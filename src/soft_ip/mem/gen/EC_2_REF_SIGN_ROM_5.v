`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module EC_2_REF_SIGN_ROM_5(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 1;
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
		6'd0: data <= 1'b1;
		6'd1: data <= 1'b1;
		6'd2: data <= 1'b1;
		6'd3: data <= 1'b1;
		6'd4: data <= 1'b1;
		6'd5: data <= 1'b0;
		6'd6: data <= 1'b1;
		6'd7: data <= 1'b0;
		6'd8: data <= 1'b1;
		6'd9: data <= 1'b1;
		6'd10: data <= 1'b1;
		6'd11: data <= 1'b0;
		6'd12: data <= 1'b1;
		6'd13: data <= 1'b1;
		6'd14: data <= 1'b1;
		6'd15: data <= 1'b1;
		6'd16: data <= 1'b1;
		6'd17: data <= 1'b1;
		6'd18: data <= 1'b1;
		6'd19: data <= 1'b1;
		6'd20: data <= 1'b1;
		6'd21: data <= 1'b1;
		6'd22: data <= 1'b1;
		6'd23: data <= 1'b1;
		6'd24: data <= 1'b1;
		6'd25: data <= 1'b1;
		6'd26: data <= 1'b1;
		6'd27: data <= 1'b1;
		6'd28: data <= 1'b1;
		6'd29: data <= 1'b1;
		6'd30: data <= 1'b1;
		6'd31: data <= 1'b1;
		6'd32: data <= 1'b1;
		6'd33: data <= 1'b1;
		6'd34: data <= 1'b1;
		6'd35: data <= 1'b1;
		6'd36: data <= 1'b1;
		6'd37: data <= 1'b1;
		6'd38: data <= 1'b1;
		6'd39: data <= 1'b1;
		6'd40: data <= 1'b1;
		6'd41: data <= 1'b1;
		6'd42: data <= 1'b1;
		6'd43: data <= 1'b1;
		6'd44: data <= 1'b1;
		6'd45: data <= 1'b1;
		6'd46: data <= 1'b1;
		6'd47: data <= 1'b1;
		6'd48: data <= 1'b1;
		6'd49: data <= 1'b1;
		6'd50: data <= 1'b0;
		6'd51: data <= 1'b1;
		6'd52: data <= 1'b1;
		6'd53: data <= 1'b1;
		6'd54: data <= 1'b1;
		6'd55: data <= 1'b1;
		6'd56: data <= 1'b1;
		6'd57: data <= 1'b1;
		6'd58: data <= 1'b1;
		6'd59: data <= 1'b1;
		6'd60: data <= 1'b1;
		6'd61: data <= 1'b1;
		6'd62: data <= 1'b1;
		6'd63: data <= 1'b1;
		endcase
		end
	end
	assign dout = data;
endmodule
