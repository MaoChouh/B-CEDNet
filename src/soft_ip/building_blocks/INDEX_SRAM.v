`timescale 1ns / 1ps
`include "../../../src/soft_ip/include/includes.vh"
`include "../../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: INDEX_SRAM
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module INDEX_SRAM(
    // inputs
    clk,
    en,
    wr,
    rd,
    rd_addr,
    wr_addr,
    data_in,
    // outputs
    data_out
    );
    
    parameter WR_DATA_WIDTH = 4;
    parameter RD_DATA_WIDTH = 4;
    parameter WR_DATA_DEPTH = 65536;
    parameter RD_DATA_DEPTH = 65536;
    
    localparam WR_ADDR_WIDTH = $clog2(WR_DATA_DEPTH);
    localparam RD_ADDR_WIDTH = $clog2(RD_DATA_DEPTH);
    localparam DIV = WR_DATA_DEPTH/RD_DATA_DEPTH;
    localparam D = (RD_ADDR_WIDTH-WR_ADDR_WIDTH >= 0)? RD_ADDR_WIDTH-WR_ADDR_WIDTH:0;
    
    // inputs
    input clk, en, wr, rd;
    input [WR_ADDR_WIDTH-1:0] wr_addr;
    input [RD_ADDR_WIDTH-1:0] rd_addr;
    input [WR_DATA_WIDTH-1:0] data_in;
    output logic [RD_DATA_WIDTH-1:0] data_out;
    
//    wire [WR_DATA_WIDTH-1:0] data_mux;
//    genvar i;
//    generate
//        `ifdef MODE_SIM
//        if (RD_ADDR_WIDTH-WR_ADDR_WIDTH != $clog2(WR_DATA_WIDTH/RD_DATA_WIDTH))
//            $error("Parameter value not matched. WR_ADDR_WIDTH = %d, RD_ADDR_WIDTH = %d, WR_DATA_WIDTH = %d, RD_DATA_WIDTH = %d.",
//                    WR_ADDR_WIDTH, RD_ADDR_WIDTH, WR_DATA_WIDTH, RD_DATA_WIDTH);
//        else begin
//        `endif
//            for (i = 0; i < RD_DATA_WIDTH/2; i = i+1) begin
//                always@(data_mux or rd_addr) begin
//                    case (rd_addr[RD_ADDR_WIDTH-1:RD_ADDR_WIDTH-D])
//                        1'b0: begin
//                            data_out[RD_DATA_WIDTH-1-i*2:RD_DATA_WIDTH-2-i*2]<= 
//                                data_mux[WR_DATA_WIDTH-1-i*RD_DATA_WIDTH-2*0
//                                    :WR_DATA_WIDTH-RD_DATA_WIDTH-i*RD_DATA_WIDTH-2*0];
//                        end
//                        1'b1: begin
//                            data_out[RD_DATA_WIDTH-1-i*2:RD_DATA_WIDTH-2-i*2]<= 
//                                data_mux[WR_DATA_WIDTH-1-i*RD_DATA_WIDTH-2*1
//                                    :WR_DATA_WIDTH-RD_DATA_WIDTH-i*RD_DATA_WIDTH-2*1];
//                        end
//                    endcase
                    
//                end
//            end
//        `ifdef MODE_SIM
//        end
//        `endif
//    endgenerate
    
    // initiate SRAM core
    mem2p11_dxw_p # (.DEPTH(WR_DATA_DEPTH), .WIDTH(WR_DATA_WIDTH)) U (.addrr(rd_addr), 
                .addrw(wr_addr), .din(data_in), .mer(rd), .mew(wr), .clk(clk), .dout(data_out));
    
endmodule
