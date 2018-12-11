/*
    Copyright
    All right reserved.
    Module Name: BCEDN_TOP
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: Top.
*/
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
`include "../../src/testbench/headers/TOP.vh"
`include "../../src/testbench/headers/AD.vh"
`include "../../src/testbench/headers/EC_1.vh"
`include "../../src/testbench/headers/EC_2.vh"
`include "../../src/testbench/headers/EC_3.vh"
`include "../../src/testbench/headers/EC_4.vh"
`include "../../src/testbench/headers/DC_5.vh"
`include "../../src/testbench/headers/DC_6.vh"
`include "../../src/testbench/headers/DC_7.vh"
`include "../../src/testbench/headers/DC_8.vh"
`include "../../src/testbench/headers/DC_9.vh"
`include "../../src/testbench/headers/DC_10.vh"

module BCEDN_TOP(
    // inputs
    clk,
    rst,
    
    start,
    data_in,
    in_en,
    // outputs
    clkw,
    data_out,
    fifo_wfull,
    out_en,
    done
);
    parameter TOP_MEAN_ROM_NAME = `PARAM_TOP_MEAN_ROM_NAME;
    parameter TOP_MEAN_WIDTH = `PARAM_TOP_MEAN_WIDTH;
    parameter TOP_MEAN_FRAC_WIDTH = `PARAM_TOP_MEAN_FRAC_WIDTH;
    parameter TOP_MEAN_ROM_DEPTH = `PARAM_TOP_MEAN_ROM_DEPTH;
    parameter TOP_MEAN_ROM_INST_TYPE = `PARAM_TOP_MEAN_ROM_INST_TYPE;
    
    parameter AD_M = `PARAM_AD_M;
    parameter AD_P = `PARAM_AD_P;
    parameter AD_H = `PARAM_AD_H;
    parameter AD_W = `PARAM_AD_W;
    parameter AD_D = `PARAM_AD_D;
    parameter AD_FH = `PARAM_AD_FH;
    parameter AD_FW = `PARAM_AD_FW;
    parameter AD_FD = `PARAM_AD_FD;
    parameter AD_PAD = `PARAM_AD_PAD;
    parameter AD_STRIDE_H = `PARAM_AD_STRIDE_H;
    parameter AD_STRIDE_W = `PARAM_AD_STRIDE_W;
    parameter AD_POOL_H = `PARAM_AD_POOL_H;
    parameter AD_POOL_W = `PARAM_AD_POOL_W;
    parameter AD_N_PE = `PARAM_AD_N_PE;
    parameter AD_DATA_IN_FP_WIDTH = `PARAM_AD_DATA_IN_FP_WIDTH;
    parameter AD_DATA_IN_FP_FRAC_WIDTH = `PARAM_AD_DATA_IN_FP_FRAC_WIDTH;
    parameter AD_WEIGHT_WIDTH = `PARAM_AD_WEIGHT_WIDTH;
    parameter AD_WEIGHT_FRAC_WIDTH = `PARAM_AD_WEIGHT_FRAC_WIDTH;
    parameter AD_IN_WINDOW_H = `PARAM_AD_IN_WINDOW_H;
    parameter AD_IN_WINDOW_W = `PARAM_AD_IN_WINDOW_W;
    parameter AD_NORMREF_WIDTH = `PARAM_AD_NORMREF_WIDTH;
    parameter AD_IN_WIDTH = `PARAM_AD_IN_WIDTH;
    parameter AD_PINDEX_WIDTH = `PARAM_AD_PINDEX_WIDTH;
    parameter AD_ROM_INST_TYPE = `PARAM_AD_ROM_INST_TYPE;
    parameter AD_W_MEM_NAME = `PARAM_AD_W_MEM_NAME;
    parameter AD_REF_MEM_NAME = `PARAM_AD_REF_MEM_NAME;
    parameter AD_REF_SIGN_MEM_NAME = `PARAM_AD_REF_SIGN_MEM_NAME;
    parameter integer AD_ROM_INDEX [AD_N_PE-1:0] = `PARAM_AD_ROM_INDEX;
    
    parameter EC_1_M = `PARAM_EC_1_M;
    parameter EC_1_P = `PARAM_EC_1_P;
    parameter EC_1_H = `PARAM_EC_1_H;
    parameter EC_1_W = `PARAM_EC_1_W;
    parameter EC_1_D = `PARAM_EC_1_D; 
    parameter EC_1_FH = `PARAM_EC_1_FH;
    parameter EC_1_FW = `PARAM_EC_1_FW;
    parameter EC_1_FD = `PARAM_EC_1_FD;
    parameter EC_1_PAD = `PARAM_EC_1_PAD;
    parameter EC_1_STRIDE_H = `PARAM_EC_1_STRIDE_H;
    parameter EC_1_STRIDE_W = `PARAM_EC_1_STRIDE_W;
    parameter EC_1_POOL_H = `PARAM_EC_1_POOL_H;
    parameter EC_1_POOL_W = `PARAM_EC_1_POOL_W;
    parameter EC_1_N_PE = `PARAM_EC_1_N_PE;
    parameter EC_1_IN_WINDOW_H = `PARAM_EC_1_IN_WINDOW_H;
    parameter EC_1_IN_WINDOW_W = `PARAM_EC_1_IN_WINDOW_W;
    parameter EC_1_NORMREF_WIDTH = `PARAM_EC_1_NORMREF_WIDTH;
    parameter EC_1_INDEX_ADDR_WIDTH = `PARAM_EC_1_INDEX_ADDR_WIDTH;
    parameter EC_1_PINDEX_WIDTH = `PARAM_EC_1_PINDEX_WIDTH;
    parameter EC_1_ROM_INST_TYPE = `PARAM_EC_1_ROM_INST_TYPE;
    parameter EC_1_W_MEM_NAME = `PARAM_EC_1_W_MEM_NAME;
    parameter EC_1_MIN_ROM_UNIT_WIDTH = `PARAM_EC_1_MIN_ROM_UNIT_WIDTH;
    parameter EC_1_REF_MEM_NAME = `PARAM_EC_1_REF_MEM_NAME;
    parameter EC_1_REF_SIGN_MEM_NAME = `PARAM_EC_1_REF_SIGN_MEM_NAME;
    parameter integer EC_1_ROM_INDEX [EC_1_N_PE-1:0] = `PARAM_EC_1_ROM_INDEX;
    
    parameter EC_2_M = `PARAM_EC_2_M;
    parameter EC_2_P = `PARAM_EC_2_P;
    parameter EC_2_H = `PARAM_EC_2_H;
    parameter EC_2_W = `PARAM_EC_2_W;
    parameter EC_2_D = `PARAM_EC_2_D;
    parameter EC_2_FH = `PARAM_EC_2_FH;
    parameter EC_2_FW = `PARAM_EC_2_FW;
    parameter EC_2_FD = `PARAM_EC_2_FD;
    parameter EC_2_PAD = `PARAM_EC_2_PAD;
    parameter EC_2_STRIDE_H = `PARAM_EC_2_STRIDE_H;
    parameter EC_2_STRIDE_W = `PARAM_EC_2_STRIDE_W;
    parameter EC_2_POOL_H = `PARAM_EC_2_POOL_H;
    parameter EC_2_POOL_W = `PARAM_EC_2_POOL_W;
    parameter EC_2_N_PE = `PARAM_EC_2_N_PE;
    parameter EC_2_NORMREF_WIDTH = `PARAM_EC_2_NORMREF_WIDTH;
    parameter EC_2_INDEX_ADDR_WIDTH = `PARAM_EC_2_INDEX_ADDR_WIDTH;
    parameter EC_2_PINDEX_WIDTH = `PARAM_EC_2_PINDEX_WIDTH;
    parameter EC_2_ROM_INST_TYPE = `PARAM_EC_2_ROM_INST_TYPE;
    parameter EC_2_MIN_ROM_UNIT_WIDTH = `PARAM_EC_2_MIN_ROM_UNIT_WIDTH;
    parameter EC_2_W_MEM_NAME = `PARAM_EC_2_W_MEM_NAME;
    parameter EC_2_REF_MEM_NAME = `PARAM_EC_2_REF_MEM_NAME;
    parameter EC_2_REF_SIGN_MEM_NAME = `PARAM_EC_2_REF_SIGN_MEM_NAME;
    parameter integer EC_2_ROM_INDEX [EC_2_N_PE-1:0] = `PARAM_EC_2_ROM_INDEX;
    
    parameter EC_3_M = `PARAM_EC_3_M;
    parameter EC_3_P = `PARAM_EC_3_P;
    parameter EC_3_H = `PARAM_EC_3_H;
    parameter EC_3_W = `PARAM_EC_3_W;
    parameter EC_3_D = `PARAM_EC_3_D;
    parameter EC_3_FH = `PARAM_EC_3_FH;
    parameter EC_3_FW = `PARAM_EC_3_FW;
    parameter EC_3_FD = `PARAM_EC_3_FD;
    parameter EC_3_PAD = `PARAM_EC_3_PAD;
    parameter EC_3_STRIDE_H = `PARAM_EC_3_STRIDE_H;
    parameter EC_3_STRIDE_W = `PARAM_EC_3_STRIDE_W;
    parameter EC_3_POOL_H = `PARAM_EC_3_POOL_H;
    parameter EC_3_POOL_W = `PARAM_EC_3_POOL_W;
    parameter EC_3_N_PE = `PARAM_EC_3_N_PE;
    parameter EC_3_NORMREF_WIDTH = `PARAM_EC_3_NORMREF_WIDTH;
    parameter EC_3_INDEX_ADDR_WIDTH = `PARAM_EC_3_INDEX_ADDR_WIDTH;
    parameter EC_3_PINDEX_WIDTH = `PARAM_EC_3_PINDEX_WIDTH;
    parameter EC_3_ROM_INST_TYPE = `PARAM_EC_3_ROM_INST_TYPE;
    parameter EC_3_W_MEM_NAME = `PARAM_EC_3_W_MEM_NAME;
    parameter EC_3_MIN_ROM_UNIT_WIDTH = `PARAM_EC_3_MIN_ROM_UNIT_WIDTH;
    parameter EC_3_REF_MEM_NAME = `PARAM_EC_3_REF_MEM_NAME;
    parameter EC_3_REF_SIGN_MEM_NAME = `PARAM_EC_3_REF_SIGN_MEM_NAME;
    parameter integer EC_3_ROM_INDEX [EC_3_N_PE-1:0] = `PARAM_EC_3_ROM_INDEX;
    
    parameter EC_4_M = `PARAM_EC_4_M;
    parameter EC_4_P = `PARAM_EC_4_P;
    parameter EC_4_H = `PARAM_EC_4_H;
    parameter EC_4_W = `PARAM_EC_4_W;
    parameter EC_4_D = `PARAM_EC_4_D;
    parameter EC_4_FH = `PARAM_EC_4_FH;
    parameter EC_4_FW = `PARAM_EC_4_FW;
    parameter EC_4_FD = `PARAM_EC_4_FD;
    parameter EC_4_PAD = `PARAM_EC_4_PAD;
    parameter EC_4_STRIDE_H = `PARAM_EC_4_STRIDE_H;
    parameter EC_4_STRIDE_W = `PARAM_EC_4_STRIDE_W;
    parameter EC_4_POOL_H = `PARAM_EC_4_POOL_H;
    parameter EC_4_POOL_W = `PARAM_EC_4_POOL_W;
    parameter EC_4_N_PE = `PARAM_EC_4_N_PE;
    parameter EC_4_NORMREF_WIDTH = `PARAM_EC_4_NORMREF_WIDTH;
    parameter EC_4_INDEX_ADDR_WIDTH = `PARAM_EC_4_INDEX_ADDR_WIDTH;
    parameter EC_4_PINDEX_WIDTH = `PARAM_EC_4_PINDEX_WIDTH;
    parameter EC_4_ROM_INST_TYPE = `PARAM_EC_4_ROM_INST_TYPE;
    parameter EC_4_MIN_ROM_UNIT_WIDTH = `PARAM_EC_4_MIN_ROM_UNIT_WIDTH;
    parameter EC_4_W_MEM_NAME = `PARAM_EC_4_W_MEM_NAME;
    parameter EC_4_REF_MEM_NAME = `PARAM_EC_4_REF_MEM_NAME;
    parameter EC_4_REF_SIGN_MEM_NAME = `PARAM_EC_4_REF_SIGN_MEM_NAME;
    parameter integer EC_4_ROM_INDEX [EC_4_N_PE-1:0] = `PARAM_EC_4_ROM_INDEX;
    
    parameter DC_5_M = `PARAM_DC_5_M;
    parameter DC_5_P = `PARAM_DC_5_P;
    parameter DC_5_H = `PARAM_DC_5_H;
    parameter DC_5_W = `PARAM_DC_5_W;
    parameter DC_5_D = `PARAM_DC_5_D;
    parameter DC_5_FH = `PARAM_DC_5_FH;
    parameter DC_5_FW = `PARAM_DC_5_FW;
    parameter DC_5_FD = `PARAM_DC_5_FD;
    parameter DC_5_PAD = `PARAM_DC_5_PAD;
    parameter DC_5_STRIDE_H = `PARAM_DC_5_STRIDE_H;
    parameter DC_5_STRIDE_W = `PARAM_DC_5_STRIDE_W;
    parameter DC_5_POOL_H = `PARAM_DC_5_POOL_H;
    parameter DC_5_POOL_W = `PARAM_DC_5_POOL_W;
    parameter DC_5_N_PE = `PARAM_DC_5_N_PE;
    parameter DC_5_NORMREF_WIDTH = `PARAM_DC_5_NORMREF_WIDTH;
    parameter DC_5_INDEX_ADDR_WIDTH = `PARAM_DC_5_INDEX_ADDR_WIDTH;
    parameter DC_5_PINDEX_WIDTH = `PARAM_DC_5_PINDEX_WIDTH;
    parameter DC_5_DATA_OUT_WIDTH = `PARAM_DC_5_DATA_OUT_WIDTH;
    parameter DC_5_ROM_INST_TYPE = `PARAM_DC_5_ROM_INST_TYPE;
    parameter DC_5_MIN_ROM_UNIT_WIDTH = `PARAM_DC_5_MIN_ROM_UNIT_WIDTH;
    parameter DC_5_W_MEM_NAME = `PARAM_DC_5_W_MEM_NAME;
    parameter DC_5_REF_MEM_NAME = `PARAM_DC_5_REF_MEM_NAME;
    parameter DC_5_REF_SIGN_MEM_NAME = `PARAM_DC_5_REF_SIGN_MEM_NAME;
    parameter integer DC_5_ROM_INDEX [DC_5_N_PE-1:0] = `PARAM_DC_5_ROM_INDEX;
    
    parameter DC_6_M = `PARAM_DC_6_M;
    parameter DC_6_P = `PARAM_DC_6_P;
    parameter DC_6_H = `PARAM_DC_6_H;
    parameter DC_6_W = `PARAM_DC_6_W;
    parameter DC_6_D = `PARAM_DC_6_D;
    parameter DC_6_FH = `PARAM_DC_6_FH;
    parameter DC_6_FW = `PARAM_DC_6_FW;
    parameter DC_6_FD = `PARAM_DC_6_FD;
    parameter DC_6_PAD = `PARAM_DC_6_PAD;
    parameter DC_6_STRIDE_H = `PARAM_DC_6_STRIDE_H;
    parameter DC_6_STRIDE_W = `PARAM_DC_6_STRIDE_W;
    parameter DC_6_POOL_H = `PARAM_DC_6_POOL_H;
    parameter DC_6_POOL_W = `PARAM_DC_6_POOL_W;
    parameter DC_6_N_PE = `PARAM_DC_6_N_PE;
    parameter DC_6_NORMREF_WIDTH = `PARAM_DC_6_NORMREF_WIDTH;
    parameter DC_6_INDEX_ADDR_WIDTH = `PARAM_DC_6_INDEX_ADDR_WIDTH;
    parameter DC_6_PINDEX_WIDTH = `PARAM_DC_6_PINDEX_WIDTH;
    parameter DC_6_DATA_OUT_WIDTH = `PARAM_DC_6_DATA_OUT_WIDTH;
    parameter DC_6_ROM_INST_TYPE = `PARAM_DC_6_ROM_INST_TYPE;
    parameter DC_6_MIN_ROM_UNIT_WIDTH = `PARAM_DC_6_MIN_ROM_UNIT_WIDTH;
    parameter DC_6_W_MEM_NAME = `PARAM_DC_6_W_MEM_NAME;
    parameter DC_6_REF_MEM_NAME = `PARAM_DC_6_REF_MEM_NAME;
    parameter DC_6_REF_SIGN_MEM_NAME = `PARAM_DC_6_REF_SIGN_MEM_NAME;
    parameter integer DC_6_ROM_INDEX [DC_6_N_PE-1:0] = `PARAM_DC_6_ROM_INDEX;
    
    parameter DC_7_M = `PARAM_DC_7_M;
    parameter DC_7_P = `PARAM_DC_7_P;
    parameter DC_7_H = `PARAM_DC_7_H;
    parameter DC_7_W = `PARAM_DC_7_W;
    parameter DC_7_D = `PARAM_DC_7_D;
    parameter DC_7_FH = `PARAM_DC_7_FH;
    parameter DC_7_FW = `PARAM_DC_7_FW;
    parameter DC_7_FD = `PARAM_DC_7_FD;
    parameter DC_7_PAD = `PARAM_DC_7_PAD;
    parameter DC_7_STRIDE_H = `PARAM_DC_7_STRIDE_H;
    parameter DC_7_STRIDE_W = `PARAM_DC_7_STRIDE_W;
    parameter DC_7_POOL_H = `PARAM_DC_7_POOL_H;
    parameter DC_7_POOL_W = `PARAM_DC_7_POOL_W;
    parameter DC_7_N_PE = `PARAM_DC_7_N_PE;
    parameter DC_7_NORMREF_WIDTH = `PARAM_DC_7_NORMREF_WIDTH;
    parameter DC_7_INDEX_ADDR_WIDTH = `PARAM_DC_7_INDEX_ADDR_WIDTH;
    parameter DC_7_PINDEX_WIDTH = `PARAM_DC_7_PINDEX_WIDTH;
    parameter DC_7_DATA_OUT_WIDTH = `PARAM_DC_7_DATA_OUT_WIDTH;
    parameter DC_7_ROM_INST_TYPE = `PARAM_DC_7_ROM_INST_TYPE;
    parameter DC_7_MIN_ROM_UNIT_WIDTH = `PARAM_DC_7_MIN_ROM_UNIT_WIDTH;
    parameter DC_7_W_MEM_NAME = `PARAM_DC_7_W_MEM_NAME;
    parameter DC_7_REF_MEM_NAME = `PARAM_DC_7_REF_MEM_NAME;
    parameter DC_7_REF_SIGN_MEM_NAME = `PARAM_DC_7_REF_SIGN_MEM_NAME;
    parameter integer DC_7_ROM_INDEX [DC_7_N_PE-1:0] = `PARAM_DC_7_ROM_INDEX;
    
    parameter DC_8_M = `PARAM_DC_8_M;
    parameter DC_8_P = `PARAM_DC_8_P;
    parameter DC_8_H = `PARAM_DC_8_H;
    parameter DC_8_W = `PARAM_DC_8_W;
    parameter DC_8_D = `PARAM_DC_8_D;
    parameter DC_8_FH = `PARAM_DC_8_FH;
    parameter DC_8_FW = `PARAM_DC_8_FW;
    parameter DC_8_FD = `PARAM_DC_8_FD;
    parameter DC_8_PAD = `PARAM_DC_8_PAD;
    parameter DC_8_STRIDE_H = `PARAM_DC_8_STRIDE_H;
    parameter DC_8_STRIDE_W = `PARAM_DC_8_STRIDE_W;
    parameter DC_8_POOL_H = `PARAM_DC_8_POOL_H;
    parameter DC_8_POOL_W = `PARAM_DC_8_POOL_W;
    parameter DC_8_N_PE = `PARAM_DC_8_N_PE;
    parameter DC_8_NORMREF_WIDTH = `PARAM_DC_8_NORMREF_WIDTH;
    parameter DC_8_INDEX_ADDR_WIDTH = `PARAM_DC_8_INDEX_ADDR_WIDTH;
    parameter DC_8_PINDEX_WIDTH = `PARAM_DC_8_PINDEX_WIDTH;
    parameter DC_8_DATA_OUT_WIDTH = `PARAM_DC_8_DATA_OUT_WIDTH;
    parameter DC_8_ROM_INST_TYPE = `PARAM_DC_8_ROM_INST_TYPE;
    parameter DC_8_MIN_ROM_UNIT_WIDTH = `PARAM_DC_8_MIN_ROM_UNIT_WIDTH;
    parameter DC_8_W_MEM_NAME = `PARAM_DC_8_W_MEM_NAME;
    parameter DC_8_REF_MEM_NAME = `PARAM_DC_8_REF_MEM_NAME;
    parameter DC_8_REF_SIGN_MEM_NAME = `PARAM_DC_8_REF_SIGN_MEM_NAME;
    parameter integer DC_8_ROM_INDEX [DC_8_N_PE-1:0] = `PARAM_DC_8_ROM_INDEX;
    
    parameter DC_9_M = `PARAM_DC_9_M;
    parameter DC_9_P = `PARAM_DC_9_P;
    parameter DC_9_H = `PARAM_DC_9_H;
    parameter DC_9_W = `PARAM_DC_9_W;
    parameter DC_9_D = `PARAM_DC_9_D;
    parameter DC_9_FH = `PARAM_DC_9_FH;
    parameter DC_9_FW = `PARAM_DC_9_FW;
    parameter DC_9_FD = `PARAM_DC_9_FD;
    parameter DC_9_PAD = `PARAM_DC_9_PAD;
    parameter DC_9_STRIDE_H = `PARAM_DC_9_STRIDE_H;
    parameter DC_9_STRIDE_W = `PARAM_DC_9_STRIDE_W;
    parameter DC_9_POOL_H = `PARAM_DC_9_POOL_H;
    parameter DC_9_POOL_W = `PARAM_DC_9_POOL_W;
    parameter DC_9_N_PE = `PARAM_DC_9_N_PE;
    parameter DC_9_NORMREF_WIDTH = `PARAM_DC_9_NORMREF_WIDTH;
    parameter DC_9_INDEX_ADDR_WIDTH = `PARAM_DC_9_INDEX_ADDR_WIDTH;
    parameter DC_9_PINDEX_WIDTH = `PARAM_DC_9_PINDEX_WIDTH;
    parameter DC_9_DATA_OUT_WIDTH = `PARAM_DC_9_DATA_OUT_WIDTH;
    parameter DC_9_ROM_INST_TYPE = `PARAM_DC_9_ROM_INST_TYPE;
    parameter DC_9_W_MEM_NAME = `PARAM_DC_9_W_MEM_NAME;
    parameter DC_9_REF_MEM_NAME = `PARAM_DC_9_REF_MEM_NAME;
    parameter DC_9_REF_SIGN_MEM_NAME = `PARAM_DC_9_REF_SIGN_MEM_NAME;
    parameter integer DC_9_ROM_INDEX [DC_9_N_PE-1:0] = `PARAM_DC_9_ROM_INDEX;
    
    parameter DC_10_M = `PARAM_DC_10_M;
    parameter DC_10_P = `PARAM_DC_10_P;
    parameter DC_10_H = `PARAM_DC_10_H;
    parameter DC_10_W = `PARAM_DC_10_W;
    parameter DC_10_D = `PARAM_DC_10_D;
    parameter DC_10_FH = `PARAM_DC_10_FH;
    parameter DC_10_FW = `PARAM_DC_10_FW;
    parameter DC_10_FD = `PARAM_DC_10_FD;
    parameter DC_10_PAD = `PARAM_DC_10_PAD;
    parameter DC_10_STRIDE_H = `PARAM_DC_10_STRIDE_H;
    parameter DC_10_STRIDE_W = `PARAM_DC_10_STRIDE_W;
    parameter DC_10_POOL_H = `PARAM_DC_10_POOL_H;
    parameter DC_10_POOL_W = `PARAM_DC_10_POOL_W;
    parameter DC_10_N_PE = `PARAM_DC_10_N_PE;
    parameter DC_10_NORMREF_WIDTH = `PARAM_DC_10_NORMREF_WIDTH;
    parameter DC_10_DATA_OUT_WIDTH = `PARAM_DC_10_DATA_OUT_WIDTH;
    parameter DC_10_ROM_INST_TYPE = `PARAM_DC_10_ROM_INST_TYPE;
    parameter DC_10_NORMREF_SCALE_WIDTH = `PARAM_DC_10_NORMREF_SCALE_WIDTH;
    parameter DC_10_W_MEM_NAME = `PARAM_DC_10_W_MEM_NAME;
    parameter DC_10_REF_MEM_NAME = `PARAM_DC_10_REF_MEM_NAME;
    parameter DC_10_REF_SCALE_MEM_NAME = `PARAM_DC_10_REF_SCALE_MEM_NAME;
    parameter integer DC_10_ROM_INDEX [DC_10_N_PE-1:0] = `PARAM_DC_10_ROM_INDEX;
    
    // inputs
    input clk,  rst, start, in_en; // 'in_en' is the input enable signal for input FIFO.
    input [7:0] data_in; // input is 8-bit unsigned integer
    
    // outputs
    output [DC_10_DATA_OUT_WIDTH-1:0] data_out;
    output logic out_en, done, fifo_wfull,clkw;
    
    
    
    logic data_rdy;// indicates prepare the data from outside
    logic clk_p, clk_r, rst_dl;
    assign clkw=clk_p;
    assign clk_p=clk;
    wire tg_ad_ec1, tg_ec1_ec2, tg_ec2_ec3, tg_ec3_ec4, tg_ec4_dc5, tg_dc5_dc6, tg_dc6_dc7, tg_dc7_dc8, tg_dc8_dc9, tg_dc9_dc10;
    wire in_en_ad_ec1, in_en_ec1_ec2, in_en_ec2_ec3, in_en_ec3_ec4, in_en_ec4_dc5, in_en_dc5_dc6, in_en_dc6_dc7, in_en_dc7_dc8, in_en_dc8_dc9, in_en_dc9_dc10;
    wire [AD_FD-1:0] data_ad_ec1;
    wire [EC_1_FD-1:0] data_ec1_ec2;
    wire [EC_2_FD-1:0] data_ec2_ec3;
    wire [EC_3_FD-1:0] data_ec3_ec4;
    wire [EC_4_FD-1:0] data_ec4_dc5;
    wire [DC_5_FD-1:0] data_dc5_dc6;
    wire [DC_6_FD-1:0] data_dc6_dc7;
    wire [DC_7_FD-1:0] data_dc7_dc8;
    wire [DC_8_FD-1:0] data_dc8_dc9;
    wire [DC_9_FD-1:0] data_dc9_dc10;
    wire [2*DC_7_N_PE-1:0] pindex_ec1_dc7; 
    wire [2*DC_6_N_PE-1:0] pindex_ec2_dc6;
    wire [2*DC_5_N_PE-1:0] pindex_ec3_dc5;
    wire pindex_rd_ec1_dc7, pindex_rd_ec2_dc6, pindex_rd_ec3_dc5;
    wire [DC_7_INDEX_ADDR_WIDTH-1:0] pindex_rd_addr_ec1_dc7;
    wire [DC_6_INDEX_ADDR_WIDTH-1:0] pindex_rd_addr_ec2_dc6;
    wire [DC_5_INDEX_ADDR_WIDTH-1:0] pindex_rd_addr_ec3_dc5;
    
    logic [7:0] fifo_data_out;
    logic fifo_rempty;
    logic rst_block;
    
    wire [AD_DATA_IN_FP_WIDTH-1:0] data_in_to_ad, mean_rom_data_out;
    
    generate
        `ifdef MODE_SIM
        if (AD_DATA_IN_FP_WIDTH != TOP_MEAN_WIDTH) begin
            $error("AD_DATA_IN_FP_WIDTH = %d not compatible with TOP_MEAN_WIDTH = %d", AD_DATA_IN_FP_WIDTH, TOP_MEAN_WIDTH);
        end
        if (TOP_MEAN_WIDTH != 8+1+TOP_MEAN_FRAC_WIDTH) begin
            $error("TOP_MEAN_WIDTH = %d not compatible with TOP_MEAN_FRAC_WIDTH = %d + 8 + 1", TOP_MEAN_WIDTH, TOP_MEAN_FRAC_WIDTH);
        end
        if (TOP_MEAN_FRAC_WIDTH != AD_DATA_IN_FP_FRAC_WIDTH) begin
            $error("TOP_MEAN_FRAC_WIDTH = %d not compatible with AD_DATA_IN_FP_FRAC_WIDTH = %d", TOP_MEAN_FRAC_WIDTH, AD_DATA_IN_FP_FRAC_WIDTH);
        end
        `endif
    endgenerate
    
    assign data_in_to_ad = {{1'b0}, fifo_data_out, {TOP_MEAN_FRAC_WIDTH{1'b0}}}- $signed(mean_rom_data_out); // 'mean_rom_data_out' is in completement format.
    
    // data_rdy_dl
    logic data_rdy_dl;
    always@(posedge clk_p) begin
        data_rdy_dl <= data_rdy;
    end
    
    // input_count
    logic [$clog2(AD_H*AD_W)-1:0] input_count;
    always@(posedge clk_p) begin
        if (~rst_block)
            input_count <= 'b0;
        else if (data_rdy_dl) begin
            if (input_count < AD_H*AD_W-1)
                input_count <= input_count + 1;
            else
                input_count <= 'b0;
        end 
    end
    
    // rst_dl
    always@(negedge clk) begin
        rst_dl <= rst;
    end
    always@(negedge clk) begin
        rst_block <= rst;
    end
    // input FIFO
    fifo1 # (.DSIZE(8), .ASIZE(3)) input_fifo_inst (// input
                                                    .wdata(data_in), .winc(in_en), .wclk(clk_p), 
                                                    .wrst_n(rst_dl), .rinc(data_rdy), .rclk(clk_p), .rrst_n(rst_dl),
                                                    // output
                                                    .rdata(fifo_data_out), .wfull_almost(fifo_wfull), .rempty(fifo_rempty));
    
    // mean_rom
    W_ROM # (.MEM_NAME(TOP_MEAN_ROM_NAME), .MEM_INDEX(0), .DATA_WIDTH(TOP_MEAN_WIDTH), 
             .DATA_DEPTH(TOP_MEAN_ROM_DEPTH), .INST_TYPE(TOP_MEAN_ROM_INST_TYPE)) 
     mean_rom_inst (.clk(clk_p), .r_en(1'b1), .burn_in_en(1'b0), .rst_b(rst_block), .addr_in(input_count), .burned(), 
                  .data_out(mean_rom_data_out));
    
    // CLK_DIV
