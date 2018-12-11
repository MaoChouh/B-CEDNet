`timescale 1ns / 1ps
/*
    Copyright
    All right reserved.
    Module Name: CLK_DIV
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module CLK_DIV(
    clk_in,
    rst,
    clk_out,
    clk_cpy,
    rst_out
    );
    parameter DIV = 13;
    
    // inputs
    input clk_in, rst;
    
    // outputs
    output logic clk_out, clk_cpy, rst_out;
    
    logic [$clog2(DIV)-1:0] pos_count, neg_count;
    logic [2:0] rst_count;
    logic rst_out_dly, clk_out_dly;
    
    // pos_count
    always@(posedge clk_in) begin
        if (~rst)
            pos_count <= 0;
        else begin
            if (pos_count < DIV-1)
                pos_count <= pos_count + 1;
            else
                pos_count <= 0;
        end
    end
    
    // neg_count
    always@(negedge clk_in) begin
        if (~rst)
            neg_count <= 0;
        else begin
            if (neg_count < DIV-1)
                neg_count <= neg_count + 1;
            else
                neg_count <= 0;
        end
    end
    
    // clk_out_dly
    assign clk_out_dly = ((pos_count > (DIV >> 1)) | (neg_count > (DIV >> 1)));
    
    // clk_out
    always@(posedge clk_in) begin 
	clk_out <= clk_out_dly;
    end   

    assign clk_cpy = clk_in;
    
    // rst_count
    always@(posedge clk_out or negedge rst) begin
        if (rst == 0) 
            rst_count <= 0;
        else if (rst_count < 7)
            rst_count <= rst_count + 1;
    end

   // rst_out_dly
    always@(posedge clk_out or negedge rst) begin
        if (rst == 0) 
            rst_out_dly <= 0;
        else if (rst_count >= 7)
            rst_out_dly <= 1;
    end
    
    // rst_out
    always@(posedge clk_in) begin
	rst_out <= rst_out_dly;
    end

    


    
endmodule
