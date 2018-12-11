`timescale 1ns / 1ps
`include "../../../src/soft_ip/include/includes.vh"
`include "../../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: FMAP_IN_SHIFTREG
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: Input feature map buffer. The bitwidth of the input data is D which is the depth of the input
    feature maps. FMAP_IN_SHIFTREG is a shift register that beffers BUFFER_DEPTH data with bitwidth of D. The
    output of the FMAP_IN_SHIFTREG is a set of signals collected from different registers with the number of 
    OUT_DATA_WIDTH.
*/


module FMAP_IN_SHIFTREG(
    // inputs
    clk,
    rst,
    in_en,
    data_in,
    // outputs
    data_out,
    out_en
    );
    
    parameter H = 32;
    parameter W = 128;
    parameter D = 512;
    parameter FH = 3;
    parameter FW = 3;
    parameter POOL_H = 2;
    parameter POOL_W = 2;
    parameter PAD = 1;
    parameter STRIDE_H = 1;
    parameter STRIDE_W = 1;
    parameter IS_BUF_ROW = 1;
    parameter IN_WINDOW_H = 3;
    parameter IN_WINDOW_W = 3;

    localparam BUFFER_DEPTH = (IS_BUF_ROW)? (W+2*PAD)*(IN_WINDOW_H-1)+IN_WINDOW_W:1; // (128+2)*3+4
    localparam IN_DATA_WIDTH = D;
    localparam OUT_DATA_WIDTH = IN_WINDOW_H*IN_WINDOW_W*D; // 4*4*512
    
    // inputs
    input clk, rst;
    input in_en;
    input [IN_DATA_WIDTH-1:0] data_in;
    
    // outputs
    output reg out_en;
    output [OUT_DATA_WIDTH-1:0] data_out;
    
    genvar i, j;
    
    // shiftreg
    reg [D-1:0] fmap_buffer [0:BUFFER_DEPTH-1];
    generate
        for (i = 0; i < BUFFER_DEPTH; i = i+1) begin: shiftregs
            always@(posedge clk)
            if (~rst)
                fmap_buffer[i] <= 0;
//            else if (in_en == 2'b01 || in_en == 2'b11)
            else if (in_en)
            begin
                if (i == 0) begin
                    fmap_buffer[i] <= data_in[D-1:0];
                end
                else begin
                    fmap_buffer[i] <= fmap_buffer[i-1];
                end
            end
//            else if (in_en == 2'b11) begin
//                if (i == 0) begin
//                    fmap_buffer[i] <= data_in[D-1:0];
//                end
//                else if(i == 1) begin
//                    fmap_buffer[i] <= data_in[2*D-1:D];
//                end
//                else begin
//                    fmap_buffer[i] <= fmap_buffer[i-2];
//                end
//            end
        end
    endgenerate
    
    // output signals
    generate
        for (i = 0; i < IN_WINDOW_H; i = i+1) begin: outsignals_H
            `ifdef MODE_SIM
            if (OUT_DATA_WIDTH-(IN_WINDOW_W-IN_WINDOW_W*i)*IN_DATA_WIDTH < 0) begin
                $error("output signal pin overflow.");
            end
            else if (BUFFER_DEPTH-IN_WINDOW_W-(W+2*PAD)*i < 0) begin
                $error("Buffer signal pin down overflow.");
            end
            else begin
            `endif
            //assign data_out_wire[OUT_DATA_WIDTH-1-IN_WINDOW_W*IN_DATA_WIDTH*i:OUT_DATA_WIDTH-(IN_WINDOW_W-IN_WINDOW_W*i)*IN_DATA_WIDTH] = fmap_buffer[BUFFER_DEPTH-1-(W+2*PAD)*i: BUFFER_DEPTH-IN_WINDOW_W-(W+2*PAD)*i];
            //assign data_out [(4*4*512-1-(0+4*i)*512) : (4*4*512-(1+4*i)*512)] = fmap_buffer[(BUFFER_DEPTH-1-(128+2*1)*i)];
            //assign data_out [(4*4*512-1-(1+4*i)*512) : (4*4*512-(2+4*i)*512)] = fmap_buffer[(BUFFER_DEPTH-2-(128+2*1)*i)];
            //assign data_out [(4*4*512-1-(2+4*i)*512) : (4*4*512-(3+4*i)*512)] = fmap_buffer[(BUFFER_DEPTH-3-(128+2*1)*i)];
            //assign data_out [(4*4*512-1-(3+4*i)*512) : (4*4*512-(4+4*i)*512)] = fmap_buffer[(BUFFER_DEPTH-4-(128+2*1)*i)];                      
                for (j = 0; j < IN_WINDOW_W; j = j+1) begin: outsignals_W
                    assign data_out [(OUT_DATA_WIDTH-1-(j+IN_WINDOW_W*i)*IN_DATA_WIDTH):(OUT_DATA_WIDTH-(1+j+IN_WINDOW_W*i)*IN_DATA_WIDTH)] = fmap_buffer[BUFFER_DEPTH-1-j-(W+2*PAD)*i];
                end
           `ifdef MODE_SIM
            end
           `endif
        end
    endgenerate
    
    // incount
    reg [$clog2(BUFFER_DEPTH):0] incout;
    always@(posedge clk) begin
        if (~rst) begin
            incout <= 0;
        end
//        else if((in_en == 2'b01) && (incout < BUFFER_DEPTH)) begin
//            incout <= incout + 1;
//        end
//        else if((in_en == 2'b11) && (incout < BUFFER_DEPTH)) begin
//            incout <= incout + 2;
//        end
        else if((in_en) && (incout < BUFFER_DEPTH)) begin
            incout <= incout + 1;
        end
    end
    
    // out_en
    always@(incout) begin
        if (incout >= BUFFER_DEPTH) begin
            out_en <= 1;
        end
        else begin
            out_en <= 0;
        end
    end
        
endmodule
