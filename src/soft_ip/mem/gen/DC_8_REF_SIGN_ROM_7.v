`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module DC_8_REF_SIGN_ROM_7(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 1;
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
		5'd0: data <= 1'b1;
		5'd1: data <= 1'b1;
		5'd2: data <= 1'b1;
		5'd3: data <= 1'b1;
		5'd4: data <= 1'b1;
		5'd5: data <= 1'b1;
		5'd6: data <= 1'b1;
		5'd7: data <= 1'b1;
		5'd8: data <= 1'b1;
		5'd9: data <= 1'b1;
		5'd10: data <= 1'b1;
		5'd11: data <= 1'b1;
		5'd12: data <= 1'b1;
		5'd13: data <= 1'b1;
		5'd14: data <= 1'b1;
		5'd15: data <= 1'b1;
		5'd16: data <= 1'b1;
		5'd17: data <= 1'b1;
		5'd18: data <= 1'b1;
		5'd19: data <= 1'b1;
		5'd20: data <= 1'b1;
		5'd21: data <= 1'b1;
		5'd22: data <= 1'b1;
		5'd23: data <= 1'b1;
		5'd24: data <= 1'b1;
		5'd25: data <= 1'b1;
		5'd26: data <= 1'b1;
		5'd27: data <= 1'b1;
		5'd28: data <= 1'b1;
		5'd29: data <= 1'b1;
		5'd30: data <= 1'b1;
		5'd31: data <= 1'b1;
		endcase
		end
	end
	assign dout = data;
endmodule