//    CLK_DIV clk_div_inst(.clk_in(clk), .rst(rst_dl), .clk_out(clk_p), .clk_cpy(clk_r), .rst_out(rst_block));
    
    // BCEDN_ADAPTER
    BCEDN_ADAPTER # (.H(AD_H), .W(AD_W), .D(AD_D), .FH(AD_FH), .FW(AD_FW), .FD(AD_FD), .PAD(AD_PAD),
                     .STRIDE_H(AD_STRIDE_H), .STRIDE_W(AD_STRIDE_W), .POOL_H(AD_POOL_H), .POOL_W(AD_POOL_W), 
                     .NORMREF_WIDTH(AD_NORMREF_WIDTH),.WEIGHT_WIDTH(AD_WEIGHT_WIDTH), .WEIGHT_FRAC_WIDTH(AD_WEIGHT_FRAC_WIDTH),
                     .DATA_IN_FP_WIDTH(AD_DATA_IN_FP_WIDTH), .DATA_IN_FP_FRAC_WIDTH(AD_DATA_IN_FP_FRAC_WIDTH),
                     .N_PE(AD_N_PE), .W_MEM_NAME(AD_W_MEM_NAME), .REF_MEM_NAME(AD_REF_MEM_NAME), .REF_SIGN_MEM_NAME(AD_REF_SIGN_MEM_NAME),
                     .INST_TYPE(AD_ROM_INST_TYPE), .ROM_INDEX(AD_ROM_INDEX), .M(AD_M), .P(AD_P))
     ad_inst (.clk(clk_p), .rst(rst_block), .in_en(1'b1), .start(start), .data_in(data_in_to_ad), 
              .tg_next(tg_ad_ec1), .data_out(data_ad_ec1), .out_en(in_en_ad_ec1), .data_rdy(data_rdy));
    
    // BCEDN_ENCODER-1
    BCEDN_ENCODER # (.H(EC_1_H), .W(EC_1_W), .D(EC_1_D), .FH(EC_1_FH), .FW(EC_1_FW), .FD(EC_1_FD), .PAD(EC_1_PAD),
                     .STRIDE_H(EC_1_STRIDE_H), .STRIDE_W(EC_1_STRIDE_W), .POOL_H(EC_1_POOL_H), .POOL_W(EC_1_POOL_W),
                     .NORMREF_WIDTH(EC_1_NORMREF_WIDTH),.N_PE(EC_1_N_PE), .W_MEM_NAME(EC_1_W_MEM_NAME), .MIN_UNIT_WIDTH(EC_1_MIN_ROM_UNIT_WIDTH),
                     .REF_MEM_NAME(EC_1_REF_MEM_NAME), .REF_SIGN_MEM_NAME(EC_1_REF_SIGN_MEM_NAME),
                     .INST_TYPE(EC_1_ROM_INST_TYPE), .ROM_INDEX(EC_1_ROM_INDEX), .M(EC_1_M), .P(EC_1_P))
     ec1_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_ad_ec1), .in_en(in_en_ad_ec1), .data_in(data_ad_ec1), .pindex_rd(pindex_rd_ec1_dc7), .pindex_rd_addr(pindex_rd_addr_ec1_dc7),
               .tg_next(tg_ec1_ec2), .pindex_out(pindex_ec1_dc7), .data_out(data_ec1_ec2), .out_en(in_en_ec1_ec2));

    //   EC_1_WRAPPER
    //   ec1_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_ad_ec1), .in_en(in_en_ad_ec1), .data_in(data_ad_ec1), .pindex_rd(pindex_rd_ec1_dc7), .pindex_rd_addr(pindex_rd_addr_ec1_dc7),
    //           .tg_next(tg_ec1_ec2), .pindex_out(pindex_ec1_dc7), .data_out(data_ec1_ec2), .out_en(in_en_ec1_ec2));
    
    // BCEDN_ENCODER-2
    BCEDN_ENCODER # (.H(EC_2_H), .W(EC_2_W), .D(EC_2_D), .FH(EC_2_FH), .FW(EC_2_FW), .FD(EC_2_FD), .PAD(EC_2_PAD),
                     .STRIDE_H(EC_2_STRIDE_H), .STRIDE_W(EC_2_STRIDE_W), .POOL_H(EC_2_POOL_H), .POOL_W(EC_2_POOL_W),
                     .NORMREF_WIDTH(EC_2_NORMREF_WIDTH),.N_PE(EC_2_N_PE), .W_MEM_NAME(EC_2_W_MEM_NAME), .MIN_UNIT_WIDTH(EC_2_MIN_ROM_UNIT_WIDTH),
                     .REF_MEM_NAME(EC_2_REF_MEM_NAME), .REF_SIGN_MEM_NAME(EC_2_REF_SIGN_MEM_NAME),
                     .INST_TYPE(EC_2_ROM_INST_TYPE), .ROM_INDEX(EC_2_ROM_INDEX), .M(EC_2_M), .P(EC_2_P))
     ec2_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_ec1_ec2), .in_en(in_en_ec1_ec2), .data_in(data_ec1_ec2), .pindex_rd(pindex_rd_ec2_dc6), .pindex_rd_addr(pindex_rd_addr_ec2_dc6),
               .tg_next(tg_ec2_ec3), .pindex_out(pindex_ec2_dc6), .data_out(data_ec2_ec3), .out_en(in_en_ec2_ec3));
    //    EC_2_WRAPPER
    //    ec2_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_ec1_ec2), .in_en(in_en_ec1_ec2), .data_in(data_ec1_ec2), .pindex_rd(pindex_rd_ec2_dc6), .pindex_rd_addr(pindex_rd_addr_ec2_dc6),
    //              .tg_next(tg_ec2_ec3), .pindex_out(pindex_ec2_dc6), .data_out(data_ec2_ec3), .out_en(in_en_ec2_ec3));
                   
    // BCEDN_ENCODER-3
    BCEDN_ENCODER # (.H(EC_3_H), .W(EC_3_W), .D(EC_3_D), .FH(EC_3_FH), .FW(EC_3_FW), .FD(EC_3_FD), .PAD(EC_3_PAD),
                     .STRIDE_H(EC_3_STRIDE_H), .STRIDE_W(EC_3_STRIDE_W), .POOL_H(EC_3_POOL_H), .POOL_W(EC_3_POOL_W),
                     .NORMREF_WIDTH(EC_3_NORMREF_WIDTH),.N_PE(EC_3_N_PE), .W_MEM_NAME(EC_3_W_MEM_NAME), .MIN_UNIT_WIDTH(EC_3_MIN_ROM_UNIT_WIDTH),
                     .REF_MEM_NAME(EC_3_REF_MEM_NAME), .REF_SIGN_MEM_NAME(EC_3_REF_SIGN_MEM_NAME),
                     .INST_TYPE(EC_3_ROM_INST_TYPE), .ROM_INDEX(EC_3_ROM_INDEX), .M(EC_3_M), .P(EC_3_P))
     ec3_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_ec2_ec3), .in_en(in_en_ec2_ec3), .data_in(data_ec2_ec3), .pindex_rd(pindex_rd_ec3_dc5), .pindex_rd_addr(pindex_rd_addr_ec3_dc5),
               .tg_next(tg_ec3_ec4), .pindex_out(pindex_ec3_dc5), .data_out(data_ec3_ec4), .out_en(in_en_ec3_ec4));
    //    EC_3_WRAPPER
    //    ec3_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_ec2_ec3), .in_en(in_en_ec2_ec3), .data_in(data_ec2_ec3), .pindex_rd(pindex_rd_ec3_dc5), .pindex_rd_addr(pindex_rd_addr_ec3_dc5),
    //           .tg_next(tg_ec3_ec4), .pindex_out(pindex_ec3_dc5), .data_out(data_ec3_ec4), .out_en(in_en_ec3_ec4));
   
    // BCEDN_ENDECODER-4
    BCEDN_ENDECODER # (.H(EC_4_H), .W(EC_4_W), .D(EC_4_D), .FH(EC_4_FH), .FW(EC_4_FW), .FD(EC_4_FD), .PAD(EC_4_PAD),
                     .STRIDE_H(EC_4_STRIDE_H), .STRIDE_W(EC_4_STRIDE_W), .POOL_H(EC_4_POOL_H), .POOL_W(EC_4_POOL_W),
                     .NORMREF_WIDTH(EC_4_NORMREF_WIDTH),.N_PE(EC_4_N_PE), .W_MEM_NAME(EC_4_W_MEM_NAME), .MIN_UNIT_WIDTH(EC_4_MIN_ROM_UNIT_WIDTH),
                     .REF_MEM_NAME(EC_4_REF_MEM_NAME), .REF_SIGN_MEM_NAME(EC_4_REF_SIGN_MEM_NAME),
                     .INST_TYPE(EC_4_ROM_INST_TYPE), .ROM_INDEX(EC_4_ROM_INDEX), .M(EC_4_M), .P(EC_4_P))
     ec4_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_ec3_ec4), .in_en(in_en_ec3_ec4), .data_in(data_ec3_ec4),
               .tg_next(tg_ec4_dc5), .data_out(data_ec4_dc5), .out_en(in_en_ec4_dc5));
    
    // BCEDN_DECODER-5
    BCEDN_DECODER # (.H(DC_5_H), .W(DC_5_W), .D(DC_5_D), .FH(DC_5_FH),.FW(DC_5_FW),.FD(DC_5_FD),
                     .POOL_H(DC_5_POOL_H),.POOL_W(DC_5_POOL_W),.PAD(DC_5_PAD), .MIN_UNIT_WIDTH(DC_5_MIN_ROM_UNIT_WIDTH),
                     .STRIDE_H(DC_5_STRIDE_H),.STRIDE_W(DC_5_STRIDE_W), .N_PE(DC_5_N_PE), 
                     .NORMREF_WIDTH(DC_5_NORMREF_WIDTH), .INST_TYPE(DC_5_ROM_INST_TYPE), .REF_SIGN_MEM_NAME(DC_5_REF_SIGN_MEM_NAME),
                     .W_MEM_NAME(DC_5_W_MEM_NAME), .REF_MEM_NAME(DC_5_REF_MEM_NAME), .ROM_INDEX(DC_5_ROM_INDEX), .M(DC_5_M), .P(DC_5_P))
     dc5_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_ec4_dc5), .in_en(in_en_ec4_dc5), .pindex_in(pindex_ec3_dc5), .data_in(data_ec4_dc5),
               .pindex_rd(pindex_rd_ec3_dc5), .pindex_rd_addr(pindex_rd_addr_ec3_dc5), .data_out(data_dc5_dc6), .tg_next(tg_dc5_dc6),.out_en(in_en_dc5_dc6));
               
    // BCEDN_DECODER-6
    BCEDN_DECODER # (.H(DC_6_H), .W(DC_6_W), .D(DC_6_D), .FH(DC_6_FH),.FW(DC_6_FW),.FD(DC_6_FD),
                     .POOL_H(DC_6_POOL_H),.POOL_W(DC_6_POOL_W),.PAD(DC_6_PAD),
                    .STRIDE_H(DC_6_STRIDE_H),.STRIDE_W(DC_6_STRIDE_W), .N_PE(DC_6_N_PE), .MIN_UNIT_WIDTH(DC_6_MIN_ROM_UNIT_WIDTH),
                     .NORMREF_WIDTH(DC_6_NORMREF_WIDTH), .INST_TYPE(DC_6_ROM_INST_TYPE), .REF_SIGN_MEM_NAME(DC_6_REF_SIGN_MEM_NAME),
                     .W_MEM_NAME(DC_6_W_MEM_NAME), .REF_MEM_NAME(DC_6_REF_MEM_NAME), .ROM_INDEX(DC_6_ROM_INDEX), .M(DC_6_M), .P(DC_6_P))
     //DC_6_WRAPPER
     dc6_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_dc5_dc6), .in_en(in_en_dc5_dc6), .pindex_in(pindex_ec2_dc6), .data_in(data_dc5_dc6),
               .pindex_rd(pindex_rd_ec2_dc6), .pindex_rd_addr(pindex_rd_addr_ec2_dc6), .data_out(data_dc6_dc7), .tg_next(tg_dc6_dc7),.out_en(in_en_dc6_dc7));
    
    // BCEDN_DECODER-7
    BCEDN_DECODER # (.H(DC_7_H), .W(DC_7_W), .D(DC_7_D), .FH(DC_7_FH),.FW(DC_7_FW),.FD(DC_7_FD),
                     .POOL_H(DC_7_POOL_H),.POOL_W(DC_7_POOL_W),.PAD(DC_7_PAD), .MIN_UNIT_WIDTH(DC_7_MIN_ROM_UNIT_WIDTH),
                     .STRIDE_H(DC_7_STRIDE_H),.STRIDE_W(DC_7_STRIDE_W), .N_PE(DC_7_N_PE), 
                     .NORMREF_WIDTH(DC_7_NORMREF_WIDTH), .INST_TYPE(DC_7_ROM_INST_TYPE), .REF_SIGN_MEM_NAME(DC_7_REF_SIGN_MEM_NAME),
                     .W_MEM_NAME(DC_7_W_MEM_NAME), .REF_MEM_NAME(DC_7_REF_MEM_NAME), .ROM_INDEX(DC_7_ROM_INDEX), .M(DC_7_M), .P(DC_7_P))
     dc7_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_dc6_dc7), .in_en(in_en_dc6_dc7), .pindex_in(pindex_ec1_dc7), .data_in(data_dc6_dc7),
               .pindex_rd(pindex_rd_ec1_dc7), .pindex_rd_addr(pindex_rd_addr_ec1_dc7), .data_out(data_dc7_dc8), .tg_next(tg_dc7_dc8),.out_en(in_en_dc7_dc8));
    
