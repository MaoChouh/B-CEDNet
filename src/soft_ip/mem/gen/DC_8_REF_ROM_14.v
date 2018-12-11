`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module DC_8_REF_ROM_14(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 14;
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
		5'd0: data <= 14'b01001001000100;
		5'd1: data <= 14'b01001010110011;
		5'd2: data <= 14'b01001000001100;
		5'd3: data <= 14'b01001010010101;
		5'd4: data <= 14'b01000111010100;
		5'd5: data <= 14'b01001101011100;
		5'd6: data <= 14'b01000111100100;
		5'd7: data <= 14'b01000011000101;
		5'd8: data <= 14'b01000111101101;
		5'd9: data <= 14'b01001100111000;
		5'd10: data <= 14'b01001001110000;
		5'd11: data <= 14'b01000110100110;
		5'd12: data <= 14'b01001000110011;
		5'd13: data <= 14'b01000011101110;
		5'd14: data <= 14'b01001000010101;
		5'd15: data <= 14'b01001001010001;
		5'd16: data <= 14'b01001101110111;
		5'd17: data <= 14'b01001000101110;
		5'd18: data <= 14'b01001010110110;
		5'd19: data <= 14'b01000101110101;
		5'd20: data <= 14'b01000110001010;
		5'd21: data <= 14'b01001010111010;
		5'd22: data <= 14'b01001011001101;
		5'd23: data <= 14'b01000110011110;
		5'd24: data <= 14'b01001010110001;
		5'd25: data <= 14'b01000011000111;
		5'd26: data <= 14'b01000001011100;
		5'd27: data <= 14'b01001101001100;
		5'd28: data <= 14'b01001011010011;
		5'd29: data <= 14'b01000101011100;
		5'd30: data <= 14'b01001000000001;
		5'd31: data <= 14'b01001001100000;
		endcase
		end
	end
	assign dout = data;
endmodule
