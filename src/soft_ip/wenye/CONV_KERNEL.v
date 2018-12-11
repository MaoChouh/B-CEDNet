/*
    Copyright
    All right reserved.
    Module Name: CONV_KERNEL
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/

`timescale 1ns/10ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"


module CONV_KERNEL(
    // inputs
    in_en,
    fmap_in,
    weight,
    // outputs
    conv_out
    );
    
    parameter D = 512;
    parameter DATA_IN_FP_WIDTH = 16;
    parameter DATA_OUT_FP_WIDTH = 16;
    parameter DATA_IN_FP_INT_WIDTH = 2;
    parameter DATA_OUT_FP_INT_WIDTH = 2;
    parameter FH = 3;
    parameter FW = 3;
    
    localparam IN_WIDTH = D*FH*FW*DATA_IN_FP_WIDTH;
    localparam OUT_WIDTH = DATA_OUT_FP_WIDTH;
    
    // inputs
    input in_en;
    input [IN_WIDTH-1:0] fmap_in, weight;
    
    // outputs
    output reg [OUT_WIDTH-1:0] conv_out;
    
    genvar i;
    
    // TODO: implement full-precision convolution
    wire [DATA_IN_FP_WIDTH-1:0] mult_out [D*FH*FW-1:0];
    generate
        for (i = 0; i < D*FH*FW; i = i+1) begin
            assign mult_out[i] = fmap_in[IN_WIDTH-1-DATA_IN_FP_WIDTH*i:IN_WIDTH-DATA_IN_FP_WIDTH-DATA_IN_FP_WIDTH*i]
                            *weight[IN_WIDTH-1-DATA_IN_FP_WIDTH*i:IN_WIDTH-DATA_IN_FP_WIDTH-DATA_IN_FP_WIDTH*i];
        end
    endgenerate
    
    integer idx;
    always @* begin
        conv_out = {OUT_WIDTH{1'b0}};
        for(idx = 0; idx < D*FH*FW; idx = idx+1)
            conv_out = conv_out + mult_out[idx];
    end
    
endmodule
