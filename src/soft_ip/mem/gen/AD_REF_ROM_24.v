`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module AD_REF_ROM_24(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 22;
localparam ROM_DEP = 4;
localparam ROM_ADDR = 2;
// input definition
input clk;
input en;
input [ROM_ADDR-1:0] addr;
// output definition
output [ROM_WID-1:0] dout;
reg [ROM_WID-1:0] data;
always @(posedge clk)
begin
if (en) begin
case(addr)
		2'd0: data <= 22'b1111111111111111110010;
		2'd1: data <= 22'b1111111111111100111001;
		2'd2: data <= 22'b0000000000000000000100;
		2'd3: data <= 22'b0000000000000010000010;
		endcase
		end
	end
	assign dout = data;
endmodule
