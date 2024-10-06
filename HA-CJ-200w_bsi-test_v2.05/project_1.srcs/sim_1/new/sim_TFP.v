`timescale 1ns/1ns
`include "../../sources_1/new/TFI.v"
module sim_TFP;
    // Parameters
    parameter DATA_WIDTH = 1;
    parameter DATA_DEPTH = 10;
    parameter QUANT_SIZE = 5;
    parameter WINDOWS    = 8;
    integer i,j;
    // Clock and reset
    reg clk;
    reg clk_q;
    reg rstn;

    // Inputs
    reg [DATA_WIDTH-1:0] spike_data_i;
    reg spike_valid;
    reg [$clog2(DATA_DEPTH)-1:0] spike_addr;
    reg [$clog2(DATA_DEPTH)-1:0] addr_q;
    reg read_sel;

    // Outputs
    wire [DATA_WIDTH*QUANT_SIZE-1:0] q0;

    // Instantiate the DUT
    TFI #(
        .DATA_WIDTH(DATA_WIDTH),
        .DATA_DEPTH(DATA_DEPTH),
        .QUANT_SIZE(QUANT_SIZE),
        .WINDOWS(WINDOWS)
    ) dut (
        .clk(clk),
        .rstn(rstn),
        .spike_data_i(spike_data_i),
        .spike_valid(spike_valid),
        .spike_addr(spike_addr),
        .clk_q(clk_q),
        .addr_q(addr_q),
        .q0(q0),
        .read_sel(read_sel)
    );

    // Clock generation
    initial begin
        clk <= 0;
        forever #2.5 clk <= ~clk; // 200 MHz clock
    end

    initial begin
        clk_q <= 0;
        forever #3.37 clk_q <= ~clk_q; // 148.5 MHz clock
    end

    // Stimulus
    initial begin
        // Initialize inputs
        rstn <= 0;
        spike_data_i <= 0;
        spike_valid <= 0;
        spike_addr <= 0;
        addr_q <= 0;
        read_sel <= 1'b1;

        // Release reset
        #10;
        rstn <= 1;

        // Generate spike data and addresses
        fork
            begin // Spike data and address generation
                for (i = 0; i < DATA_DEPTH*30 ; i = i + 1) begin
                    @(posedge clk);
                    if (i % 10 == 0) begin
                        spike_data_i <= $random;
                        spike_valid <= 1;
                        spike_addr <= (spike_addr + 1) % DATA_DEPTH;
                    end else begin
                        spike_valid <= 0;
                    end
                end
            end

            begin // Read address generation
                for (j = 0; j < DATA_DEPTH*30 ; j = j + 1) begin
                    @(posedge clk_q);
                    if (j % 10 == 0) begin
                        addr_q <= (addr_q + 1) % DATA_DEPTH;
                    end
                end
            end
        join
        $finish;
    end

    initial begin
        $dumpvars (0, sim_TFP); //记录i_design.module1模块及其下面层次中所有模块的所有信号
        $dumpfile ("mydesign.vcd"); //指定VCD文件名为mydesign.dump
    end
endmodule
