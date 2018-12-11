`timescale 1ns / 1ps
`include "../../../src/soft_ip/building_blocks/headers/gen/W_ROM_SOFT_F.vh"
/*
    Copyright
    All right reserved.
    Module Name: W_ROM_SOFT_F
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module ROM_SOFT_F(
    clk, 
    clk_r,
    rst,
    addr_in,
    r_en,
    data_out
    );
    parameter DATA_WIDTH = 4608;
    parameter DATA_DEPTH = 64; 
    parameter DATA_DIV = 12; // DATA_DIV = FREQ_CLK_R / FREQ_CLK
    parameter MEM_NAME = "";
    parameter integer MEM_INDEX = 0;
    parameter USE_IP = 1;
    parameter MIN_UNIT_WIDTH = 128;
    
    localparam ADDR_IN_WIDTH = $clog2(DATA_DEPTH);
    localparam TRUE_DATA_WIDTH = DATA_WIDTH/DATA_DIV;
    localparam TRUE_DATA_DEPTH = DATA_DEPTH*DATA_DIV;
    localparam N_SUBMEM = TRUE_DATA_WIDTH/MIN_UNIT_WIDTH;
    
    // input
    input clk, clk_r, r_en, rst;
    input [ADDR_IN_WIDTH-1:0] addr_in;
    
    // output
    output logic [DATA_WIDTH-1:0] data_out;
    
    logic [TRUE_DATA_WIDTH-1:0] data_out_1 [DATA_DIV-1:0];
    logic [TRUE_DATA_WIDTH-1:0] data_out_2 [DATA_DIV-1:0];
    logic buffer_sw;
    logic [$clog2(TRUE_DATA_DEPTH)-1:0] true_addr;
    logic [$clog2(DATA_DIV)-1:0] sub_addr, sub_addr_dl;
    logic [TRUE_DATA_WIDTH-1:0] core_data;
    logic r_en_dl;
    
    if (USE_IP) begin
        always@(posedge clk_r) begin
            r_en_dl <= r_en;
        end
    end
    else begin
        always@(r_en) begin
            r_en_dl <= r_en;
        end
    end
    
    
    genvar i;
    
    // sub_addr
    always@(posedge clk_r) begin
        if (~rst)
            sub_addr <= 0;
        else if (r_en) begin
            if (sub_addr < DATA_DIV-1)
                sub_addr <= sub_addr + 1;
            else
                sub_addr <= 0;
        end
        else begin
            sub_addr <= 0;
        end
    end
    
    // sub_addr_dl
    if (USE_IP) begin
        always@(posedge clk_r) begin
            sub_addr_dl <= sub_addr;
        end
    end
    else begin
        always@(sub_addr) begin
            sub_addr_dl <= sub_addr_dl;
        end
    end
    
    // true_addr
    always@(addr_in or sub_addr) begin
        true_addr <= addr_in*DATA_DIV+sub_addr;
    end
    
    // buffer_sw
    always@(posedge clk) begin
        if (~rst)
            buffer_sw <= 1;
        else if (r_en) begin
            buffer_sw <= ~buffer_sw;
        end
    end
    
    // data_out_1
    generate
        for (i = 0; i < DATA_DIV; i = i+1) begin
            always@(posedge clk_r) begin
                if (~rst)
                    data_out_1[i] <= 0;
                else if (r_en_dl && buffer_sw == 1 && sub_addr_dl == i) begin
                    data_out_1[i] <= core_data;
                end
            end
        end
    endgenerate
    // data_out_2
    generate
        for (i = 0; i < DATA_DIV; i = i+1) begin
            always@(posedge clk_r) begin
                if (~rst)
                    data_out_2[i] <= 0;
                else if (r_en_dl && buffer_sw == 0 && sub_addr_dl == i) begin
                    data_out_2[i] <= core_data;
                end
            end
        end
    endgenerate
    
    // data_out
    generate
    for (i = 0; i < DATA_DIV; i = i + 1) begin
	    always@(data_out_1 or data_out_2 or buffer_sw) begin
		if (!buffer_sw) begin
		    data_out[DATA_WIDTH-1-i*TRUE_DATA_WIDTH:DATA_WIDTH-TRUE_DATA_WIDTH-i*TRUE_DATA_WIDTH] <= data_out_1[i];
		end
		else begin
		    data_out[DATA_WIDTH-1-i*TRUE_DATA_WIDTH:DATA_WIDTH-TRUE_DATA_WIDTH-i*TRUE_DATA_WIDTH] <= data_out_2[i];
		end
	    end
    end
    endgenerate
    
    // ROM_CORE , 'core_data' connects the output of data core.
    generate
        if (USE_IP == 1)
            ROM_CORE_TEST_0 U (.addr(true_addr), .dout(core_data));
        else begin
            `GEN_ROM_SOFT_F
        end
    endgenerate
endmodule
