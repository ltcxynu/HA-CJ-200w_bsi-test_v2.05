`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/03 16:58:31
// Design Name: 
// Module Name: pixel_top
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



module pixel_top #(
    parameter VA = 540
)(
	
	input rstn
	
	,input clk10m
	,input clk20m
	,input clk100m
	,input clk200m
	,input clk125m
//lvds
	,input	[12:0]	lvds_p1
	,input	[12:0]	lvds_n1
	,input			 clk_p1
	,input			 clk_n1


	,input	[12:0]	lvds_p2
	,input	[12:0]	lvds_n2
	,input			 clk_p2
	,input			 clk_n2


	,input	[12:0]	lvds_p3
	,input	[12:0]	lvds_n3
	,input			 clk_p3
	,input			 clk_n3


	,input	[12:0]	lvds_p4
	,input	[12:0]	lvds_n4
	,input			 clk_p4
	,input			 clk_n4


	,input	[12:0]	lvds_p5
	,input	[12:0]	lvds_n5
	,input			 clk_p5
	,input			 clk_n5


	,input	[12:0]	lvds_p6
	,input	[12:0]	lvds_n6
	,input			 clk_p6
	,input			 clk_n6


	,input	[12:0]	lvds_p7
	,input	[12:0]	lvds_n7
	,input			 clk_p7
	,input			 clk_n7


	,input	[12:0]	lvds_p8
	,input	[12:0]	lvds_n8
	,input			 clk_p8
	,input			 clk_n8


	,input	[12:0]	lvds_p9
	,input	[12:0]	lvds_n9
	,input			 clk_p9
	,input			 clk_n9


	,input	[12:0]	lvds_p10
	,input	[12:0]	lvds_n10
	,input			 clk_p10
	,input			 clk_n10


	,input	[12:0]	lvds_p11
	,input	[12:0]	lvds_n11
	,input			 clk_p11
	,input			 clk_n11


	,input	[12:0]	lvds_p12
	,input	[12:0]	lvds_n12
	,input			 clk_p12
	,input			 clk_n12


	,input	[12:0]	lvds_p13
	,input	[12:0]	lvds_n13
	,input			 clk_p13
	,input			 clk_n13


	,input	[12:0]	lvds_p14
	,input	[12:0]	lvds_n14
	,input			 clk_p14
	,input			 clk_n14


    ,input  wire    fifo_wr_ready
//pixl data out
	,output	wire [2559:0]	pixl_data_out
	,output	wire 		    pixl_data_out_en
//spi
	,output    	wire          clk_spi 
	,output    	wire          mosi
	,input     	wire          miso
	,output   	wire 	cs
	,output     wire    led

    );

parameter FIFO_WIDTH=512;


wire [FIFO_WIDTH-1:0] 	data_to_fifo[13:0];
wire [13:0]		 		data_to_fifo_en;
wire [13:0]				data_to_fifo_clk;

wire	data_from_fifo_clk;

reg 	[13:0]				data_from_fifo_en;
wire [FIFO_WIDTH-1:0]	data_from_fifo[13:0];
wire [09:0]				data_rd_data_count[13:0];

reg 		fifo_rst;
reg [7:0]	delay_cnt;


reg [13:0]data_from_fifo_en_r1;
reg [13:0]data_from_fifo_en_r2;
reg [13:0]data_from_fifo_en_r3;
reg 	[13:0]	data_out_en;
reg [511:0]	data_out[13:0];

wire	[4:0]	probe_in[13:0];

wire	[4:0]	probe_out[13:0];


wire	[12:0]	lvds_p[13:0];
wire	[12:0]	lvds_n[13:0];
wire	[13:0]	clk_p;
wire	[13:0]	clk_n;


wire	[13:0]	phase;

assign phase	=	14'b11111111111110;
localparam DEBUG_EN = 14'b11111111111111;
//----------------------------------------------------------
//IDELAYCTRL
wire RefClk;

//(* IODELAY_GROUP = "sel_1bi4_group" *)
IDELAYCTRL IDELAYCTRL_inst 
(
	.RDY(),                
	.REFCLK(clk200m),     
	.RST(~rstn)        
);

//*************************************************************
vio_0 IDELAY_VIO (
  .clk(clk10m),                  // input wire clk
  
  .probe_out0(probe_out[0]),    // output wire [4 : 0] probe_out0
  .probe_out1(probe_out[1]),    // output wire [4 : 0] probe_out1
  .probe_out2(probe_out[2]),    // output wire [4 : 0] probe_out2
  .probe_out3(probe_out[3]),    // output wire [4 : 0] probe_out3
  .probe_out4(probe_out[4]),    // output wire [4 : 0] probe_out4
  .probe_out5(probe_out[5]),    // output wire [4 : 0] probe_out5
  .probe_out6(probe_out[6]),    // output wire [4 : 0] probe_out6
  .probe_out7(probe_out[7]),    // output wire [4 : 0] probe_out7
  .probe_out8(probe_out[8]),    // output wire [4 : 0] probe_out8
  .probe_out9(probe_out[9]),    // output wire [4 : 0] probe_out9
  .probe_out10(probe_out[10]),  // output wire [4 : 0] probe_out10
  .probe_out11(probe_out[11]),  // output wire [4 : 0] probe_out11
  .probe_out12(probe_out[12]),  // output wire [4 : 0] probe_out12
  .probe_out13(probe_out[13])  // output wire [4 : 0] probe_out13
);


	assign data_from_fifo_clk	=clk125m;


	assign 	lvds_p[00]   =		lvds_p1           ;
	assign 	lvds_n[00]   =		lvds_n1           ;
	assign 	   clk_p[00]   =		 clk_p1            ;
	assign 	   clk_n[00]   =		 clk_n1            ;
	assign 	lvds_p[01]   =			lvds_p2       ;
	assign 	lvds_n[01]   =			lvds_n2       ;
	assign 	   clk_p[01]   =			 clk_p2        ;
	assign 	   clk_n[01]   =			 clk_n2        ;
	assign 	lvds_p[02]   =			lvds_p3       ;
	assign 	lvds_n[02]   =			lvds_n3       ;
	assign 	   clk_p[02]   =			 clk_p3        ;
	assign 	   clk_n[02]   =			 clk_n3        ;
	assign 	lvds_p[03]   =			lvds_p4       ;
	assign 	lvds_n[03]   =			lvds_n4       ;
	assign 	   clk_p[03]   =			 clk_p4        ;
	assign 	   clk_n[03]   =			 clk_n4        ;
	assign 	lvds_p[04]   =			lvds_p5       ;
	assign 	lvds_n[04]   =			lvds_n5       ;
	assign 	   clk_p[04]   =			 clk_p5        ;
	assign 	   clk_n[04]   =			 clk_n5        ;
	assign 	lvds_p[05]   =			lvds_p6       ;
	assign 	lvds_n[05]   =			lvds_n6       ;
	assign 	   clk_p[05]   =			 clk_p6        ;
	assign 	   clk_n[05]   =			 clk_n6        ;
	assign 	lvds_p[06]   =			lvds_p7       ;
	assign 	lvds_n[06]   =			lvds_n7       ;
	assign 	   clk_p[06]   =			 clk_p7        ;
	assign 	   clk_n[06]   =			 clk_n7        ;
	assign 	lvds_p[07]   =			lvds_p8       ;
	assign 	lvds_n[07]   =			lvds_n8       ;
	assign 	   clk_p[07]   =			 clk_p8        ;
	assign 	   clk_n[07]   =			 clk_n8        ;
	assign 	lvds_p[08]   =			lvds_p9       ;
	assign 	lvds_n[08]   =			lvds_n9       ;
	assign 	   clk_p[08]   =			 clk_p9        ;
	assign 	   clk_n[08]   =			 clk_n9        ;
	assign 	lvds_p[09]   =			lvds_p10      ;
	assign 	lvds_n[09]   =			lvds_n10      ;
	assign 	   clk_p[09]   =			 clk_p10       ;
	assign 	   clk_n[09]   =			 clk_n10       ;
	assign 	lvds_p[10]   =			lvds_p11      ;
	assign 	lvds_n[10]   =			lvds_n11      ;
	assign 	   clk_p[10]   =			 clk_p11       ;
	assign 	   clk_n[10]   =			 clk_n11       ;
	assign 	lvds_p[11]   =			lvds_p12      ;
	assign 	lvds_n[11]   =			lvds_n12      ;
	assign 	   clk_p[11]   =			 clk_p12       ;
	assign 	   clk_n[11]   =			 clk_n12       ;
	assign 	lvds_p[12]   =			lvds_p13      ;
	assign 	lvds_n[12]   =			lvds_n13      ;
	assign 	   clk_p[12]   =			 clk_p13       ;
	assign 	   clk_n[12]   =			 clk_n13       ;
	assign 	lvds_p[13]   =			lvds_p14      ;
	assign 	lvds_n[13]   =			lvds_n14      ;
	assign 	   clk_p[13]   =			  clk_p14      ;
	assign 	   clk_n[13]   =			  clk_n14      ;

wire [3:0] frame_valid_delay [13:0];

assign frame_valid_delay[0]  = 4'h2;
assign frame_valid_delay[1]  = 4'h2;
assign frame_valid_delay[2]  = 4'h1;
assign frame_valid_delay[3]  = 4'h1;
assign frame_valid_delay[4]  = 4'h1;
assign frame_valid_delay[5]  = 4'h2;
assign frame_valid_delay[6]  = 4'h2;
assign frame_valid_delay[7]  = 4'h2;
assign frame_valid_delay[8]  = 4'h2;
assign frame_valid_delay[9]  = 4'h1;
assign frame_valid_delay[10] = 4'h1;
assign frame_valid_delay[11] = 4'h1;
assign frame_valid_delay[12] = 4'h2;
assign frame_valid_delay[13] = 4'h2;

wire [13:0] wr_rst_busy;
wire [13:0] rd_rst_busy;

reg [13:0] wr_rst_busy_reg0 = 14'd0, wr_rst_busy_reg1 = 14'd0;
reg [13:0] rd_rst_busy_reg0 = 14'd0, rd_rst_busy_reg1 = 14'd0;

wire [13:0] fifo_busy;

//vio_3 vio_3 (
//  .clk(clk200m),                  // input wire clk
//  .probe_out0(frame_valid_delay[0]),    // output wire [3 : 0] probe_out0
//  .probe_out1(frame_valid_delay[1]),    // output wire [3 : 0] probe_out1
//  .probe_out2(frame_valid_delay[2]),    // output wire [3 : 0] probe_out2
//  .probe_out3(frame_valid_delay[3]),    // output wire [3 : 0] probe_out3
//  .probe_out4(frame_valid_delay[4]),    // output wire [3 : 0] probe_out4
//  .probe_out5(frame_valid_delay[5]),    // output wire [3 : 0] probe_out5
//  .probe_out6(frame_valid_delay[6]),    // output wire [3 : 0] probe_out6
//  .probe_out7(frame_valid_delay[7]),    // output wire [3 : 0] probe_out7
//  .probe_out8(frame_valid_delay[8]),    // output wire [3 : 0] probe_out8
//  .probe_out9(frame_valid_delay[9]),    // output wire [3 : 0] probe_out9
//  .probe_out10(frame_valid_delay[10]),  // output wire [3 : 0] probe_out10
//  .probe_out11(frame_valid_delay[11]),  // output wire [3 : 0] probe_out11
//  .probe_out12(frame_valid_delay[12]),  // output wire [3 : 0] probe_out12
//  .probe_out13(frame_valid_delay[13])  // output wire [3 : 0] probe_out13
//);

genvar pin_count;
generate for (pin_count = 0; pin_count < 14; pin_count = pin_count + 1) begin: pixel_sync
	//--lvds
	pixel_receive#(
	.DATA_WIDTH      		( 13 ),
	.DEBUG_EN               (DEBUG_EN[pin_count])
	)u_pixel_receive(
	.phase					(phase[pin_count]			),//
	.ch_cnt					(pin_count					),//chanel number

	.pixel_bit_p      		( lvds_p[pin_count]      	),
	.pixel_bit_n      		( lvds_n[pin_count]      	),

	.pixel_clk_p      		( clk_p[pin_count]      	),
	.pixel_clk_n      		( clk_n[pin_count]      	),
		
		
    .fifo_busy          (fifo_busy[pin_count]           ),		
	.rstn           	( rstn           				),
	.refclk				( clk200m						),
	
	.frame_valid_delay  (frame_valid_delay[pin_count]   ),
		
	.SET_DELAY_VALUE	( probe_out[pin_count] 			),//delay set
	.DELAY_OUT			( probe_in[pin_count]          	),

	.DATA_CLK			( data_to_fifo_clk[pin_count]  	),	
	.DATA				( data_to_fifo[pin_count] 	 	),
	.DATA_EN			( data_to_fifo_en[pin_count]   	)
	);
	
    always @ (posedge data_to_fifo_clk[pin_count]) begin
        wr_rst_busy_reg0[pin_count] <= wr_rst_busy[pin_count];
        wr_rst_busy_reg1[pin_count] <= wr_rst_busy_reg0[pin_count];
        
        rd_rst_busy_reg0[pin_count] <= rd_rst_busy[pin_count];
        rd_rst_busy_reg1[pin_count] <= rd_rst_busy_reg0[pin_count];
    end 
    
    assign fifo_busy[pin_count] = wr_rst_busy_reg1[pin_count] | rd_rst_busy_reg1[pin_count];
	
	//--fifo
	fifo512bit_1k lvds1_fifo512bit_1k (
	.rst			(~(rstn&&fifo_rst)),                      // input wire rst
	
	.wr_clk			(data_to_fifo_clk[pin_count]	),                // input wire wr_clk
	.din			(data_to_fifo[pin_count]		),                      // input wire [511 : 0] din
	.wr_en			(data_to_fifo_en[pin_count]		),                  // input wire wr_en
	.rd_clk			(data_from_fifo_clk				),                // input wire rd_clk
	.rd_en			(data_from_fifo_en[pin_count]	),                  // input wire rd_en
	.dout			(data_from_fifo[pin_count]		),                    // output wire [511 : 0] dout
	.rd_data_count	(data_rd_data_count[pin_count]	),  // output wire [9 : 0] rd_data_count
	
	.full(),                    // output wire full
	.empty(),                  // output wire empty
	.wr_data_count(),  // output wire [9 : 0] wr_data_count
	.wr_rst_busy(wr_rst_busy[pin_count]),      // output wire wr_rst_busy
	.rd_rst_busy(rd_rst_busy[pin_count])      // output wire rd_rst_busy
	);
	
//	always @ ( posedge data_from_fifo_clk )
//	begin
//		data_from_fifo_en_r1[pin_count] 	<= data_from_fifo_en[pin_count];
//		data_from_fifo_en_r2[pin_count] 	<= data_from_fifo_en_r1[pin_count];
//		data_from_fifo_en_r3[pin_count] 	<= data_from_fifo_en_r2[pin_count];
//		data_out_en[pin_count] 			<= data_from_fifo_en_r3[pin_count];
//		data_out[pin_count] 				<= data_from_fifo[pin_count];
//	end
		
		
  end
endgenerate

//---------------------------------------------------------------
//流水线读�??

reg [07:0]	c_state;
reg [07:0]	n_state;

always @ (posedge data_from_fifo_clk)
	if(!rstn)
		c_state	<= 8'd0;
	else
		c_state	<= n_state;

always @(*) 
	case(c_state)	
		0 : begin
			if((data_rd_data_count[0]	>512)||(data_rd_data_count[1]	>512)||(data_rd_data_count[2]	>512)||(data_rd_data_count[3]	>512))
				n_state	= 8'd15;
			else if((data_rd_data_count[0] >64)&&(data_rd_data_count[1]	>64)&&(data_rd_data_count[2]	>64)&&(data_rd_data_count[3]	>64))
				n_state	= 8'd1;
			else
				n_state	= 8'd0;
		end
		1 : n_state	= 8'd8 ;
//		1 : n_state	= 8'd2 ;
//		2 : n_state	= 8'd3 ;
//		3 : n_state	= 8'd4 ;
//		4 : n_state	= 8'd5 ;
//		5 : n_state	= 8'd6 ;
//		6 : n_state	= 8'd7 ;
//		7 : n_state	= 8'd8 ;
		8 : n_state	= 8'd0 ;
//		8 : n_state	= 8'd9 ;
//		9 : n_state	= 8'd10;
//		10 : n_state	= 8'd11;
//		11 : n_state	= 8'd12;
//		12 : n_state	= 8'd13;
//		13 : n_state	= 8'd14;
//		14 : n_state	= 8'd0;
		15 : if(delay_cnt==5)n_state	= 8'd0;
		      else 
		          n_state = 8'd15;
		default:n_state	= 8'd0;
	endcase

always @ (posedge data_from_fifo_clk)
	if(!rstn)begin
		data_from_fifo_en[00]	<= 1'b0;
		data_from_fifo_en[01]	<= 1'b0;
		data_from_fifo_en[02]	<= 1'b0;
		data_from_fifo_en[03]	<= 1'b0;
		data_from_fifo_en[04]	<= 1'b0;
		data_from_fifo_en[05]	<= 1'b0;
		data_from_fifo_en[06]	<= 1'b0;
		data_from_fifo_en[07]	<= 1'b0;
		data_from_fifo_en[08]	<= 1'b0;
		data_from_fifo_en[09]	<= 1'b0;
		data_from_fifo_en[10]	<= 1'b0;
		data_from_fifo_en[11]	<= 1'b0;
		data_from_fifo_en[12]	<= 1'b0;
		data_from_fifo_en[13]	<= 1'b0;

		delay_cnt	<= 8'd0;
		fifo_rst	<= 1'b0;
	end
	else
	case(n_state)
		0 : begin
		data_from_fifo_en[00]	<= 1'b0;
		data_from_fifo_en[01]	<= 1'b0;
		data_from_fifo_en[02]	<= 1'b0;
		data_from_fifo_en[03]	<= 1'b0;
		data_from_fifo_en[04]	<= 1'b0;
		data_from_fifo_en[05]	<= 1'b0;
		data_from_fifo_en[06]	<= 1'b0;
		data_from_fifo_en[07]	<= 1'b0;
		data_from_fifo_en[08]	<= 1'b0;
		data_from_fifo_en[09]	<= 1'b0;
		data_from_fifo_en[10]	<= 1'b0;
		data_from_fifo_en[11]	<= 1'b0;
		data_from_fifo_en[12]	<= 1'b0;
		data_from_fifo_en[13]	<= 1'b0;
		delay_cnt	<= 8'd0;
		fifo_rst	<= 1'b1;
	end
		1 : begin
		data_from_fifo_en[00]	<= 1'b1;
		data_from_fifo_en[01]	<= 1'b1;
		data_from_fifo_en[02]	<= 1'b1;
		data_from_fifo_en[03]	<= 1'b1;
		data_from_fifo_en[04]	<= 1'b1;
		data_from_fifo_en[05]	<= 1'b1;
		data_from_fifo_en[06]	<= 1'b1;
		data_from_fifo_en[07]	<= 1'b0;
		data_from_fifo_en[08]	<= 1'b0;
		data_from_fifo_en[09]	<= 1'b0;
		data_from_fifo_en[10]	<= 1'b0;
		data_from_fifo_en[11]	<= 1'b0;
		data_from_fifo_en[12]	<= 1'b0;
		data_from_fifo_en[13]	<= 1'b0;
	end
//		2 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b1;
//		data_from_fifo_en[02]	<= 1'b0;
//		data_from_fifo_en[03]	<= 1'b0;
//		data_from_fifo_en[04]	<= 1'b0;
//		data_from_fifo_en[05]	<= 1'b0;
//		data_from_fifo_en[06]	<= 1'b0;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b0;
//		data_from_fifo_en[09]	<= 1'b0;
//		data_from_fifo_en[10]	<= 1'b0;
//		data_from_fifo_en[11]	<= 1'b0;
//		data_from_fifo_en[12]	<= 1'b0;
//		data_from_fifo_en[13]	<= 1'b0;
//	end
//		3 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b0;
//		data_from_fifo_en[02]	<= 1'b1;
//		data_from_fifo_en[03]	<= 1'b0;
//		data_from_fifo_en[04]	<= 1'b0;
//		data_from_fifo_en[05]	<= 1'b0;
//		data_from_fifo_en[06]	<= 1'b0;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b0;
//		data_from_fifo_en[09]	<= 1'b0;
//		data_from_fifo_en[10]	<= 1'b0;
//		data_from_fifo_en[11]	<= 1'b0;
//		data_from_fifo_en[12]	<= 1'b0;
//		data_from_fifo_en[13]	<= 1'b0;
//	end
//		4 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b0;
//		data_from_fifo_en[02]	<= 1'b0;
//		data_from_fifo_en[03]	<= 1'b1;
//		data_from_fifo_en[04]	<= 1'b0;
//		data_from_fifo_en[05]	<= 1'b0;
//		data_from_fifo_en[06]	<= 1'b0;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b0;
//		data_from_fifo_en[09]	<= 1'b0;
//		data_from_fifo_en[10]	<= 1'b0;
//		data_from_fifo_en[11]	<= 1'b0;
//		data_from_fifo_en[12]	<= 1'b0;
//		data_from_fifo_en[13]	<= 1'b0;
//	end
//		5 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b0;
//		data_from_fifo_en[02]	<= 1'b0;
//		data_from_fifo_en[03]	<= 1'b0;
//		data_from_fifo_en[04]	<= 1'b1;
//		data_from_fifo_en[05]	<= 1'b0;
//		data_from_fifo_en[06]	<= 1'b0;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b0;
//		data_from_fifo_en[09]	<= 1'b0;
//		data_from_fifo_en[10]	<= 1'b0;
//		data_from_fifo_en[11]	<= 1'b0;
//		data_from_fifo_en[12]	<= 1'b0;
//		data_from_fifo_en[13]	<= 1'b0;
//	end
//		6 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b0;
//		data_from_fifo_en[02]	<= 1'b0;
//		data_from_fifo_en[03]	<= 1'b0;
//		data_from_fifo_en[04]	<= 1'b0;
//		data_from_fifo_en[05]	<= 1'b1;
//		data_from_fifo_en[06]	<= 1'b0;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b0;
//		data_from_fifo_en[09]	<= 1'b0;
//		data_from_fifo_en[10]	<= 1'b0;
//		data_from_fifo_en[11]	<= 1'b0;
//		data_from_fifo_en[12]	<= 1'b0;
//		data_from_fifo_en[13]	<= 1'b0;
//	end
//		7 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b0;
//		data_from_fifo_en[02]	<= 1'b0;
//		data_from_fifo_en[03]	<= 1'b0;
//		data_from_fifo_en[04]	<= 1'b0;
//		data_from_fifo_en[05]	<= 1'b0;
//		data_from_fifo_en[06]	<= 1'b1;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b0;
//		data_from_fifo_en[09]	<= 1'b0;
//		data_from_fifo_en[10]	<= 1'b0;
//		data_from_fifo_en[11]	<= 1'b0;
//		data_from_fifo_en[12]	<= 1'b0;
//		data_from_fifo_en[13]	<= 1'b0;
//	end
		8 : begin
		data_from_fifo_en[00]	<= 1'b0;
		data_from_fifo_en[01]	<= 1'b0;
		data_from_fifo_en[02]	<= 1'b0;
		data_from_fifo_en[03]	<= 1'b0;
		data_from_fifo_en[04]	<= 1'b0;
		data_from_fifo_en[05]	<= 1'b0;
		data_from_fifo_en[06]	<= 1'b0;
		data_from_fifo_en[07]	<= 1'b1;
		data_from_fifo_en[08]	<= 1'b1;
		data_from_fifo_en[09]	<= 1'b1;
		data_from_fifo_en[10]	<= 1'b1;
		data_from_fifo_en[11]	<= 1'b1;
		data_from_fifo_en[12]	<= 1'b1;
		data_from_fifo_en[13]	<= 1'b1;
	end
//		9 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b0;
//		data_from_fifo_en[02]	<= 1'b0;
//		data_from_fifo_en[03]	<= 1'b0;
//		data_from_fifo_en[04]	<= 1'b0;
//		data_from_fifo_en[05]	<= 1'b0;
//		data_from_fifo_en[06]	<= 1'b0;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b1;
//		data_from_fifo_en[09]	<= 1'b0;
//		data_from_fifo_en[10]	<= 1'b0;
//		data_from_fifo_en[11]	<= 1'b0;
//		data_from_fifo_en[12]	<= 1'b0;
//		data_from_fifo_en[13]	<= 1'b0;
//	end
//		10 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b0;
//		data_from_fifo_en[02]	<= 1'b0;
//		data_from_fifo_en[03]	<= 1'b0;
//		data_from_fifo_en[04]	<= 1'b0;
//		data_from_fifo_en[05]	<= 1'b0;
//		data_from_fifo_en[06]	<= 1'b0;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b0;
//		data_from_fifo_en[09]	<= 1'b1;
//		data_from_fifo_en[10]	<= 1'b0;
//		data_from_fifo_en[11]	<= 1'b0;
//		data_from_fifo_en[12]	<= 1'b0;
//		data_from_fifo_en[13]	<= 1'b0;
//	end
//		11 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b0;
//		data_from_fifo_en[02]	<= 1'b0;
//		data_from_fifo_en[03]	<= 1'b0;
//		data_from_fifo_en[04]	<= 1'b0;
//		data_from_fifo_en[05]	<= 1'b0;
//		data_from_fifo_en[06]	<= 1'b0;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b0;
//		data_from_fifo_en[09]	<= 1'b0;
//		data_from_fifo_en[10]	<= 1'b1;
//		data_from_fifo_en[11]	<= 1'b0;
//		data_from_fifo_en[12]	<= 1'b0;
//		data_from_fifo_en[13]	<= 1'b0;
//	end
//		12 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b0;
//		data_from_fifo_en[02]	<= 1'b0;
//		data_from_fifo_en[03]	<= 1'b0;
//		data_from_fifo_en[04]	<= 1'b0;
//		data_from_fifo_en[05]	<= 1'b0;
//		data_from_fifo_en[06]	<= 1'b0;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b0;
//		data_from_fifo_en[09]	<= 1'b0;
//		data_from_fifo_en[10]	<= 1'b0;
//		data_from_fifo_en[11]	<= 1'b1;
//		data_from_fifo_en[12]	<= 1'b0;
//		data_from_fifo_en[13]	<= 1'b0;
//	end
//		13 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b0;
//		data_from_fifo_en[02]	<= 1'b0;
//		data_from_fifo_en[03]	<= 1'b0;
//		data_from_fifo_en[04]	<= 1'b0;
//		data_from_fifo_en[05]	<= 1'b0;
//		data_from_fifo_en[06]	<= 1'b0;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b0;
//		data_from_fifo_en[09]	<= 1'b0;
//		data_from_fifo_en[10]	<= 1'b0;
//		data_from_fifo_en[11]	<= 1'b0;
//		data_from_fifo_en[12]	<= 1'b1;
//		data_from_fifo_en[13]	<= 1'b0;
//	end
//		14 : begin
//		data_from_fifo_en[00]	<= 1'b0;
//		data_from_fifo_en[01]	<= 1'b0;
//		data_from_fifo_en[02]	<= 1'b0;
//		data_from_fifo_en[03]	<= 1'b0;
//		data_from_fifo_en[04]	<= 1'b0;
//		data_from_fifo_en[05]	<= 1'b0;
//		data_from_fifo_en[06]	<= 1'b0;
//		data_from_fifo_en[07]	<= 1'b0;
//		data_from_fifo_en[08]	<= 1'b0;
//		data_from_fifo_en[09]	<= 1'b0;
//		data_from_fifo_en[10]	<= 1'b0;
//		data_from_fifo_en[11]	<= 1'b0;
//		data_from_fifo_en[12]	<= 1'b0;
//		data_from_fifo_en[13]	<= 1'b1;
//	end
		15 : begin
		data_from_fifo_en[00]	<= 1'b0;
		data_from_fifo_en[01]	<= 1'b0;
		data_from_fifo_en[02]	<= 1'b0;
		data_from_fifo_en[03]	<= 1'b0;
		data_from_fifo_en[04]	<= 1'b0;
		data_from_fifo_en[05]	<= 1'b0;
		data_from_fifo_en[06]	<= 1'b0;
		data_from_fifo_en[07]	<= 1'b0;
		data_from_fifo_en[08]	<= 1'b0;
		data_from_fifo_en[09]	<= 1'b0;
		data_from_fifo_en[10]	<= 1'b0;
		data_from_fifo_en[11]	<= 1'b0;
		data_from_fifo_en[12]	<= 1'b0;
		data_from_fifo_en[13]	<= 1'b0;
		delay_cnt	<= delay_cnt	+	1'b1;
		fifo_rst	<= 1'b0;
	end

	endcase

localparam IDLE = 3'd0;
localparam FR = 3'd1;			//first row
localparam PRE_UPPER = 3'd2;	//40row
localparam MIDDLE = 3'd3;
localparam PRE_LOWER = 3'd4;	//40row
localparam LR = 3'd5;			//last row

reg fifo_wr;

wire [275:0] pix_rdata [13:0];
wire [13:0] pix_empty, pp_ram_full;
wire [13:0] wr_done, pix_rd_done;
wire [9:0] pix_waddr [13:0];
wire [9:0] pix_raddr [13:0];
wire [13:0] pix_ram_rden;
reg rd_mid;

reg [9:0] pix_waddr_reg [13:0];

//reg [9:0] cnt_wr [13:0];
reg [9:0] cnt_rd;
reg [10:0] cnt_line;

reg [2:0] state;
reg [2:0] nstate;

function [1919:0] reverse_line;
input [1919:0] bits;
integer k;
begin
  for (k=0;k<1920;k=k+1) begin
    reverse_line[k] = bits[1919-k];
  end
end
endfunction

function [275:0] reverse_line0;
input [275:0] bits;
integer k;
begin
  for (k=0;k<276;k=k+1) begin
    reverse_line0[k] = bits[275-k];
  end
end
endfunction


always @ (posedge clk125m or negedge rstn) begin
    if (!rstn) begin
        state <= IDLE;
        cnt_line <= 11'd0;
        rd_mid <= 1'b0;
    end 
    else begin
        case (state)
            IDLE : begin
                if (fifo_wr_ready && (!(|pix_empty))) begin
                    state <= MIDDLE;
                    cnt_line <= 11'd0;
                    rd_mid <= 1'b1;
                end 
            end 
            
            MIDDLE : begin
                if (cnt_line >= 1079) begin
                    state <= IDLE;
                    rd_mid <= 1'b0;
                    cnt_line <= 11'd0;
                end 
                else begin
                    cnt_line <= cnt_line + 1'b1;
                end 
            end 
        endcase
    end 
end 

(* KEEP = "TRUE" *)wire  [$clog2(540)-1:0]          tfi_addr[0:13];
(* KEEP = "TRUE" *)wire  [276*4-1:0]         		tfi_data[0:13];
(* KEEP = "TRUE" *)wire 							tfi_read_en[0:13];
(* KEEP = "TRUE" *)wire 							led_en[0:13];
(* KEEP = "TRUE" *)wire led_or_en = led_en[2]|led_en[3]|led_en[4]|led_en[9]|led_en[10]|led_en[11];
(* KEEP = "TRUE" *)wire [13:0] 						led_delay_ms;
(* KEEP = "TRUE" *)wire [19:0] 						led_sensitive;
genvar i;
generate for (i = 0; i < 14; i = i + 1) begin: PP_RAM

//    assign wr_done[i] = (data_from_fifo_en[i] && (cnt_wr[i] == (VA - 1))) ? 1'b1 : 1'b0;
    assign wr_done[i] = (data_from_fifo_en[i] && (pix_waddr[i] == (VA - 1))) ? 1'b1 : 1'b0;
    assign pix_waddr[i] = data_from_fifo[i][276 +: 10];
    assign pix_rd_done[i] = rd_mid && (cnt_line == 2*VA - 1);
    
    if (i < 7) begin
        assign pix_raddr[i] = (2*VA-1) - cnt_line; // ȥ����40��
        assign pix_ram_rden[i] = cnt_line >= VA ? rd_mid : 1'b0;
    end
    else begin
        assign pix_raddr[i] = cnt_line; // ȥ��ǰ40��
        assign pix_ram_rden[i] = cnt_line < VA ? rd_mid : 1'b0;
    end
    
    pp_pix #(.VA(VA)) u_pp_pix1 (
      .clk_i                (clk125m                    ),
      .resetz_i             (rstn                       ),
      .pp_ram_wr_done_i     (wr_done[i]                 ),
      .pp_ram_rd_done_i     (pix_rd_done[i]             ),
      .pp_ram_full_o        (pp_ram_full[i]             ),
      .pp_ram_empty_o       (pix_empty[i]               ),
      .pix_raddr_i          (pix_raddr[i]               ),
      .pix_rd_i             (pix_ram_rden[i]            ),
      .pix_waddr_i          (pix_waddr[i]               ),
      .pix_wdata_i          (data_from_fifo[i][275:0]   ),
      .pix_wr_i             (data_from_fifo_en[i]       ),
      .pix_rdata_o          (pix_rdata[i]               )
    );
/**TFI算法，designed by ltc 2024/10/2**/
		if(i == 2 || i == 3 || i == 4 || i == 9 || i== 10 || i == 11) begin
			TFI #(
				.DATA_WIDTH		(276),
				.DATA_DEPTH		(540),
				.QUANT_SIZE		(4	),
				.WINDOWS		(15	)
			)u_TFI(
				.clk          (clk125m          		),
				.rstn         (rstn        	 			),
				.spike_data_i (data_from_fifo[i][275:0] ),
				.spike_valid  (data_from_fifo_en[i]  	),
				.spike_addr   (pix_waddr[i]   			),
				.clk_q        (clk125m        			),
				.addr_q       (tfi_addr[i]     			),
				.q0           (tfi_data[i] 				),
				.read_sel     (tfi_read_en[i]  			)
			);
			saveimg_and_sub #(
				.DATA_WIDTH (4	),    // 每个数据的位�?  
				.RAM_DEPTH  (540),   // RAM的深�?  
				.NUM_ROWS   (276)     // 行数  
			)u_saveimg_and_sub(
				.clk         (clk125m         			),
				.rstn        (rstn        				),
				.tfi_data    (tfi_data[i]    			),
				.tfi_addr    (tfi_addr[i]    			),
				.tfi_read_en (tfi_read_en[i] 			),
				.led_en	 	 (led_en[i]					),
				.sensitive	 (led_sensitive)
			);
			
		end
    end 
/**end of TFI算法，designed by ltc 2024/10/2**/
endgenerate
always @(posedge clk125m or negedge rstn) begin		
  if (!rstn) begin
    fifo_wr <= 1'b0;
  end else begin
    fifo_wr <= rd_mid;
  end
end
vio_4 your_instance_name (
  .clk(clk),                // input wire clk
  .probe_out0(led_delay_ms),  // output wire [13 : 0] probe_out0
  .probe_out1(led_sensitive)  // output wire [19 : 0] probe_out1
);
led_trigger u_led_trigger(
	.trigger  (led_or_en  	),
	.delay_ms (led_delay_ms ),
	.led      (led      	),
	.clk      (clk      	),
	.rst      (rstn     	)
);

reg [1931:0] linePix_reorder;
reg [1919:0] linePix_out;
wire [2559:0] line_out_adjust;
reg [10:0] cnt_line_reg;

always @ (posedge clk125m) begin
    cnt_line_reg <= cnt_line;
end

always @ (*) begin
    if (cnt_line_reg >= 540 ) begin
        linePix_reorder = {pix_rdata[6],  pix_rdata[5],  pix_rdata[4], pix_rdata[3], 
                           pix_rdata[2],  pix_rdata[1],  pix_rdata[0]};
    end 
    else begin
        linePix_reorder = {pix_rdata[13], pix_rdata[12], pix_rdata[11], pix_rdata[10], 
                           pix_rdata[9],  pix_rdata[8],  pix_rdata[7]};
    end   
end

ila_1 ila_1 (
	.clk(clk125m), // input wire clk
	.probe0({pix_rdata[0],pix_rdata[7]}), // input wire [3863:0]  probe0  
	.probe1(pix_ram_rden), // input wire [13:0]  probe1 
	.probe2(cnt_line_reg), // input wire [9:0]  probe2
	.probe3(state), // input wire [9:0]  probe2
	.probe4(pix_empty), // input wire [9:0]  probe2
	.probe5(c_state), // input wire [9:0]  probe2
	.probe6(data_from_fifo_en), // input wire [9:0]  probe2
	.probe7(wr_done) // input wire [9:0]  probe2
);

//always@(posedge clk125m or negedge rstn) begin
//	if(!rstn)
//		linePix_out <= 1920'b0;
//	else begin
//	case (state)
//		IDLE: 		linePix_out <= 1920'b0;
//		FR: 		linePix_out <= {192'hf1f1_f0f0_f1f1_f0f0_f1f1_f0f0_f1f1_f0f0_f1f1_f0f0_f1f1_f0f0,1728'b0};
//		PRE_UPPER: 	linePix_out <= 1920'b0;
////		MIDDLE: 	linePix_out <= vio_sel1 ? linePix_reorder[12+:1920] : reverse_line(linePix_reorder[12+:1920]);
////		MIDDLE: 	linePix_out <= linePix_reorder[12+:1920];
//		MIDDLE: 	linePix_out <= linePix_reorder[6+:1920];
//		PRE_LOWER: 	linePix_out <= (cnt_line==11'd1039)?linePix_out:1920'b0;
//		LR: 		linePix_out <= {192'hf0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0,1728'b0};
//	endcase
//	end
//end

always @ (*) begin
    if (cnt_line_reg == 11'd0) begin
        linePix_out = {192'hf1f1_f0f0_f1f1_f0f0_f1f1_f0f0_f1f1_f0f0_f1f1_f0f0_f1f1_f0f0,1728'b0};
    end 
    else if (cnt_line_reg == 2*VA - 1) begin
        linePix_out = {192'hf0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0_f0f0,1728'b0};
    end 
    else begin
        linePix_out = linePix_reorder[6+:1920];
    end
end 

genvar j;
for(j=0;j<10;j=j+1)begin
	assign line_out_adjust[(256*j+255):256*j]={pixl_data_out_en,63'b0,linePix_out[192*j+191:192*j]};
end


assign pixl_data_out = line_out_adjust;		//gt_rx_afifo��data����
assign pixl_data_out_en = fifo_wr;


//---------------------------------------------------------------
//--config
wire cs_p;
wire clk2m;
reg [07:0] clk_cnt;
always @ (posedge clk10m)
	if(!rstn)
		clk_cnt	<= 8'd0;
	else
		clk_cnt	<= clk_cnt	+	1'b1;

assign 	clk2m	= 	clk_cnt[2];

reg [07:0]	load_cnt;
wire   load	;
always @ (posedge clk2m)
	if(!rstn)
		load_cnt	<=8'd0;
	else if(&load_cnt)
		load_cnt	<=load_cnt;
	else
		load_cnt	<=load_cnt	+	1'b1;
		

assign load	= (load_cnt == 250)	?	1'b1 : 1'b0;

spi_config u_spi_config(
		.clk     		( clk2m   		),//2mhz
		.clk10m  		( clk10m		),
		.rst_n   		( rstn   		),
		.load	 		( load	    	),
		.cs_spi	 		( cs_p			),
		.clk_spi 		( clk_spi 		),
		.miso    		( miso    		),
		.mosi    		( mosi    		)
);

assign cs	=cs_p;




endmodule
