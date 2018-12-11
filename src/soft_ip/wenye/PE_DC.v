`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: PE_DC
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module PE_DC(
    // inputs
    norm_ref,
    data_in,
    weight_in,
    pindex,
    s,
    // outputs
    data_out
    );
    
    parameter D = 512;
    parameter FH = 3;
    parameter FW = 3;
    parameter POOL_H = 2;
    parameter POOL_W = 2;
    parameter STRIDE_H = 1;
    parameter STRIDE_W = 1;
    parameter NORMREF_WIDTH = 13;
    
    localparam IN_WIDTH = D*FH*FW;
    localparam PE_IN_DATA_WIDTH = D*FW*FH;
    localparam PINDEX_WIDTH = ($clog2(POOL_H*POOL_W) > 1)? $clog2(POOL_H*POOL_W):1;
    localparam OUT_WIDTH = POOL_W*POOL_H;
    localparam N_KERNEL = 1;
    
    // inputs
    input [IN_WIDTH-1:0] data_in;
    input [PE_IN_DATA_WIDTH-1:0] weight_in;
    input [NORMREF_WIDTH-1:0] norm_ref;
    input [PINDEX_WIDTH-1:0] pindex;
    input s; //This input may affect the sign of data_out
    
    // outputs
    output [OUT_WIDTH-1:0] data_out;

    // initiate kernel
    wire [NORMREF_WIDTH-1:0] conv_out;
    BINCONV_KERNEL # (.D(D), .FH(FH), .FW(FW))
    conv_kernel_inst(
        .in_en(in_en),
        .fmap_in(data_in),
        .weight(weight_in), 
        .conv_out(conv_out) 
        );
    
    // batch-norm and binrz
    wire binrz_res;
    wire [NORMREF_WIDTH-1:0] binrz_ref;
    assign binrz_ref = $signed(FH*FW*D)/2+$signed(norm_ref)/2;
    COMPARATOR # (.N(2), .DATA_WIDTH(NORMREF_WIDTH)) 
        bn_binrz_inst (.data_in({binrz_ref, conv_out}), .s(s), .index(binrz_res));
        
    // upooling
    generate
        if (POOL_H*POOL_W != 1) begin
            DEMUX # (.DATA_WIDTH(1), .N(POOL_H*POOL_W)) upool_inst (.data_in(binrz_res), .sel(pindex), .data_out(data_out));
        end
        else begin
            assign data_out = binrz_res;
        end
    endgenerate

endmodule
