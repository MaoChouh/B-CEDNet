/*
    Copyright
    All right reserved.
    Module Name: BINCONV_KERNEL
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/

`timescale 1ns/10ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"

module BINCONV_KERNEL(
    // inputs
    in_en,
    fmap_in,
    weight,
    // outputs
    conv_out
);

    parameter D = 512;
    parameter FH = 3;
    parameter FW = 3;
    parameter OUT_WIDTH = 1;
    
    localparam IN_WIDTH = D*FH*FW;
    
    input in_en;
    input [IN_WIDTH-1:0] fmap_in;
    input [IN_WIDTH-1:0] weight;
    
    output reg [OUT_WIDTH-1:0] conv_out;
    

    wire [IN_WIDTH-1:0] fmap_xor;
    
    
    assign  fmap_xor = fmap_in ~^ weight;
    
    integer idx;
    always @* begin
        conv_out = {OUT_WIDTH{1'b0}};
        for(idx = 0; idx < IN_WIDTH; idx = idx+1)
            conv_out = conv_out + fmap_xor[idx];
    end

endmodule
    
    
    
    
    
        
