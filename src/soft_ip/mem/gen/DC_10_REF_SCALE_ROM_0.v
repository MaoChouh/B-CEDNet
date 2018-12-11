`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module DC_10_REF_SCALE_ROM_0(
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
		5'd0: data <= 12'b000001011110;
		5'd1: data <= 12'b111110100010;
		5'd2: data <= 12'b000001101110;
		5'd3: data <= 12'b111110011100;
		5'd4: data <= 12'b111110011000;
		5'd5: data <= 12'b111110011111;
		5'd6: data <= 12'b111110010100;
		5'd7: data <= 12'b111110011000;
		5'd8: data <= 12'b111110011000;
		5'd9: data <= 12'b111110100011;
		5'd10: data <= 12'b000001111100;
		5'd11: data <= 12'b111110001100;
		5'd12: data <= 12'b111110011001;
		5'd13: data <= 12'b111110011000;
		5'd14: data <= 12'b000001100010;
		5'd15: data <= 12'b111110011011;
		5'd16: data <= 12'b000001101011;
		5'd17: data <= 12'b111101111000;
		5'd18: data <= 12'b111110011111;
		5'd19: data <= 12'b111110011101;
		5'd20: data <= 12'b111110011110;
		5'd21: data <= 12'b111110011001;
		5'd22: data <= 12'b000001101110;
		5'd23: data <= 12'b111110010000;
		5'd24: data <= 12'b000010000110;
		5'd25: data <= 12'b111110010110;
		5'd26: data <= 12'b000001111110;
		endcase
		end
	end
	assign dout = data;
endmodule
