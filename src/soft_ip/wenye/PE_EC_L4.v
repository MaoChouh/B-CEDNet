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


module PE_EC_L4(
    // inputs
    norm_ref,
    data_in,
    weight_in,
    // outputs
    //data_out,
    //pindex,
    data_out_4
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
    
    // inputs
    input [IN_WIDTH-1:0] data_in;
    input [PE_IN_DATA_WIDTH-1:0] weight_in;
    input [NORMREF_WIDTH-1:0] norm_ref;
    
    // outputs
    output logic [3:0] data_out_4;
    wire [OUT_WIDTH-1:0] data_out;
    wire [PINDEX_WIDTH-1:0] pindex;
    
    
    // initiate kernels
    genvar i, j, m;
    wire [PE_IN_DATA_WIDTH-1:0] kernel_data [N_KERNEL-1:0];
    wire [POOL_H*POOL_W*NORMREF_WIDTH-1:0] conv_out;
    generate
        for (i = 0; i < POOL_H; i = i+1) begin
            for (j = 0; j < POOL_W; j = j+1) begin
                for (m = 0; m < FH; m = m + 1) begin
                    // this should be verified very carefully!
                    assign kernel_data[i*POOL_W+j][PE_IN_DATA_WIDTH-1-D*FW*m: PE_IN_DATA_WIDTH-FW*D-D*FW*m] = 
                        data_in[IN_WIDTH-1-D*(m*IN_WINDOW_W+i*IN_WINDOW_W*STRIDE_H+j*STRIDE_W)
                        : IN_WIDTH-FW*D-D*(m*IN_WINDOW_W+i*IN_WINDOW_W*STRIDE_H+j*STRIDE_W)];
                end
                BINCONV_KERNEL # (.D(D), .FH(FH), .FW(FW))
                conv_kernel_inst(
                    .in_en(in_en),
                    .fmap_in(kernel_data[i*POOL_W+j]),
                    .weight(weight_in), 
                    .conv_out(conv_out[POOL_H*POOL_W*NORMREF_WIDTH-1-(j*POOL_H+i)*NORMREF_WIDTH
                                    : POOL_H*POOL_W*NORMREF_WIDTH-NORMREF_WIDTH-(j*POOL_H+i)*NORMREF_WIDTH]) 
                    );
            end
        end           
    endgenerate
    
    // initiate COMPARATOR for max-pooling
    wire [NORMREF_WIDTH-1:0] p_res;
    COMPARATOR # (.N(POOL_H*POOL_W), .DATA_WIDTH(NORMREF_WIDTH)) 
        max_pooling_inst (.data_in(conv_out), .data_out(p_res), .index(pindex));
    
    
    // initiate COMPARATOR for binarization
    wire [NORMREF_WIDTH-1:0] binrz_ref;
    assign binrz_ref = $signed(FH*FW*D)/2+$signed(norm_ref)/2;
    COMPARATOR # (.N(2), .DATA_WIDTH(NORMREF_WIDTH))
        binzr_inst (.data_in({binrz_ref, p_res}), .index(data_out));

   //Final data output of PE_EC_L4
   always@* begin
     data_out_4 = 4'bx;
       case(pindex)
         2'b00: data_out_4={3'b000,data_out};
         2'b01: data_out_4={2'b00,data_out,1'b0};
         2'b10: data_out_4={1'b0,data_out,2'b00};
         2'b11: data_out_4={data_out,3'b000};
       endcase
   end
endmodule

