`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/02 18:46:02
// Design Name: 
// Module Name: idelay_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module idelay_tb;

    reg clk200m;

    always #2.5 clk200m = ~clk200m; 

    wire data_in_from_pins_delay;
    reg pixel_bit;
    reg [4:0] SET_DELAY_VALUE;
    wire [4:0] delay_out_value;

    wire pixel_bit1;
    wire [4:0] delay_out_value1;
    wire data_in_from_pins_delay1;

    assign pixel_bit1 = pixel_bit;

    initial begin
        
        clk200m <= 1; 
        pixel_bit <= 1;
        SET_DELAY_VALUE <= 0;

        #500
        @ (posedge clk200m)
        pixel_bit <= 0;
        #500
        @ (posedge clk200m)
        pixel_bit <= 1;
        SET_DELAY_VALUE <= 10;

        #500
        @ (posedge clk200m)
        pixel_bit <= 0;

        #500
        @ (posedge clk200m)
        pixel_bit <= 1;
        SET_DELAY_VALUE = 16;
        @ (posedge clk200m)
        pixel_bit <= 0;

        #500
        @ (posedge clk200m)
        pixel_bit <= 1;
        SET_DELAY_VALUE <= 25;

        #500

        $stop;
    end

    //(* IODELAY_GROUP = "sel_1bi4_group" *)
//    IDELAYCTRL IDELAYCTRL_inst (
//        .RDY(),                
//        .REFCLK(clk200m),     
//        .RST(1'b0)        
//    );

    //(* IODELAY_GROUP = "sel_1bi4_group" *)
    IDELAYE2 # (
        .CINVCTRL_SEL           ("FALSE"),                            // TRUE, FALSE
        .DELAY_SRC              ("IDATAIN"),                          // IDATAIN, DATAIN
        .HIGH_PERFORMANCE_MODE  ("TRUE"),                            // TRUE, FALSE
        .IDELAY_TYPE            ("VAR_LOAD"),              // FIXED, VARIABLE, or VAR_LOADABLE
        .IDELAY_VALUE           (0),                        // 0 to 31
        .REFCLK_FREQUENCY       (200.0),
        .PIPE_SEL               ("FALSE"),
        .SIGNAL_PATTERN         ("DATA"))                             // CLOCK, DATA
    idelaye2_inst (
        .DATAOUT                (data_in_from_pins_delay),
        .DATAIN                 (1'b0),                               // Data from FPGA logic
        .C                      (clk200m),
        .CE                     (1'b0),
        .INC                    (1'b0),
        .IDATAIN                (pixel_bit),                 // Driven by IOB
        .LD                     (1'b1),
        .REGRST                 (1'b0),
        .LDPIPEEN               (1'b0),
        .CNTVALUEIN             (SET_DELAY_VALUE),
        .CNTVALUEOUT            (delay_out_value),
        .CINVCTRL               (1'b0)
    );

    IDELAYE2 # (
        .CINVCTRL_SEL           ("FALSE"),                            // TRUE, FALSE
        .DELAY_SRC              ("IDATAIN"),                          // IDATAIN, DATAIN
        .HIGH_PERFORMANCE_MODE  ("TRUE"),                            // TRUE, FALSE
        .IDELAY_TYPE            ("VAR_LOAD"),              // FIXED, VARIABLE, or VAR_LOADABLE
        .IDELAY_VALUE           (0),                        // 0 to 31
        .REFCLK_FREQUENCY       (200.0),
        .PIPE_SEL               ("FALSE"),
        .SIGNAL_PATTERN         ("DATA"))                             // CLOCK, DATA
    idelaye2_inst1 (
        .DATAOUT                (data_in_from_pins_delay1),
        .DATAIN                 (1'b0),                               // Data from FPGA logic
        .C                      (clk200m),
        .CE                     (1'b0),
        .INC                    (1'b0),
        .IDATAIN                (pixel_bit1),                 // Driven by IOB
        .LD                     (1'b1),
        .REGRST                 (1'b0),
        .LDPIPEEN               (1'b0),
        .CNTVALUEIN             (SET_DELAY_VALUE),
        .CNTVALUEOUT            (delay_out_value1),
        .CINVCTRL               (1'b0)
    );

endmodule
