`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module AD_W_ROM_3(
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
		5'd0: data <= 153'b000000101000011110000001000100010100000011011110101111111101111100011111111001101011111111111010110010111111100101100001111111010000011111111110010000000;
		5'd1: data <= 153'b000000000101101110000000101110001100000000001110010000000010001001010000000011011111011111100111110010000000000010001001111111111100000011111111110010010;
		5'd2: data <= 153'b111111010101011001111111000101010011111101000111101000000000111111100000000111110001011111111111010111000000010011001000000001000000111100000001110110011;
		5'd3: data <= 153'b111111100100011101111110111001000011111110110111110111111111110011101111111101111000111111111101011000000000000010010010000001001100000000000011010101111;
		5'd4: data <= 153'b111111111100011101111111111011100011111111111000001111111111101010011111111111110101111111111111001110111111111100010011111111111011011011111111110111000;
		5'd5: data <= 153'b000000001101010010000000111100000111111110101000111000000010010001101111101110001101100000001001110001111111111100011101111111100011010100000001111000001;
		5'd6: data <= 153'b111111110110001110000001001010101011111110111111001111111100011111110000000111011111000000010110100100111111111101000111111111001000100011111110010100110;
		5'd7: data <= 153'b000000011011001010000000000111100111111110011101101000000010100111101111111011010110011111100101000111000000101100000110000000011111100011111111000010111;
		5'd8: data <= 153'b000000000010010010000000011011000011111101000001001000000001101001100000000110101100111111101011100001000000010010001000000001000010010111111110110110101;
		5'd9: data <= 153'b000000000001111000000000011111111000000001011000000111111010111001111111101111011110100000000111110101000000110001111110000000011000101011111111010100100;
		5'd10: data <= 153'b000000010111101010000001001110001111111111111101010000000001010101111111101011011000100000000001101111000000000011000101111111101010001100000000111011101;
		5'd11: data <= 153'b111111111101111011111111111000001111111111111010000111111111101000001111111110101011011111111111000100111111111110101111111111111011001000000000000011011;
		5'd12: data <= 153'b000000000001101110000000010110000000000001101111101000000010001100001111111100110111100000001011010010000000011110100011111110101000101011111100100101111;
		5'd13: data <= 153'b111111101100010101111111100011011100000010110110010111111111001011001111110111000101000000010001011000111111100010111001111111010110011100000010111001110;
		5'd14: data <= 153'b111111110111100110000000000000010111111101111111000000000010110001100000001010011011011111101101101101000000100001010010000000010010100111111110001100110;
		5'd15: data <= 153'b111111110101010110000001000001100011111110110100000000000001011011111111111100001011011111100010100010111111110101101110000001011110101000000001011010000;
		5'd16: data <= 153'b111111100011000110000000001101111100000011100110001111111101000011000000000110111100000000000100110100111111100000110101111111010001001000000000100000011;
		5'd17: data <= 153'b111111101001010111111111100100000000000100001100100111111100010010000000000010111100011111110111000100000000001011110001111111111000011111111111110110000;
		5'd18: data <= 153'b111111100001011001111110101111001011111101111000001000000101101100100000001000110110000000001010001010111111111000101010000000000111010000000000011101100;
		5'd19: data <= 153'b000000000001001100000000111010101111111101110101011111111100010000010000010000010100111111110001101011111111111101100011111111010111100100000001010000101;
		5'd20: data <= 153'b000000001000001111111111110011000011111111010111101111111011010100010000001011101000000000000011010110000000011011001011111110110101110000000000001011000;
		5'd21: data <= 153'b000000000011111000000000001001110100000000000101001111111100010101110000000111000001100000001001011100111111101000101100000000000111011000000000001110110;
		5'd22: data <= 153'b000000000000011011111110001100101111111111100011000111111111110011000000000000000111111111111111101111000000000000100100000001111000101000000000010000110;
		5'd23: data <= 153'b000000000000001111111111111111111000000000000000011000000000000000001111110010110000100000011010101000000000000000001000000000000000000011111111111110111;
		5'd24: data <= 153'b111111011011010001111111110110110000000010110111001111111101110011101111111111110100100000010000100110111111011000001001111111101110000000000001110111100;
		5'd25: data <= 153'b111111111110101111111111111011100011111111101000111111111111000100011111110011001011011111101111101111000000010100101010000001001110010100000010011111001;
		5'd26: data <= 153'b000000000010111011111110100111010111111110000010000000000101001000000000000110001010100000010000110101111111100111000011111111111100001000000000000011010;
		5'd27: data <= 153'b000000101011001001111111100111000011111110101101000000000100110011011111111110111101011111101001001111000000100101011011111111110101000111111110000001001;
		5'd28: data <= 153'b000000001000101010000001000010011111111101100011000000000011010101110000001010110111011111110001110010111111110010110101111111111110011111111110000101011;
		5'd29: data <= 153'b111111110111000110000000001000010100000000001111111111111111100000110000000100101001100000000101011110111111111110001110000000010110001111111111111111010;
		5'd30: data <= 153'b000000010111101100000001111100000011111111011011101111111111010110000000000000001110011111101001100001111111101001111101111111100111110100000000011001001;
		5'd31: data <= 153'b111111111110101101111111110001111100000000011011010000000111001101011111111011111111111111101010110110111111110111110011111111101100100100000000100101011;
		endcase
		end
	end
	assign dout = data;
endmodule
