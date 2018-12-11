`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module EC_3_REF_SOFT_ROM_3(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 14;
localparam ROM_DEP = 128;
localparam ROM_ADDR = 7;
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
		7'd0: data <= 14'b01001011111001;
		7'd1: data <= 14'b01001011100111;
		7'd2: data <= 14'b01001011011001;
		7'd3: data <= 14'b01001100001000;
		7'd4: data <= 14'b01001010010010;
		7'd5: data <= 14'b01001011100000;
		7'd6: data <= 14'b01001000100000;
		7'd7: data <= 14'b01001100010101;
		7'd8: data <= 14'b01001001100100;
		7'd9: data <= 14'b01001011010010;
		7'd10: data <= 14'b01001100001001;
		7'd11: data <= 14'b01001010110000;
		7'd12: data <= 14'b01001010101110;
		7'd13: data <= 14'b01001101010010;
		7'd14: data <= 14'b01001100101011;
		7'd15: data <= 14'b01001010011011;
		7'd16: data <= 14'b01001100001101;
		7'd17: data <= 14'b01001010100111;
		7'd18: data <= 14'b01001011110100;
		7'd19: data <= 14'b01001011110010;
		7'd20: data <= 14'b01001010101001;
		7'd21: data <= 14'b01001011000001;
		7'd22: data <= 14'b01001101110100;
		7'd23: data <= 14'b01001011111110;
		7'd24: data <= 14'b01001010010001;
		7'd25: data <= 14'b01001000001011;
		7'd26: data <= 14'b01000111000101;
		7'd27: data <= 14'b01000111011110;
		7'd28: data <= 14'b01001011011010;
		7'd29: data <= 14'b01001010000100;
		7'd30: data <= 14'b01001011101000;
		7'd31: data <= 14'b01001100000111;
		7'd32: data <= 14'b01001101000110;
		7'd33: data <= 14'b01001011001000;
		7'd34: data <= 14'b01001101010101;
		7'd35: data <= 14'b01001001011000;
		7'd36: data <= 14'b01001011100010;
		7'd37: data <= 14'b01000111110011;
		7'd38: data <= 14'b01000110011111;
		7'd39: data <= 14'b01001010010011;
		7'd40: data <= 14'b01001000100111;
		7'd41: data <= 14'b01001010110111;
		7'd42: data <= 14'b01001000010101;
		7'd43: data <= 14'b01001001011000;
		7'd44: data <= 14'b01001100101001;
		7'd45: data <= 14'b01001010010000;
		7'd46: data <= 14'b01001011000110;
		7'd47: data <= 14'b01001011111110;
		7'd48: data <= 14'b01001001001010;
		7'd49: data <= 14'b01001100001100;
		7'd50: data <= 14'b01001011110100;
		7'd51: data <= 14'b01001000000101;
		7'd52: data <= 14'b01001010111001;
		7'd53: data <= 14'b01001011110001;
		7'd54: data <= 14'b01001001011110;
		7'd55: data <= 14'b01001010100110;
		7'd56: data <= 14'b01000111011101;
		7'd57: data <= 14'b01001100111101;
		7'd58: data <= 14'b01001011010010;
		7'd59: data <= 14'b01001011111001;
		7'd60: data <= 14'b01001011011111;
		7'd61: data <= 14'b01001011100111;
		7'd62: data <= 14'b01001011111111;
		7'd63: data <= 14'b01001010001011;
		7'd64: data <= 14'b01001100010001;
		7'd65: data <= 14'b01001011110010;
		7'd66: data <= 14'b01001100101010;
		7'd67: data <= 14'b01001011101001;
		7'd68: data <= 14'b01001010100101;
		7'd69: data <= 14'b01000111111111;
		7'd70: data <= 14'b01001011010001;
		7'd71: data <= 14'b01001101110111;
		7'd72: data <= 14'b01001010011001;
		7'd73: data <= 14'b01001001000011;
		7'd74: data <= 14'b01001011011100;
		7'd75: data <= 14'b01001000010011;
		7'd76: data <= 14'b01000111101000;
		7'd77: data <= 14'b01001011001010;
		7'd78: data <= 14'b01001001110101;
		7'd79: data <= 14'b01001001111001;
		7'd80: data <= 14'b01001001010000;
		7'd81: data <= 14'b01001010111001;
		7'd82: data <= 14'b01001010011010;
		7'd83: data <= 14'b01001001101011;
		7'd84: data <= 14'b01001000001110;
		7'd85: data <= 14'b01001100011001;
		7'd86: data <= 14'b01001011010101;
		7'd87: data <= 14'b01001100110110;
		7'd88: data <= 14'b01001100011001;
		7'd89: data <= 14'b01001010100011;
		7'd90: data <= 14'b01001100110100;
		7'd91: data <= 14'b01001100110100;
		7'd92: data <= 14'b01001011110111;
		7'd93: data <= 14'b01001001111011;
		7'd94: data <= 14'b01001011110101;
		7'd95: data <= 14'b01001101011110;
		7'd96: data <= 14'b01001101110110;
		7'd97: data <= 14'b01001100101100;
		7'd98: data <= 14'b01001100100111;
		7'd99: data <= 14'b01001011100101;
		7'd100: data <= 14'b01001000010111;
		7'd101: data <= 14'b01001001110011;
		7'd102: data <= 14'b01001011001101;
		7'd103: data <= 14'b01001011010001;
		7'd104: data <= 14'b01001100101110;
		7'd105: data <= 14'b01001010001111;
		7'd106: data <= 14'b01001100001010;
		7'd107: data <= 14'b01001100101110;
		7'd108: data <= 14'b01001000000110;
		7'd109: data <= 14'b01001100011011;
		7'd110: data <= 14'b01000110110001;
		7'd111: data <= 14'b01001011100101;
		7'd112: data <= 14'b01001100000111;
		7'd113: data <= 14'b01001000011011;
		7'd114: data <= 14'b01001000010000;
		7'd115: data <= 14'b01001100100101;
		7'd116: data <= 14'b01001011011010;
		7'd117: data <= 14'b01001100001110;
		7'd118: data <= 14'b01001011101000;
		7'd119: data <= 14'b01001001000001;
		7'd120: data <= 14'b01001011110001;
		7'd121: data <= 14'b01001010111100;
		7'd122: data <= 14'b01001100000010;
		7'd123: data <= 14'b01001100101110;
		7'd124: data <= 14'b01001010110110;
		7'd125: data <= 14'b01001000110100;
		7'd126: data <= 14'b01001000110010;
		7'd127: data <= 14'b01001010011001;
		endcase
		end
	end
	assign dout = data;
endmodule
