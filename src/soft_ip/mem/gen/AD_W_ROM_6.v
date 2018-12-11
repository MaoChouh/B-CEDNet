`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module AD_W_ROM_6(
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
		2'd0: data <= 153'b000000010100100010000000101000000111111101111111000000000011101001100000000101011011111111100100111001111111110111000000000000001101111000000000011000011;
		2'd1: data <= 153'b000000001000010100000000110101101000000010100010101000000001100000011111111011001100011111110110001111000000001110101001111110010001100011111111011111101;
		2'd2: data <= 153'b111111111110010010000000010100110100000001100111110111111110101010011111111010011101100000000101111001111111110000010011111111100011001111111111101000000;
		2'd3: data <= 153'b000000000010001000000000001101001111111110110101100111111101110101000000000011001000000000001001001000111111110010110100000000001101010111111111111010110;
		endcase
		end
	end
	assign dout = data;
endmodule