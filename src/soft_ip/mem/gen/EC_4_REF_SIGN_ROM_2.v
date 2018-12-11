`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module EC_4_REF_SIGN_ROM_2(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 1;
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
		7'd0: data <= 1'b1;
		7'd1: data <= 1'b1;
		7'd2: data <= 1'b1;
		7'd3: data <= 1'b1;
		7'd4: data <= 1'b1;
		7'd5: data <= 1'b1;
		7'd6: data <= 1'b1;
		7'd7: data <= 1'b1;
		7'd8: data <= 1'b1;
		7'd9: data <= 1'b1;
		7'd10: data <= 1'b1;
		7'd11: data <= 1'b1;
		7'd12: data <= 1'b1;
		7'd13: data <= 1'b1;
		7'd14: data <= 1'b1;
		7'd15: data <= 1'b1;
		7'd16: data <= 1'b1;
		7'd17: data <= 1'b1;
		7'd18: data <= 1'b1;
		7'd19: data <= 1'b1;
		7'd20: data <= 1'b1;
		7'd21: data <= 1'b1;
		7'd22: data <= 1'b1;
		7'd23: data <= 1'b1;
		7'd24: data <= 1'b1;
		7'd25: data <= 1'b1;
		7'd26: data <= 1'b1;
		7'd27: data <= 1'b1;
		7'd28: data <= 1'b1;
		7'd29: data <= 1'b1;
		7'd30: data <= 1'b1;
		7'd31: data <= 1'b1;
		7'd32: data <= 1'b1;
		7'd33: data <= 1'b1;
		7'd34: data <= 1'b1;
		7'd35: data <= 1'b1;
		7'd36: data <= 1'b1;
		7'd37: data <= 1'b1;
		7'd38: data <= 1'b1;
		7'd39: data <= 1'b1;
		7'd40: data <= 1'b1;
		7'd41: data <= 1'b1;
		7'd42: data <= 1'b1;
		7'd43: data <= 1'b1;
		7'd44: data <= 1'b1;
		7'd45: data <= 1'b1;
		7'd46: data <= 1'b1;
		7'd47: data <= 1'b1;
		7'd48: data <= 1'b1;
		7'd49: data <= 1'b1;
		7'd50: data <= 1'b1;
		7'd51: data <= 1'b1;
		7'd52: data <= 1'b1;
		7'd53: data <= 1'b1;
		7'd54: data <= 1'b1;
		7'd55: data <= 1'b1;
		7'd56: data <= 1'b1;
		7'd57: data <= 1'b1;
		7'd58: data <= 1'b1;
		7'd59: data <= 1'b1;
		7'd60: data <= 1'b1;
		7'd61: data <= 1'b1;
		7'd62: data <= 1'b1;
		7'd63: data <= 1'b1;
		7'd64: data <= 1'b1;
		7'd65: data <= 1'b1;
		7'd66: data <= 1'b1;
		7'd67: data <= 1'b1;
		7'd68: data <= 1'b1;
		7'd69: data <= 1'b1;
		7'd70: data <= 1'b1;
		7'd71: data <= 1'b1;
		7'd72: data <= 1'b1;
		7'd73: data <= 1'b1;
		7'd74: data <= 1'b1;
		7'd75: data <= 1'b1;
		7'd76: data <= 1'b1;
		7'd77: data <= 1'b1;
		7'd78: data <= 1'b1;
		7'd79: data <= 1'b1;
		7'd80: data <= 1'b1;
		7'd81: data <= 1'b1;
		7'd82: data <= 1'b1;
		7'd83: data <= 1'b1;
		7'd84: data <= 1'b1;
		7'd85: data <= 1'b1;
		7'd86: data <= 1'b1;
		7'd87: data <= 1'b1;
		7'd88: data <= 1'b1;
		7'd89: data <= 1'b1;
		7'd90: data <= 1'b1;
		7'd91: data <= 1'b1;
		7'd92: data <= 1'b1;
		7'd93: data <= 1'b1;
		7'd94: data <= 1'b1;
		7'd95: data <= 1'b1;
		7'd96: data <= 1'b1;
		7'd97: data <= 1'b1;
		7'd98: data <= 1'b1;
		7'd99: data <= 1'b1;
		7'd100: data <= 1'b1;
		7'd101: data <= 1'b1;
		7'd102: data <= 1'b1;
		7'd103: data <= 1'b1;
		7'd104: data <= 1'b1;
		7'd105: data <= 1'b1;
		7'd106: data <= 1'b1;
		7'd107: data <= 1'b1;
		7'd108: data <= 1'b1;
		7'd109: data <= 1'b1;
		7'd110: data <= 1'b1;
		7'd111: data <= 1'b1;
		7'd112: data <= 1'b1;
		7'd113: data <= 1'b1;
		7'd114: data <= 1'b1;
		7'd115: data <= 1'b1;
		7'd116: data <= 1'b1;
		7'd117: data <= 1'b1;
		7'd118: data <= 1'b1;
		7'd119: data <= 1'b1;
		7'd120: data <= 1'b1;
		7'd121: data <= 1'b1;
		7'd122: data <= 1'b1;
		7'd123: data <= 1'b1;
		7'd124: data <= 1'b1;
		7'd125: data <= 1'b1;
		7'd126: data <= 1'b1;
		7'd127: data <= 1'b1;
		endcase
		end
	end
	assign dout = data;
endmodule
