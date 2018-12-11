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
    in_en,
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
    localparam CONV_OUT_WIDTH = $clog2(D*FW*FH+1);
    localparam CONV_OUT_FRAC_WIDTH = 1;
    
    // inputs
    input [IN_WIDTH-1:0] data_in;
    input [PE_IN_DATA_WIDTH-1:0] weight_in;
    input [NORMREF_WIDTH-1:0] norm_ref;
    input [PINDEX_WIDTH-1:0] pindex;
    input s; //This input may affect the sign of data_out
    input in_en;
    
    // outputs
    output [OUT_WIDTH-1:0] data_out;
    
    generate
        `ifdef MODE_SIM
        if (CONV_OUT_WIDTH+1 != NORMREF_WIDTH) begin
            $error("NORMREF_WIDTH = %d not compatible with CONV_OUT_WIDTH = %d", NORMREF_WIDTH, CONV_OUT_WIDTH);
        end
        `endif
    endgenerate

    // initiate kernel
    wire [CONV_OUT_WIDTH-1:0] conv_out;
    BINCONV_KERNEL # (.D(D), .FH(FH), .FW(FW), .OUT_WIDTH(CONV_OUT_WIDTH))
    conv_kernel_inst(
        .in_en(in_en),
        .fmap_in(data_in),
        .weight(weight_in), 
        .conv_out(conv_out) 
        );
    
    // batch-norm and binrz
    wire binrz_res;
    COMPARATOR # (.N(2), .DATA_WIDTH(NORMREF_WIDTH)) 
        bn_binrz_inst (.data_in({norm_ref, conv_out, {CONV_OUT_FRAC_WIDTH{1'b0}}}), .s(s), .index(binrz_res));
        
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
