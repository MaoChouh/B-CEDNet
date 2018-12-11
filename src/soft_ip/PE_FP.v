`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: PE_FP
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module PE_FP(
    // inputs
    norm_ref,
    data_in,
    weight_in,
    in_en,
    s,
    // outputs
    data_out,
    pindex
    );
    
    parameter D = 512;
    parameter FH = 3;
    parameter FW = 3;
    parameter POOL_H = 2;
    parameter POOL_W = 2;
    parameter STRIDE_H = 1;
    parameter STRIDE_W = 1;
    parameter WEIGHT_WIDTH = 16;
    parameter WEIGHT_FRAC_WIDTH = 8;
    parameter FMAP_WIDHT = 16;
    parameter FMAP_FRAC_WIDHT = 0;
    parameter NORMREF_WIDTH = 0;
    
    localparam IN_WINDOW_H = (POOL_H-1)*STRIDE_H+FH;
    localparam IN_WINDOW_W = (POOL_W-1)*STRIDE_W+FW;
    localparam IN_WIDTH_FMAP = D*IN_WINDOW_H*IN_WINDOW_W*FMAP_WIDHT;
    localparam KERNEL_FMAP_WIDTH = D*FH*FW*FMAP_WIDHT; // conv. kernel input width
    localparam IN_WIDTH_WEIGHT = D*FW*FH*WEIGHT_WIDTH;
    localparam KERNEL_WEIGHT_WIDTH = D*FH*FW*WEIGHT_WIDTH; // conv. kernel input width
    localparam OUT_WIDTH_CONV = WEIGHT_WIDTH+FMAP_WIDHT+$clog2(D*FH*FW); // fix-point conv. output width
    localparam OUT_WIDTH_CONV_FRAC = WEIGHT_FRAC_WIDTH+FMAP_FRAC_WIDHT;
    localparam NORMREF_FRAC_WIDTH = OUT_WIDTH_CONV_FRAC;
    localparam PINDEX_WIDTH = $clog2(POOL_H*POOL_W);
    localparam OUT_WIDTH = 1;
    localparam N_KERNEL = POOL_H*POOL_W;
    
    
    // inputs
    input [IN_WIDTH_FMAP-1:0] data_in;
    input [IN_WIDTH_WEIGHT-1:0] weight_in;
    input [NORMREF_WIDTH-1:0] norm_ref;
    input s; //this input may affect the sign of data_out
    input in_en;
    
    // outputs
    output [PINDEX_WIDTH-1:0] pindex;
    output [OUT_WIDTH-1:0] data_out;

    // initiate kernels
    genvar i, j, m;
    wire [KERNEL_FMAP_WIDTH-1:0] kernel_data [N_KERNEL-1:0];
    wire [POOL_H*POOL_W*OUT_WIDTH_CONV-1:0] conv_out;
    generate
    
        `ifdef MODE_SIM
        if (OUT_WIDTH_CONV != NORMREF_WIDTH+NORMREF_FRAC_WIDTH) begin
            $error("NORMREF_WIDTH = %d, NORMREF_FRAC_WIDTH = %d not compatible with OUT_WIDTH_CONV = %d", 
                NORMREF_WIDTH, NORMREF_FRAC_WIDTH, OUT_WIDTH_CONV);
        end
        `endif
        
        for (i = 0; i < POOL_H; i = i+1) begin
            for (j = 0; j < POOL_W; j = j+1) begin
                for (m = 0; m < FH; m = m + 1) begin
                    // this should be verified very carefully!
                    assign kernel_data[i*POOL_W+j][KERNEL_FMAP_WIDTH-1-D*FW*FMAP_WIDHT*m
                                :KERNEL_FMAP_WIDTH-FW*D*FMAP_WIDHT-D*FW*FMAP_WIDHT*m] = 
                        data_in[IN_WIDTH_FMAP-1-FMAP_WIDHT*(m*IN_WINDOW_W+i*IN_WINDOW_W*STRIDE_H+j*STRIDE_W)
                                :IN_WIDTH_FMAP-FW*FMAP_WIDHT-FMAP_WIDHT*(m*IN_WINDOW_W+i*IN_WINDOW_W*STRIDE_H+j*STRIDE_W)];
                end
                CONV_KERNEL # (.D(D), .FH(FH), .FW(FW),
                               .DATA_A_WIDTH(FMAP_WIDHT),
                               .DATA_B_WIDTH(WEIGHT_WIDTH),
                               .DATA_A_FRAC_WIDTH(FMAP_FRAC_WIDHT),
                               .DATA_B_FRAC_WIDTH(WEIGHT_FRAC_WIDTH))
                conv_kernel_inst(
                    .in_en(in_en),
                    .fmap_in(kernel_data[i*POOL_W+j]),
                    .weight(weight_in), 
                    .conv_out(conv_out[POOL_H*POOL_W*OUT_WIDTH_CONV-1-(j*POOL_H+i)*OUT_WIDTH_CONV
                                    : POOL_H*POOL_W*OUT_WIDTH_CONV-OUT_WIDTH_CONV-(j*POOL_H+i)*OUT_WIDTH_CONV]) 
                    );
            end
        end           
    endgenerate
    
    // batch-norm and binrz
     COMPARATOR # (.N(2), .DATA_WIDTH(OUT_WIDTH_CONV)) 
           bn_binrz_inst (.data_in({norm_ref, {NORMREF_FRAC_WIDTH{1'b0}}, conv_out}), .s(s), .index(data_out)); 
           // put extra zero to the right of norm_ref as fraction bit.
    
endmodule
