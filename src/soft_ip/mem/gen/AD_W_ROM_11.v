`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module AD_W_ROM_11(
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
		2'd0: data <= 153'b111111100110100100000000111010110000000010110001011111111100100100000000001010000001011111111010000010111111100101011011111111111111011111111110100111001;
		2'd1: data <= 153'b000000000000010111111111111010110011111111001101000111111111010111011111111111001110011111111010010001111111111110101010000000000000110111111111101010101;
		2'd2: data <= 153'b000000010011100111111111110100011011111111101110111000000010110000011111110000010111000000001000010100111111011111011000000001010111111100000000001101101;
		2'd3: data <= 153'b000000000100011110000000001100110100000000010001111000000000011001110000000000110011011111111111011111111111111100011011111111110000100011111111010100100;
		endcase
		end
	end
	assign dout = data;
endmodule