// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Tue Oct 16 12:54:51 2018
// Host        : DESKTOP-M0UOV8J running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/Vivado_prj/B-CEDNet/B-CEDNet.srcs/sources_1/ip/data_in_ROM/data_in_ROM_stub.v
// Design      : data_in_ROM
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu9p-flga2104-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.2" *)
module data_in_ROM(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[11:0],douta[7:0]" */;
  input clka;
  input [11:0]addra;
  output [7:0]douta;
endmodule
