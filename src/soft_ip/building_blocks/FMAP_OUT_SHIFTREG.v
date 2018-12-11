`timescale 1ns / 1ps
`include "../../../src/soft_ip/include/includes.vh"
`include "../../../src/soft_ip/include/util.vh"

/*
    Copyright
    All right reserved.
    Module Name: FMAP_OUT_SHIFTREG
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: A buffer for PE output. 
        The bitwidth of the input data is 1 which is the output of PE.
        The bitwidth of the output data is D which is the input (1x1xD) of next FMAP_IN_SHIFTREG.
        The size of shiftreg is also D.
*/


module FMAP_OUT_SHIFTREG(
    // inputs
    clk,
    rst,
    in_en,
    data_in,
    // outputs
    data_out,
    out_en
    );
    
    parameter FD = 512;
    parameter N_PE = 1;
    parameter IN_WIDTH = 1;
    parameter DEPTH = 1;
   
    // inputs
    input clk, in_en, rst;
    input [IN_WIDTH-1:0] data_in;
    
    // outputs
    output out_en;
    output [IN_WIDTH*FD/N_PE-1:0] data_out;
    
    // shiftreg
    reg [IN_WIDTH*FD*DEPTH/N_PE-1:0] PE_dout_buffer;
    
    always @(posedge clk)
    begin
        if (~rst)
            PE_dout_buffer <= 'b0;
        else if (in_en)
        begin
            //bit shift register
            PE_dout_buffer <= {data_in, PE_dout_buffer[IN_WIDTH*DEPTH*FD/N_PE-1:1]};
        end
    end
        
    //module output wires
//    assign data_out = PE_dout_buffer[IN_WIDTH*DEPTH*FD/N_PE-1:IN_WIDTH*DEPTH*FD/N_PE-FD/N_PE];
    assign data_out = PE_dout_buffer[FD/N_PE-1:0];
    
endmodule
