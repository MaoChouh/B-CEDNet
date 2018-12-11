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
    // outputs
    data_out,
    pindex,
    );
    
    parameter D = 512;
    parameter FH = 3;
    parameter FW = 3;
    parameter POOL_H = 2;
    parameter POOL_W = 2;
    parameter STRIDE_H = 1;
    parameter STRIDE_W = 1;
    parameter DATA_IN_FP_WIDTH = 16;
    parameter DATA_IN_FP_INT_WIDTH = 8;
    
    localparam IN_WINDOW_H = (POOL_H-1)*STRIDE_H+FH;
    localparam IN_WINDOW_W = (POOL_W-1)*STRIDE_W+FW;
    localparam IN_WEIGHT_WIDTH = D*FH*FW*DATA_IN_FP_WIDTH;
    localparam IN_WIDTH = D*IN_WINDOW_H*IN_WINDOW_W;
    localparam PE_IN_DATA_WIDTH = D*FW*FH*DATA_IN_FP_WIDTH;
    localparam NORMREF_WIDTH = clogb2(2*FH*FW*D);
    localparam PINDEX_WIDTH = clogb2(POOL_H*POOL_W);
    localparam OUT_WIDTH = 1;
    localparam N_KERNEL = POOL_H*POOL_W;
    
    // inputs
    input [IN_WIDTH-1:0] data_in;
    input [IN_WEIGHT_WIDTH-1:0] weight_in;
    input [NORMREF_WIDTH-1:0] norm_ref;
    
    // outputs
    output [PINDEX_WIDTH-1:0] pindex;
    output [OUT_WIDTH:0] data_out;
    
    // initiate kernels
    genvar i, j, m;
    wire [PE_IN_DATA_WIDTH-1:0] kernel_data [N_KERNEL-1:0];
    wire [POOL_H*POOL_W*NORMREF_WIDTH-1:0] conv_out;
    generate
        for (i = 0; i < POOL_H; i = i+1) begin
            for (j = 0; j < POOL_W; j = j+1) begin
                for (m = 0; m < FH; m = m + 1) begin
                    // this should be verified very carefully!
                    assign kernel_data[i*POOL_W+j][PE_IN_DATA_WIDTH-1-D*FW*DATA_IN_FP_WIDTH*m
                                :PE_IN_DATA_WIDTH-FW*D*DATA_IN_FP_WIDTH-D*FW*DATA_IN_FP_WIDTH*m] = 
                        data_in[IN_WIDTH-1-D*(m*IN_WINDOW_W+i*IN_WINDOW_W*STRIDE_H+j*STRIDE_W)
                                :IN_WIDTH-FW*D-D*(m*IN_WINDOW_W+i*IN_WINDOW_W*STRIDE_H+j*STRIDE_W)];
                end
                CONV_KERNEL # (.D(D), .FH(FH), .FW(FW),
                               .DATA_IN_FP_WIDTH(DATA_IN_FP_WIDTH),
                               .DATA_IN_FP_INT_WIDTH(DATA_IN_FP_INT_WIDTH),
                               .DATA_OUT_FP_WIDTH(),
                               .DATA_OUT_FP_INT_WIDTH())
                conv_kernel_inst(
                    .in_en(in_en),
                    .fmap_in(kernel_data[i*POOL_W+j]),
                    .weight(weight_in), 
                    .conv_out(conv_out[POOL_H*POOL_W*NORMREF_WIDTH-1-(i*POOL_W+j)*NORMREF_WIDTH
                                    : POOL_H*POOL_W*NORMREF_WIDTH-NORMREF_WIDTH-(i*POOL_W+j)*NORMREF_WIDTH]) 
                    );
            end
        end           
    endgenerate
    
    // batch-norm and binrz
     COMPARATOR # (.N(2), .DATA_WIDTH(NORMREF_WIDTH)) 
           bn_binrz_inst (.data_in({norm_ref, conv_out}), .index(data_out));
    
endmodule
