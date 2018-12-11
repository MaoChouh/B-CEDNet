`timescale 1ns / 1ps
/*
Copyright
All right reserved.
Module Name: rom_syn
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM: ROM_DEP x ROM_WID
*/
module AD_REF_SIGN_ROM_15(
// inputs
clk,
en,
addr,
// outputs
dout
);
localparam ROM_WID = 1;
localparam ROM_DEP = 4;
localparam ROM_ADDR = 2;
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
		2'd0: data <= 1'b1;
		2'd1: data <= 1'b1;
		2'd2: data <= 1'b1;
		2'd3: data <= 1'b1;
		endcase
		end
	end
	assign dout = data;
endmodule
