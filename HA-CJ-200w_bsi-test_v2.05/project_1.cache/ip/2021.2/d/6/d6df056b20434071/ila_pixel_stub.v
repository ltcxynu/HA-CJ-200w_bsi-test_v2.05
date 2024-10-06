// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Tue Sep  3 15:20:19 2024
// Host        : LAPTOP-AT92CJ0U running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ila_pixel_stub.v
// Design      : ila_pixel
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1157-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2021.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[11:0],probe1[0:0],probe2[7:0],probe3[15:0],probe4[7:0],probe5[0:0],probe6[275:0],probe7[59:0],probe8[275:0]" */;
  input clk;
  input [11:0]probe0;
  input [0:0]probe1;
  input [7:0]probe2;
  input [15:0]probe3;
  input [7:0]probe4;
  input [0:0]probe5;
  input [275:0]probe6;
  input [59:0]probe7;
  input [275:0]probe8;
endmodule
