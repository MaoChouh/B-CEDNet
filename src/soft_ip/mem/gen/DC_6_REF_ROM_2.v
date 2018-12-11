`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module DC_6_REF_ROM_2(
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
		6'd0: data <= 14'b01001100000011;
		6'd1: data <= 14'b01001011011011;
		6'd2: data <= 14'b01000110010101;
		6'd3: data <= 14'b01001100111000;
		6'd4: data <= 14'b01000111111011;
		6'd5: data <= 14'b01001001010011;
		6'd6: data <= 14'b01001001001000;
		6'd7: data <= 14'b01000100101001;
		6'd8: data <= 14'b01000110001010;
		6'd9: data <= 14'b01000011100011;
		6'd10: data <= 14'b01000111111100;
		6'd11: data <= 14'b01000100111011;
		6'd12: data <= 14'b01001101000010;
		6'd13: data <= 14'b01001001111100;
		6'd14: data <= 14'b01001001100011;
		6'd15: data <= 14'b01000110000010;
		6'd16: data <= 14'b01001100101000;
		6'd17: data <= 14'b01001011111010;
		6'd18: data <= 14'b01000101010001;
		6'd19: data <= 14'b01001011010100;
		6'd20: data <= 14'b01000111000101;
		6'd21: data <= 14'b01001001110001;
		6'd22: data <= 14'b01001011011011;
		6'd23: data <= 14'b01001101111111;
		6'd24: data <= 14'b01001000110110;
		6'd25: data <= 14'b01000111110100;
		6'd26: data <= 14'b01001011100011;
		6'd27: data <= 14'b01001000101001;
		6'd28: data <= 14'b01001100100111;
		6'd29: data <= 14'b01000111110000;
		6'd30: data <= 14'b01001101110011;
		6'd31: data <= 14'b01001100110000;
		6'd32: data <= 14'b01001100000010;
		6'd33: data <= 14'b01000110011111;
		6'd34: data <= 14'b01000111111010;
		6'd35: data <= 14'b01001100011001;
		6'd36: data <= 14'b01001100101000;
		6'd37: data <= 14'b01000111010101;
		6'd38: data <= 14'b01001011001100;
		6'd39: data <= 14'b01001100010101;
		6'd40: data <= 14'b01001100101010;
		6'd41: data <= 14'b01001010111101;
		6'd42: data <= 14'b01000111000100;
		6'd43: data <= 14'b01001011011111;
		6'd44: data <= 14'b01001101110101;
		6'd45: data <= 14'b01001001110110;
		6'd46: data <= 14'b01000111001000;
		6'd47: data <= 14'b01000110000110;
		6'd48: data <= 14'b01001100100011;
		6'd49: data <= 14'b01001000011111;
		6'd50: data <= 14'b01001001110111;
		6'd51: data <= 14'b01001000011010;
		6'd52: data <= 14'b01001000111000;
		6'd53: data <= 14'b01001011000100;
		6'd54: data <= 14'b01001101110100;
		6'd55: data <= 14'b01001011010101;
		6'd56: data <= 14'b01001001011110;
		6'd57: data <= 14'b01001100001110;
		6'd58: data <= 14'b01001110010001;
		6'd59: data <= 14'b01001000110011;
		6'd60: data <= 14'b01001100111101;
		6'd61: data <= 14'b01001111100011;
		6'd62: data <= 14'b01000111100100;
		6'd63: data <= 14'b01001011000101;
		endcase
		end
	end
	assign dout = data;
endmodule
