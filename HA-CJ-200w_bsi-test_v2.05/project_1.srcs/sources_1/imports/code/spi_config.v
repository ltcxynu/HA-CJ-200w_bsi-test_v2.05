`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:31 06/21/2021 
// Design Name: 
// Module Name:    spi_config 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`define VIO;

module spi_config (
    
		input     wire          clk, // 2MHz, 500ns
		input 		wire clk10m,
		input     wire          rst_n,

		input     wire          load,
    
		output    wire          cs_spi,
		output    wire          clk_spi, // spi内部时钟
		input    wire          miso,
		output    wire          mosi
);


//-------------------------------- internal signals ------------------------------//
reg         	cs_p;
reg             cs_p_d1         ;

reg   [7:0]     cnt_reg         ;  // �?要配置的寄存器计数器,�?�?31�?!
reg   [7:0]     cnt_clk         ;  // 每个寄存器需要的时钟数计数器


reg   [15:0]    data_reg        ;  // 地址+指令+数据

  reg 		    mosi_reg    ;

  reg [15:0]		mid_data_reg;
  reg           sdio            ;
  reg           cs              ;
  reg           sclk            ;


//------------------------------------ parameter ----------------------------------//


//------------------------------------ main code ----------------------------------//
wire vio_valid;
wire reload;
wire [15:0] probe_out0[31:0]; 
wire [15:0] probe_out1[31:0];
wire [15:0] probe_out2[31:0];

wire            lvds_test_en;
wire   [15:0]   lvds_test_reg;

wire [7:0] vio_reg_10, vio_reg_11, vio_reg_28;
wire [3:0] vio_lvds_reg0;
wire [3:0] vio_lvds_reg1;
wire [3:0] vio_lvds_reg2;
wire [3:0] vio_lvds_reg3;
wire [3:0] vio_lvds_reg4;
wire [3:0] vio_lvds_reg5;
wire [3:0] vio_lvds_reg6;
wire [3:0] vio_lvds_reg7;
wire [3:0] vio_lvds_reg8;
wire [3:0] vio_lvds_reg9;
wire [3:0] vio_lvds_reg10;
wire [3:0] vio_lvds_reg11;
wire [3:0] vio_lvds_reg12;
wire [3:0] vio_lvds_reg13;

//assign vio_reg_10 = probe_out0[00][7:0];
//assign vio_reg_11 = probe_out0[01][7:0];
//assign vio_reg_28 = probe_out0[02][7:0];

assign vio_reg_10 = 8'h20;
assign vio_reg_11 = 8'h20;
assign vio_reg_28 = 8'h01;

assign vio_lvds_reg0  = probe_out0[03][1:0];
assign vio_lvds_reg1  = probe_out0[04][1:0];
assign vio_lvds_reg2  = probe_out0[05][1:0];
assign vio_lvds_reg3  = probe_out0[06][1:0];
assign vio_lvds_reg4  = probe_out0[07][1:0];
assign vio_lvds_reg5  = probe_out0[08][1:0];
assign vio_lvds_reg6  = probe_out0[09][1:0];
assign vio_lvds_reg7  = probe_out0[10][1:0];
assign vio_lvds_reg8  = probe_out0[11][1:0];
assign vio_lvds_reg9  = probe_out0[12][1:0];
assign vio_lvds_reg10 = probe_out0[13][1:0];
assign vio_lvds_reg11 = probe_out0[14][1:0];
assign vio_lvds_reg12 = probe_out0[15][1:0];
assign vio_lvds_reg13 = probe_out0[16][1:0];



assign lvds_test_reg  = lvds_test_en ?  16'b0001101_1_0000_0001 : 16'b0001101_1_0000_0000;//lvds test en


always @(negedge clk) begin
    case(cnt_reg)
        // Serial Port Configuration
		
        8'd01   : data_reg <= 16'b0100010_1_0000_0011;  //PLL config�?20*（n+3�?
        8'd02   : data_reg <= 16'b0100010_0_0000_0000;  // 
		
        8'd03   : data_reg <= lvds_test_reg;  //TEST EN
        8'd04   : data_reg <= 16'b0001101_0_0000_0000;  // 
		
        8'd05   : data_reg <= 16'b0011111_1_0000_0001;  //LVDS EN
        8'd06   : data_reg <= 16'b0011111_0_0000_0000;  // 
        
        8'd07   : data_reg <= 16'b1001100_1_0000_0001;  //PLL EN
        8'd08   : data_reg <= 16'b1001100_0_0000_0000;  // 
		