//     BCEDN_DECODER-8
    BCEDN_DECODER # (.H(DC_8_H), .W(DC_8_W), .D(DC_8_D), .FH(DC_8_FH),.FW(DC_8_FW),.FD(DC_8_FD),
                     .POOL_H(DC_8_POOL_H),.POOL_W(DC_8_POOL_W),.PAD(DC_8_PAD), .MIN_UNIT_WIDTH(DC_8_MIN_ROM_UNIT_WIDTH),
                     .STRIDE_H(DC_8_STRIDE_H),.STRIDE_W(DC_8_STRIDE_W), .N_PE(DC_8_N_PE), .TG_NEXT_W(2),
                     .NORMREF_WIDTH(DC_8_NORMREF_WIDTH), .INST_TYPE(DC_8_ROM_INST_TYPE), .REF_SIGN_MEM_NAME(DC_8_REF_SIGN_MEM_NAME),
                     .W_MEM_NAME(DC_8_W_MEM_NAME), .REF_MEM_NAME(DC_8_REF_MEM_NAME), .ROM_INDEX(DC_8_ROM_INDEX), .M(DC_8_M), .P(DC_8_P))
     dc8_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_dc7_dc8), .in_en(in_en_dc7_dc8), .pindex_in('b0), .data_in(data_dc7_dc8),
               .data_out(data_dc8_dc9), .tg_next(tg_dc8_dc9),.out_en(in_en_dc8_dc9));
