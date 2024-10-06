`timescale  1ns / 1ps

module tb_spi_config;

reg     tb_cs_p;
reg     tb_clk;
reg     tb_rst_n;
reg    load;

wire    tb_clk_spi;
wire    tb_mosi;
wire    tb_miso;

always #5 tb_clk = ~tb_clk;

initial begin
    tb_cs_p = 0;
    tb_clk = 0;
    tb_rst_n = 0;
	
	load <= 1'b0;
    #10;
    tb_rst_n = 1;
    #40;
    repeat(28) begin
        @(posedge tb_clk);
        tb_cs_p = 1;
    end
    @(posedge tb_clk);
    tb_cs_p = 0;
	load <= 1'b1;
	#500
	load <= 1'b0;
    #100000;
    $stop;
end

spi_config
test_spi_config (
.clk(tb_clk),
.rst_n(tb_rst_n),
.load(load),
.clk_spi(tb_clk_spi),
.mosi(tb_mosi),
.miso(tb_miso)
);

endmodule