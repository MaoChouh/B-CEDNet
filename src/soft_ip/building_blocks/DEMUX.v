`timescale 1ns / 1ps
/*
    Copyright
    All right reserved.
    Module Name: DEMUX
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/
`include "../../../src/soft_ip/include/includes.vh"
`include "../../../src/soft_ip/include/util.vh"

module DEMUX(
    // inputs
    data_in,
    sel,
    // outpus
    data_out
    );
    
    parameter DATA_WIDTH = 8;
    parameter N = 4;
    
    localparam SEL_WIDTH = $clog2(N);
    
    // inputs
    input [DATA_WIDTH-1:0] data_in;
    input [SEL_WIDTH-1:0] sel;
    
    // outputs
    output [N*DATA_WIDTH-1:0] data_out;
    
    genvar i, j;
    wire [N*DATA_WIDTH-1:0] data_out_tmp;
    generate
        for(i = 0; i < DATA_WIDTH; i = i+1) begin
            DEMUX_1b # (.N(N)) demux_inst(.data_in(data_in[i]), .sel(sel), .data_out(data_out_tmp[N*DATA_WIDTH-1-N*i:N*DATA_WIDTH-N-N*i]));
            for (j = 0; j < N; j = j+1)begin
                assign data_out[N*DATA_WIDTH-1-(j*DATA_WIDTH+i)] = data_out_tmp[N*DATA_WIDTH-1-(i*N+j)];
            end
        end
    endgenerate
endmodule
