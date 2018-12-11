`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: BCEDN_DECODER_OUT
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: Binary convolutional decoder module.
*/


module BCEDN_DECODER_OUT(
    // input
    clk,
    rst,
    start,
    in_en,
    data_in,
    // output 
    data_out,
    done,
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
    parameter NORMREF_SCALE_WIDTH = 15;
    parameter W_MEM_NAME = "";
    parameter REF_MEM_NAME = "";
    parameter REF_SCALE_MEM_NAME = "";
    parameter PRELOADFILE = "";
    parameter INST_TYPE = "FULL_SOFT";
    //parameter string ROM_INDEX [0:N_PE-1] = {"0"};
    parameter integer ROM_INDEX [0:N_PE-1] = {0};
    parameter M = 1; // this parameter is used to cover ec_block-4 that has 512 cycle processing delay but
                     // maximum output_count of 1024. M = 1 is applied for ec_block-1 to ec_block-3 and M
                     // = 2 is used to ec_block-4
    parameter P = 1; // this parameter is used create time gap between row, 'P = 1' means 'row_count' will increase
                                          // once 'col_count' reach its maximum.
    parameter DATA_OUT_WIDTH = 0;
    parameter N_V_PE = 1; // this param is used to treat the DC_CTRL to used short processing period
    parameter IS_BUF_ROW = 1; // this parameter is used to config if there is row buffer in the 'fmap_in_shiftreg'.
                              // only DC-9 and DC-10 should set this value to 0 to disable the row buffer.
    
    localparam W_ROM_DATA_DEPTH = FD/N_PE;
    localparam IN_WINDOW_H = FH;
    localparam IN_WINDOW_W = FW;
    localparam PE_IN_FMAP_WIDTH = IN_WINDOW_H*IN_WINDOW_W*D;
    localparam PE_IN_WEIGHT_WIDTH = FH*FW*D;
    localparam ROM_ADDR_WIDTH = $clog2(W_ROM_DATA_DEPTH);
    localparam H_OUT = H/POOL_H;
    localparam W_OUT = W/POOL_W;
    localparam INDEX_SRAM_DEPTH = H_OUT*W_OUT*FD/N_PE;
    localparam INDEX_ADDR_WIDTH = $clog2(INDEX_SRAM_DEPTH);
    localparam PINDEX_WIDTH = ($clog2(POOL_H*POOL_W) > 1)? $clog2(POOL_H*POOL_W):1;
    localparam CONV_OUT_WIDTH = ($clog2(D*FW*FH)+2 > NORMREF_WIDTH)? $clog2(D*FW*FH)+2:NORMREF_WIDTH; 
    localparam PE_OUT_WIDTH = CONV_OUT_WIDTH+NORMREF_SCALE_WIDTH;
    
    // input definition
    input clk;
    input rst;
    input in_en;
    input start;
    input [D-1:0] data_in;
    
    // output definition
    output out_en, done;
    output logic [PE_OUT_WIDTH-1:0] data_out;
    
    wire fmap_in_shiftreg_en;
    wire [ROM_ADDR_WIDTH-1:0] w_rom_addr;
    wire fmap_out_shiftreg_en, w_rom_en, pe_en;
    wire [D-1:0] data_in_mux;
    wire pad_mux_sel;
    
    // initiate the shifter register for buffering the input feature maps
    wire [PE_IN_FMAP_WIDTH-1:0] data_inreg2pe;
    FMAP_IN_SHIFTREG # (.IS_BUF_ROW(IS_BUF_ROW), .H(H), .W(W), .D(D), .FH(FH), .FW(FW), .POOL_H(POOL_H), .POOL_W(POOL_W), .IN_WINDOW_H(IN_WINDOW_H), .IN_WINDOW_W(IN_WINDOW_W), .PAD(PAD), .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W))
        fmap_in_shiftreg_inst (.clk(clk), .rst(rst), .in_en(fmap_in_shiftreg_en), .data_in(data_in_mux), .out_en(), .data_out(data_inreg2pe));
 
    // initiate the PEs, the corresponding vROM and shifter registers
    wire [PE_IN_WEIGHT_WIDTH*N_PE-1:0] weight;
    wire [NORMREF_WIDTH*N_PE-1:0] norm_ref;
    wire [N_PE*PE_OUT_WIDTH-1:0] pe_data_out;
    wire [NORMREF_SCALE_WIDTH*N_PE-1:0] norm_ref_scale;
    
    genvar i;
    generate
        for (i = 0; i < N_PE; i = i+1) begin: PEs
            PE_OUT # (.D(D), .FH(FH), .FW(FW), .POOL_H(POOL_H), .POOL_W(POOL_W), .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W), .NORMREF_WIDTH(NORMREF_WIDTH), .NORMREF_SCALE_WIDTH(NORMREF_SCALE_WIDTH))
             pe_out_inst (.norm_ref(norm_ref[NORMREF_WIDTH*N_PE-1-NORMREF_WIDTH*i:NORMREF_WIDTH*N_PE-NORMREF_WIDTH-NORMREF_WIDTH*i]), 
                          .data_in(data_inreg2pe), 
                          .scale(norm_ref_scale[NORMREF_SCALE_WIDTH*N_PE-1-i*NORMREF_SCALE_WIDTH:NORMREF_SCALE_WIDTH*N_PE-NORMREF_SCALE_WIDTH-i*NORMREF_SCALE_WIDTH]),
                          .weight_in(weight[PE_IN_WEIGHT_WIDTH*N_PE-1-PE_IN_WEIGHT_WIDTH*i:PE_IN_WEIGHT_WIDTH*N_PE-PE_IN_WEIGHT_WIDTH-PE_IN_WEIGHT_WIDTH*i]), 
                          .data_out(pe_data_out[N_PE*PE_OUT_WIDTH-1-i*PE_OUT_WIDTH:N_PE*PE_OUT_WIDTH-PE_OUT_WIDTH-i*PE_OUT_WIDTH])
                         );
            W_ROM # (.MEM_NAME(W_MEM_NAME), .MEM_INDEX(ROM_INDEX[i]), .DATA_WIDTH(PE_IN_WEIGHT_WIDTH), .DATA_DEPTH(W_ROM_DATA_DEPTH), .INST_TYPE(INST_TYPE), .PRELOADFILE(PRELOADFILE))
             w_rom_inst (.clk(clk), .r_en(w_rom_en), .burn_in_en('b0), .rst_b(rst), .addr_in(w_rom_addr), .burned(), 
                         .data_out(weight[PE_IN_WEIGHT_WIDTH*N_PE-1-PE_IN_WEIGHT_WIDTH*i:PE_IN_WEIGHT_WIDTH*N_PE-PE_IN_WEIGHT_WIDTH-PE_IN_WEIGHT_WIDTH*i]));
            
            W_ROM # (.MEM_NAME(REF_MEM_NAME), .MEM_INDEX(ROM_INDEX[i]), .DATA_WIDTH(NORMREF_WIDTH), .DATA_DEPTH(W_ROM_DATA_DEPTH), .INST_TYPE(INST_TYPE), .PRELOADFILE(PRELOADFILE)) 
             normref_rom_inst (.clk(clk), .r_en(w_rom_en), .burn_in_en('b0), .rst_b(rst), .addr_in(w_rom_addr), .burned(), 
                         .data_out(norm_ref[NORMREF_WIDTH*N_PE-1-NORMREF_WIDTH*i:NORMREF_WIDTH*N_PE-NORMREF_WIDTH-NORMREF_WIDTH*i]));    
                         
            W_ROM # (.MEM_NAME(REF_SCALE_MEM_NAME), .MEM_INDEX(ROM_INDEX[i]), .DATA_WIDTH(NORMREF_SCALE_WIDTH), .DATA_DEPTH(W_ROM_DATA_DEPTH), .INST_TYPE(INST_TYPE), .PRELOADFILE(PRELOADFILE)) 
             normref_scale_rom_inst (.clk(clk), .r_en(w_rom_en), .burn_in_en('b0), .rst_b(rst), .addr_in(w_rom_addr), .burned(), 
                         .data_out(norm_ref_scale[NORMREF_SCALE_WIDTH*N_PE-1-i*NORMREF_SCALE_WIDTH:NORMREF_SCALE_WIDTH*N_PE-NORMREF_SCALE_WIDTH-i*NORMREF_SCALE_WIDTH])); 
            
//            FMAP_OUT_SHIFTREG # (.FD(FD), .N_PE(N_PE), .IN_WIDTH(PE_OUT_WIDTH))
//             fmap_out_shiftreg_inst_0 (.clk(clk), .in_en(fmap_out_shiftreg_en), .data_in(pe_data_out[N_PE*PE_OUT_WIDTH-1-i*PE_OUT_WIDTH:N_PE*PE_OUT_WIDTH-PE_OUT_WIDTH-i*PE_OUT_WIDTH]), 
//                                       .data_out(data_out[PE_OUT_WIDTH*FD-1-i*PE_OUT_WIDTH*FD/N_PE:PE_OUT_WIDTH*FD-PE_OUT_WIDTH*FD/N_PE-i*PE_OUT_WIDTH*FD/N_PE])
//                                       );
            assign data_out = pe_data_out;
        end
    endgenerate
    
    // zero mux
    assign data_in_mux = (pad_mux_sel)? {D{'b0}}: data_in;
    
    // initiate the DC_CTRL
    DC_CTRL # (.H(H), .W(W), .D(D), .FH(FH), .FW(FW), .FD(FD), .N_PE(N_PE), .PAD(PAD),
               .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W), 
               .POOL_H(POOL_H), .POOL_W(POOL_W), .N_V_PE(N_V_PE),
               .W_ROM_DATA_DEPTH(W_ROM_DATA_DEPTH), .M(M), .P(P))
           dc_ctrl_inst (
                // inputs
                .clk(clk),
                .rst(rst),
                .start(start),
                .data_in_en(in_en),
                // outputs
                .fmap_in_shiftreg_en(fmap_in_shiftreg_en),
                .fmap_out_shiftreg_en(out_en),
                .w_rom_en(w_rom_en),
                .w_rom_addr(w_rom_addr),
                .pe_en(pe_en),
                .index_sram_rd(),
                .index_sram_addr(),
                .upool_mux_sel(),
                .data_out_en(),
                .pad_mux_sel(pad_mux_sel),
                .tg_next(),
                .done(done)
           );
    
endmodule
