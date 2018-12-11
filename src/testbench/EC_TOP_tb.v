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


module EC_TOP_tb();

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
//    reg [DATA_IN_WIDTH-1:0] data_in, data_in_dly;
    reg [512-1:0] data_in, data_in_dly;
    // outputs
    wire [512-1:0] data_out;
    wire out_en;
    wire rdy, fifo_wfull;
    wire done;
//    wire data_rdy;
    
    // init
    integer data_in_id, data_in_ad_id, data_ad_ec1_id, data_ec1_ec2_id, data_ec2_ec3_id, data_ec3_ec4_id, data_ec4_dc5_id,
            data_dc5_dc6_id, data_dc6_dc7_id, data_dc7_dc8_id, data_dc8_dc9_id, data_dc9_dc10_id, data_dc10_out_id;
    integer ad_conv_out_id_0, ad_conv_out_id_1, ad_normref_id_0, ad_normref_id_1, ad_normsign_id_0, ad_normsign_id_1, ad_weights_id_0, 
            ad_weights_id_1, ad_fmap_in_id_0, ad_fmap_in_id_1, ad_mult_out_id_0, ad_mult_out_id_1;
    integer ec1_fmap_id_0_0,ec1_fmap_id_0_1, ec1_fmap_id_1_0,ec1_fmap_id_1_1, ec1_w_id_0_0,ec1_w_id_0_1, ec1_w_id_1_0,ec1_w_id_1_1,
            ec1_conv_out_id_0_0,ec1_conv_out_id_0_1,ec1_conv_out_id_1_0,ec1_conv_out_id_1_1;
    reg processing;
    initial begin
         clk = 0; rst = 0; start = 0; in_en = 0;
        data_in = 0; processing = 0; start = 0;
        data_ec3_ec4_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_ec3_ec4.rst"},"r");
        data_ec4_dc5_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_ec4_dc5.rst"},"w");
        #(10*CLK_P_PERIOD)
        rst = 1;
        #(20*CLK_P_PERIOD)
        start = 1;
        processing = 1;
        # CLK_P_PERIOD
        start = 0;
        # (PROCESSING_CYC*CLK_P_PERIOD)
        processing = 0;
        $fclose(data_ec3_ec4_id);
        $fclose(data_ec4_dc5_id);
        $finish;
    end

    
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
            if (!$feof(data_ec3_ec4_id)) begin   
                $fscanf(data_ec3_ec4_id, "%b\n", data_in_dly);
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
    
    
    // EC-4 to DC-5
    always@(posedge clkw) begin
        if (U.ec4_inst.out_en) begin    
            $fwrite(data_ec4_dc5_id,"%b\n", U.ec4_inst.data_out);
        end            
    end
    

   EC_TOP U (.clkw(clkw), .clk(clk), .rst(rst), .start(start), .data_in(data_in), .in_en(in_en), .data_out(data_out), .out_en(out_en), .done(done), .fifo_wfull(fifo_wfull));
        
endmodule
