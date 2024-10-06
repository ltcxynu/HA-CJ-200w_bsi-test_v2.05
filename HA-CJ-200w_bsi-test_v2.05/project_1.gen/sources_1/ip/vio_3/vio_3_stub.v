// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Sep 11 10:06:39 2024
// Host        : LAPTOP-AT92CJ0U running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/work/vivado_prj/690t200w/HA-CJ-200w-test_v2.01/project_1.gen/sources_1/ip/vio_3/vio_3_stub.v
// Design      : vio_3
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1157-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2021.2" *)
module vio_3(clk, probe_out0)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_out0[3:0]" */;
  input clk;
  output [3:0]probe_out0;
endmodule
