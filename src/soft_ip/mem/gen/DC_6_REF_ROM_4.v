`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module DC_6_REF_ROM_4(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 14;
localparam ROM_DEP = 64;
localparam ROM_ADDR = 6;
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
		6'd0: data <= 14'b01001111011110;
		6'd1: data <= 14'b01001001111000;
		6'd2: data <= 14'b01000101001010;
		6'd3: data <= 14'b01001000001111;
		6'd4: data <= 14'b01001101000101;
		6'd5: data <= 14'b01000111111101;
		6'd6: data <= 14'b01001010111101;
		6'd7: data <= 14'b01001010011101;
		6'd8: data <= 14'b01000110100011;
		6'd9: data <= 14'b01010000000010;
		6'd10: data <= 14'b01001000100011;
		6'd11: data <= 14'b01001011110010;
		6'd12: data <= 14'b01001011101000;
		6'd13: data <= 14'b01001010110110;
		6'd14: data <= 14'b01001010011100;
		6'd15: data <= 14'b01001010000000;
		6'd16: data <= 14'b01001010001101;
		6'd17: data <= 14'b01001100111100;
		6'd18: data <= 14'b01001011011111;
		6'd19: data <= 14'b01001010001001;
		6'd20: data <= 14'b01000111110111;
		6'd21: data <= 14'b01001000110001;
		6'd22: data <= 14'b01001100110100;
		6'd23: data <= 14'b01000101100100;
		6'd24: data <= 14'b01001101101111;
		6'd25: data <= 14'b01010000000110;
		6'd26: data <= 14'b01001001111100;
		6'd27: data <= 14'b01001011010101;
		6'd28: data <= 14'b01001101001001;
		6'd29: data <= 14'b01000101011011;
		6'd30: data <= 14'b01001010001111;
		6'd31: data <= 14'b01001111010010;
		6'd32: data <= 14'b01001001000111;
		6'd33: data <= 14'b01001101011010;
		6'd34: data <= 14'b01000101110010;
		6'd35: data <= 14'b01001011000011;
		6'd36: data <= 14'b01001000001100;
		6'd37: data <= 14'b01001000101101;
		6'd38: data <= 14'b01000110001100;
		6'd39: data <= 14'b01001111000110;
		6'd40: data <= 14'b01001101101110;
		6'd41: data <= 14'b01001010110110;
		6'd42: data <= 14'b01001000110111;
		6'd43: data <= 14'b01001101110011;
		6'd44: data <= 14'b01001011100110;
		6'd45: data <= 14'b01000111110001;
		6'd46: data <= 14'b01001000010110;
		6'd47: data <= 14'b01001000000011;
		6'd48: data <= 14'b01001110101110;
		6'd49: data <= 14'b01001111110011;
		6'd50: data <= 14'b01001000101101;
		6'd51: data <= 14'b01001010111101;
		6'd52: data <= 14'b01001001011001;
		6'd53: data <= 14'b01001011100000;
		6'd54: data <= 14'b01001011111001;
		6'd55: data <= 14'b01000110101111;
		6'd56: data <= 14'b01001010001110;
		6'd57: data <= 14'b01001111000000;
		6'd58: data <= 14'b01001100001011;
		6'd59: data <= 14'b01001001011110;
		6'd60: data <= 14'b01001100111001;
		6'd61: data <= 14'b01001100101001;
		6'd62: data <= 14'b01000101011110;
		6'd63: data <= 14'b01001010000001;
		endcase
		end
	end
	assign dout = data;
endmodule
