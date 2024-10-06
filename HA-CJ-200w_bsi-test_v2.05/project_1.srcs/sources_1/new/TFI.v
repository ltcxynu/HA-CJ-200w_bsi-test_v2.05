
module interval_cal_intval_ram #(
    parameter DWIDTH = 792,
    parameter AWIDTH = $clog2(10800),
    parameter MEM_SIZE = 10800
)(
    addr0,
    ce0,
    q0, 
    addr1, 
    ce1, 
    d1, 
    we1, 
    //q1,  
    clk
);

input[AWIDTH-1:0] addr0;
input ce0;
output reg[DWIDTH-1:0] q0;
input[AWIDTH-1:0] addr1;
input ce1;
input[DWIDTH-1:0] d1;
input we1;
//output reg[DWIDTH-1:0] q1;
input clk;

(* ram_style = "block"*)reg [DWIDTH-1:0] ram[0:MEM_SIZE-1];

integer i;
initial
    for (i=0; i<MEM_SIZE; i=i+1)
        ram[i] = 0; 


always @(posedge clk)  
begin 
    if (ce0) begin
        q0 <= ram[addr0];
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        if (we1) 
            ram[addr1] <= d1; 
        //q1 <= ram[addr1];
    end
end


endmodule

module TFI#(
    parameter DATA_WIDTH = 192,
    parameter DATA_DEPTH = 10800,
    parameter QUANT_SIZE = 5,
    parameter WINDOWS    = 32
)(
    input                                   clk,
    input                                   rstn,
    input [DATA_WIDTH-1:0]                  spike_data_i, // spike data
    input                                   spike_valid,
    input  [$clog2(DATA_DEPTH)-1:0]         spike_addr,
    input                                   clk_q,
    input  [$clog2(DATA_DEPTH)-1:0]         addr_q, // read addr
    output wire[DATA_WIDTH*QUANT_SIZE-1:0]  q0,
    input                                   read_sel
);
//      A0,B0   A0,B1   A1,B1   A1,B2   A2,B2   A2,B3
//img:     B0,  A0,        B1,  A1,        B2,  A2   60 fps
//event A0-B0   B1-A0   A1-B1   
    // Frame counter
    reg [$clog2(WINDOWS)-1:0] frame_counter;
    reg [$clog2(WINDOWS)-1:0] out_cnt;


    // Memory for storing spike counts
    // (* ram_style = "block" *)reg [DATA_WIDTH*QUANT_SIZE-1:0] temp_mem [0:DATA_DEPTH-1];
    // (* ram_style = "block" *)reg [DATA_WIDTH*QUANT_SIZE-1:0] async_mem_recon0 [0:DATA_DEPTH-1];
    // (* ram_style = "block" *)reg [DATA_WIDTH*QUANT_SIZE-1:0] async_mem_recon1 [0:DATA_DEPTH-1];
    // Read and process data
    wire [DATA_WIDTH*QUANT_SIZE-1:0] interval_data_read;
    reg  [DATA_WIDTH*QUANT_SIZE-1:0] interval_data_process;
    reg  [DATA_WIDTH*QUANT_SIZE-1:0] interval_data_save;
    reg  [DATA_WIDTH-1:0]                  spike_data_i_ff1;
    wire  temp_mem_write_en;
    wire  async_mem_recon0_en;
    // Current address register
    reg [$clog2(DATA_DEPTH)-1:0] current_spike_addr_pp1;
    reg [$clog2(DATA_DEPTH)-1:0] current_spike_addr;

    integer i, j;  // Define integer variables outside always block

    //Memory instance
    interval_cal_intval_ram #(
        .DWIDTH    (DATA_WIDTH*QUANT_SIZE),
        .AWIDTH    ($clog2(DATA_DEPTH)),
        .MEM_SIZE  (DATA_DEPTH   )
    )temp_mem(
        .addr0  (spike_addr),
        .ce0    (spike_valid),
        .q0     (interval_data_read), 
        .addr1  (current_spike_addr),  
        .ce1    (temp_mem_write_en), 
        .d1     (interval_data_process), 
        .we1    (temp_mem_write_en), 
        .clk    (clk)
    );

    interval_cal_intval_ram #(
        .DWIDTH    (DATA_WIDTH*QUANT_SIZE),
        .AWIDTH    ($clog2(DATA_DEPTH)),
        .MEM_SIZE  (DATA_DEPTH   )
    )async_mem_recon0(
        .addr0  (addr_q),
        .ce0    (read_sel),
        .q0     (q0), 
        .addr1  (current_spike_addr),  
        .ce1    (async_mem_recon0_en), 
        .d1     (interval_data_save), 
        .we1    (async_mem_recon0_en), 
        .clk    (clk)
    );

    // Initialize frame counter
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            frame_counter <= 0;
            out_cnt       <= 0;
        end else if (current_spike_addr == DATA_DEPTH-1 && spike_valid) begin
            if (frame_counter == WINDOWS-1) begin
                // frame_counter <= 0;
                out_cnt       <= out_cnt + 1;
            end else begin
                frame_counter <= frame_counter + 1;
            end
        end
    end

    // Update current spike address
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            current_spike_addr      <=  'd0;
            current_spike_addr_pp1  <=  'd0;
        end else if (spike_valid) begin
            current_spike_addr_pp1 <= spike_addr;
            current_spike_addr <= current_spike_addr_pp1;
        end
    end

    // Process spikes and update interval memory
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            interval_data_process <= 0;
            interval_data_save    <= 0;
        end else if (spike_valid) begin
            // Read data from interval memory
            // interval_data_read <= temp_mem[spike_addr];
            spike_data_i_ff1 <= spike_data_i;
            // Process each spike
            for (j = 0; j < DATA_WIDTH; j = j + 1) begin
                if (spike_data_i_ff1[j] == 1'b1) begin// # spike�?1时，重置间隔计数，并输出
                    interval_data_process[j*QUANT_SIZE +: QUANT_SIZE] <= 1;
                    interval_data_save[j*QUANT_SIZE +: QUANT_SIZE]    <= interval_data_process[j*QUANT_SIZE +: QUANT_SIZE];
                end else begin
                    if(frame_counter == 'd0) begin// # spike�?0时，累积
                        interval_data_process[j*QUANT_SIZE +: QUANT_SIZE] <= 2;
                    end else begin
                        if(interval_data_read[j*QUANT_SIZE +: QUANT_SIZE] <= WINDOWS) begin
                            interval_data_process[j*QUANT_SIZE +: QUANT_SIZE] <= interval_data_read[j*QUANT_SIZE +: QUANT_SIZE] + 'd1;
                        end else begin
                            interval_data_process[j*QUANT_SIZE +: QUANT_SIZE] <= WINDOWS;
                        end
                    end
                    interval_data_save[j*QUANT_SIZE +: QUANT_SIZE]    <= {QUANT_SIZE{1'b0}}+1'b1;
                end
            end
        end
    end

assign temp_mem_write_en = (current_spike_addr != current_spike_addr_pp1);
assign async_mem_recon0_en = (current_spike_addr != current_spike_addr_pp1);

endmodule
