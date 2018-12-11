// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon Oct 29 10:09:50 2018
// Host        : DESKTOP-M0UOV8J running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/Vivado_prj/B-CEDNet/B-CEDNet.srcs/sources_1/ip/c_shift_ram_0/c_shift_ram_0_stub.v
// Design      : c_shift_ram_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu9p-flga2104-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_shift_ram_v12_0_12,Vivado 2018.2" *)
module c_shift_ram_0(D, CLK, Q)
/* synthesis syn_black_box black_box_pad_pin="D[23:0],CLK,Q[23:0]" */;
  input [23:0]D;
  input CLK;
  output [23:0]Q;
endmodule