//		8'd09   : data_reg <= 16'b0001010_1_0000_0001;  // 
//        8'd10   : data_reg <= 16'b0001010_0_0000_0000;  // 
//        8'd11   : data_reg <= 16'b0001011_1_0000_0001;  // 
//        8'd12   : data_reg <= 16'b0001011_0_0000_0000;  // 
		
//        8'd13   : data_reg <= 16'b0011100_1_0000_0010;  // timing start
//        8'd14   : data_reg <= 16'b0011100_0_0000_0000;  // 

        8'd09   : data_reg <= {8'b0001010_1, vio_reg_10};//0000_0001;  // 
        8'd10   : data_reg <= 16'b0001010_0_0000_0000;  // 
        8'd11   : data_reg <= {8'b0001011_1, vio_reg_11};  // 
        8'd12   : data_reg <= 16'b0001011_0_0000_0000;  // 
		
        8'd13   : data_reg <= {8'b0011100_1, vio_reg_28};//_0000_0010;  // timing start
        8'd14   : data_reg <= 16'b0011100_0_0000_0000;  // 

//        8'd15   : data_reg <= {12'b0100011_1_0000, vio_lvds_reg0};  // 
//        8'd16   : data_reg <= {12'b0100100_1_0000, vio_lvds_reg1};  // 
//        8'd17   : data_reg <= {12'b0100101_1_0000, vio_lvds_reg2};  // 
//        8'd18   : data_reg <= {12'b0100110_1_0000, vio_lvds_reg3};  // 
//        8'd19   : data_reg <= {12'b0100111_1_0000, vio_lvds_reg4};  // 
//        8'd20   : data_reg <= {12'b0101000_1_0000, vio_lvds_reg5};  // 
//        8'd21   : data_reg <= {12'b0101001_1_0000, vio_lvds_reg6};  // 
//        8'd22   : data_reg <= {12'b0101010_1_0000, vio_lvds_reg7};  // 
//        8'd23   : data_reg <= {12'b0101011_1_0000, vio_lvds_reg8};  // 
//        8'd24   : data_reg <= {12'b0101100_1_0000, vio_lvds_reg9};  // 
//        8'd25   : data_reg <= {12'b0101101_1_0000, vio_lvds_reg10};  // 
//        8'd26   : data_reg <= {12'b0101110_1_0000, vio_lvds_reg11};  // 
//        8'd27   : data_reg <= {12'b0101111_1_0000, vio_lvds_reg12};  // 
//        8'd28   : data_reg <= {12'b0110000_1_0000, vio_lvds_reg13};  // 
        
        8'd15   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd16   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd17   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd18   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd19   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd20   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd21   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd22   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd23   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd24   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd25   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd26   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd27   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd28   : data_reg <= 16'b0000000_1_0000_0010;  // 
        
        8'd29   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd30   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd31   : data_reg <= 16'b0000000_1_0000_0010;  // 
        8'd32   : data_reg <= 16'b0000000_1_0000_0010;  // 
	      8'd33   : data_reg <= 16'b0000000_1_0000_0010;
           8'd34: data_reg <= 16'b0000000_1_0000_0010;
           8'd35: data_reg <= 16'b0000000_1_0000_0010;
           8'd36: data_reg <= 16'b0000000_1_0000_0010;
           8'd37: data_reg <= 16'b0000000_1_0000_0010;
           8'd38: data_reg <= 16'b0000000_1_0000_0010;
           8'd39: data_reg <= 16'b0000000_1_0000_0010;
           8'd40: data_reg <= 16'b0000000_1_0000_0010;
           8'd41: data_reg <= 16'b0000000_1_0000_0010;
           8'd42: data_reg <= 16'b0000000_1_0000_0010;
           8'd43: data_reg <= 16'b0000000_1_0000_0010;
           8'd44: data_reg <= 16'b0000000_1_0000_0010;
           8'd45: data_reg <= 16'b0000000_1_0000_0010;
           8'd46: data_reg <= 16'b0000000_1_0000_0010;
           8'd47: data_reg <= 16'b0000000_1_0000_0010;
           8'd48: data_reg <= 16'b0000000_1_0000_0010;
           8'd49: data_reg <= 16'b0000000_1_0000_0010;
           8'd50: data_reg <= 16'b0000000_1_0000_0010;
           8'd51: data_reg <= 16'b0000000_1_0000_0010;
           8'd52: data_reg <= 16'b0000000_1_0000_0010;
           8'd53: data_reg <= 16'b0000000_1_0000_0010;
           8'd54: data_reg <= 16'b0000000_1_0000_0010;
           8'd55: data_reg <= 16'b0000000_1_0000_0010;
           8'd56: data_reg <= 16'b0000000_1_0000_0010;
           8'd57: data_reg <= 16'b0000000_1_0000_0010;
           8'd58: data_reg <= 16'b0000000_1_0000_0010;
           8'd59: data_reg <= 16'b0000000_1_0000_0010;
           8'd60: data_reg <= 16'b0000000_1_0000_0010;
           8'd61: data_reg <= 16'b0000000_1_0000_0010;
           8'd62: data_reg <= 16'b0000000_1_0000_0010;
           8'd63: data_reg <= 16'b0000000_1_0000_0010;
           8'd64: data_reg <= 16'b0000000_1_0000_0010;
           8'd65: data_reg <= 16'b0000000_1_0000_0010;
           8'd66: data_reg <= 16'b0000000_1_0000_0010;
           8'd67: data_reg <= 16'b0000000_1_0000_0010;
           8'd68: data_reg <= 16'b0000000_1_0000_0010;
           8'd69: data_reg <= 16'b0000000_1_0000_0010;
           8'd70: data_reg <= 16'b0000000_1_0000_0010;
           8'd71: data_reg <= 16'b0000000_1_0000_0010;
           8'd72: data_reg <= 16'b0000000_1_0000_0010;
           8'd73: data_reg <= 16'b0000000_1_0000_0010;
           8'd74: data_reg <= 16'b0000000_1_0000_0010;
           8'd75: data_reg <= 16'b0000000_1_0000_0010;
           8'd76: data_reg <= 16'b0000000_1_0000_0010;
           8'd77: data_reg <= 16'b0000000_1_0000_0010;
			  default : data_reg <= 16'dZ;
    endcase
	end


