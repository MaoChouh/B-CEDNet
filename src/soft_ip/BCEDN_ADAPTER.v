`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: BCEDN_ADAPTOR
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: Full-precision adaptor module.
*/

module BCEDN_ADAPTER(
    // inputs
    clk,
    rst,
    in_en,
    start,
    data_in,
    // outputs
    tg_next,
    data_rdy,
    data_out,
    out_en
    );
    parameter H = 32;
    parameter W = 128;
    parameter D = 1;
    parameter FH = 3;
    parameter FW = 3;
    parameter FD = 128;
    parameter PAD = 1;
    parameter STRIDE_H = 1;
    parameter STRIDE_W = 1;
    parameter POOL_H = 1;
    parameter POOL_W = 1;
    parameter DATA_IN_FP_WIDTH = 17; // for input image
    parameter DATA_IN_FP_FRAC_WIDTH = 8; // for input image
    parameter WEIGHT_WIDTH = 17; // for weight
    parameter WEIGHT_FRAC_WIDTH = 8; // for weight
    parameter NORMREF_WIDTH = 15; // for ref
    parameter N_PE = 1;
    parameter W_MEM_NAME = "";
    parameter REF_MEM_NAME = "";
    parameter REF_SIGN_MEM_NAME = "";
    parameter INST_TYPE = "FULL_SOFT";
    parameter PRELOADFILE = "";
    //parameter string ROM_INDEX [0:N_PE-1] = {"0"};
    parameter integer ROM_INDEX [0:N_PE-1] = {0};
    parameter M = 1; // this parameter is used to cover ec_block-4 that has 512 cycle processing delay but
                     // maximum output_count of 1024. M = 1 is applied for ec_block-1 to ec_block-3 and M
                     // = 2 is used to ec_block-4
    parameter P = 1; // this parameter is used create time gap between row, 'P = 1' means 'row_count' will increase
                                          // once 'col_count' reach its maximum.
    
    localparam W_ROM_DATA_DEPTH = FD/N_PE;
    localparam W_ROM_ADDR_IN_WIDTH = $clog2(W_ROM_DATA_DEPTH);
    localparam PE_IN_WINDOW_H = (POOL_H-1)*STRIDE_H+FH; 
    localparam PE_IN_WINDOW_W = (POOL_W-1)*STRIDE_W+FW; 
    localparam PE_IN_DATA_WIDTH = PE_IN_WINDOW_H*PE_IN_WINDOW_W*D*DATA_IN_FP_WIDTH; 
    localparam PE_IN_WEIGHT_WIDTH = D*FH*FW*WEIGHT_WIDTH; // for weights
    localparam IN_WINDOW_H = (POOL_H-1)*STRIDE_H+FH;
    localparam IN_WINDOW_W = (POOL_W-1)*STRIDE_W+FW;
    
    // inputs
    input clk, rst, in_en, start;
    input [DATA_IN_FP_WIDTH-1:0] data_in;
    
    //outputs
    output logic out_en, tg_next, data_rdy;
    output logic [FD-1:0] data_out;
    
    // initiate PE_FP, W_ROM and FMAP_OUT_SHIFTREG
    genvar i;
    wire [PE_IN_WEIGHT_WIDTH*N_PE-1:0] weight;
    wire [NORMREF_WIDTH*N_PE-1:0] norm_ref;
    wire [N_PE-1:0] pe_data_out;
    wire [N_PE-1:0] norm_ref_sign;
    // initiate AD_CTRL
    wire fmap_in_shiftreg_en;
    wire fmap_out_shiftreg_en, w_rom_en, pe_en, pad_mux_sel;
    wire [W_ROM_ADDR_IN_WIDTH-1:0] w_rom_addr;
    wire [PE_IN_DATA_WIDTH-1:0] data_inreg2pe;
    generate
        for (i = 0; i < N_PE; i = i+1) begin
            PE_FP # (.D(D), .FH(FH), .FW(FW), .POOL_H(POOL_H), .POOL_W(POOL_W), .WEIGHT_WIDTH(WEIGHT_WIDTH), .WEIGHT_FRAC_WIDTH(WEIGHT_FRAC_WIDTH), 
                     .FMAP_WIDHT(DATA_IN_FP_WIDTH), .FMAP_FRAC_WIDHT(DATA_IN_FP_FRAC_WIDTH), .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W), .NORMREF_WIDTH(NORMREF_WIDTH))
             pe_fp_inst (.norm_ref(norm_ref[NORMREF_WIDTH*N_PE-1-NORMREF_WIDTH*i:NORMREF_WIDTH*N_PE-NORMREF_WIDTH-NORMREF_WIDTH*i]), 
                         .data_in(data_inreg2pe), 
                         .s(norm_ref_sign[N_PE-1-i:N_PE-1-i]),
                         .weight_in(weight[PE_IN_WEIGHT_WIDTH*N_PE-1-PE_IN_WEIGHT_WIDTH*i:PE_IN_WEIGHT_WIDTH*N_PE-PE_IN_WEIGHT_WIDTH-PE_IN_WEIGHT_WIDTH*i]), 
                         .data_out(pe_data_out[N_PE-1-i:N_PE-1-i]));
            
            W_ROM # (.MEM_NAME(W_MEM_NAME), .MEM_INDEX(ROM_INDEX[i]), .DATA_WIDTH(PE_IN_WEIGHT_WIDTH), .DATA_DEPTH(W_ROM_DATA_DEPTH), .INST_TYPE(INST_TYPE), .PRELOADFILE(PRELOADFILE))
              w_rom_inst (.clk(clk), .r_en(w_rom_en), .burn_in_en(1'b0), .rst_b(rst), .addr_in(w_rom_addr), .burned(), 
                          .data_out(weight[PE_IN_WEIGHT_WIDTH*N_PE-1-PE_IN_WEIGHT_WIDTH*i:PE_IN_WEIGHT_WIDTH*N_PE-PE_IN_WEIGHT_WIDTH-PE_IN_WEIGHT_WIDTH*i]));
             
            W_ROM # (.MEM_NAME(REF_MEM_NAME), .MEM_INDEX(ROM_INDEX[i]), .DATA_WIDTH(NORMREF_WIDTH), .DATA_DEPTH(W_ROM_DATA_DEPTH), .INST_TYPE(INST_TYPE), .PRELOADFILE(PRELOADFILE)) 
             normref_rom_inst (.clk(clk), .r_en(w_rom_en), .burn_in_en('b0), .rst_b(rst), .addr_in(w_rom_addr), .burned(), 
                          .data_out(norm_ref[NORMREF_WIDTH*N_PE-1-NORMREF_WIDTH*i:NORMREF_WIDTH*N_PE-NORMREF_WIDTH-NORMREF_WIDTH*i]));
            W_ROM # (.MEM_NAME(REF_SIGN_MEM_NAME), .MEM_INDEX(ROM_INDEX[i]), .DATA_WIDTH(1), .DATA_DEPTH(W_ROM_DATA_DEPTH), .INST_TYPE(INST_TYPE), .PRELOADFILE(PRELOADFILE)) 
             normref_sign_rom_inst (.clk(clk), .r_en(w_rom_en), .burn_in_en('b0), .rst_b(rst), .addr_in(w_rom_addr), .burned(), 
                          .data_out(norm_ref_sign[N_PE-1-i:N_PE-1-i])); 
            
            FMAP_OUT_SHIFTREG # (.FD(FD), .N_PE(N_PE)) 
             fmap_out_shiftreg_inst (.clk(clk), .rst(rst), .in_en(fmap_out_shiftreg_en), .data_in(pe_data_out[N_PE-1-i]), .data_out(data_out[FD-1-i*FD/N_PE: FD-FD/N_PE-i*FD/N_PE]));
        end
    endgenerate
    
    // initiate zero-padding mux
    logic [DATA_IN_FP_WIDTH-1:0] zero_pad_mux;
    assign zero_pad_mux = (pad_mux_sel)? 'b0:data_in;
    
    // initiate FMAP_IN_SHIFTREG
    FMAP_IN_SHIFTREG # (.H(H), .W(W), .D(DATA_IN_FP_WIDTH), .FH(FH), .FW(FW), .IN_WINDOW_H(IN_WINDOW_H), .IN_WINDOW_W(IN_WINDOW_W), .POOL_H(POOL_H), .POOL_W(POOL_W), .PAD(PAD), .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W))
        fmap_in_shiftreg_inst (.clk(clk), .rst(rst), .in_en(fmap_in_shiftreg_en), .data_in(zero_pad_mux), .out_en(), .data_out(data_inreg2pe));
    
    AD_CTRL # (.H(H), .W(W), .D(D), .FH(FH), .FW(FW), .FD(FD), .N_PE(N_PE), .PAD(PAD),
               .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W), 
               .POOL_H(POOL_H), .POOL_W(POOL_W), .W_ROM_DATA_DEPTH(W_ROM_DATA_DEPTH),
               .DATA_IN_FP_WIDTH(DATA_IN_FP_WIDTH), .DATA_IN_FP_INT_WIDTH(DATA_IN_FP_WIDTH-DATA_IN_FP_FRAC_WIDTH))
           ad_ctrl_inst (
                // inputs
                .clk(clk),
                .rst(rst),
                .start(start),
                .data_in_en(in_en),
                // outputs
                .fmap_in_shiftreg_en(fmap_in_shiftreg_en),
                .fmap_out_shiftreg_en(fmap_out_shiftreg_en),
                .w_rom_en(w_rom_en),
                .w_rom_addr(w_rom_addr),
                .pe_en(pe_en),
                .data_rdy(data_rdy),
                .pad_mux_sel(pad_mux_sel),
                .data_out_en(out_en),
                .tg_next(tg_next)
           );
endmodule 
