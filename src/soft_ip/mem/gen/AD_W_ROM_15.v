`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module AD_W_ROM_15(
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
		2'd0: data <= 153'b000000000100010010000000011001110111111011101110111000000001101101010000000011000010000000001001001010000000000100011010000000011001110011111111110001100;
		2'd1: data <= 153'b000000011000001000000000001100101111111101111101011000000001100011001111110001110001111111111100100011000000001100010000000000001001101100000010010011101;
		2'd2: data <= 153'b000000001001110111111111110000111000000000001001110111111110111101111111111000111101111111111100111110000000000011110111111111110111011100000000011000110;
		2'd3: data <= 153'b111111111100011100000000011100101000000001100100010000000000011001111111111000101111111111111110011101000000000101010001111111111111000011111111010000001;
		endcase
		end
	end
	assign dout = data;
endmodule
