`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/22 20:43:38
// Design Name: 
// Module Name: pixel_receive
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


module pixel_receive
#(
	parameter DATA_WIDTH		= 13,
	parameter DEBUG_EN = 1'b0	
)
(
	input 							phase,
	input 	[3:0]					ch_cnt,
	input	[DATA_WIDTH-1:0]				pixel_bit_p,
	input	[DATA_WIDTH-1:0]				pixel_bit_n,
	input						pixel_clk_p,
	input						pixel_clk_n,
	// input						pixel_frame_p,
	// input						pixel_frame_n,

    input  wire     [3:0]       frame_valid_delay,
    input  wire                 fifo_busy,
	input						rstn,
	input						refclk,
	input	[4:0]				SET_DELAY_VALUE,
	output	[4:0]				DELAY_OUT,

	output 						DATA_CLK,
	output	reg [511:0]			DATA,
	output 	reg					DATA_EN
);


  
wire	[DATA_WIDTH-1:0]		pixel_bit;
wire	 						pixel_frame;
wire	[DATA_WIDTH-1:0]		data_in_from_pins_delay;
reg	[DATA_WIDTH-1:0]		data_in_from_pins_delay_buf;

wire pixel_clk_in;
wire pixel_clk;
wire pixel_clk_div;
//wire     [3:0]       frame_valid_delay;


reg [07:0]		frame_cnt;
reg [15:0]		line_cnt;		
reg [07:0] 		bit_cnt;

reg	[04:0]		data_out[DATA_WIDTH-1:0];
reg	[22:0]		data_out_23bit[DATA_WIDTH-1:0];



wire	[4:0]		delay_out_value[DATA_WIDTH-1:0];  
assign 	DELAY_OUT			 = 	delay_out_value[0];

//vio_3 vio_3_inst (
//  .clk(pixel_clk_div),                // input wire clk
//  .probe_out0(frame_valid_delay)  // output wire [3 : 0] probe_out0
//);

//-----------------------------------------------------------------------
//--clk clk_div

   IBUFDS #(
      .DIFF_TERM("TRUE"),       // Differential Termination
      .IBUF_LOW_PWR("FALSE"),     // Low power="TRUE", Highest performance="FALSE" 
      .IOSTANDARD("LVDS")     // Specify the input I/O standard
   ) IBUFDS_inst1 (
      .O(pixel_clk_in),  // Buffer output
      .I(pixel_clk_p),  // Diff_p buffer input (connect directly to top-level port)
      .IB(pixel_clk_n) // Diff_n buffer input (connect directly to top-level port)
   );


   BUFIO BUFIO_inst1 (
      .O(pixel_clk), // 1-bit output: Clock output (connect to I/O clock loads).
      .I(pixel_clk_in)  // 1-bit input: Clock input (connect to an IBUF or BUFMR).
   );

   BUFR #(
      .BUFR_DIVIDE("1"),   // Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8" 
      .SIM_DEVICE("7SERIES")  // Must be set to "7SERIES" 
   )
   BUFR_inst (
      .O(pixel_clk_div),     // 1-bit output: Clock output port
      .CE(1'b1),   // 1-bit input: Active high, clock enable (Divided modes only)
      .CLR(1'b0), // 1-bit input: Active high, asynchronous clear (Divided modes only)
      .I(pixel_clk_in)      // 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
   );   


//--bit decode


genvar pin_count;
genvar slice_count;
generate for (pin_count = 0; pin_count < DATA_WIDTH; pin_count = pin_count + 1) begin: pins

IBUFDS
#(	.DIFF_TERM  ("TRUE"),             // Differential termination
	.IOSTANDARD ("LVDS"))
ibufds_inst
(	.I          (pixel_bit_p[pin_count]),
	.IB         (pixel_bit_n[pin_count]),
	.O          (pixel_bit[pin_count]));


//     (* IODELAY_GROUP = "sel_1bi4_group" *)
     IDELAYE2
       # (
         .CINVCTRL_SEL           ("FALSE"),                            // TRUE, FALSE
         .DELAY_SRC              ("IDATAIN"),                          // IDATAIN, DATAIN
         .HIGH_PERFORMANCE_MODE  ("TRUE"),                            // TRUE, FALSE
         .IDELAY_TYPE            ("VAR_LOAD"),              // FIXED, VARIABLE, or VAR_LOADABLE
         .IDELAY_VALUE           (0),                 		 // 0 to 31
         .REFCLK_FREQUENCY       (200.0),
         .PIPE_SEL               ("FALSE"),
         .SIGNAL_PATTERN         ("DATA"))                             // CLOCK, DATA
       idelaye2_inst
           (
         .DATAOUT                	(data_in_from_pins_delay[pin_count]),
         .DATAIN                 	(1'b0),                               // Data from FPGA logic
         .C                      		(refclk),
         .CE                     		(1'b0),
         .INC                    		(1'b0),
         .IDATAIN                	(pixel_bit[pin_count]), 				// Driven by IOB
         .LD                     		(1'b1),
         .REGRST                 	(~rstn),
         .LDPIPEEN               	(1'b0),
         .CNTVALUEIN             	(SET_DELAY_VALUE),
         .CNTVALUEOUT            (delay_out_value[pin_count]),
         .CINVCTRL               	(1'b0)
         );
         
 
  always @	(posedge pixel_clk_div	or 	negedge rstn)
	if(~rstn)
		data_in_from_pins_delay_buf[pin_count]	<= 	0;
	else
		data_in_from_pins_delay_buf[pin_count]	<= 	data_in_from_pins_delay[pin_count];
 
 always @	(posedge pixel_clk_div	or 	negedge rstn)
	if(~rstn)
		data_out_23bit[pin_count]	<= 	0;
//	else if(frame_cnt	==	8'd2)
////		data_out_23bit[pin_count]	<= 	{22'b0,data_in_from_pins_delay_buf[pin_count]};
//		data_out_23bit[pin_count]	<= 	{data_in_from_pins_delay_buf[pin_count], 22'b0};
	else
//		data_out_23bit[pin_count]	<= 	{data_out_23bit[pin_count][21:0],data_in_from_pins_delay_buf[pin_count]};
		data_out_23bit[pin_count]	<= 	{data_in_from_pins_delay_buf[pin_count], data_out_23bit[pin_count][22:1]};
//		data_out_23bit[pin_count]	<= 	{data_in_from_pins_delay[pin_count], data_out_23bit[pin_count][22:1]};
 end
  endgenerate

//frame head counter


assign pixel_frame	=	(phase	==	1'b1)	?	data_in_from_pins_delay[12]	:	~data_in_from_pins_delay[12]; //phase adjust

always @	(posedge pixel_clk_div	or 	negedge rstn)
	if(~rstn)
		frame_cnt	<= 	0;
	else if(pixel_frame	==	1'b1)
		frame_cnt	<= 	frame_cnt+1'b1;
	else
		frame_cnt	<= 	0;
//line counter
always @	(posedge pixel_clk_div	or 	negedge rstn)
	if(~rstn)
		line_cnt	<= 	0;
//	else if(frame_cnt	==	8'd1)
	else if(!pixel_frame_reg[frame_valid_delay+1] && pixel_frame_reg[frame_valid_delay])
//	else if(!pixel_frame_reg[0] && pixel_frame)
		line_cnt	<= 	0;
	else if(bit_cnt	==	22)
		line_cnt	<= 	line_cnt+1'b1;
	else
		line_cnt	<= 	line_cnt;

//serdes to parallel
reg [17:0] pixel_frame_reg;
always @ (posedge pixel_clk_div or negedge rstn) begin
    if (!rstn)
        pixel_frame_reg <= 18'd00;
    else 
        pixel_frame_reg <= {pixel_frame_reg[16:0], pixel_frame};
end

always @	(posedge pixel_clk_div	or 	negedge rstn)
	if(~rstn)
		bit_cnt	<= 	0;
//	else if(frame_cnt	==	8'd1)
	else if(!pixel_frame_reg[frame_valid_delay+1] && pixel_frame_reg[frame_valid_delay])
//	else if(!pixel_frame_reg[0] && pixel_frame)
		bit_cnt	<= 	0;
	else if(bit_cnt	==	8'd22)
		bit_cnt	<= 	0;
	else
		bit_cnt	<= 	bit_cnt	+	1'b1;


//always @	(posedge pixel_clk_div	or 	negedge rstn)
//	if(~rstn)
//		bit_cnt	<= 	0;
//	else if(frame_cnt	==	8'd1)
//		bit_cnt	<= 	0;
//	else if(bit_cnt	==	8'd22)
//		bit_cnt	<= 	0;
//	else
//		bit_cnt	<= 	bit_cnt	+	1'b1;

wire[275:0] data_out_276bit;

assign data_out_276bit[ 22:  0]	=	data_out_23bit[ 0];
assign data_out_276bit[ 45: 23]	=	data_out_23bit[ 1];
assign data_out_276bit[ 68: 46]	=	data_out_23bit[ 2];
assign data_out_276bit[ 91: 69]	=	data_out_23bit[ 3];
assign data_out_276bit[114: 92]	=	data_out_23bit[ 4];
assign data_out_276bit[137:115]	=	data_out_23bit[ 5];
assign data_out_276bit[160:138]	=	data_out_23bit[ 6];
assign data_out_276bit[183:161]	=	data_out_23bit[ 7];
assign data_out_276bit[206:184]	=	data_out_23bit[ 8];
assign data_out_276bit[229:207]	=	data_out_23bit[ 9];
assign data_out_276bit[252:230]	=	data_out_23bit[10];
assign data_out_276bit[275:253]	=	data_out_23bit[11];

always @ (posedge pixel_clk_div)
	if(~rstn)
		DATA	<=	512'd0;
	else
		DATA	<=	{222'b0,ch_cnt,line_cnt[9:0],data_out_276bit};

always @ (posedge pixel_clk_div)
	if(~rstn)
		DATA_EN	<=	1'b0;
	else if(bit_cnt	==	22 && fifo_busy == 1'b0)
		DATA_EN	<=	1'b1;
	else 
		DATA_EN	<=	1'b0;

assign	DATA_CLK	=	pixel_clk_div;
	
reg [22:0] data_out_23bit_reg [11:0];


genvar i;
generate for (i = 0; i < 12; i = i + 1) begin

    always @ (posedge pixel_clk_div) begin
        if (bit_cnt	==	22)
            data_out_23bit_reg[i] <= data_out_23bit[i];
    end
end
endgenerate

reg error0, error2, error3;
reg error4, error6, error7;
reg error8, error10, error11;

always @ (posedge pixel_clk_div or negedge rstn) begin
    if (~rstn)
        error0 <= 1'b0;
    else if (data_out_23bit_reg[0] == 23'h2a_aaaa || data_out_23bit_reg[0] == 23'h55_5555)
        error0 <= 1'b0;
    else 
        error0 <= 1'b1;
end

always @ (posedge pixel_clk_div or negedge rstn) begin
    if (~rstn)
        error2 <= 1'b0;
    else if (data_out_23bit_reg[2] == 23'h2a_aaaa || data_out_23bit_reg[2] == 23'h55_5555)
        error2 <= 1'b0;
    else 
        error2 <= 1'b1;
end

always @ (posedge pixel_clk_div or negedge rstn) begin
    if (~rstn)
        error3 <= 1'b0;
    else if (data_out_23bit_reg[3] == 23'h7f_ffff)
        error3 <= 1'b0;
    else 
        error3 <= 1'b1;
end
	
always @ (posedge pixel_clk_div or negedge rstn) begin
    if (~rstn)
        error4 <= 1'b0;
    else if (data_out_23bit_reg[4] == 23'h2a_aaaa || data_out_23bit_reg[4] == 23'h55_5555)
        error4 <= 1'b0;
    else 
        error4 <= 1'b1;
end	

always @ (posedge pixel_clk_div or negedge rstn) begin
    if (~rstn)
        error6 <= 1'b0;
    else if (data_out_23bit_reg[6] == 23'h2a_aaaa || data_out_23bit_reg[6] == 23'h55_5555)
        error6 <= 1'b0;
    else 
        error6 <= 1'b1;
end	

always @ (posedge pixel_clk_div or negedge rstn) begin
    if (~rstn)
        error7 <= 1'b0;
    else if (data_out_23bit_reg[7] == 23'h7f_ffff)
        error7 <= 1'b0;
    else 
        error7 <= 1'b1;
end	
	
always @ (posedge pixel_clk_div or negedge rstn) begin
    if (~rstn)
        error8 <= 1'b0;
    else if (data_out_23bit_reg[8] == 23'h2a_aaaa || data_out_23bit_reg[8] == 23'h55_5555)
        error8 <= 1'b0;
    else 
        error8 <= 1'b1;
end	

always @ (posedge pixel_clk_div or negedge rstn) begin
    if (~rstn)
        error10 <= 1'b0;
    else if (data_out_23bit_reg[10] == 23'h2a_aaaa || data_out_23bit_reg[10] == 23'h55_5555)
        error10 <= 1'b0;
    else 
        error10 <= 1'b1;
end	

always @ (posedge pixel_clk_div or negedge rstn) begin
    if (~rstn)
        error11 <= 1'b0;
    else if (data_out_23bit_reg[11] == 23'h7f_ffff)
        error11 <= 1'b0;
    else 
        error11 <= 1'b1;
end	
	
		
generate if (DEBUG_EN) begin
    ila_pixel ila_pixel_inst (
	.clk(pixel_clk_div), // input wire clk

	.probe0(data_in_from_pins_delay[11:0]	    ), // input wire [11:0]  probe0  
	.probe1(pixel_frame							), // input wire [0:0]  probe1
	.probe2(frame_cnt							), // input wire [7:0]  probe2 
	.probe3(line_cnt							), // input wire [15:0]  probe3 
	.probe4(bit_cnt								), // input wire [7:0]  probe4 
	.probe5(DATA_EN								), // input wire [0:0]  probe5
	.probe6({ data_out_23bit_reg[0],
	          data_out_23bit_reg[1],
	          data_out_23bit_reg[2],
	          data_out_23bit_reg[3],
	          data_out_23bit_reg[4],
	          data_out_23bit_reg[5],
	          data_out_23bit_reg[6],
	          data_out_23bit_reg[7],
	          data_out_23bit_reg[8],
	          data_out_23bit_reg[9],
	          data_out_23bit_reg[10],
	          data_out_23bit_reg[11]}),
	  .probe7({error0, error2, error3, error4, error6, error7, error8, error10, error11}) // input wire [275:0]  probe6
);
end 
endgenerate		



endmodule
