`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: PE_EC
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module PE_EC(
    // inputs
    norm_ref,
    data_in,
    weight_in,
    in_en,
    s,
    // outputs
    conv_out_1,
    conv_out_2,
    conv_out_3,
    conv_out_4,
    max_conv,
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
    parameter NORMREF_WIDTH = 14;
    
    localparam IN_WINDOW_H = (POOL_H-1)*STRIDE_H+FH;
    localparam IN_WINDOW_W = (POOL_W-1)*STRIDE_W+FW;
    localparam IN_WIDTH = D*IN_WINDOW_H*IN_WINDOW_W;
    localparam PE_IN_DATA_WIDTH = D*FW*FH;
    localparam PINDEX_WIDTH = $clog2(POOL_H*POOL_W);
    localparam OUT_WIDTH = 1;
    localparam N_KERNEL = POOL_H*POOL_W;
    localparam CONV_OUT_WIDTH = $clog2(D*FW*FH+1);
    localparam CONV_OUT_FRAC_WIDTH = 1;

    // inputs
    input [IN_WIDTH-1:0] data_in;
    input [PE_IN_DATA_WIDTH-1:0] weight_in;
    input [NORMREF_WIDTH-1:0] norm_ref;
    input s; //This input may affect the sign of data_out
    input in_en;
    
    // outputs
    output [PINDEX_WIDTH-1:0] pindex;
    output [OUT_WIDTH-1:0] data_out;

    // initiate kernels
    genvar i, j, m;
    wire [PE_IN_DATA_WIDTH-1:0] kernel_data [N_KERNEL-1:0];
    wire [POOL_H*POOL_W*CONV_OUT_WIDTH-1:0] conv_out;
    generate
        `ifdef MODE_SIM
    //    if (CONV_OUT_WIDTH+1 != NORMREF_WIDTH) begin
    //        $error("NORMREF_WIDTH = %d not compatible with CONV_OUT_WIDTH = %d", NORMREF_WIDTH, CONV_OUT_WIDTH);
    //    end
        `endif
    
        for (i = 0; i < POOL_H; i = i+1) begin
            for (j = 0; j < POOL_W; j = j+1) begin
                for (m = 0; m < FH; m = m + 1) begin
                    // this should be verified very carefully!
                    assign kernel_data[i*POOL_W+j][PE_IN_DATA_WIDTH-1-D*FW*m: PE_IN_DATA_WIDTH-FW*D-D*FW*m] = 
                        data_in[IN_WIDTH-1-D*(m*IN_WINDOW_W+i*IN_WINDOW_W*STRIDE_H+j*STRIDE_W)
                        : IN_WIDTH-FW*D-D*(m*IN_WINDOW_W+i*IN_WINDOW_W*STRIDE_H+j*STRIDE_W)];
                end
                BINCONV_KERNEL # (.D(D), .FH(FH), .FW(FW), .OUT_WIDTH(CONV_OUT_WIDTH))
                conv_kernel_inst(
                    .in_en(in_en),
                    .fmap_in(kernel_data[i*POOL_W+j]),
                    .weight(weight_in), 
                    .conv_out(conv_out[POOL_H*POOL_W*CONV_OUT_WIDTH-1-(i*POOL_W+j)*CONV_OUT_WIDTH
                                    : POOL_H*POOL_W*CONV_OUT_WIDTH-CONV_OUT_WIDTH-(i*POOL_W+j)*CONV_OUT_WIDTH]) 
                    );
            end
        end           
    endgenerate
    
    output [CONV_OUT_WIDTH-1:0] conv_out_1,conv_out_2,conv_out_3,conv_out_4;
    assign conv_out_1 = conv_out[POOL_H*POOL_W*CONV_OUT_WIDTH-1-(0*POOL_W+0)*CONV_OUT_WIDTH
                                        : POOL_H*POOL_W*CONV_OUT_WIDTH-CONV_OUT_WIDTH-(0*POOL_W+0)*CONV_OUT_WIDTH];
    assign conv_out_2 = conv_out[POOL_H*POOL_W*CONV_OUT_WIDTH-1-(0*POOL_W+1)*CONV_OUT_WIDTH
                                        : POOL_H*POOL_W*CONV_OUT_WIDTH-CONV_OUT_WIDTH-(0*POOL_W+1)*CONV_OUT_WIDTH];
    assign conv_out_3 = conv_out[POOL_H*POOL_W*CONV_OUT_WIDTH-1-(1*POOL_W+0)*CONV_OUT_WIDTH
                                        : POOL_H*POOL_W*CONV_OUT_WIDTH-CONV_OUT_WIDTH-(1*POOL_W+0)*CONV_OUT_WIDTH];
    assign conv_out_4 = conv_out[POOL_H*POOL_W*CONV_OUT_WIDTH-1-(1*POOL_W+1)*CONV_OUT_WIDTH
                                        : POOL_H*POOL_W*CONV_OUT_WIDTH-CONV_OUT_WIDTH-(1*POOL_W+1)*CONV_OUT_WIDTH];                                     
    // initiate COMPARATOR for max-pooling
    wire [CONV_OUT_WIDTH-1:0] p_res;
    COMPARATOR # (.N(POOL_H*POOL_W), .DATA_WIDTH(CONV_OUT_WIDTH)) 
        max_pooling_inst (.data_in(conv_out), .data_out(p_res), .s(s), .index(pindex));
    
    output [CONV_OUT_WIDTH-1:0] max_conv;
    assign max_conv = p_res;
    
    // initiate COMPARATOR for binarization
    COMPARATOR # (.N(2), .DATA_WIDTH(NORMREF_WIDTH))
        binzr_inst (.data_in({norm_ref, p_res, {CONV_OUT_FRAC_WIDTH{1'b0}}}), .s(s), .index(data_out));

endmodule
