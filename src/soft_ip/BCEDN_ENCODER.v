/*
    Copyright
    All right reserved.
    Module Name: BCEDN_ENCODER
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: Binary convolutional encoder module.
*/

`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"

module BCEDN_ENCODER(
    // input
    clk,
    clk_r,
    rst,
    start,
    in_en,
    data_in,
    pindex_rd,
    pindex_rd_addr,
    // output
    tg_next,
    pindex_out,
    data_out,
    out_en
);
    parameter H = 32;
    parameter W = 128;
    parameter D = 512;
    parameter FH = 3;
    parameter FW = 3;
    parameter FD = 512;
    parameter POOL_H = 2;
    parameter POOL_W = 2;
    parameter PAD = 1;
    parameter STRIDE_H = 1;
    parameter STRIDE_W = 1;
    parameter N_PE = 1;
    parameter NORMREF_WIDTH = 15;
    parameter W_MEM_NAME = "";
    parameter REF_MEM_NAME = "";
    parameter REF_SIGN_MEM_NAME = "";
    parameter PRELOADFILE = "";
    parameter INST_TYPE = "FULL_SOFT";
    parameter MIN_UNIT_WIDTH = 0;
    //parameter string ROM_INDEX [0:N_PE-1] = {"0"};
    parameter integer ROM_INDEX [0:N_PE-1] = {0};
    parameter M = 1; // this parameter is used to cover ec_block-4 that has 512 cycle processing delay but
                     // maximum output_count of 1024. M = 1 is applied for ec_block-1 to ec_block-3 and M
                     // = 2 is used to ec_block-4
    parameter P = 1; // this parameter is used create time gap between row, 'P = 1' means 'row_count' will increase
                                          // once 'col_count' reach its maximum.
    
    localparam W_ROM_DATA_DEPTH = FD/N_PE;
    localparam IN_WINDOW_H = (POOL_H-1)*STRIDE_H+FH;
    localparam IN_WINDOW_W = (POOL_W-1)*STRIDE_W+FW;
    localparam PE_IN_FMAP_WIDTH = IN_WINDOW_H*IN_WINDOW_W*D;
    localparam PE_IN_WEIGHT_WIDTH = FH*FW*D;
    localparam ROM_ADDR_WIDTH = $clog2(W_ROM_DATA_DEPTH);
    localparam H_OUT = H/POOL_H;
    localparam W_OUT = W/POOL_W;
    localparam INDEX_SRAM_DEPTH = H_OUT*W_OUT*FD/N_PE;
    localparam INDEX_ADDR_WIDTH = $clog2(INDEX_SRAM_DEPTH);
    localparam PINDEX_WIDTH = ($clog2(POOL_H*POOL_W)*N_PE > 1)? $clog2(POOL_H*POOL_W)*N_PE:1;
    
    // input definition
    input clk, clk_r;
    input rst;
    input in_en;
    input start;
    input [D-1:0] data_in;
    input pindex_rd;
    input [INDEX_ADDR_WIDTH-1:0] pindex_rd_addr;
    
    // output definition
    output out_en, tg_next;
    output [PINDEX_WIDTH-1:0] pindex_out;
    output [FD-1:0] data_out;
    
    logic [D-1:0] data_in_mux;
    
    wire [PE_IN_FMAP_WIDTH-1:0] data_inreg2pe;
    wire [PE_IN_WEIGHT_WIDTH*N_PE-1:0] weight;
    wire [NORMREF_WIDTH*N_PE-1:0] norm_ref;
    wire [N_PE-1:0] norm_ref_sig;
    wire [N_PE-1:0] pe_data_out;
    wire [$clog2(POOL_H*POOL_W)*N_PE-1:0] pindex;
    wire fmap_in_shiftreg_en;
    wire [ROM_ADDR_WIDTH-1:0] w_rom_addr;
    wire fmap_out_shiftreg_en, w_rom_en, pe_en, pad_mux_sel, index_sram_en, index_sram_wr;
    wire [INDEX_ADDR_WIDTH-1:0] index_sram_addr;
    
    // initiate the shifter register for buffering the input feature maps
    FMAP_IN_SHIFTREG # (.H(H), .W(W), .D(D), .FH(FH), .FW(FW), .IN_WINDOW_H(IN_WINDOW_H), .IN_WINDOW_W(IN_WINDOW_W), .POOL_H(POOL_H), .POOL_W(POOL_W), .PAD(PAD), .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W))
        fmap_in_shiftreg_inst (.clk(clk), .rst(rst), .in_en(fmap_in_shiftreg_en), .data_in(data_in_mux), .out_en(), .data_out(data_inreg2pe));
        
    // initiate the PEs, the corresponding vROM and shifter registers
    genvar i;
    generate
        for (i = 0; i < N_PE; i = i+1) begin: PEs
            PE_EC # (.D(D), .FH(FH), .FW(FW), .POOL_H(POOL_H), .POOL_W(POOL_W), .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W), .NORMREF_WIDTH(NORMREF_WIDTH))
             pe_ec_inst (.norm_ref(norm_ref[NORMREF_WIDTH*N_PE-1-NORMREF_WIDTH*i:NORMREF_WIDTH*N_PE-NORMREF_WIDTH-NORMREF_WIDTH*i]), .data_in(data_inreg2pe), 
                         .weight_in(weight[PE_IN_WEIGHT_WIDTH*N_PE-1-PE_IN_WEIGHT_WIDTH*i:PE_IN_WEIGHT_WIDTH*N_PE-PE_IN_WEIGHT_WIDTH-PE_IN_WEIGHT_WIDTH*i]), 
                         .s(norm_ref_sig[N_PE-1-i:N_PE-1-i]),
                         .data_out(pe_data_out[N_PE-1-i:N_PE-1-i]), 
                         .pindex(pindex[$clog2(POOL_H*POOL_W)*N_PE-1-i*$clog2(POOL_H*POOL_W):$clog2(POOL_H*POOL_W)*N_PE-$clog2(POOL_H*POOL_W)-i*$clog2(POOL_H*POOL_W)]));
            W_ROM # (.MEM_NAME(W_MEM_NAME), .MEM_INDEX(ROM_INDEX[i]), .DATA_WIDTH(PE_IN_WEIGHT_WIDTH), .DATA_DEPTH(W_ROM_DATA_DEPTH), .INST_TYPE(INST_TYPE), .PRELOADFILE(PRELOADFILE), .MIN_UNIT_WIDTH(MIN_UNIT_WIDTH))
             w_rom_inst (.clk(clk), .clk_r(clk_r), .r_en(w_rom_en), .burn_in_en(0), .rst_b(rst), .addr_in(w_rom_addr), .burned(), 
                         .data_out(weight[PE_IN_WEIGHT_WIDTH*N_PE-1-PE_IN_WEIGHT_WIDTH*i:PE_IN_WEIGHT_WIDTH*N_PE-PE_IN_WEIGHT_WIDTH-PE_IN_WEIGHT_WIDTH*i]));
            
            W_ROM # (.MEM_NAME(REF_MEM_NAME), .MEM_INDEX(ROM_INDEX[i]), .DATA_WIDTH(NORMREF_WIDTH), .DATA_DEPTH(W_ROM_DATA_DEPTH), .INST_TYPE(INST_TYPE), .PRELOADFILE(PRELOADFILE)) 
             normref_rom_inst (.clk(clk), .r_en(w_rom_en), .burn_in_en('b0), .rst_b(rst), .addr_in(w_rom_addr), .burned(), 
                         .data_out(norm_ref[NORMREF_WIDTH*N_PE-1-NORMREF_WIDTH*i:NORMREF_WIDTH*N_PE-NORMREF_WIDTH-NORMREF_WIDTH*i]));        
            
            W_ROM # (.MEM_NAME(REF_SIGN_MEM_NAME), .MEM_INDEX(ROM_INDEX[i]), .DATA_WIDTH(1), .DATA_DEPTH(W_ROM_DATA_DEPTH), .INST_TYPE(INST_TYPE), .PRELOADFILE(PRELOADFILE)) 
             normref_sign_rom_inst (.clk(clk), .r_en(w_rom_en), .burn_in_en('b0), .rst_b(rst), .addr_in(w_rom_addr), .burned(), 
                         .data_out(norm_ref_sig[N_PE-1-i:N_PE-1-i]));
            
            FMAP_OUT_SHIFTREG # (.FD(FD), .N_PE(N_PE)) 
             fmap_out_shiftreg_inst (.clk(clk), .rst(rst),.in_en(fmap_out_shiftreg_en), .data_in(pe_data_out[N_PE-1-i]), .data_out(data_out[FD-1-i*FD/N_PE: FD-FD/N_PE-i*FD/N_PE]));
        end
    endgenerate
    
    // initiate INDEX_SRAM
    INDEX_SRAM # (.WR_DATA_WIDTH($clog2(POOL_H*POOL_W)*N_PE), .RD_DATA_WIDTH($clog2(POOL_H*POOL_W)*N_PE), .WR_DATA_DEPTH(INDEX_SRAM_DEPTH), .RD_DATA_DEPTH(INDEX_SRAM_DEPTH))
     index_sram_inst (.clk(clk), .en(index_sram_en), .wr_addr(index_sram_addr), .wr(index_sram_wr), .rd(pindex_rd), .rd_addr(pindex_rd_addr), .data_in(pindex), .data_out(pindex_out));
    
    // initiate the EC_CTRL
    EC_CTRL # (.H(H), .W(W), .D(D), .FH(FH), .FW(FW), .FD(FD), .N_PE(N_PE), .PAD(PAD),
               .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W), 
               .POOL_H(POOL_H), .POOL_W(POOL_W), 
               .W_ROM_DATA_DEPTH(W_ROM_DATA_DEPTH), .M(M), .P(P))
           ec_ctrl_inst (
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
                .index_sram_en(index_sram_en),
                .index_sram_wr(index_sram_wr),
                .index_sram_addr(index_sram_addr),
                .pad_mux_sel(pad_mux_sel),
                .data_out_en(out_en),
                .tg_next(tg_next)
           );
    // zero mux
    always@(data_in or pad_mux_sel or fmap_in_shiftreg_en) begin
        if (pad_mux_sel) begin
            data_in_mux <= {D{1'b0}};
        end
        else begin
            data_in_mux <= data_in;
        end
    end
    
endmodule

