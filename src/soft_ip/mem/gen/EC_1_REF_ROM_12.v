`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module EC_1_REF_ROM_12(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 12;
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
		5'd0: data <= 12'b010010001000;
		5'd1: data <= 12'b010010101001;
		5'd2: data <= 12'b010011000011;
		5'd3: data <= 12'b010011101110;
		5'd4: data <= 12'b010011011100;
		5'd5: data <= 12'b010000101001;
		5'd6: data <= 12'b010000111111;
		5'd7: data <= 12'b010010110111;
		5'd8: data <= 12'b010010111010;
		5'd9: data <= 12'b001111010110;
		5'd10: data <= 12'b010010111101;
		5'd11: data <= 12'b010100001000;
		5'd12: data <= 12'b010010011101;
		5'd13: data <= 12'b010011011011;
		5'd14: data <= 12'b010011101001;
		5'd15: data <= 12'b010011000011;
		5'd16: data <= 12'b010001000011;
		5'd17: data <= 12'b010010010101;
		5'd18: data <= 12'b010011100110;
		5'd19: data <= 12'b010011010110;
		5'd20: data <= 12'b010001101110;
		5'd21: data <= 12'b010010101101;
		5'd22: data <= 12'b010011001111;
		5'd23: data <= 12'b010100000000;
		5'd24: data <= 12'b010011101101;
		5'd25: data <= 12'b010010101101;
		5'd26: data <= 12'b010011001001;
		5'd27: data <= 12'b010001111011;
		5'd28: data <= 12'b010010100100;
		5'd29: data <= 12'b010100111010;
		5'd30: data <= 12'b010100000001;
		5'd31: data <= 12'b010010011100;
		endcase
		end
	end
	assign dout = data;
endmodule
