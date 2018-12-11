`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module DC_9_W_ROM_10(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 512;
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
		5'd0: data <= 512'b11111010001111001100110001111001000100111101111101110101111001101101111000110100001011111000010110100001101010100010111111010010000100110101001011001100010111000011001101000001101100111001011110100101010011101001011101110101111110110001010111001001001111011000001011111010111100001110110110100111011110011100110011000010010101111010111101011100001000000101011110000011011001001111000010101010000100111011111010100110011011000000101101001101010011111111101111010011011101000111100111101010011100100101011001011100;
		5'd1: data <= 512'b10101001011111100110101110010001010100110001110011111011010010000100010011101110001001111100000001010010011101010010101100011111101000110111011100010000001110011010110001100101001011110000000111010000110100110110010010000011011100110001001110101101011001001000011101001101101010100101000111101011010000011101000000010001111011011000110111110001011000000100000010000001000010000001001110000110001001000010000101101010100110011010001110100100100111010000000001101000110111101101000101000001001010101110011011001000;
		5'd2: data <= 512'b11011000000101110000010101000011000011000011001101000100010101101100010000111111000000111100010010010100001100100101010001000001100000011111101110100110011101001110011101010101010101010101101110100111011010001111100100001011110100010001001101001011101101000001110001100111001001110111000011010110110001011000111001010111010010111101100100100010111010011011001000001011101010101100100110110101101011111010010100111111110011100011100100000101001000111000000001110101011111011110100101001111001100011110110100001111;
		5'd3: data <= 512'b01101001010110010111011010101100011111111110011110010110001001011110111000010000010000011111011011101001110001101010010000111000010010011011000111010110011111110001000110100010101100111010011110011001101000010010111100001100000011010000110100000010100100101000000100000001010000001100110111011001110100011101000011110010001111001011001010100110001100010000110000000111110010110100001001101000011010011101100010101100001111101010001110001110100001110000101000000000100000101001111011011111101010111001001101101111;
		5'd4: data <= 512'b01101001001110011001111001011011000001101001000101011101110100010101110111101100000011100011010010010001101000110010100111011110000101110101011111001100000101100101001000001000011000011001001111110010010101001011111111111001000011110101011100101000011111011110101011110100101101001110111110001011011110011000110010000110010001111001011011001110001100001011010110001011011011001111001111110111101101110011010110000110001110101010101001010011100101111100100000010000010010010010100111001000001110110101011010001110;
		5'd5: data <= 512'b10001110000011011111000010111100010110000010110010101011000010100011000000001101010011010000111100100001110111011111110000101111101101101010000000010011101010100000010101111000101111110100110000010111100010110100111110100101101000011110101010011110010010100111010010100110110010100000010010100100010001010011001001010101001110000111000010100010000111000111100100011100100100011001001100111000011000001101101110000000110001101111011000000010011010100000011100101110111000001100001001010000110011101011010111100101;
		5'd6: data <= 512'b01000011110010000101010101100011111101011100010011001011011011100111110000000001100111000010000110111000111010011000111111101111000100100101110001001100001000110100101011110001010000010011001111000110100111110010011101000011010101011000111010110000011000001111000011111001111001101111011011000010011111011001101010011000101011110010111011101100101010010110010111101101001001100001001100010110111000000111001100001110010011011001010000010100100110011001100010011010000010100111000001011000000111101000111111011000;
		5'd7: data <= 512'b10000001101000001100110110101101111001010100011010001011111011010010101111110101101100001011100000001010010000011110001010011100011000101000010001000001001010110110100001110000011011100111010001011010101001111010010000011010001001011000001101110110011010001111001010100000010010101100101100001000011111000111010100111000101111001111010011101001101010001010110011111101000100100101001110011010101000010110000100001001011100001010010010110100000101010110000000101111110001111010111011010001100111101011110110100010;
		5'd8: data <= 512'b11001011110100000101101101011111100100001100111101011011101101110001010000100101000011000100100111101000011010111000001001010100100101110100101000001101000001101100111110010100011000000000000001011110110101110001000100101110101011111001110010111001111010000000101011111010100101100101101010100111111111000110111000001011110010111010101011011100010010110111101010011011101011110111100111110010101000001010011111001001101000110001110101000001101110001100110110011001100100100011001011011101111110111100010001110010;
		5'd9: data <= 512'b00110110011001011010000111111110000111101010100010000000100110011011101101011000010001101110001001011111100001001101000000100010001010011010001100110011011111010001010110001110010011111110100100010101000000000000110010100100011000010110101110111101100001111001010110001111000011010001000011111010000000100001001100010111101010000111010110100001100111101011101000100100110110011000010011101001011111000100000100110101111101100010001110101010011010100110010100100000101101111011111110110111111000011100000110100111;
		5'd10: data <= 512'b11101011101111011101001110011010100000110001101101010010100001000111100101100011101111011100110101100011110110111000011110110000000001010001101110001100000001100110010000011101110010000010010000111110000111110001001111111000111110001001100111011100111010100101110000011100001111010001101110100011101111100110000010011111110001110110000001011101000110101001000001010110001101000010100111010011010001100001010110000001111101010101110001000001111111100110111010000011100110000110000001010101011101111101111101010010;
		5'd11: data <= 512'b10111110101011010001100001011000010000000001100011011100110100100001000111101110111010110001110100110001100111000101011100010001101111010001101110101101010000001110110100011001010011000100100001001110010100111101101110111000111110101101110001011111110011010100110011010100001101110001011100101010101011110010101101011001010000110101010101001101010101110101000101110010010101101010110100110101100101101001010101010001111000010101110001110100111010010110111111111111011111000100001100010101010111010111101001011101;
		5'd12: data <= 512'b00001001110010110111100110110110111001100000000010101010100110011010101101000011110100010111101000101111010101011100011000101101111011101110110100100001111000111110110011110110011011010110110001011010100001110110110010011110000101001010101000010100111010100111010110000000010010111101101001001010100001100011001100111101100110000101000010100011110111111010110001111100110100110000001100111001100111000100000101011001000000000101010110100110111111010001000000101100110110111010111011000001100010101010110111100011;
		5'd13: data <= 512'b11110100000000011011001011100100000111111011001000010101010011110011111100001100110110100000010001111001010100110111001000110111001111001001001011111110110101010010111000010011010110110001111110100111101010111110001001000001011110111110110101111111110101110001010111100111011001010010100110110001001000001000000111111111001010111011010101010100010011001001001111001110100100011010010001101101101101110101000101110011010110101001101010111011100100011000110111011001001011110100000000011111001000011000101000011111;
		5'd14: data <= 512'b10100001000101011100111000001010100110111110101101110111001111101110110110011101000001000110010010101001011110000010110111000000101000110111001011011100111101100001001111110111001010001011011110110001101011001011011111010101101100110001110101101010101100101101110100011111111000010110100110110111001110011000110111000010001101110010010001111100010100001011010010001111001011110111101001100011100100110001011101100011111111000001101001111011100100111110101000010001000011010101110001110110111001110111001000111000;
		5'd15: data <= 512'b10010111101011101111000010000011100100111101111111100010100010100011110100001011001011000000100101111001110011001000000001110010001101100001100100101000100001100000110011011001100010001011110101010010100111110010001011111110111110011101110011010000110010011000101001001001001111101011001100101111001100101010111110110111100010110110010001011001010111100101111101110010101001000011000101010010000001000111011110010010111100111101001100110001101110000100010110011011000100100110000000110000011101110111101101111000;
		5'd16: data <= 512'b01011110101111010100001101010111100000000111010100111001100100010001100001100000010110011110101000110100101101100100100001011000000111000111111001100000101100011111100001001110001110111101000011110101011101001110000100011000000000101100111101000011100001011111110001010111010101011000001100001011100111011101001000111111111000101001010110011100101011111001000011110010010111110010110011011001110011100010000001111101001100100100001100100100001111110100111101110010101111000010101010001111110111001101000111101000;
		5'd17: data <= 512'b10011000010001110100011101000011100010110011010111101100100100000000001010011010101101101111100000010100110101000000100001011000100100000111101010110001011110111101001001000101100111111110001010110011010011001110001100011101110011100010001000100011101100011111100100110101011010010010011011011010110110011010011101100001000111000001101000110100111101111001110100101001000011100110101000010100111110110011110001001101111001010110011001010100000011000010011010110111010010011001100100101010110111110011011001001101;
		5'd18: data <= 512'b00100011001001001111110110001001100110100000010011011011011010000101110101001110101110010000011100110100001100010010000000011111101001000101011001010000000000000111110000101001011011111001000010000000110111101110011010001111000101101000000110101010111000101101100000000000001011110111000011001011110001111101100001000001111010010001010011110101011011100101011100101001000011000011001110011110101100110010000100000011100110001111010010011000110001010111010001001110110010011100010001010001000110100110011011001010;
		5'd19: data <= 512'b00110101110011110110000110100101111110000110101010000010100011000011000000010001001100001001101100100010010111011001010000100100111101001110100000110011011010111010110111111001111101100110100000110111111011010100000000010000011000101010100000010110111010110100010000101010010010111001001001110100010001110011011101111000101110000101100010110001110111111000101001111101100100100000101101001000010010000100100001001101110000000110000010110000111110000011011010111111100011101110011100110110110100001000100100110100;
		5'd20: data <= 512'b00111001011000101111011011101100111011010110011111110110001011011010100000110111000001000010011000111011110011101010110100011000000110011011000101011010001111010001100001001010001100101100000111111001001001000110011011010010100101011101101101100100101110100010010011000101110000011110010111111101010111011111000111110110011101011000111001111010000000010011100001010111110100000000001001011100010010101110110010001000000100100001001110001010000101010010101100001000000000001001111011000011110010100110011100110010;
		5'd21: data <= 512'b00000010100100100000011010100110111100000000001111011011001111101010101000101110100100101000001001011000000101011111100010101001001010110101110010000011100100001111001011111101100010101110100110101111101110110010001110001111000110100011101101001111010101100111110100101011100110010001001000111100011010101011011000110100000100100111100010001110101001111011101000101100000110010001010100100011100000011110011010111001100101101010011010110000001011010001001100100001000111000101111101100110011101111110000010101011;
		5'd22: data <= 512'b00010001010111111010010110110110000111010101011100100011001111111101010100001111000101110000010000010110001100110001011010101101101000111101001010110100101101001110101001111110000111001011101000111111101000011011001010100011101110110111111101100111000101001101100111100111000111010111000010100101010001010000100101010101111010100110110100011000111010001101111110101011101000110001101110111100101001101101101110100000110000110011100001111101001111101101001101110001111001010001001011100100001110001101110101101011;
		5'd23: data <= 512'b01001101100110000111100011010011010111011110000111011101011111010000010000100001100110000011001110000110111101100110110111011110010110000100010000000110100101001000101100010010110000001101001111001100101100000011010011110010000111011101101110000101100110010100000011110001101001011110100111100111000100110101101010000011110011111001011111111100000000110001011111010001011110101001011001010100100001010000010101011111001110011001110110001001010010011000100011000010001011000011100010011110101010000010010101010100;
		5'd24: data <= 512'b00011100010010111010001001110100011111101010010100111100011111011000001000000001010100001111001010001111000001100111000000101111001110011110011011110110011010010001000101000010010101111111001011100100101000001101110000000001011001000110011100100101100101111010001110110111010000001100010001011100010010000011001111101110011111011000001110100110101100100010100111101100110100111100011001101001011111111110101000100100000101101010001110101010010011110001101101100100101000101001011110001011100000001001011000100111;
		5'd25: data <= 512'b10010100010000110000101110101010010011101001001001000010100100100110011010110101000100101010010010000101010110001101011111100001111110110101101111101011111110001001001000100111011100111111111011111001010010000111000100011010110000110100011110010001100001011011010111000010011011100001100010011110101000101110011010011110001101010110110000100001101111011100101010000100100010100110010010101011011111011000010110110011110001101000111111101001000011101001011010011011000110111101110101100111111001111100100110101111;
		5'd26: data <= 512'b11010110110100000000011101011000010100000001101100100001100101110110011010101011010000011110010010010000101100100101011111000001100101110001101111111110100100100011001001011111100010111000010100100101011110011001100111111110110010110100001001001011000101010010100101111100101101011011111111110101100011101110110111000010011001100110010101001110100010000011000111010110000001101111010101100111010111100001011110111110100011110000111010110111001011111100101111101001001101000101100100111100010001011101101110001111;
		5'd27: data <= 512'b10010110101111010111100010100010100001001000101101000111100000100111010111110101001001001010010111100110111100001000111110111100011111000001001000010010100000101000111001111001010010100110010100010010000011100001000011111000101001001110100010010000111010000101000001011101100101010110001110100011010111100011111000000011100010110111000001011101100110001001000101010010001001000011000101111111000100001000010100010011111010010101110000010001111110101110100010100011110111000110111101010100101101110100100100011000;
		5'd28: data <= 512'b11100110101111101111001110011010100000011001101001001001100111000001110101001111101111110000100101110100111110011000001001010100101001110001001010110100100001001110110001011001110000000010110110110010111111110011001111101001001110101101110111011000110010011001100100110110001111100011101000101010101101100100110000001001110010111111100001010100110111101101011110110010000111000011110110110101100101011001011111110101111000011111110001110001111000100110110011111001111111001100000101010101000111011101101000011011;
		5'd29: data <= 512'b00000010011010111010000010101011100101111100010010110001001110100010111101001100010101000110001001011111001001001110111011100111011110111110011000010100001001011100110010110011110011011110100001100010100110100010010110110011101001111010101110110100101001110111000110101101101101110101010011110011010000110000001000111101101110000001100010110101110111100100010011101101110010100010100110010101001100100001101111110011100110010010011001001001001111110101000000100011100111110101110000101101001000111010010101011000;
		5'd30: data <= 512'b00101001011011001010010111100001100111011110010010001101011111010101011111010100100101100111010110100110011000000111110110100110111110001111011000100010110011111101101111101000001111101011001011010001100101001110010000100001000001011111000100110100001100111101000011111111111000000100010010101001010100010100111101000001111101001011101010110110101100101100011000101101110011000111101010001000101000011110101000001111111110100110000101001000010001111011000000110110100001000010010011001010101110100001110111100110;
		5'd31: data <= 512'b00010110010000101010110111011100011110000010001000100000100010011010101001100001011100111010111001100110000011001101001000100001011010111011000101111011100010010011110010011110001001101101111001101101111100010100100010000010011000110110101111001011000001110011010100001110010011000001000001000110001001010111000101110010000001000100010100000000101111101011111010100010110100011000010001100001011111010000100000111001011101100010100110100110111001111010011101100000101101111000001110100111011010011111001110100111;
		endcase
		end
	end
	assign dout = data;
endmodule
