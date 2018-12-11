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

module EC_TOP(
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
    
    // inputs
    input clk,  rst, start, in_en; // 'in_en' is the input enable signal for input FIFO.
    input [512-1:0] data_in; // input is 8-bit unsigned integer  
    // outputs
    output logic out_en, done, fifo_wfull,clkw;
    output logic [512-1:0] data_out;
    logic data_rdy;// indicates prepare the data from outside
    logic clk_p, clk_r, rst_dl;
    assign clkw=clk_p;
    assign clk_p=clk;
    wire tg_ad_ec1, tg_ec1_ec2, tg_ec2_ec3, tg_ec3_ec4, tg_ec4_dc5, tg_dc5_dc6, tg_dc6_dc7, tg_dc7_dc8, tg_dc8_dc9, tg_dc9_dc10;
    wire in_en_ad_ec1, in_en_ec1_ec2, in_en_ec2_ec3, in_en_ec3_ec4, in_en_ec4_dc5, in_en_dc5_dc6, in_en_dc6_dc7, in_en_dc7_dc8, in_en_dc8_dc9, in_en_dc9_dc10;
    wire [EC_4_FD-1:0] data_ec4_dc5;

    
    logic [512-1:0] fifo_data_out;
    logic fifo_rempty;
    logic rst_block;
        
    // data_rdy_dl
    logic data_rdy_dl;
    always@(posedge clk_p) begin
        data_rdy_dl <= data_rdy;
    end
    
    
    // rst_dl
    always@(negedge clk) begin
        rst_dl <= rst;
    end
    always@(negedge clk) begin
        rst_block <= rst;
    end
    // input FIFO
    fifo1 # (.DSIZE(512), .ASIZE(4)) input_fifo_inst (// input
                                                    .wdata(data_in), .winc(in_en), .wclk(clk_p), 
                                                    .wrst_n(rst_dl), .rinc(ec4_inst.fmap_in_shiftreg_en), .rclk(clk_p), .rrst_n(rst_dl),
                                                    // output
                                                    .rdata(fifo_data_out), .wfull_almost(fifo_wfull), .rempty(fifo_rempty));
    

    // BCEDN_ENDECODER-4
    BCEDN_ENDECODER # (.H(EC_4_H), .W(EC_4_W), .D(EC_4_D), .FH(EC_4_FH), .FW(EC_4_FW), .FD(EC_4_FD), .PAD(EC_4_PAD),
                     .STRIDE_H(EC_4_STRIDE_H), .STRIDE_W(EC_4_STRIDE_W), .POOL_H(EC_4_POOL_H), .POOL_W(EC_4_POOL_W),
                     .NORMREF_WIDTH(EC_4_NORMREF_WIDTH),.N_PE(EC_4_N_PE), .W_MEM_NAME(EC_4_W_MEM_NAME), .MIN_UNIT_WIDTH(EC_4_MIN_ROM_UNIT_WIDTH),
                     .REF_MEM_NAME(EC_4_REF_MEM_NAME), .REF_SIGN_MEM_NAME(EC_4_REF_SIGN_MEM_NAME),
                     .INST_TYPE(EC_4_ROM_INST_TYPE), .ROM_INDEX(EC_4_ROM_INDEX), .M(EC_4_M), .P(EC_4_P))
     ec4_inst (.clk(clk_p), .clk_r(clk_r), .rst(rst_block), .start(start), .in_en(), .data_in(fifo_data_out),
               .tg_next(done), .data_out(data_out), .out_en(out_en));
    

    
endmodule
