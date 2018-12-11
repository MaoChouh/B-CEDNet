`timescale 1ns / 1ps
/*
    Copyright
    All right reserved.
    Module Name: DEMUX-1b
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/
`include "../include/includes.vh"
`include "../include/util.vh"

module DEMUX_1b(
    // inputs
    data_in,
    sel,
    // outpus
    data_out
    );
    
    parameter N = 4;
    
    localparam SEL_WIDTH = $clog2(N);
    
    // inputs
    input data_in;
    input [SEL_WIDTH-1:0] sel;
    
    // outputs
    output reg [N-1:0] data_out;
    
    // demuxing
    wire [SEL_WIDTH-1:0] sel_inv;
    assign sel_inv = N-1-sel;
    always @* begin
        data_out = 0;
        data_out[sel_inv] = data_in;
    end
endmodule
