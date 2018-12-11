`timescale 1ns / 1ps
`include "../../src/testbench/headers/FMAP_IN_SHIFTREG_tb.vh"
/*
    Copyright
    All right reserved.
    Module Name: FMAP_IN_SHIFTREG
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
    Testbench of FMAP_IN_SHIFTREG
*/


module FMAP_IN_SHIFTREG_tb();
    parameter H = `PARAM_H;
    parameter W = `PARAM_W;
    parameter D = `PARAM_D;
    parameter FH = `PARAM_FH;
    parameter FW = `PARAM_FW;
    parameter POOL_H = `PARAM_POOL_H;
    parameter POOL_W = `PARAM_POOL_W;
    parameter PAD = `PARAM_PAD;
    parameter STRIDE_H = `PARAM_STRIDE_H;
    parameter STRIDE_W = `PARAM_STRIDE_W;
    
    parameter IN_DATA_WIDTH = `PARAM_IN_DATA_WIDTH;
    parameter OUT_DATA_WIDTH = `PARAM_OUT_DATA_WIDTH;
    parameter NUM_DATA = `PARAM_NUM_DATA;
    parameter CLK_PERIOD = `PARAM_CLK_PERIOD;
    
    localparam IN_WINDOW_H = (POOL_H-1)*STRIDE_H+FH; // 4
    localparam IN_WINDOW_W = (POOL_W-1)*STRIDE_W+FW; // 4
    localparam BUFFER_DEPTH = (W+2*PAD)*FH+IN_WINDOW_H;
    
    // inputs
    reg clk, rst;
    reg [1:0] in_en;
    reg [IN_DATA_WIDTH-1:0] data_in;
    
    // inputs
    reg out_en;
    reg [OUT_DATA_WIDTH-1:0] data_out;
    
    FMAP_IN_SHIFTREG # (.H(H), .W(W), .D(D), .FH(FH), .FW(FW), .POOL_H(POOL_H), .POOL_W(POOL_W), .PAD(PAD), .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W))
        U (.clk(clk), .rst(rst), .in_en(in_en), .data_in(data_in), .out_en(out_en), .data_out(data_out));
    
    integer data_read, data_in_id, data_out_id;
    
    initial begin
        clk = 0;
        rst = 0;
        in_en = 2'b00;
        data_read = 0;
        data_in_id = $fopen({`PARAM_INPUTPATH, "FMAP_IN_SHIFTREG_tb_data_in.data"},"r");
        data_out_id = $fopen({`PARAM_OUTPUTPATH, "FMAP_IN_SHIFTREG_tb_data_out.rst"},"wt");
        #(10*CLK_PERIOD)
        rst = 1;
        in_en = 2'b01;
        #((BUFFER_DEPTH)*CLK_PERIOD)
        in_en = 2'b11;
        #((BUFFER_DEPTH)*CLK_PERIOD)
        in_en = 2'b00;
        #(5*CLK_PERIOD)
        $fclose(data_out_id);
        $fclose(data_in_id);
        $finish;
    end
    
    always #(CLK_PERIOD/2) clk = ~clk;
    
    // read data from file
    always@ (negedge clk) begin
        if (rst && !$feof(data_in_id) && in_en) begin
            $fscanf(data_in_id, "%b\n", data_in);
            data_read = data_read + 1;
        end
    end
    
    // write output data to file
    always@(posedge clk) begin
        if (rst && out_en) begin
            $fwrite(data_out_id,"%b\n", data_out);
        end
    end
    
    initial begin
        $vcdplusfile({`PARAM_OUTPUTPATH, "testbench_FMAP_IN_SHIFTREG_waveform.vpd"});
        $vcdpluson;
        $vcdplusmemon(0);
        $vcdplusdeltacycleon(0);
    end
    
endmodule