//    DC_8_WRAPPER
//     dc8_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(tg_dc7_dc8), .in_en(in_en_dc7_dc8), .pindex_in(1'b0), .data_in(data_dc7_dc8),
//               .data_out(data_dc8_dc9), .tg_next(tg_dc8_dc9),.out_en(in_en_dc8_dc9));
    
    // BCEDN_DECODER-9
    BCEDN_DECODER # (.H(DC_9_H), .W(DC_9_W), .D(DC_9_D), .FH(DC_9_FH),.FW(DC_9_FW),.FD(DC_9_FD),
                     .POOL_H(DC_9_POOL_H),.POOL_W(DC_9_POOL_W),.PAD(DC_9_PAD), .IS_BUF_ROW(0),
                     .STRIDE_H(DC_9_STRIDE_H),.STRIDE_W(DC_9_STRIDE_W), .N_PE(DC_9_N_PE), .TG_NEXT_H(0), .TG_NEXT_W(1),
                     .NORMREF_WIDTH(DC_9_NORMREF_WIDTH), .INST_TYPE(DC_9_ROM_INST_TYPE), .REF_SIGN_MEM_NAME(DC_9_REF_SIGN_MEM_NAME),
                     .W_MEM_NAME(DC_9_W_MEM_NAME), .REF_MEM_NAME(DC_9_REF_MEM_NAME), .ROM_INDEX(DC_9_ROM_INDEX), .M(DC_9_M), .P(DC_9_P))
     dc9_inst (.clk(clk_p), .rst(rst_block), .start(tg_dc8_dc9), .in_en(in_en_dc8_dc9), .pindex_in('b0), .data_in(data_dc8_dc9),
               .data_out(data_dc9_dc10), .tg_next(tg_dc9_dc10),.out_en(in_en_dc9_dc10));
    
    // BCEDN_DECODER_OUT-10
    BCEDN_DECODER_OUT # (.H(DC_10_H), .W(DC_10_W), .D(DC_10_D), .FH(DC_10_FH),.FW(DC_10_FW),.FD(DC_10_FD), .IS_BUF_ROW(0),
                         .POOL_H(DC_10_POOL_H),.POOL_W(DC_10_POOL_W),.PAD(DC_10_PAD),  .N_V_PE(DC_9_N_PE), // use 'DC_9_N_PE' as 'N_V_PE' only in DC-10
                         .STRIDE_H(DC_10_STRIDE_H),.STRIDE_W(DC_10_STRIDE_W), .N_PE(DC_10_N_PE), .NORMREF_SCALE_WIDTH(DC_10_NORMREF_SCALE_WIDTH),
                         .NORMREF_WIDTH(DC_10_NORMREF_WIDTH), .INST_TYPE(DC_10_ROM_INST_TYPE), .REF_SCALE_MEM_NAME(DC_10_REF_SCALE_MEM_NAME),
                         .W_MEM_NAME(DC_10_W_MEM_NAME), .REF_MEM_NAME(DC_10_REF_MEM_NAME), .ROM_INDEX(DC_10_ROM_INDEX), .M(DC_10_M), .P(DC_10_P))
     dc10_inst (.clk(clk_p), .rst(rst_block), .start(tg_dc9_dc10), .in_en(in_en_dc9_dc10), .data_in(data_dc9_dc10), 
                .data_out(data_out), .done(done), .out_en(out_en));
    
endmodule
