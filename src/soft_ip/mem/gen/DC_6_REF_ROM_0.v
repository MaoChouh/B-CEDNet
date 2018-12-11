`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module DC_6_REF_ROM_0(
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
		6'd0: data <= 14'b01001100101110;
		6'd1: data <= 14'b01001100001111;
		6'd2: data <= 14'b01001000010110;
		6'd3: data <= 14'b01001100101110;
		6'd4: data <= 14'b01001101101001;
		6'd5: data <= 14'b01001011101000;
		6'd6: data <= 14'b01001010100010;
		6'd7: data <= 14'b01001010111011;
		6'd8: data <= 14'b01001010111110;
		6'd9: data <= 14'b01001001001011;
		6'd10: data <= 14'b01001100001010;
		6'd11: data <= 14'b01001011000010;
		6'd12: data <= 14'b01001000110101;
		6'd13: data <= 14'b01001110100000;
		6'd14: data <= 14'b01000111100110;
		6'd15: data <= 14'b01001101101100;
		6'd16: data <= 14'b01001011101000;
		6'd17: data <= 14'b01001001100011;
		6'd18: data <= 14'b01001000100011;
		6'd19: data <= 14'b01001110000010;
		6'd20: data <= 14'b01001100101101;
		6'd21: data <= 14'b01001101111111;
		6'd22: data <= 14'b01001100000110;
		6'd23: data <= 14'b01001100000111;
		6'd24: data <= 14'b01001001101110;
		6'd25: data <= 14'b01000010100110;
		6'd26: data <= 14'b01001101001100;
		6'd27: data <= 14'b01001010001001;
		6'd28: data <= 14'b01001111001110;
		6'd29: data <= 14'b01001101100111;
		6'd30: data <= 14'b01001110001110;
		6'd31: data <= 14'b01001001001011;
		6'd32: data <= 14'b01000111001111;
		6'd33: data <= 14'b01001110001000;
		6'd34: data <= 14'b01000111011101;
		6'd35: data <= 14'b01001100111111;
		6'd36: data <= 14'b01001000101001;
		6'd37: data <= 14'b01001011001101;
		6'd38: data <= 14'b01001001011000;
		6'd39: data <= 14'b01001000000011;
		6'd40: data <= 14'b01001010010111;
		6'd41: data <= 14'b01001001111010;
		6'd42: data <= 14'b01001011101100;
		6'd43: data <= 14'b01001010101011;
		6'd44: data <= 14'b01010010010101;
		6'd45: data <= 14'b01000101111010;
		6'd46: data <= 14'b01001110000000;
		6'd47: data <= 14'b01001001111110;
		6'd48: data <= 14'b01001001001101;
		6'd49: data <= 14'b01001100011100;
		6'd50: data <= 14'b01001101101100;
		6'd51: data <= 14'b01001010010001;
		6'd52: data <= 14'b01001010110110;
		6'd53: data <= 14'b01001010100011;
		6'd54: data <= 14'b01001010000000;
		6'd55: data <= 14'b01001001111100;
		6'd56: data <= 14'b01001110010100;
		6'd57: data <= 14'b01001011000111;
		6'd58: data <= 14'b01001011001110;
		6'd59: data <= 14'b01001011000011;
		6'd60: data <= 14'b01001111010100;
		6'd61: data <= 14'b01001011100111;
		6'd62: data <= 14'b01001011001011;
		6'd63: data <= 14'b01001000010010;
		endcase
		end
	end
	assign dout = data;
endmodule
