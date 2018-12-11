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
    parameter DATA_A_WIDTH = 16; // FMAP
    parameter DATA_A_FRAC_WIDTH = 8;
    parameter DATA_B_WIDTH = 16; // WEIGHTS
    parameter DATA_B_FRAC_WIDTH = 8;
    parameter FH = 3;
    parameter FW = 3;
    
    localparam IN_WIDTH_FMAP = D*FH*FW*DATA_A_WIDTH;
    localparam IN_WIDTH_W = D*FH*FW*DATA_B_WIDTH;
    localparam DATA_MULT_WIDTH = DATA_A_WIDTH+DATA_B_WIDTH;
    localparam DATA_MULT_FRAC_WIDTH = DATA_A_FRAC_WIDTH+DATA_B_FRAC_WIDTH;
    localparam DATA_OUT_WIDTH = DATA_MULT_WIDTH + $clog2(D*FH*FW);
    localparam DATA_OUT_FRAC_WIDTH = DATA_MULT_FRAC_WIDTH;
    
    // inputs
    input in_en;
    input [IN_WIDTH_FMAP-1:0] fmap_in; 
    input [IN_WIDTH_W-1:0] weight;
    
    // outputs
    output reg signed [DATA_OUT_WIDTH-1:0] conv_out;
    
    genvar i;
    
    // TODO: implement full-precision convolution
    wire signed [DATA_MULT_WIDTH-1:0] mult_out [D*FH*FW-1:0];
    generate
        for (i = 0; i < D*FH*FW; i = i+1) begin
            assign mult_out[i] = $signed(fmap_in[IN_WIDTH_FMAP-1-DATA_A_WIDTH*i:IN_WIDTH_FMAP-DATA_A_WIDTH-DATA_A_WIDTH*i])
                            *$signed(weight[IN_WIDTH_W-1-DATA_B_WIDTH*i:IN_WIDTH_W-DATA_B_WIDTH-DATA_B_WIDTH*i]);
        end
    endgenerate
    
    integer idx;
    always @* begin
        conv_out = {DATA_OUT_WIDTH{1'b0}};
        for(idx = 0; idx < D*FH*FW; idx = idx+1)
            conv_out = conv_out + mult_out[idx];
    end
    
endmodule
