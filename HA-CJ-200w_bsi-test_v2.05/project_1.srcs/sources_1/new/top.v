`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/03 16:15:15
// Design Name: 
// Module Name: top
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

module cj_200w_top(

//system
	input 			clk //50m

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



//spi
	,output PDLU_EN
	,output PDLU_pixel_RSTN
	,output PDLU_RSTN
	,output PDRU_Mclk_20M

	,output    wire          clk_spi 
	,output    wire          mosi
	,input   	 wire          miso
	,output 	wire 	cs

    ,input               MGT117_P        
    ,input               MGT117_N        
    ,output [3 : 0]      QSFP1_TX_P      
    ,output [3 : 0]      QSFP1_TX_N      
    ,input  [3 : 0]      QSFP1_RX_P      
    ,input  [3 : 0]      QSFP1_RX_N  

//status
	,output 			led
//------------------------------------------------------


    );


wire	sys_clk50m;
wire clk125m;

    clk_wiz_0 clk_wiz_0 (
        .clk_out2   (sys_clk50m   	),
        .clk_out1   (sys_main_clk   ),
        .clk_in1    (clk      		)
    );

    assign clk125m             = sys_main_clk ;
	   //------------------------------相机-----------------------------------

	//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// clk_out1____10.000______0.000______50.0______285.743____164.985
// clk_out2____20.000______0.000______50.0______192.113____164.985
// clk_out3___100.000______0.000______50.0______162.035____164.985
// clk_out4___200.000______0.000______50.0______142.107____164.985
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary______________50____________0.010

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
wire clk10m    ;
wire clk20m    ;
wire clk100m   ;
wire clk200m   ;
wire pll_locked;
  clk_wiz_1 clk_wiz_1_inst
   (
    // Clock out ports
    .clk_out1(clk10m    ),     // output clk_out1
    .clk_out2(clk20m    ),     // output clk_out2
    .clk_out3(clk100m   ),     // output clk_out3
    .clk_out4(clk200m   ),     // output clk_out4
    // Status and control signals
    .reset(1'b0), // input reset
    .locked(pll_locked),       // output locked
   // Clock in ports
    .clk_in1(sys_clk50m));      // input clk_in1


reg [23:0] led_cnt;
always @ (posedge clk20m)
	led_cnt	<= led_cnt + 1;
assign led = led_cnt[23];
//*************************************************************
wire pixl_rstn;
reg [25:0] pixl_rstn_cnt;
always @ (posedge clk20m)
if(~pll_locked)
	pixl_rstn_cnt	<= 0;
else if(&pixl_rstn_cnt)
	pixl_rstn_cnt	<= pixl_rstn_cnt;
else
	pixl_rstn_cnt	<= pixl_rstn_cnt + 1;


assign PDLU_EN					=(pixl_rstn_cnt	<	50) ?	1'b0	:	1'b1;
assign PDLU_RSTN				=(pixl_rstn_cnt	<	50) ?	1'b0	:	1'b1;
assign PDLU_pixel_RSTN			=(pixl_rstn_cnt	<	2000) ?	1'b0	:	1'b1;
assign PDRU_Mclk_20M			=clk20m;

assign pixl_rstn				= (pixl_rstn_cnt	<	20000) ?	1'b0	:	1'b1;

wire pixl_data_out_en;
wire [2559:0]	pixl_data_out;

 pixel_top pixel_top_inst (
 
        .rstn	(pixl_rstn &&    pll_locked),
		
        .clk10m	(clk10m),
        .clk20m	(clk20m),
        .clk100m	(clk100m),
        .clk200m	(clk200m),
        .clk125m	(clk125m),
        
        .lvds_p1(lvds_p1[12:0]),
        .lvds_n1(lvds_n1[12:0]),
        .clk_p1(clk_p1),
        .clk_n1(clk_n1),
        
        .lvds_p2(lvds_p2),
        .lvds_n2(lvds_n2),
        .clk_p2(clk_p2),
        .clk_n2(clk_n2),
        
        .lvds_p3(lvds_p3),
        .lvds_n3(lvds_n3),
        .clk_p3(clk_p3),
        .clk_n3(clk_n3),

        .lvds_p4(lvds_p4),
        .lvds_n4(lvds_n4),
        .clk_p4(clk_p4),
        .clk_n4(clk_n4),

        .lvds_p5(lvds_p5),
        .lvds_n5(lvds_n5),
        .clk_p5(clk_p5),
        .clk_n5(clk_n5),

        .lvds_p6(lvds_p6),
        .lvds_n6(lvds_n6),
        .clk_p6(clk_p6),
        .clk_n6(clk_n6),

        .lvds_p7(lvds_p7),
        .lvds_n7(lvds_n7),
        .clk_p7(clk_p7),
        .clk_n7(clk_n7),

        .lvds_p8(lvds_p8),
        .lvds_n8(lvds_n8),
        .clk_p8(clk_p8),
        .clk_n8(clk_n8),

        .lvds_p9(lvds_p9),
        .lvds_n9(lvds_n9),
        .clk_p9(clk_p9),
        .clk_n9(clk_n9),

        .lvds_p10(lvds_p10),
        .lvds_n10(lvds_n10),
        .clk_p10(clk_p10),
        .clk_n10(clk_n10),

        .lvds_p11(lvds_p11),
        .lvds_n11(lvds_n11),
        .clk_p11(clk_p11),
        .clk_n11(clk_n11),

        .lvds_p12(lvds_p12),
        .lvds_n12(lvds_n12),
        .clk_p12(clk_p12),
        .clk_n12(clk_n12),

        .lvds_p13(lvds_p13),
        .lvds_n13(lvds_n13),
        .clk_p13(clk_p13),
        .clk_n13(clk_n13),

        .lvds_p14(lvds_p14),
        .lvds_n14(lvds_n14),
        .clk_p14(clk_p14),
        .clk_n14(clk_n14),

        .fifo_wr_ready (1'b1),
        //data out
        .pixl_data_out      (pixl_data_out),
        .pixl_data_out_en   (pixl_data_out_en),
        // SPI
        .clk_spi(clk_spi),
        .mosi(mosi),
        .miso(miso),
        .cs(cs)
    );
    
wire aurora_clk_o;
wire req_data;
wire fifo_empty;
wire [2559:0] fifo2reg;
wire [255:0] reg2aurora;
wire out_valid;
wire fifo_full;
wire aurora_tx_ready;

    wire                channel_up_aurora       ;
    wire [3 : 0]        lane_up_aurora          ;

    async_fifo#(
        .DSIZE(2560),
        .ASIZE(10)
    )async_fifo(
        .w_clk      (clk125m),
        .w_rst_n    (pll_locked),
        .w_en       (pixl_data_out_en && channel_up_aurora),
        .w_data     (pixl_data_out),    //debug
        .r_clk      (aurora_clk_o),
        .r_rst_n    (pll_locked),       //debug
        .r_en       (req_data && !fifo_empty),         //debug
        .r_data     (fifo2reg),         //debug
        .r_empty    (fifo_empty),       //debug
        .w_full     (fifo_full)         //debug
    );
    
    axis_dwidth_converter_0 dwidth_converter_u (
        .aclk(aurora_clk_o),                    // input wire aclk
        .aresetn(pll_locked),              // input wire aresetn
        .s_axis_tvalid(!fifo_empty),  // input wire s_axis_tvalid
        .s_axis_tready(req_data),  // output wire s_axis_tready
        .s_axis_tdata(fifo2reg),    // input wire [2559 : 0] s_axis_tdata
        .m_axis_tvalid(out_valid),  // output wire m_axis_tvalid
        .m_axis_tready(aurora_tx_ready),  // input wire m_axis_tready
        .m_axis_tdata(reg2aurora)    // output wire [255 : 0] m_axis_tdata
    );
    
    wire gt_125M_clk;
    wire soft_reset = 1'b0;
    
    IBUFDS_GTE2 IBUFGDS_GTclk_gt (
        .CEB                (1'b0               ),
        .I                  (MGT117_P           ),
        .IB                 (MGT117_N           ),
        .ODIV2              (),
        .O                  (gt_125M_clk        )
    );
    
    aurora_64b66b_0_support aurora_64b66b_0_block_i (
        // TX AXI4-S Interface
        .s_axi_tx_tdata         (reg2aurora     ),
        .s_axi_tx_tvalid        (out_valid),
        .s_axi_tx_tready        (aurora_tx_ready    ),
        // RX AXI4-S Interface
        .m_axi_rx_tdata         (),
        .m_axi_rx_tvalid        (),
        .m_axi_rx_tready        (),
        // GT Serial I/O
        .rxp                    (QSFP1_RX_P         ),
        .rxn                    (QSFP1_RX_N         ),
        .txp                    (QSFP1_TX_P         ),
        .txn                    (QSFP1_TX_N         ),
        //GT Reference Clock Interface
        .gt_refclk1_p           (gt_125M_clk        ),
        // Status
        .channel_up             (channel_up_aurora  ),
        .lane_up                (lane_up_aurora     ),
        // System Interface
        .user_clk_out           (aurora_clk_o         ),
        .reset_pb               (soft_reset         ),//复位
        .drp_clk_in             (clk125m       ),
        .init_clk_125M          (clk125m       ),
        //---------------------- GTXE2 COMMON DRP Ports ----------------------
        .tx_out_clk             ()
     ); 
     
    ila_0 ila_0 (
        .clk(aurora_clk_o), // input wire clk
        .probe0(channel_up_aurora), // input wire [0:0]  probe0  
        .probe1(lane_up_aurora), // input wire [0:0]  probe1 
        .probe2(aurora_tx_ready), // input wire [0:0]  probe2 
        .probe3(out_valid), // input wire [0:0]  probe3 
        .probe4(reg2aurora), // input wire [255:0]  probe4
        .probe5(pixl_data_out_en), // input wire [255:0]  probe4
        .probe6(fifo_full) // input wire [255:0]  probe4
    );

     
//     vio_0 vio_0 (
//        .probe_in0                  (lane_up_aurora     ),//4
//        .probe_out0                 (i_delay_param      ),//16
//        .probe_out1                 (soft_reset         ),//1//0 actually
//        .probe_out2                 (test_mode          ),//1
//        .clk                        (clk125m       ) //
//    );

endmodule