reg [07:0] c_state;
reg [07:0] n_state;

always @ (negedge clk or negedge rst_n)
	if(!rst_n)
		c_state	<= 8'd0;
	else
		c_state	<= n_state;
		
always @ (c_state  or load or reload or cnt_reg or cnt_clk)
	case(c_state)
		0 : begin
			if(load||reload)
				n_state	= 8'd1;
			else
				n_state	= 8'd0;
		end
		1 : begin
				n_state	= 8'd11;
		end
		11 : begin
				n_state	= 8'd2;
		end
		2 : begin
				n_state	= 8'd3;
		end
		3 : begin
			if(cnt_clk<8'd16)
				n_state	= 8'd2;
			else
				n_state	= 8'd4;
		end
		4 : begin
				n_state	= 8'd14;
		end
		14 : begin
			if(cnt_reg<78)
				n_state	= 8'd1;
			else
				n_state	= 8'd5;
		end
		5:	n_state	= 8'd0;
		default:n_state	= 8'd0;
	endcase

always @ (negedge clk or negedge rst_n)
	if(!rst_n)begin
		sdio <= 1'b0;
		cs   <= 1'b0;
		sclk <= 1'b1;
        cnt_clk <= 0;
        cnt_reg <= 1;
        mid_data_reg <= 16'b0;
	end
	else
		case(n_state)
			0 : begin
				sdio <= 1'b0;
				cs   <= 1'b0;
				sclk <= 1'b1;
        		cnt_clk <= 0;
       			cnt_reg <= 1;
        		mid_data_reg <= 16'b0;
			end
			1 : begin
				sdio <= 1'b0;
				cs   <= 1'b1;
				sclk <= 1'b1;
			end
			11 : begin
				sdio <= 1'b0;
				cs   <= 1'b1;
				sclk <= 1'b1;
        		mid_data_reg <= data_reg;
			end
			2 : begin
				sdio <= mid_data_reg[15];
				cs   <= 1'b1;
				sclk <= 1'b0;
				cnt_clk <= cnt_clk + 1;
			end
			3 : begin
              	mid_data_reg <= {mid_data_reg[14:0],1'b0};
				sdio <= sdio;
				cs   <= 1'b1;
				sclk <= 1'b1;
			end
			4 : begin
				sdio <= 1'b0;
				cs   <= 1'b0;
				sclk <= 1'b1;
			end
			14 : begin
				sdio <= 1'b0;
				cs   <= 1'b0;
				sclk <= 1'b1;
        		cnt_clk <= 0;
				if(cnt_reg<78)
					cnt_reg <= cnt_reg + 1;

			end
			5 : begin
				sdio <= 1'b0;
				cs   <= 1'b0;
				sclk <= 1'b1;
        		cnt_clk <= 0;
        		cnt_reg <= 0;
        		mid_data_reg <= 16'b0;
			end
			default: begin
				sdio <= 1'b0;
				cs   <= 1'b0;
				sclk <= 1'b1;
        		cnt_clk <= 0;
        		cnt_reg <= 0;
			end
		endcase

assign mosi	= sdio;
assign clk_spi	= sclk;
assign cs_spi	= ~cs;

//----------------------------------------------
vio_2 vio_2_inst1_32 (
  .clk(clk10m),                  // input wire clk
  .probe_out0   (probe_out0[00]	),    // output wire [13 : 0] probe_out0
  .probe_out1   (probe_out0[01]	),    // output wire [13 : 0] probe_out1
  .probe_out2   (probe_out0[02]	),    // output wire [13 : 0] probe_out2
  .probe_out3   (probe_out0[03]	),    // output wire [13 : 0] probe_out3
  .probe_out4   (probe_out0[04]	),    // output wire [13 : 0] probe_out4
  .probe_out5   (probe_out0[05]	),    // output wire [13 : 0] probe_out5
  .probe_out6   (probe_out0[06]	),    // output wire [13 : 0] probe_out6
  .probe_out7   (probe_out0[07]	),    // output wire [13 : 0] probe_out7
  .probe_out8   (probe_out0[08]	),    // output wire [13 : 0] probe_out8
  .probe_out9   (probe_out0[09]	),    // output wire [13 : 0] probe_out9
  .probe_out10(probe_out0[10]),  // output wire [13 : 0] probe_out10
  .probe_out11(probe_out0[11]),  // output wire [13 : 0] probe_out11
  .probe_out12(probe_out0[12]),  // output wire [13 : 0] probe_out12
  .probe_out13(probe_out0[13]),  // output wire [13 : 0] probe_out13
  .probe_out14(probe_out0[14]),  // output wire [13 : 0] probe_out14
  .probe_out15(probe_out0[15]),  // output wire [13 : 0] probe_out15
  .probe_out16(probe_out0[16]),  // output wire [13 : 0] probe_out16
  .probe_out17(probe_out0[17]),  // output wire [13 : 0] probe_out17
  .probe_out18(probe_out0[18]),  // output wire [13 : 0] probe_out18
  .probe_out19(probe_out0[19]),  // output wire [13 : 0] probe_out19
  .probe_out20(probe_out0[20]),  // output wire [13 : 0] probe_out20
  .probe_out21(probe_out0[21]),  // output wire [13 : 0] probe_out21
  .probe_out22(probe_out0[22]),  // output wire [13 : 0] probe_out22
  .probe_out23(probe_out0[23]),  // output wire [13 : 0] probe_out23
  .probe_out24(probe_out0[24]),  // output wire [13 : 0] probe_out24
  .probe_out25(probe_out0[25]),  // output wire [13 : 0] probe_out25
  .probe_out26(probe_out0[26]),  // output wire [13 : 0] probe_out26
  .probe_out27(probe_out0[27]),  // output wire [13 : 0] probe_out27
  .probe_out28(probe_out0[28]),  // output wire [13 : 0] probe_out28
  .probe_out29(probe_out0[29]),  // output wire [13 : 0] probe_out29
  .probe_out30(probe_out0[30]),  // output wire [13 : 0] probe_out30
  .probe_out31(probe_out0[31]),  // output wire [13 : 0] probe_out31
  
  
  .probe_out32(lvds_test_en),  // output wire [0 : 0] probe_out32
  .probe_out33(reload)  // output wire [0 : 0] probe_out32
);

/*
ila_2 SPI_ILA (
	.clk(clk10m), // input wire clk


	.probe0(mosi 	), // input wire [0:0]  probe0  
	.probe1(clk_spi	), // input wire [0:0]  probe1 
	.probe2(cs_spi	), // input wire [0:0]  probe2
	.probe3(miso 	) // input wire [0:0]  probe0  
);
*/

endmodule
