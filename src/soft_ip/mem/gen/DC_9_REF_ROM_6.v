`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module DC_9_REF_ROM_6(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 11;
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
		5'd0: data <= 11'b01000010111;
		5'd1: data <= 11'b00111010100;
		5'd2: data <= 11'b01000111011;
		5'd3: data <= 11'b11000110111;
		5'd4: data <= 11'b01000000011;
		5'd5: data <= 11'b00111011000;
		5'd6: data <= 11'b01111111111;
		5'd7: data <= 11'b00111001111;
		5'd8: data <= 11'b00111010100;
		5'd9: data <= 11'b00001110100;
		5'd10: data <= 11'b01000101101;
		5'd11: data <= 11'b01100100010;
		5'd12: data <= 11'b01000110101;
		5'd13: data <= 11'b00111011111;
		5'd14: data <= 11'b01000011010;
		5'd15: data <= 11'b01001000001;
		5'd16: data <= 11'b01000111010;
		5'd17: data <= 11'b01000100110;
		5'd18: data <= 11'b01000100000;
		5'd19: data <= 11'b11110010100;
		5'd20: data <= 11'b11010000100;
		5'd21: data <= 11'b00111110100;
		5'd22: data <= 11'b00111101100;
		5'd23: data <= 11'b01111111111;
		5'd24: data <= 11'b01000001001;
		5'd25: data <= 11'b01000100101;
		5'd26: data <= 11'b00111100111;
		5'd27: data <= 11'b00111001010;
		5'd28: data <= 11'b10000000000;
		5'd29: data <= 11'b00111000111;
		5'd30: data <= 11'b01011001101;
		5'd31: data <= 11'b01111111111;
		endcase
		end
	end
	assign dout = data;
endmodule
