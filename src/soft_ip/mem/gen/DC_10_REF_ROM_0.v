`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module DC_10_REF_ROM_0(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 12;
localparam ROM_DEP = 27;
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
		5'd0: data <= 12'b000111110011;
		5'd1: data <= 12'b000111000001;
		5'd2: data <= 12'b001001100001;
		5'd3: data <= 12'b000111000100;
		5'd4: data <= 12'b000111000101;
		5'd5: data <= 12'b000110110000;
		5'd6: data <= 12'b000110101100;
		5'd7: data <= 12'b000110101110;
		5'd8: data <= 12'b000110100001;
		5'd9: data <= 12'b000110110001;
		5'd10: data <= 12'b001001000011;
		5'd11: data <= 12'b000110100111;
		5'd12: data <= 12'b000110101011;
		5'd13: data <= 12'b000110101111;
		5'd14: data <= 12'b001000111010;
		5'd15: data <= 12'b000111000100;
		5'd16: data <= 12'b001001001010;
		5'd17: data <= 12'b000110001101;
		5'd18: data <= 12'b000110111111;
		5'd19: data <= 12'b000111000101;
		5'd20: data <= 12'b000110111111;
		5'd21: data <= 12'b000110111101;
		5'd22: data <= 12'b001001010000;
		5'd23: data <= 12'b000110101100;
		5'd24: data <= 12'b001001111011;
		5'd25: data <= 12'b000110101010;
		5'd26: data <= 12'b001001101000;
		endcase
		end
	end
	assign dout = data;
endmodule
