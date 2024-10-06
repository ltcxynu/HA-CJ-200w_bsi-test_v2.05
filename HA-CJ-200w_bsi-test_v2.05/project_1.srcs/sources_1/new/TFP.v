module TFP#(
    parameter DATA_WIDTH = 192,
    parameter DATA_DEPTH = 10800,
    parameter QUANT_SIZE = 5,
    parameter WINDOWS    = 30
)(
    input                                   clk,
    input                                   rstn,
    input [DATA_WIDTH-1:0]                  spike_data_i, // spike data
    input                                   spike_valid,
    input  [$clog2(DATA_DEPTH)-1:0]         spike_addr,
    input                                   clk_q,
    (*mark_debug= "true"*)input  [$clog2(DATA_DEPTH)-1:0]         addr_q, // read addr
    output wire[DATA_WIDTH*QUANT_SIZE-1:0]  q0,
    output wire[DATA_WIDTH*QUANT_SIZE-1:0]  q1
    //(*mark_debug= "true"*)input  [1:0]                            read_sel
);
//      A0,B0   A0,B1   A1,B1   A1,B2   A2,B2   A2,B3
//img:     B0,  A0,        B1,  A1,        B2,  A2   60 fps
//event A0-B0   B1-A0   A1-B1   
    // Frame counter
    (*mark_debug= "true"*)reg [$clog2(WINDOWS)-1:0] frame_counter;
    (*mark_debug= "true"*)reg [$clog2(WINDOWS)-1:0] out_cnt;
    (*mark_debug= "true"*)wire [15:0]q0_debug;
    (*mark_debug= "true"*)wire [15:0]q1_debug;
    (*mark_debug= "true"*)wire [15:0]interval_data_read_debug;
    (*mark_debug= "true"*)wire [15:0]interval_data_process_debug;
    
    
    // Memory for storing spike counts
    // (* ram_style = "block" *)reg [DATA_WIDTH*QUANT_SIZE-1:0] temp_mem [0:DATA_DEPTH-1];
    // (* ram_style = "block" *)reg [DATA_WIDTH*QUANT_SIZE-1:0] async_mem_recon0 [0:DATA_DEPTH-1];
    // (* ram_style = "block" *)reg [DATA_WIDTH*QUANT_SIZE-1:0] async_mem_recon1 [0:DATA_DEPTH-1];
    // Read and process data
    wire [DATA_WIDTH*QUANT_SIZE-1:0] interval_data_read;
    wire [287:0] interval_data_read1;
    wire [671:0] interval_data_read2;
    assign interval_data_read = {{interval_data_read1},{interval_data_read2}};
    reg  [DATA_WIDTH*QUANT_SIZE-1:0] interval_data_process;
    wire  [287:0] interval_data_process1;
    wire  [671:0] interval_data_process2;
    assign interval_data_process1=interval_data_process[959:672];
    assign interval_data_process2=interval_data_process[671:0];    
    reg  [DATA_WIDTH-1:0]                  spike_data_i_ff1;
    (*mark_debug= "true"*)wire  temp_mem_write_en;
    (*mark_debug= "true"*)wire  async_mem_recon0_en;
   (*mark_debug= "true"*) wire  async_mem_recon1_en;
    // Current address register
    (*mark_debug= "true"*)reg [$clog2(DATA_DEPTH)-1:0] current_spike_addr_pp1;
    (*mark_debug= "true"*)reg [$clog2(DATA_DEPTH)-1:0] current_spike_addr;
    
    assign interval_data_read_debug=interval_data_read[679:664];
    assign q0_debug=q0[679:664];
    assign q1_debug=q1[679:664];
    assign interval_data_process_debug=interval_data_process[679:664];
    
    integer i, j;  // Define integer variables outside always block

    //Memory instance
    interval_cal_intval_ram2 temp_mem0(
        .addr0  (spike_addr),
        .ce0    (spike_valid),
        .q0     (interval_data_read1), 
        .addr1  (current_spike_addr),  
        .ce1    (temp_mem_write_en), 
        .d1     (interval_data_process1), 
        .we1    (temp_mem_write_en), 
        .clk    (clk)
    );
        interval_cal_intval_ram temp_mem1(
        .addr0  (spike_addr),
        .ce0    (spike_valid),
        .q0     (interval_data_read2), 
        .addr1  (current_spike_addr),  
        .ce1    (temp_mem_write_en), 
        .d1     (interval_data_process2), 
        .we1    (temp_mem_write_en), 
        .clk    (clk)
    );
    uram_gen #(
        .DATA_WIDTH    (DATA_WIDTH*QUANT_SIZE),
        .DATA_DEPTH    (DATA_DEPTH)
    )async_mem_recon0(
        .clka       (clk),  // –¥ ±÷”
        .clkb       (clk_q),   // ∂¡ ±÷”
        .addra      (current_spike_addr),
        .dina         (interval_data_process),
        .ena        (async_mem_recon0_en),
        .addrb      (addr_q),
        .doutb         (q0),
        .enb        ('b1)
    );
    uram_gen #(
        .DATA_WIDTH    (DATA_WIDTH*QUANT_SIZE),
        .DATA_DEPTH    (DATA_DEPTH)
    )async_mem_recon1(
        .clka       (clk),  // –¥ ±÷”
        .clkb       (clk_q),   // ∂¡ ±÷”
        .addra      (current_spike_addr),
        .dina         (interval_data_process),
        .ena        (async_mem_recon1_en),
        .addrb      (addr_q),
        .doutb         (q1),
        .enb        ('b1)
    );

    // Initialize frame counter
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            frame_counter <= 0;
            out_cnt       <= 0;
        end else if ((current_spike_addr == DATA_DEPTH-1)&&spike_valid) begin
            if (frame_counter == WINDOWS-1) begin
                frame_counter <= 0;
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
//            temp_mem_write_en  <= 0;
//            async_mem_recon0_en<= 0;
//            async_mem_recon1_en<= 0;
            interval_data_process <= 0;
        end else if (spike_valid) begin
            // Read data from interval memory
            // interval_data_read <= temp_mem[spike_addr];
            spike_data_i_ff1 <= spike_data_i;
            // Process each spike
            for (j = 0; j < DATA_WIDTH; j = j + 1) begin
                if (spike_data_i_ff1[j] == 1'b1) begin
                    if(frame_counter == 'd0)
                        interval_data_process[j*QUANT_SIZE +: QUANT_SIZE] <= 1;
                    else
                        interval_data_process[j*QUANT_SIZE +: QUANT_SIZE] <= interval_data_read[j*QUANT_SIZE +: QUANT_SIZE] + 1;
                end else begin
                    if(frame_counter == 'd0)
                        interval_data_process[j*QUANT_SIZE +: QUANT_SIZE] <= 0;
                    else
                        interval_data_process[j*QUANT_SIZE +: QUANT_SIZE] <= interval_data_read[j*QUANT_SIZE +: QUANT_SIZE];
                end
            end
        end
    end
    
assign temp_mem_write_en = (current_spike_addr != current_spike_addr_pp1)&&(frame_counter < WINDOWS-1);
assign async_mem_recon0_en = (current_spike_addr != current_spike_addr_pp1)&&(frame_counter == WINDOWS-1)&&(out_cnt[0] == 'd0);
assign async_mem_recon1_en = (current_spike_addr != current_spike_addr_pp1)&&(frame_counter == WINDOWS-1)&&(out_cnt[0] == 'd1);
//always@(*)begin

//        //save data to target ram
//    if(current_spike_addr != current_spike_addr_pp1) begin
//        if (frame_counter < WINDOWS-1) begin
//            // Write updated data back to interval memory
//            temp_mem_write_en = 1;
//        end else begin
//            // Write data to dual_port memory
//            temp_mem_write_en = 0;
            
//            if(out_cnt[0] == 'd0) begin
//                async_mem_recon0_en = 1;
//                async_mem_recon1_en = 0;
//            end
//            else begin 
//                async_mem_recon0_en = 0;
//                async_mem_recon1_en = 1;
//            end
//        end
//    end
//end
endmodule
