`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module EC_1_W_ROM_F_11(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 1152;
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
		5'd0: data <= 1152'b101101011011011100011010000001001000110000000001000010111001000110100001000101010100100011001110010010010011010111010011100101011010101111111011010100011001100101010001100101000110010100110111100010111010111100011011001101011100111000110101100011110110011111010000100001001101110110101100011100101110100100011110111100001111101010111101100010111100000000101100011001101110001100100110000110001011101101010001110000110010111100000000111000100100110110101001101100000100011110011011100010100001010110010010011110111101011101001100110011010101111001000100111001010000110111110001111111010011110101101010100001100001100000100110111000111110111001111110110001100100011110111110101111101110000101000110110111111100010000100101110010000101100001101100101011100011011111111100110001110001100111000101001000110111011111100111010110011100101001111000011100000010111000000100111010010011010011101001010101100101110000001000110111000110001111001101011010001100111011001111111100110001001000101101010100101101110111111101010101010101110101111000101101111010001011000110111001100000010000000111010011111100110010010000110101011110001110100100101000100101111001100101;
		5'd1: data <= 1152'b001001011111111001000101110111001001011110111110110100010110100111000101111110111101110110111110011111011110001101101100011111111001110001000100010010011001111011110010101001110110110100010110011001011110011101001010101101110011010111100011101001110110001011110000110000100011010011111001110110101100100100011010000011101100100101100001100100101111000011100110101011100010011100111000111010011101101011010110111100111111101011111100100100100010110011001110011110111011010101000101011111111000111110111101111100001101110000001000110110011001001110110110001100101100000101101000101010110010110101001000000000000010111100000010101001001111101001100110110100000101110110101001111110100111100010000101000000101100001110111101100000101111100001101110000011101110010111111010111001110101101010100110110110011111110111110000010111111100110011000110111110011111110001100101101111110100101011101101101000001100100000000000110010111000101110011100011000100101100111000111111010100011111101001011000100111110101110001110001011111110100001101000000100101100111111001011100000100100101100011100010101001110101000110111010010001100000010100111000011001010101000001000;
		5'd2: data <= 1152'b000001011111101000101101011010010010111110000100010111100100111101100011010000000111010000001011000111100010011010010101010100111000001110110010001011100111010111101110110100001101011001110001000000101100100000110101110101101000000001110100011000111010110101001100001010001100010110100011001111101100101111101100000011010001101111111000011001010000100111011011110100001011101101011101010001110110010010101000000011000110111011000001010110101101001011001001010000010100110010011011100111000111101001000010000110111010010100110111011100100100010010000010100011001001111100101101000011011110111110010111101101110100010010000010010011011010001011010000101110100101001111000011000100111010111010101101000001100001101010110101100010101110010001110010100001101011100000100010000001011111011100100010010011001101011010000001000101101000111011001001110110010101010001011111000011001010101001000001001111001011011100111111110100011101011011110011100111001100010110101110110111101011011110011010011111000110001010100110001110001010001011011010100000001101110110100011011110000110101110100001100100001111101000110101100010101110010001100111000101101011101100100010;
		5'd3: data <= 1152'b100110000101000010011011111000110100110101100000101001100110101000111011101101110100100000010101000001111011101010001100101000010100011100111101111010000001110000000000101000111110101110110010011110101101010010001110110000100000010100111010100110000000111101000111101001111011011100111100111010010100000101001010101100001000100000000101110110001101001111010100110101110000111010001101011001000000101111010001100010110000001110101110101100011010010000011010111001100001111010111100000101110111111010011000101000110111010110110100101101001001110000111000010000110101111011110010011110011100110111001000110010001001000011010000100000111001100100010101001011010111111111011010011100001001000000001010101011001001100010001101000100011111100111011100100101100000011111111011000110000000000111010101100000010101100011100110101110011100011100010111111001101100101011001100010100111101111010010000010011110101010110011001000011101011111001001000000100010101101010011010011101010010010100001000010000011000000010011000000010110100100100100000110111101010000111010000101011010011111000000001001011001000001100111000000101010011011101001001100101011010111100100011;
		5'd4: data <= 1152'b111101100011101010001000110000111001001110100110110001000001100001001010101011011101010010100011001000111100001111110010001110101111010000101100111101011010001111110010100111101011000100110010111010010010011101001011100100010010001101101011001000011010101100010001101101111001011111100011100000111101101011000010111010101000111111001011110111011101100110100011100000111101100111110001110100011001100100111100111000011101101111100101100000100110100011001010101000010001010101100111001011100100001011110001101100001101010010000100001001111010000011111010111110011000101001111000111000010011110101000010101011001111111000000010100100111111100001110000001110110111101111000011111100111111110010100101000001101000111111101011100100001111001011111101100001111001101111110011110100010000000110110000110000111111111011001000100000100010010011001111001100010001010001000101111011000100011011110001011000001001000100011010001101101011001111011111110000011000111010100100111010100010111111011001110010001111011011001110001110010110000011101000101010111001111111010111111111101100111110001111011101101100111010111111100111011100010010110111010001101111100011100000;
		5'd5: data <= 1152'b111010111101011110111111101101100010100001011100100000010111011100111100000111101011111000101000100110110001110100010001110000000110101011000000100111011011000101001110100100111111110111110111101101111100110011110100010010010110100010011111101011011100100000101011010110101111111011011000001011111001001001010111100111110000011010001010001101100101100001111010101111010110111011010000101000001100100001011011000100011101101111001001100100001000101010010111111000001010111101111101111111100000101000001101001100101100010100111011011110000000001101100101110111101001010100001010100101101110001000100111001110010111111011000110010111101111001011100101011111011010000000001111101000011100110011000001011000110011010001001010001011101010011000111100001000110101100001101101101100110101000110101100011111101000010000110100110101111111001001111100010110100111010011001001111011011011000111100111111001100000001100001100101011011011111010100100101000010111101011110011011101000101111001101101100001101001110110101101011101111100011101111110011001111001010110110100110010001011000101001110100101111110110110001111011010001101101110011101000110011000010111101111;
		5'd6: data <= 1152'b001011100001010111000011110111101010011000010011101110001011010100101110101011100010011010010010110010010110111100101110111011110000100101100100110000110000010001100100000100100001001000011011001111011001011111001101000100110100100001101001011100010111100100101101011110111011011001101110011011011101011011100111111100111011110111011011110011011101111011010011001001111101111011101001100111001001001001010001100010011111000110001110101100010010111010001011101111111011101011111100011110101010001110111011111110101101000010011010001101001111100111111001111011001001010100001100100011100011100100010011111101010010111001000110101110111011101111010101101110010010100001010111110100011111110010010001110010100000110000011010001101011110111100001001000000111101101110110001110100100000110011110101101100101101101001101001111110011000010000110101001111011110101110100001011100111000001010110100111000101001000010000110010110111010001111111010001010111011001010110100101010100011000101001010101010000010111111101011001100010111001001001001101000110010010101010011111101110011011110000100111011101000111010000001001101111000010010010101110011011011000011100001;
		5'd7: data <= 1152'b010111000100101110000111011000111000100000100010000000100000001101110010100101100000100100001101110100010001010110011100100001010101100111101011101001000010100011100110001101101110000010110101010100000100000011011111000001010101011001111101110001010000110111100010111001011110011100111100011111100100001101111110011101011011110001011101110011000000011110011000011001010010111101000101010010100101000101000000111001110100001000100000011110010011101101110001010000100100011000001011100110010011000100110101000101110100011111000001001111000011111010000110011000010101110011110111011111010101100011001110101010011111000000111100011101011111110100100111111101000010001001111100100011111011010000010111011010111100110101101000100101001111011111110100101011110110011111111111100010000000100011001000000000010000101001101111101111010101100101110011111100001001111100111010000011001101000100111001000101001001011111011100000101000001110001000000001110000011010101111011111001000101000011000100101110001011111010011000111000010011100001110001111100111111001100011101110010011101110001010011001011111100011011001010000101010011010001111100110011111010110111000111;
		5'd8: data <= 1152'b110101100100000001011001100011100101001111110011001001100111101001111011011100110100101111111001001110111101100100110110010100101101101001010010010010011001111000010111101001100010000101100010010110000011101111010001100011010011010111111010111001000101001010001011110011100011111001110110001101101010011011100001011011101100111111010011110100011101100111110101001111000111101011011010110111101101010001111100101110100011001111001110001000111011011001111000001100111000001110100000011001110011110000101100001110101101101101011010001111101111111001011011101110100010001011101100010111010010111100010101100101110011001101111000111001100110000011001010010100100000101011010011011111111111001101101001101011110101111110110111010011111100001011110101010110011111111011000110110111110100000011111111101010110011101011001011001001101011001001111000001101111000100111101100101000110001111000110010001010001000101001001000111100011011101101011110100010110010100101100010111110111111101010000111101101010011011111011010001101100111000010001110010111101000101000011111000111111000111001101001001111100111111011111010110011101000111011110101111111011110111001001100;
		5'd9: data <= 1152'b111110000011001011000011101100111010110011011010111011011110010010000011001101110101000110110100111101100000101011011000001100101001100010011010010110111100001100001001011000101010111010101100100111101010011111000000010011110000100101000111101100000110011111011100000011001101100110000010110100001010111101101001101000001101100010110111100010110000010101100011110000101011000000101010010111000010011101010100001000110000000001001111111010011010111010011110000111011011000100110000110100111100001000011010111100111011100010110011000100111101000000011001011110101010001011101010101110111010111111111001100001001001100111100110100000101111000011011100010010001111010110000110010100010111011000101001111100001111110010110111001010111000110000100101010100101010010010100010011100010011100100110100010000110100000101101110100000010001000010101010010100011011010011100001000101110000011011001000001100011101011111101001101101001010000100111100010001111001101111011010101011110001100101111001010010011010111100000110000000010010100110000100110101001010111010110110011110100000001101011110111110101011010110000001011010010101001110111100011000100110000100111101;
		5'd10: data <= 1152'b000101111101100100000010001100110100011010010010110111001111101101110111010100001100010100010011100110000111100101000011010111010000010110100001001010100100110000100110111100010001010000111011110100000100000011011111111100100001100000110001010011110101110100000001111100011110110001001100000000111001000110010100000011110110100010001010100111000111001110011110000100011110000101111101100001111100111110101101001011000000011010000011010110011111001101011001011110001100111100111111000010000111100101110101010011110000001111111100001100101000110000111111010001010001111000111111111010010011100010001100111110111101100001111001011011010101010100000001111101011010101111001100101110111101110101010110001000010100111110101001100100000011011101100100011101010110110101100111100000101101001001000011110111000001101010011001011100000010110101011011101101010100001011111001010110001111110101101111001011101001010111010100011100111000110001011011101011000001011000101100110010011010110110000010111011011101101001011100010010110111011011110101001001110101100001110010010100011011110110100101001000010100101001011111100100111000011001100110010001101101101111100100;
		5'd11: data <= 1152'b000001111110000011100001001010001000010010001100001000011110000001100101111100000100011000111011000100001011000001110011000111100000011011011000111000011001110000100110100010110011010001110000011101111110001010000111101101100000000000001010011000001001111000000110011011001100100110101100000111111001101101110000111110000111110111111010101001101010111100100001000110000110111011111010100110001001111100010111010001001010001111100100000001010111100011100100001001010000000011100000011101101010011010000011111111000001011011111001011101010000110011000111111011000001010100101000010101110000101011000001101110010101011010100010010010000011100110011100111110010001000000000101110100011101110011110100001010000001110000111011100000000111100101010110001000110000110011111100010101010000001100000110011000111000000111110001101011101111111001100000100111100101111011000100100111001011011010010001100001000001000100100111001011100111001110101000110110011100111011100110111011100100111001011100110011011000011100001010000000101100110111011001101110111011011011110011110110001101000011001100111001001100011000001111110111010111110011110111000000001001100101101001;
		5'd12: data <= 1152'b110101100100000010010101101100010001101101101111111010000111110001011010111100011100100001101000101110111101000011101100000100001100110011100000111010111100001100111111111000111110110011011000001010111011101100001000010100111010110111110100111000001001110011011000000000110000010011000001011100011100111111101001100001111100101000010111000110110010100011101011100110000001100001000110110010100000010010000101101000110111001000001011101010110011001001111101101110011110101001110000011010111111100000110010010110101110100000010111100001011111001101111101000000101110111011001001010101110111011100011100010100111010110101111000110110000101110011001010000111001010110111110110000101010000011011101001011010010111001000110111001110001000101100110011001110011111000000010100100011101100100000010101101001100111101010001110001010111011010001111001001100011000101101110011001100111011010000101110010110001011101010010110011001011111110100111011000100111110110011101000010110110010010111110011000110110111110111111000001011001101110011101111010011001100000000110100010011110011001001100101101110101111100010110001000001100000101011110101111110101010001001001100;
		5'd13: data <= 1152'b100011000000110011000000100011000011010110000111111110010101001101101000000001111000101110101010010011011111010001101111010011101101111011000100110110011110100000010010111101110110110101010001111110011011001111001011001100010011011010111000001001100001111010001110010101100101110011011100000100111001101000100101011001011110111001111011100010110101101111011101111111000010010001010110110011001001101100011010011000010000110111111110100011010010111101000011000100011101001110111011011111111100100110011001111110001101111010001000110111011010110101000110011100110000011100110011111010000011010111001011010011000001111010001000001001111100000011011110110010001101101111111000011110101110001101111111001101000110000010111101011010110100110101111110101110001010011110100110110101001011100110001010011000011110000111101100100101110100101011001010010000010001010111001010001011101100011110001001001100001101000010000010001101001110000111111000101010010101001000001101110000111001110100010001100011000111111001001010101001110011100011011110100110001101011011010001010100011010111001100100011010001110001010111111100000111111010100101101110010101010110111100010;
		5'd14: data <= 1152'b000110000010101110001110101001110101110101110010101001101010101100111011100011100000000111001110100010010111010010011010000111011111110000110001110100011101001001100101001001101110110110110011001111101000111000101010101111010111001110110001001110001100011111011010000101110000111111100110001110010010101110101000100111110001111100010001011010000011000000100001111111010101101001011100010001110110101110100000000011010010110001010110010010100110100000111010000010000100000100001011101010010110000001000111000001010010111101001100110000111111111000011100000001010111101111110010001110001010001011001100000111110101000101111000001101100000011110001010100001100101011111001010001110000011001100101010100101011010110110110100000011100111000011000011010111010011100001000110001100111111101100110110011010001110100101011000000101100110100110000010010100101001010111001111100011100000011011000111011101010111110001111101111001001110100100000101011111100111000111001000000100010110101010110100101001110010000110010010111001001101100001101100010101000110010100111000010000000110111110100001111110101011110101111000011010100000001110100010000110101111011011011110;
		5'd15: data <= 1152'b001011110110010000101100001011101110011000101001011000000100000111010001000001100111111011011111100000010011101001100110101011110110111001001110110010011010111000000100100001110110101001010101100100001110110010101110000111101001100111111011011001001100010100001011010001001100011000101100011011000000001101011010111100011110000111100100111010110001001110000101001011110100010100001101000010100110011011010011100111110111100000001101001010100001010011110000101001011111101111110001110011010110111000100100001001110010010001011101101111010101010101100100001010010001001100001101110000011101011010111010101110001100111000100011100011010011101000011100110011000110000000110001010000010111110110010000111111101010000101001000011001101011000100101110010000110100010111111011010011101101001000011111110100010001000001101010101011000001111010000011001101111111001011111000010101110100011010011100001110100100100000110011010110000101000111100001011011110010000100000110110011101000111110111010101110000100011111000010100010110011001011001000101110110000111001000001110011000111100110101100100011001000001001001110100100000110000011001110010011101001100001110001;
		5'd16: data <= 1152'b010110000010001101010110011100010010100101011010101010101010010101100011100111100111010001000001110111111110010110011000101100100111000110011011001100100101010110101101011110001000001100000111110001101100010100110101010001001001111010001111110111011101000010000011111111000010001101001100111001011000010001010110011010011110000111110010110011010000111110001110110000111100000111110000000010000100001110010101011010011000110001111011100010011100111111000001010100101101111111011011000101011000111010001110101010100100100100101011101010100110111111000100101101001100110111100010110010110101111001011111111010001101010111101110110001110010011100000011101011110010011000101001110011000100000000010110010001101100100001010000100101011110111110001100101011100100011100100001100011000010100111000000010100010010000001011010111010000101001011111110110110001101111000110011100011111000100011001000110011100111010100010111101011000001001100000001001011011101100101101010111011000101000010000101100000111001011010000011110010010110111010000011111101110010001001101100111010011000000100010010001011101100100100010101100101000101101111011100101011100100111100110100;
		5'd17: data <= 1152'b000010000010001100100011010000110000110111001011111010011100111100000010110000100101010000110011101100000111110000111010100111011100100010011010100011001100001101011001111011001010010100001001100001111011011111010000110001110011010100110001110110100000011011011110110011000001100010101100111100101010010100010101000000001110100100110101000010001100010101110100100000001010010100001000000001010011011101101111011001100000011111000011111011101100011101000000010110100100110001110010100100010101110101010010010111010110000000111011111010111101011100000001101001101010000101001111010101111011001000010110101101111110000111110001110110101101011011010011110111001011110110101100101110101010000100010000100000001100100000100101110110100000010101110101101001001010001000100010000101011010011101000110010000010100111111001011111010101011110011100010010100001100110010000010110101100101100001010011000111011101001100001001110110001000011101010011101011000010000100000110001100011110011100010010000111010001001001100010001001100010100011011010100000100001111111101111000110001010100100010010110101101110101000100101100110110100000010110011100010101010000000100000;
		5'd18: data <= 1152'b010010101110011101001100000010000110011111101010011101110111101011001011010000001000100101001000001001011000101000000100110100000101111011111100010000011110110001110011101011100110010100001000111010011011011110000011101111010111010111110010011001011111111011111110110001000100010110111100001101101011111001110001111100111111010100111111010110101110100000111111101101001110010111011110000011001101011100011100010011000110001110101110100101100100010101001100100010111001100011000111110001101001000111001110110011010110101001101011110111110110100110111010110110100010101001110001011000101010110111011010100011101010011111000000000010001100000010111110111010001101111110111001110111101011101100111110111100010110111110111111110010111101100011110011101111010111010111101110001010001001101110001010010111010000011110000110011000011010111101000010010100001001110000100001110110010101000110001000000101010010100001111011010011010101100100101110110100110111110011101001001101010110110110000001100101101001000101110101000000100101011010111100111101111100110101111100001010001011101011110101010111110011111111111111110000011011010101000110101100010000111011001111;
		5'd19: data <= 1152'b101111110101011001101111101110000011101101101100000100110000110101100101101111111100001101110000011111001001110100100100100111000100111011011110010011010110110001100111000011100111010100100001011100010111100110100010011000100111110110111101011011011101011000000110010101110100001100101100011001111001111001110101010011010100000101111110001001111001001101101001101110000110010011011110101010100101000111000001110111010000111111011011001100100010110101010110110001100010010111000011101100101011100111001101000101100100011011000010000100010100110001000011001010101011100100111011011101101101001000001101110000101010101010011101111011111101011001101010000010000100100001101000001000101001101001110001101010110101111011110010010101011101000100110010110101011000100011001111000000110101110011011100000111000110101010100011001110101011001100110010110101100100010010110111110110001011110100100110010001110000011111101100110010110000110000000010100000000101011011110111001111010101000000001101000010011111001011111101011001011000011100010111010001001000111001101100011011101100000101111010111101010011000001010010010011001001101010101000101110010010011000000101;
		5'd20: data <= 1152'b011110000001001100011110010000011000101101110100110000011010111000001110100001001011010101010101100010101000001010001001001000011101000100111011001111100111001110110000011011011000000111000000100001100001110110110101011001001100001001000110100000000001000111111000101110110001011001000011100110010111111010000101100011001000111000011101001100011100010110010111110000101000100110100001111001100111011110000101001110000011111000000111011110101101011011101101010110101110100001010010101101010111110000000100100011001001001000001111111010001101110001111100000101001111100001010111010111110101001100111011000001111001010101111100010000101000011111001010011000111110111100111101010111100100101101111110110101111111111001010111011111011001100011111101001111010010010111000110100110100101010111011011110111000110101000000011010011000010101010110101100101010110001101010010010111011111100000001000110111110011001100111100010110111001010010110111000111100101100100011000111000011100001101101011001110111011110110110100011001101100011110010110010101011100000000010110110101000001001111101001011110011011010111011110111001010010001110100101011110101100010111101101;
		5'd21: data <= 1152'b011010111100011011000000011001101100101000000001010011101001010111000111000001011101100100000000010001010000010100111110000001100000000000011110010111011011010011011011011010011000101011011001111101010011110111000111010101001010100100101111011100111101010001011101001111011010100011111001101000000010110011000001011011111000000101000000110000100001010100111110100000011110011110011110100110010110000000100010110000111011010100100101001010010111100110000111100001100001100000110011000011110000100111100101101010111110001101000101001111100000001111111110010101010010101010010111010001111101100111111001111100001111111001001101000111010010100101001000100110100101111111010110000010100000101010100110011110011110011010111100000010011101110011111110101010010011110010110100000010001111101001010110111000100000110110100010000001010110101111100010010000001001010000010100011111111111010010101011000101101001010101010001101010000101001100110101010111001100000100001111000000011110001000000101011110110111101101010001011101101001111010011011111001001011111110100001111101100010100111001001000101110011010100111000110110100110100000110111010010010111100100001001;
		5'd22: data <= 1152'b000000111001101001101010110010001001010000000000010100111100000000000000010000000011000001001000100110001001100000110001110101001110011110001000001010000001110001010011010000001101001100001111110100100101001100110000001001110010100001111001101010010100011011011010100111000111111110010100001110000001100011111101101101110111111000010100001010110011101001100010010111010001100010011110101000111010111000110100110010000110101100000000000100101100110110000001011100010110010101101000101011001100110000100011010000001111001111011110101001001001111011010011000011000101011100100001000011000011110011101011011100010110001010111010011011010101011011011110010011101001011110001100110100100010100101111111100100010111110000110001011010110100010010101110011110010011010011001111101100111011100000111010110011001101010110001000000101010100110110000001011110100101010101011000101110000000100111000001100100001110001101001100101101000100110000010101011001000101000101001010101011001010111000111111000101000010010000010001100001010101001001110111011011001111110110011100100110100011010100011111010100111111110110101011011010100100100000100000001110000010110011001010;
		5'd23: data <= 1152'b010011111111101010101101101111101100111011110001010100101011011111110110010110001101010101001101100111100111100010010111001001111010001111000000011001100000111001001101110000000010101000000001010110001101101011010101110001111111011100110111011110000011011111110100100010001100110110001011000001111101010001010001001100000011101011100000110001110100000000000011010011110110000100101010001001111100010000100000101111001111010010011001000110011111011001101100011110000010111101000110000100000111110001010001110111100011000110111111010010100100110000010101001011101011010100000011110101001111100100010111011101110100000001110000110100000001111000110100101110001011101000010001010000010111110001111010110010010011111011101000000111001100110010010010010100010100001011111010101101111101010000111110101111001100000010001011001000101110111001100001000101101100110101110000101100000111110111010001110111111011000110011111111100000010110000000001100111101101000101000101000100001100010010011011001111100001001100011101111000010100011101010100000000001101011100100101100010101000100110111011100011010011000000011100000011100000100011011010100100011000000100001101;
		5'd24: data <= 1152'b000000111001101101101110011111111101010111011111011111011100101101010110010100100101110000000010111101011101110101011110010011011100111000100011100011101010101101001100110000110110100011100001011101010010000001001010000011111001011111011001010110011101110110101000000110110000111011110111000110010100111010100001101011110100011110010101001110000111000011110101101111100001101010001101001001110110011010101110011111000010111000010011011110101111000101110011011010000110110101011011101101100001100101110100110011111010101111100010000010101100111001011111110101100011011100001101010000111000111010110111100101111001000100111001000111100101111111111010011011001111010111010100000111001001111101101001101001100010101110111101001010110110110011100011101001001011110010111000000011010111101111001011010001010000010010010110011101010110101100011010110001111111011110111011010000010001000110001110110101111110100000111011010110010100111100110001010011100111000100101111010011001010001010010111001111010101000101010100101011101101011011010101100011001101010010101001001111101110100101001010101100101011110000110000011011010110110010110111100000111011110100101000;
		5'd25: data <= 1152'b111001110110100110100000111110011100101010110110101101100110100000010110010000100111010110001111100001011110001010000111101101010000101001100000010100111011001100011011000010101110100100110001001000001010111100001010001100000111001111010101001111100010101000110000100100110101011101110000011111010101101101011110111011111100011101111000001100010111001011010111100111010101101011011100011101111111110110101000010111011100010101110100000100100100100000000100110010101111010101000111001011000000001111000111111100011101111101001100110000011001101110000000101101111110010101110000001110011011011111101010100001110011001100001000001101001010101010100011100001110011111010110011100110100101100110001110101001011100111001001000001110101111000011110110000111010011101011110011001000111111101100110110011111001110110101010000000100100000111111000110111010000011010011001100110111000010111101101111111100110101110001011100100000011001011011000001011101001010001101101000001101011010001101000000010011110010100111110011111001011001100011101111000001010111001000010010001100011101111111101101100101010111111001001111111011111011100011110011110110111011110011001111;
		5'd26: data <= 1152'b001010000011101111001100111000010011110100001110111100011000110000011001110000101101011010110101010101011001001001011100111110001000100100111011100101011000011010100101101001111010101111010100110001100010011010001001101000000000000100000110100011000010000101110111101001000010111100100101111001010100001000101010110100101111000000100000110010001000011110010100011100111111000000001101101110011001100110000101010100110111000101111110100000010100000010011010011100000011110111100100011001111000011011010101101100001101011110001100101001000010010000110100011100010101001011011000011110010111100011100100110011110000100011011010110001011110110100101000001001110111001000010000111010010001100101011000000101011000100111001110001100101011101111000010001111000010010111001111110101101000000000101110101011001011111001100001000110101101000011100010100100000110101111000000100011000110101011110101011011010100000111010001011100110100100100101000000110011111101000001101000000111110000000110110111100101100101011001110000011010101001101010100001011001101101101000000010010000010100011010001111110010011010111100010010011110011010101010000101100010001010001011110;
		5'd27: data <= 1152'b010011100011100110000000010100010000111001000011110011100010100101010010110001100100110111110010110011010100111001001010001011100001100000010001110010011101001101011011001011101110000100101101000000111000011110010010101110110100000111010000100011000010111111100111100011001010010110111001001100000101101101111010101101100110110101100100011010100110110000100001011011100110001010000101011001111100001000010111101110001100111101111001100111100000010010000110010000001110010101000000110101011110111010111001101000011101100001101100110010011100000001010111101101101010110111110000010110101010011100111001001011010101001111010010101011000110001110010111111001000011111110111000001110100101000101011010110110100111010100101001111010010101100010010110001110000110011111011000000011101110001101010010000001010001010010010011001000000110110110000011011000001101010000010001101011101101010000110101001110001000011111011101110001001110001001010100001011100000100001011010011100010110101010001100010011010000110100110011100111110011111010110001100100110111011110010011111010010001110001000010001111001101011111011011001101101111000011000110110010110101111111111011;
		5'd28: data <= 1152'b000011000010010100000011011100010110110111001011111010000010100001000000110000101100011011100011101101011010001001011000000111001011110011010111000010110100000100111111101111101010010101101110001010010111100001000101100001100011000110010010110100100101101101011010101011111011010010011110011100001010011101101000111101101101100001000101010110011110011011000001110101011101001010000000011111000011101101011011000000010000100110111100101000100110111000001011101001100001001110010111011100110001100110010001100101101101100010001010110010011000001100010101011011111011100111010110001111110110100111011011101100000111001100011001100110100100000011010011110001001011110010111100011110001101001101011010101101101011110000011011000010111110111011110101001001100111010000100000110010001011101011010001100110110001011101100110111100110010111000110010101000110000110100000101000110110010000110000000011000011100010011000100001111101001011000111000011101110001101010010110001111010111000100001011011101001110000010100011011101101110100010100111110101000011011000101110011110100100000001010010100010001111100110111000011011011100000110110001100010000010011110111000;
		5'd29: data <= 1152'b110011011011101101111100011000110110010000001110110010011101100101000000010010000101011000000000000100111001010001011010110111100011000110010001100010000011101110000101011011011101001011001001000000111111100011010101100101111000110110100001110001011100110100101100100010111000000111111100111011101101000001110011111101011010001111011110100011010100010001010001110011110011111011100110001101111000110000101100101010000011111001000011000110001101000101110000000101011100101101000000000010101011110001000000110001010011000010001000000100111101010011011101101100001101001000001101000110111010010110010000101101110010000010110001111011011111101011101101100111100111101110000110101100111010110010011001000001001000101000110000101010111111010001100110100001101011100111111010101001011101011000110010010110001011001000001000000100011100110000000001100100011001001001110000011000000110110001000111100111111011000110011111111000011001110011010101101011101011000100000100000011000111101110010100001001110010000011110110011110010100011011011110100000001101011110101011000110000111101111101011110100001111010000111110010010101010000000110010110110000010000011001000;
		5'd30: data <= 1152'b001001111010010010100111011001010100111001000011011110101101001001110001010101001100110000011010100101010011100101000101000111010010100000111011010110111100001100011011001011101010010100101101000110111011011110010001011111010100101100011011100011000111001001001100001001111000110000111111011101101110011101111101110100111100000001000010110011001110100010111101010011110000011001001100001111001011111001011001010000010011101100000100111100100000111110001101101110011000001010110111110111100101000100001101111110111101101011001011111011000011111101010101011011010101100110100110110011100101100010011110111001000011111101010110100110101010010000010111011000010001101110110110111010101111001101111110010110011111000110101101110010010101101111011101000110000100010101011101110110000001101010101001010000110111010100001101100011000010010110001010011101001001110001001100101111101011010110101000010000001101011111010100101011100110110001011110110000010111101011111011111110010101000111000000010000101010110000111110111001110001110101101001010111110101101001000000000100011000110010100001000011111101101110110111100101110011111111001110011100011000111001100010;
		5'd31: data <= 1152'b001000011111001101100010010011001101110001000100010101100011110100001001110000000011010111111111110011000110110101010101000110111010000111011111101010000000110010110111000011000001010110100101111110101101000010010111101101100101100010111110001101011110011110000011010000010111111000000101101011011000100100011100100001001101100111000000100111110111110000111110110011110000011100100001101000000001001110000010110001101101010100010000000100010010111100001010101101010001000011111011111101100110110111011011001000111000010000001100101100111100011010011010101111011000111110110010111110101110001000101100011111100111011011001110101100011100101011010101001000010001010100100011111010000100000111101110111100101111101111000010011011110000000010010010100000111001100000001011101110000101110011101011100001101001000000101000110001010000000011101100001110110010001000111110011101111110111110110001100001101101111010111111000011100010001001010001011110111110110111010000001101000100011001101110100000110100011110010101001100000001111011011100000010110100111111100011010101110110011011100001011011101101011100000101011100011000001000000001110111000101101001011111;
		endcase
		end
	end
	assign dout = data;
endmodule
