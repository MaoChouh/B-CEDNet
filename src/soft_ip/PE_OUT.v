`timescale 1ns / 1ps
/*
    Copyright
    All right reserved.
    Module Name: PE_OUT
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module PE_OUT(
    // inputs
    norm_ref,
    data_in,
    weight_in,
    in_en,
    scale,
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
    parameter NORMREF_SCALE_WIDTH = 13;
    
    localparam IN_WIDTH = D*FH*FW;
    localparam PE_IN_DATA_WIDTH = D*FW*FH;
    localparam N_KERNEL = 1;
    localparam CONV_OUT_WIDTH = ($clog2(D*FW*FH+1)+2 > NORMREF_WIDTH)? $clog2(D*FW*FH+1)+2:NORMREF_WIDTH; 
    localparam OUT_WIDTH = CONV_OUT_WIDTH+NORMREF_SCALE_WIDTH;
    
    // inputs
    input [IN_WIDTH-1:0] data_in;
    input [PE_IN_DATA_WIDTH-1:0] weight_in;
    input [NORMREF_WIDTH-1:0] norm_ref; // the bitwidth of the 'conv_out' and the 'norm_ref' should be the same and be the maximun of their neccssary bidwidth.
    input [NORMREF_SCALE_WIDTH-1:0] scale;
    input in_en;
    
    // outputs
    output [OUT_WIDTH-1:0] data_out;
    
    generate
        `ifdef MODE_SIM
        if (CONV_OUT_WIDTH != NORMREF_WIDTH) begin
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
        
    // batch-normalization
    assign data_out = ($signed(conv_out<<1)-$signed(norm_ref))*$signed(scale);
    
endmodule
