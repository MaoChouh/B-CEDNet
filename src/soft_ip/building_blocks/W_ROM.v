`timescale 1ns / 1ps
`include "../../../src/soft_ip/include/includes.vh"
`include "../../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: W_ROM
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/

module W_ROM(
    // inputs
    clk,
    clk_r,
    addr_in,
    r_en,
    burn_in_en,
    rst_b,
    // outputs
    burned,
    data_out
    );
    
    parameter DATA_WIDTH = 4608;
    parameter DATA_DEPTH = 512;
    parameter INST_TYPE = "FULL_SOFT"; // FULL_SOFT, 512X64X16, 1024X32X32, 1152X32X32
    parameter PRELOADFILE = "";
    parameter MEM_NAME = "";
    parameter MIN_UNIT_WIDTH = 0;
    parameter DATA_DIV = 12;
    parameter integer MEM_INDEX = 0;
    
    localparam ADDR_WIDTH = $clog2(DATA_DEPTH);
    
    // inputs
    input clk, clk_r, r_en, burn_in_en;
    input [ADDR_WIDTH-1:0] addr_in;
    input rst_b;
    
    // outputs
    output burned;
    output [DATA_WIDTH-1:0] data_out;
    
    generate
        if (INST_TYPE == "FULL_SOFT" && MIN_UNIT_WIDTH == 0) begin
            W_ROM_SOFT # (.DATA_WIDTH(DATA_WIDTH), .DATA_DEPTH(DATA_DEPTH), .MEM_NAME(MEM_NAME), .MEM_INDEX(MEM_INDEX)) 
                w_rom_inst (.clk(clk), .addr_in(addr_in), .r_en(r_en), .burn_in_en(burn_in_en), .burned(burned), .data_out(data_out), .rst_b(rst_b));
        end
        else if (INST_TYPE == "FULL_SOFT" && MIN_UNIT_WIDTH != 0) begin
            ROM_SOFT_F # (.DATA_WIDTH(DATA_WIDTH), .DATA_DEPTH(DATA_DEPTH), .MEM_NAME(MEM_NAME), .MEM_INDEX(MEM_INDEX), .MIN_UNIT_WIDTH(MIN_UNIT_WIDTH),.DATA_DIV(DATA_DIV)) 
                w_rom_inst (.clk(clk), .clk_r(clk_r), .rst(rst_b), .addr_in(addr_in), .r_en(r_en), .data_out(data_out));
        end
        else if (INST_TYPE == "512X64X16") begin
            W_ROM_512X64X16 # (.DATA_WIDTH(DATA_WIDTH), .DATA_DEPTH(DATA_DEPTH), .PRELOADFILE(PRELOADFILE)) 
                w_rom_inst (.clk(clk), .addr_in(addr_in), .r_en(r_en), .burn_in_en(burn_in_en), .burned(burned), .data_out(data_out), .rst_b(rst_b));
        end
        else if (INST_TYPE == "1024X32X32") begin
            W_ROM_1024X32X32 # (.DATA_WIDTH(DATA_WIDTH), .DATA_DEPTH(DATA_DEPTH), .PRELOADFILE(PRELOADFILE)) 
                w_rom_inst (.clk(clk), .addr_in(addr_in), .r_en(r_en), .burn_in_en(burn_in_en), .burned(burned), .data_out(data_out), .rst_b(rst_b));
        end
        else if (INST_TYPE == "1152X32X32") begin
            W_ROM_1152X32X32 # (.DATA_WIDTH(DATA_WIDTH), .DATA_DEPTH(DATA_DEPTH), .PRELOADFILE(PRELOADFILE)) 
                        w_rom_inst (.clk(clk), .addr_in(addr_in), .r_en(r_en), .burn_in_en(burn_in_en), .burned(burned), .data_out(data_out), .rst_b(rst_b));
        end
        `ifdef MODE_SIM
        else begin
            $error("INST_TYPE: %s not supported.", INST_TYPE);
        end
        `endif
    endgenerate 
endmodule
