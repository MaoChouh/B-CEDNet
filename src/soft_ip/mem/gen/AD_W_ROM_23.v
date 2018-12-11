`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module AD_W_ROM_23(
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
		2'd0: data <= 153'b111111111111100011111111111011111000000000000011011000000111001011011111111100101100111111101101101001000000011011000001111111111001101011111110001101100;
		2'd1: data <= 153'b111111111100101011111111110100111011111111100110111111111111101011011111111111000001111111111101101101111111111111111101111111111100001011111111110000111;
		2'd2: data <= 153'b000000000101000000000000001101110100000000011101010111111111110111101111111111110001000000000001000010111111111000110001111111110001100111111111101011011;
		2'd3: data <= 153'b000000000001000010000000011011010000000100000011100111111100000010111111111101001000000000000100110100111111011001001111111111110101101011111111110111001;
		endcase
		end
	end
	assign dout = data;
endmodule
