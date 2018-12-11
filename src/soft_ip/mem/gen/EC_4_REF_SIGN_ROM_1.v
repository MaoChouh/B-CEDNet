`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module EC_4_REF_SIGN_ROM_1(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 1;
localparam ROM_DEP = 256;
localparam ROM_ADDR = 8;
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
		8'd0: data <= 1'b1;
		8'd1: data <= 1'b1;
		8'd2: data <= 1'b1;
		8'd3: data <= 1'b1;
		8'd4: data <= 1'b1;
		8'd5: data <= 1'b1;
		8'd6: data <= 1'b1;
		8'd7: data <= 1'b1;
		8'd8: data <= 1'b1;
		8'd9: data <= 1'b1;
		8'd10: data <= 1'b1;
		8'd11: data <= 1'b1;
		8'd12: data <= 1'b1;
		8'd13: data <= 1'b1;
		8'd14: data <= 1'b1;
		8'd15: data <= 1'b1;
		8'd16: data <= 1'b1;
		8'd17: data <= 1'b1;
		8'd18: data <= 1'b1;
		8'd19: data <= 1'b1;
		8'd20: data <= 1'b1;
		8'd21: data <= 1'b1;
		8'd22: data <= 1'b1;
		8'd23: data <= 1'b1;
		8'd24: data <= 1'b1;
		8'd25: data <= 1'b1;
		8'd26: data <= 1'b1;
		8'd27: data <= 1'b1;
		8'd28: data <= 1'b1;
		8'd29: data <= 1'b1;
		8'd30: data <= 1'b1;
		8'd31: data <= 1'b1;
		8'd32: data <= 1'b1;
		8'd33: data <= 1'b1;
		8'd34: data <= 1'b1;
		8'd35: data <= 1'b1;
		8'd36: data <= 1'b1;
		8'd37: data <= 1'b1;
		8'd38: data <= 1'b1;
		8'd39: data <= 1'b1;
		8'd40: data <= 1'b1;
		8'd41: data <= 1'b1;
		8'd42: data <= 1'b1;
		8'd43: data <= 1'b1;
		8'd44: data <= 1'b1;
		8'd45: data <= 1'b1;
		8'd46: data <= 1'b1;
		8'd47: data <= 1'b1;
		8'd48: data <= 1'b1;
		8'd49: data <= 1'b1;
		8'd50: data <= 1'b1;
		8'd51: data <= 1'b1;
		8'd52: data <= 1'b1;
		8'd53: data <= 1'b1;
		8'd54: data <= 1'b1;
		8'd55: data <= 1'b1;
		8'd56: data <= 1'b1;
		8'd57: data <= 1'b1;
		8'd58: data <= 1'b1;
		8'd59: data <= 1'b1;
		8'd60: data <= 1'b1;
		8'd61: data <= 1'b1;
		8'd62: data <= 1'b1;
		8'd63: data <= 1'b1;
		8'd64: data <= 1'b1;
		8'd65: data <= 1'b1;
		8'd66: data <= 1'b1;
		8'd67: data <= 1'b1;
		8'd68: data <= 1'b1;
		8'd69: data <= 1'b1;
		8'd70: data <= 1'b1;
		8'd71: data <= 1'b1;
		8'd72: data <= 1'b1;
		8'd73: data <= 1'b1;
		8'd74: data <= 1'b1;
		8'd75: data <= 1'b1;
		8'd76: data <= 1'b1;
		8'd77: data <= 1'b1;
		8'd78: data <= 1'b1;
		8'd79: data <= 1'b1;
		8'd80: data <= 1'b1;
		8'd81: data <= 1'b1;
		8'd82: data <= 1'b1;
		8'd83: data <= 1'b1;
		8'd84: data <= 1'b1;
		8'd85: data <= 1'b1;
		8'd86: data <= 1'b1;
		8'd87: data <= 1'b1;
		8'd88: data <= 1'b1;
		8'd89: data <= 1'b1;
		8'd90: data <= 1'b1;
		8'd91: data <= 1'b1;
		8'd92: data <= 1'b1;
		8'd93: data <= 1'b1;
		8'd94: data <= 1'b1;
		8'd95: data <= 1'b1;
		8'd96: data <= 1'b1;
		8'd97: data <= 1'b1;
		8'd98: data <= 1'b1;
		8'd99: data <= 1'b1;
		8'd100: data <= 1'b1;
		8'd101: data <= 1'b1;
		8'd102: data <= 1'b1;
		8'd103: data <= 1'b1;
		8'd104: data <= 1'b1;
		8'd105: data <= 1'b1;
		8'd106: data <= 1'b1;
		8'd107: data <= 1'b1;
		8'd108: data <= 1'b1;
		8'd109: data <= 1'b1;
		8'd110: data <= 1'b1;
		8'd111: data <= 1'b1;
		8'd112: data <= 1'b1;
		8'd113: data <= 1'b1;
		8'd114: data <= 1'b1;
		8'd115: data <= 1'b1;
		8'd116: data <= 1'b1;
		8'd117: data <= 1'b1;
		8'd118: data <= 1'b1;
		8'd119: data <= 1'b1;
		8'd120: data <= 1'b1;
		8'd121: data <= 1'b1;
		8'd122: data <= 1'b1;
		8'd123: data <= 1'b1;
		8'd124: data <= 1'b1;
		8'd125: data <= 1'b1;
		8'd126: data <= 1'b1;
		8'd127: data <= 1'b1;
		8'd128: data <= 1'b1;
		8'd129: data <= 1'b1;
		8'd130: data <= 1'b1;
		8'd131: data <= 1'b1;
		8'd132: data <= 1'b1;
		8'd133: data <= 1'b1;
		8'd134: data <= 1'b1;
		8'd135: data <= 1'b1;
		8'd136: data <= 1'b1;
		8'd137: data <= 1'b1;
		8'd138: data <= 1'b1;
		8'd139: data <= 1'b1;
		8'd140: data <= 1'b1;
		8'd141: data <= 1'b1;
		8'd142: data <= 1'b1;
		8'd143: data <= 1'b1;
		8'd144: data <= 1'b1;
		8'd145: data <= 1'b1;
		8'd146: data <= 1'b1;
		8'd147: data <= 1'b1;
		8'd148: data <= 1'b1;
		8'd149: data <= 1'b1;
		8'd150: data <= 1'b1;
		8'd151: data <= 1'b1;
		8'd152: data <= 1'b1;
		8'd153: data <= 1'b1;
		8'd154: data <= 1'b1;
		8'd155: data <= 1'b1;
		8'd156: data <= 1'b1;
		8'd157: data <= 1'b1;
		8'd158: data <= 1'b1;
		8'd159: data <= 1'b1;
		8'd160: data <= 1'b1;
		8'd161: data <= 1'b1;
		8'd162: data <= 1'b1;
		8'd163: data <= 1'b1;
		8'd164: data <= 1'b1;
		8'd165: data <= 1'b1;
		8'd166: data <= 1'b1;
		8'd167: data <= 1'b1;
		8'd168: data <= 1'b1;
		8'd169: data <= 1'b1;
		8'd170: data <= 1'b1;
		8'd171: data <= 1'b1;
		8'd172: data <= 1'b1;
		8'd173: data <= 1'b1;
		8'd174: data <= 1'b1;
		8'd175: data <= 1'b1;
		8'd176: data <= 1'b1;
		8'd177: data <= 1'b1;
		8'd178: data <= 1'b1;
		8'd179: data <= 1'b1;
		8'd180: data <= 1'b1;
		8'd181: data <= 1'b1;
		8'd182: data <= 1'b1;
		8'd183: data <= 1'b1;
		8'd184: data <= 1'b1;
		8'd185: data <= 1'b1;
		8'd186: data <= 1'b1;
		8'd187: data <= 1'b1;
		8'd188: data <= 1'b1;
		8'd189: data <= 1'b1;
		8'd190: data <= 1'b1;
		8'd191: data <= 1'b1;
		8'd192: data <= 1'b1;
		8'd193: data <= 1'b1;
		8'd194: data <= 1'b1;
		8'd195: data <= 1'b1;
		8'd196: data <= 1'b1;
		8'd197: data <= 1'b1;
		8'd198: data <= 1'b1;
		8'd199: data <= 1'b1;
		8'd200: data <= 1'b1;
		8'd201: data <= 1'b1;
		8'd202: data <= 1'b1;
		8'd203: data <= 1'b1;
		8'd204: data <= 1'b1;
		8'd205: data <= 1'b1;
		8'd206: data <= 1'b1;
		8'd207: data <= 1'b1;
		8'd208: data <= 1'b1;
		8'd209: data <= 1'b1;
		8'd210: data <= 1'b1;
		8'd211: data <= 1'b1;
		8'd212: data <= 1'b1;
		8'd213: data <= 1'b1;
		8'd214: data <= 1'b1;
		8'd215: data <= 1'b1;
		8'd216: data <= 1'b1;
		8'd217: data <= 1'b1;
		8'd218: data <= 1'b1;
		8'd219: data <= 1'b1;
		8'd220: data <= 1'b1;
		8'd221: data <= 1'b1;
		8'd222: data <= 1'b1;
		8'd223: data <= 1'b1;
		8'd224: data <= 1'b1;
		8'd225: data <= 1'b1;
		8'd226: data <= 1'b1;
		8'd227: data <= 1'b1;
		8'd228: data <= 1'b1;
		8'd229: data <= 1'b1;
		8'd230: data <= 1'b1;
		8'd231: data <= 1'b1;
		8'd232: data <= 1'b1;
		8'd233: data <= 1'b1;
		8'd234: data <= 1'b1;
		8'd235: data <= 1'b1;
		8'd236: data <= 1'b1;
		8'd237: data <= 1'b1;
		8'd238: data <= 1'b1;
		8'd239: data <= 1'b1;
		8'd240: data <= 1'b1;
		8'd241: data <= 1'b1;
		8'd242: data <= 1'b1;
		8'd243: data <= 1'b1;
		8'd244: data <= 1'b1;
		8'd245: data <= 1'b1;
		8'd246: data <= 1'b1;
		8'd247: data <= 1'b1;
		8'd248: data <= 1'b1;
		8'd249: data <= 1'b1;
		8'd250: data <= 1'b1;
		8'd251: data <= 1'b1;
		8'd252: data <= 1'b1;
		8'd253: data <= 1'b1;
		8'd254: data <= 1'b1;
		8'd255: data <= 1'b1;
		endcase
		end
	end
	assign dout = data;
endmodule
