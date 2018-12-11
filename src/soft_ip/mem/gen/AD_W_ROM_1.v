`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module AD_W_ROM_1(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 153;
localparam ROM_DEP = 32;
localparam ROM_ADDR = 5;
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
		5'd0: data <= 153'b000000001101000101111111101010100011111111010101100111111100010100000000010010001001011111111011111001111111010100010100000000101110011111111111100110110;
		5'd1: data <= 153'b111111100110011011111111010110011111111110010000000000000000000010010000001100011001000000001110010001111111010110110000000001010100101011111111101000010;
		5'd2: data <= 153'b111111100110100000000001111010111111111101101110100111111100110011010000001001011100111111111011010100111111111010001101111111111100101100000000010011101;
		5'd3: data <= 153'b111111111111010010000000000100000100000000000110111000000001001110101111111111110011100000000000110100000000000001100011111111101100000011111111111100000;
		5'd4: data <= 153'b111111111001001001111110000010100000000001000001011111111111110110010000000110010000100000010000000010000000001001100100000001000101001011111101000111011;
		5'd5: data <= 153'b111111010110010111111111000101010000000001110000011000000101110110000000001011001001111111110101011110111111111100010001111111011110111111111111100101010;
		5'd6: data <= 153'b000000000110101100000000101100010100000000100001110111111100111100001111110010000011100000010110001011000000010101111001111111000110111100000000010101111;
		5'd7: data <= 153'b000000000011110110000000000011001100000000000000010000000000011111100000000000101011000000000001000110000000000100100100000000000100000100000000001011011;
		5'd8: data <= 153'b000000000011011101111111110111010011111111101100100000000000100110011111111111110111111111111111000110000000000111001010000000000110011011111111111100101;
		5'd9: data <= 153'b111111110011100101111110011100111000000000000110101000000110001011110000000100000100011111111101001101000000011011110011111111001001101011111111111100101;
		5'd10: data <= 153'b111111010011111000000000011100010000000001001111100111111010111111110000000011011000100000001011010101111111011111111110000000000101111000000010101100111;
		5'd11: data <= 153'b111111111111101100000000000111101100000000011011100000000100111111011111101110101001111111111001100011000000001011011000000000010101010100000000101001110;
		5'd12: data <= 153'b111111100110100100000000111010110000000010110001011111111100100100000000001010000001011111111010000010111111100101011011111111111111011111111110100111001;
		5'd13: data <= 153'b000000000000010111111111111010110011111111001101000111111111010111011111111111001110011111111010010001111111111110101010000000000000110111111111101010101;
		5'd14: data <= 153'b000000010011100111111111110100011011111111101110111000000010110000011111110000010111000000001000010100111111011111011000000001010111111100000000001101101;
		5'd15: data <= 153'b000000000100011110000000001100110100000000010001111000000000011001110000000000110011011111111111011111111111111100011011111111110000100011111111010100100;
		5'd16: data <= 153'b000000100101100010000000000101111011111110100100000000000101001111110000000000011101111111101100100101000000001010011000000000000000110011111101100111111;
		5'd17: data <= 153'b000000000001110101111111110100011000000000001100110111111110001000110000001110011010011111101010100001000000000000010101111111110001010000000000011011000;
		5'd18: data <= 153'b111111111001101110000001001011101111111111001111101000000010110001010000000100110001111111100111110111000000001000101110000000101101101111111101001111110;
		5'd19: data <= 153'b000000001000100100000000010001010000000000011110000000000000101001110000000001000111000000000001110010000000000001111110000000000100110100000000001101001;
		5'd20: data <= 153'b000000000001001111111111111010000111111111100111010000000001011111011111111111001110011111111000101000000000001101110011111111111000101111111111110011011;
		5'd21: data <= 153'b000000001101111100000000010011110111111100101111111000000010101110100000000010001100011111110010100000000000110101111000000000000000001011111110010010011;
		5'd22: data <= 153'b111111010000101001111111110111010000000001111100000111111011011001001111111110101110000000011001000000111111111010101101111111100010101100000010000000111;
		5'd23: data <= 153'b000000000100100011111111010100011000000001000000100111111011100000000000001101011110111111111000000100111111111100001010000001100010000111111101000111011;
		5'd24: data <= 153'b000000011011100001111110100011000111111111100110010111111110111111111111111101101110100000010101101000111111110001011100000001010110000111111110001100000;
		5'd25: data <= 153'b000000001101110100000001011111001000000001111100010111111010001101011111111010101011111111110100010111000000010110100001111111011111100011111111011111110;
		5'd26: data <= 153'b111111111110001001111111111011010011111111111011110111111111111001001111111111100101111111111111111110111111111101101111111111111001111011111111111101000;
		5'd27: data <= 153'b111111110101101110000000001000100000000000011111110000000001001001110000000101100100111111110101111011000000000101110111111111011111001011111111101100101;
		5'd28: data <= 153'b000000000100010010000000011001110111111011101110111000000001101101010000000011000010000000001001001010000000000100011010000000011001110011111111110001100;
		5'd29: data <= 153'b000000011000001000000000001100101111111101111101011000000001100011001111110001110001111111111100100011000000001100010000000000001001101100000010010011101;
		5'd30: data <= 153'b000000001001110111111111110000111000000000001001110111111110111101111111111000111101111111111100111110000000000011110111111111110111011100000000011000110;
		5'd31: data <= 153'b111111111100011100000000011100101000000001100100010000000000011001111111111000101111111111111110011101000000000101010001111111111111000011111111010000001;
		endcase
		end
	end
	assign dout = data;
endmodule
