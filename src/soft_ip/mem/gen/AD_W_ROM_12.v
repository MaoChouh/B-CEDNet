`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module AD_W_ROM_12(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 153;
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
		2'd0: data <= 153'b000000100101100010000000000101111011111110100100000000000101001111110000000000011101111111101100100101000000001010011000000000000000110011111101100111111;
		2'd1: data <= 153'b000000000001110101111111110100011000000000001100110111111110001000110000001110011010011111101010100001000000000000010101111111110001010000000000011011000;
		2'd2: data <= 153'b111111111001101110000001001011101111111111001111101000000010110001010000000100110001111111100111110111000000001000101110000000101101101111111101001111110;
		2'd3: data <= 153'b000000001000100100000000010001010000000000011110000000000000101001110000000001000111000000000001110010000000000001111110000000000100110100000000001101001;
		endcase
		end
	end
	assign dout = data;
endmodule