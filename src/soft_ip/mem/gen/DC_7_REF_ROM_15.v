`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module DC_7_REF_ROM_15(
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
		5'd0: data <= 14'b01001101100100;
		5'd1: data <= 14'b01001000011010;
		5'd2: data <= 14'b01001111011100;
		5'd3: data <= 14'b01001001110110;
		5'd4: data <= 14'b01001011010000;
		5'd5: data <= 14'b01001001100001;
		5'd6: data <= 14'b01001010100001;
		5'd7: data <= 14'b01000110010001;
		5'd8: data <= 14'b01001000000100;
		5'd9: data <= 14'b01001000100100;
		5'd10: data <= 14'b01001001011011;
		5'd11: data <= 14'b01000111010100;
		5'd12: data <= 14'b01000110010001;
		5'd13: data <= 14'b01001101101010;
		5'd14: data <= 14'b01001000000001;
		5'd15: data <= 14'b01000111001100;
		5'd16: data <= 14'b01001011000011;
		5'd17: data <= 14'b01001010010001;
		5'd18: data <= 14'b01001000000000;
		5'd19: data <= 14'b01001100010101;
		5'd20: data <= 14'b01000111100010;
		5'd21: data <= 14'b01001011110111;
		5'd22: data <= 14'b01001000011110;
		5'd23: data <= 14'b01001010000001;
		5'd24: data <= 14'b01001001000100;
		5'd25: data <= 14'b01000110100011;
		5'd26: data <= 14'b01000110000001;
		5'd27: data <= 14'b01001011001100;
		5'd28: data <= 14'b01001010101101;
		5'd29: data <= 14'b01001011011001;
		5'd30: data <= 14'b01001011001000;
		5'd31: data <= 14'b01000011101010;
		endcase
		end
	end
	assign dout = data;
endmodule
