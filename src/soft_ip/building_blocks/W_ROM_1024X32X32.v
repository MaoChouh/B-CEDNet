`timescale 1ns / 1ps
`include "../../../src/soft_ip/include/includes.vh"
`include "../../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: W_ROM_1024X32X32
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module W_ROM_1024X32X32(
    // inputs
    clk,
    addr_in,
    r_en,
    burn_in_en,
    rst_b,
    // outputs
    burned,
    data_out
    );
    
    parameter DATA_WIDTH = 4608;
    parameter DATA_DEPTH = 1024;
    parameter PRELOADFILE = "";
    
    localparam ADDR_IN_WIDTH = $clog2(DATA_DEPTH);
    localparam N_ROM = DATA_WIDTH/32;
    localparam D_ROM = (DATA_DEPTH > 1024)? DATA_DEPTH:1024;
    
    // inputs
    input clk, r_en, burn_in_en;
    input [ADDR_IN_WIDTH-1:0] addr_in;
    input rst_b;

    // outputs
    output burned;
    output [DATA_WIDTH-1:0] data_out;
    
    `ifdef MODE_SIM
        string str[0:N_ROM-1];
        genvar i;
        integer k;
        
        initial begin
            for (k = 0; k < N_ROM; k = k+1) begin
                str[k].itoa(k);
            end
        end
        
        generate
            for (i = 0; i < N_ROM; i = i+1) begin
                b7dhd110g_1024x32x32 U (
                    // inputs
                    .clk(clk),
                    .cen_b(r_en),
                    .a(addr_in),
                    .t_cen_b('b0),
                    .t_a('b0),
                    .t_mux(1'b0), //In function mode t_mux set to Low
                    .t_scan_en('b0) ,
                    .t_sin('b0),
                    .t_strd('b0),
                    .t_burnin('b0),
                    .rst_b(rst_b),
                    // outputs
                    .t_sout(),
                    .q(data_out[DATA_WIDTH-1-i*32:DATA_WIDTH-32-i*32])
                );
            end
        endgenerate
    `endif
    
endmodule
