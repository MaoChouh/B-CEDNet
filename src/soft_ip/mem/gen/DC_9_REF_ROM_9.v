`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module DC_9_REF_ROM_9(
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
		5'd0: data <= 11'b01111111111;
		5'd1: data <= 11'b01000010000;
		5'd2: data <= 11'b01110101001;
		5'd3: data <= 11'b01111111111;
		5'd4: data <= 11'b01000100011;
		5'd5: data <= 11'b01000100101;
		5'd6: data <= 11'b01000101001;
		5'd7: data <= 11'b01000110001;
		5'd8: data <= 11'b01000110000;
		5'd9: data <= 11'b01000101000;
		5'd10: data <= 11'b00111110111;
		5'd11: data <= 11'b01000110000;
		5'd12: data <= 11'b01000000001;
		5'd13: data <= 11'b00111101101;
		5'd14: data <= 11'b00111100010;
		5'd15: data <= 11'b00111100010;
		5'd16: data <= 11'b01000100011;
		5'd17: data <= 11'b01000011000;
		5'd18: data <= 11'b00111101110;
		5'd19: data <= 11'b00111100001;
		5'd20: data <= 11'b01000110111;
		5'd21: data <= 11'b00111010001;
		5'd22: data <= 11'b00111110001;
		5'd23: data <= 11'b01000011010;
		5'd24: data <= 11'b00111100000;
		5'd25: data <= 11'b00010100000;
		5'd26: data <= 11'b00111010101;
		5'd27: data <= 11'b01000100010;
		5'd28: data <= 11'b01000100010;
		5'd29: data <= 11'b01000011011;
		5'd30: data <= 11'b01000100010;
		5'd31: data <= 11'b10110111101;
		endcase
		end
	end
	assign dout = data;
endmodule
