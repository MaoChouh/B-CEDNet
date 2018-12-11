`timescale 1ns / 1ps
`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
`include "../../src/testbench/headers/BCEDN_TOP_tb.vh"
/*
    Copyright
    All right reserved.
    Module Name: BCEDN_TOP
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: BCEDN_TOP module.
*/


module ADAPTER_tb();

    parameter DATA_IN_WIDTH = `PARAM_DATA_IN_WIDTH;
    parameter DATA_OUT_WIDTH = `PARAM_DATA_OUT_WIDTH;
    parameter CLK_P_PERIOD = `PARAM_CLK_P_PERIOD;
    parameter CLK_R_PERIOD = `PARAM_CLK_R_PERIOD;
    parameter PROCESSING_CYC = `PARAM_PROCESSING_CYC;
    
    // inputs
    reg clk;
    wire clkw;
    reg rst;
    reg start;
    reg in_en;
    reg [DATA_IN_WIDTH-1:0] data_in, data_in_dly;
    // outputs
    wire [DATA_OUT_WIDTH-1:0] data_out;
    wire out_en;
    wire rdy, fifo_wfull;
    wire done;
//    wire data_rdy;
    
    // init
    integer data_in_id, data_in_ad_id, data_ad_ec1_id;
    reg processing;
    initial begin
//        clkw = 0;
         clk = 0; rst = 0; start = 0; in_en = 0;
        data_in = 0; processing = 0; start = 0;
        data_in_id = $fopen({`PARAM_INPUTPATH, "BCEDN_TOP_tb_data_in.data"}, "r");
        data_in_ad_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_in_ad.rst"},"w");
        data_ad_ec1_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_ad_ec1.rst"},"w");
        #(10*CLK_P_PERIOD)
        rst = 1;
        #(20*CLK_P_PERIOD)
        start = 1;
        processing = 1;
        # CLK_P_PERIOD
        start = 0;
        # (PROCESSING_CYC*CLK_P_PERIOD)
        processing = 0;
        $fclose(data_in_id);
        $fclose(data_in_ad_id);
        $fclose(data_ad_ec1_id);
        $finish;
    end
    

    

    
    // clkw
//    always #(CLK_P_PERIOD/2) clkw = ~clkw;
    
    // clk
    always #(CLK_R_PERIOD/2) clk = ~clk;
    
    // in_en 
    always@(posedge clkw) begin
        if (~rst)
            in_en <= 0;
        else if (~fifo_wfull) begin
            in_en <= 1;
        end
        else begin
            in_en <= 0;
        end
    end
    
    // data_in
    always@(posedge clkw) begin
        if (~rst) begin
            data_in <= 0;
            data_in_dly <= 0;
        end
        else if (~fifo_wfull) begin
            if (!$feof(data_in_id)) begin   
                $fscanf(data_in_id, "%b\n", data_in_dly);
                data_in <= data_in_dly;
            end
            else begin
                data_in <= 0;
                data_in_dly <= 0;
            end
        end
        else begin
            data_in <= 0;
            data_in_dly <= 0;
        end
    end
    

    
    // input to AD
    always@(posedge clkw) begin
        if (U.data_rdy_dl) begin    
            $fwrite(data_in_ad_id,"%b\n", U.ad_inst.data_in);
        end            
    end
    
     //AD to EC-1
    always@(posedge clkw) begin
        if (U.ec1_inst.in_en) begin    
            $fwrite(data_ad_ec1_id,"%b\n", U.ec1_inst.data_in);
        end            
    end


    BCEDN_TOP U (.clkw(clkw), .clk(clk), .rst(rst), .start(start), .data_in(data_in), .in_en(in_en), .data_out(data_out), .out_en(out_en), .done(done), .fifo_wfull(fifo_wfull));
        
endmodule
