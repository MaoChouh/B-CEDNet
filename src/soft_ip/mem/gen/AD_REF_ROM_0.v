`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module AD_REF_ROM_0(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 22;
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
		5'd0: data <= 22'b1111111111111100100010;
		5'd1: data <= 22'b1111111111111111111101;
		5'd2: data <= 22'b1111111111111111101010;
		5'd3: data <= 22'b1111111111111111111110;
		5'd4: data <= 22'b1111111111111111111111;
		5'd5: data <= 22'b0000000000000001011001;
		5'd6: data <= 22'b1111111111100011101101;
		5'd7: data <= 22'b0000000000001110110010;
		5'd8: data <= 22'b0000000000000011100111;
		5'd9: data <= 22'b0000000000111111111111;
		5'd10: data <= 22'b0000000000000011100111;
		5'd11: data <= 22'b1111111111111111110101;
		5'd12: data <= 22'b1111111111111100000110;
		5'd13: data <= 22'b0000000000000010001000;
		5'd14: data <= 22'b0000000000000000000001;
		5'd15: data <= 22'b0000000000000000000010;
		5'd16: data <= 22'b1111111111111011101101;
		5'd17: data <= 22'b0000000000000010101011;
		5'd18: data <= 22'b0000000000000000000001;
		5'd19: data <= 22'b0000000000000110000001;
		5'd20: data <= 22'b1111111111111101110110;
		5'd21: data <= 22'b0000000000000000000000;
		5'd22: data <= 22'b0000000000111111111111;
		5'd23: data <= 22'b0000000000111111111111;
		5'd24: data <= 22'b1111111111111101011111;
		5'd25: data <= 22'b1111111111111111111111;
		5'd26: data <= 22'b0000000000000101010101;
		5'd27: data <= 22'b0000000000000010011110;
		5'd28: data <= 22'b1111111111000000000000;
		5'd29: data <= 22'b0000000000000010100011;
		5'd30: data <= 22'b0000000000000000000000;
		5'd31: data <= 22'b1111111111111111111001;
		endcase
		end
	end
	assign dout = data;
endmodule
