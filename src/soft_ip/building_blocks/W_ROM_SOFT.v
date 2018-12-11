`timescale 1ns / 1ps
`include "../../../src/soft_ip/include/includes.vh"
`include "../../../src/soft_ip/include/util.vh"
`include "../../../src/soft_ip/building_blocks/headers/gen/W_ROM_SOFT.vh"
/*
    Copyright
    All right reserved.
    Module Name: W_ROM_SOFT
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module W_ROM_SOFT(
    // inputs
    clk,
    addr_in,
    r_en,
    rst_b,
    burn_in_en,
    // outputs
    burned,
    data_out
    );
    
    parameter DATA_WIDTH = 4806;
    parameter DATA_DEPTH = 512; 
    parameter MEM_NAME = "";
    parameter integer MEM_INDEX = 0;
    
    localparam ADDR_IN_WIDTH = $clog2(DATA_DEPTH);
    
    // inputs
    input clk, r_en, burn_in_en;
    input [ADDR_IN_WIDTH-1:0] addr_in;
    input rst_b;

    // outputs
    output burned;
    output [DATA_WIDTH-1:0] data_out;
    
    `GEN_ROM_SOFT
    
endmodule
