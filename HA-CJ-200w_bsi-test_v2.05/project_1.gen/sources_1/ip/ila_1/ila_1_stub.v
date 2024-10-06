// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Fri Sep 20 15:43:00 2024
// Host        : LAPTOP-AT92CJ0U running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/work/vivado_prj/690t200w/HA-CJ-200w_bsi-test_v2.05/project_1.gen/sources_1/ip/ila_1/ila_1_stub.v
// Design      : ila_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1157-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2021.2" *)
module ila_1(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[551:0],probe1[13:0],probe2[10:0],probe3[2:0],probe4[13:0],probe5[7:0],probe6[13:0],probe7[13:0]" */;
  input clk;
  input [551:0]probe0;
  input [13:0]probe1;
  input [10:0]probe2;
  input [2:0]probe3;
  input [13:0]probe4;
  input [7:0]probe5;
  input [13:0]probe6;
  input [13:0]probe7;
endmodule
