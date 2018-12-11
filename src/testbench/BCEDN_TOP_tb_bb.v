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


module BCEDN_TOP_tb_bb();

    parameter DATA_IN_WIDTH = `PARAM_DATA_IN_WIDTH;
    parameter DATA_OUT_WIDTH = `PARAM_DATA_OUT_WIDTH;
    parameter CLK_PERIOD = `PARAM_CLK_PERIOD;
    parameter PROCESSING_CYC = `PARAM_PROCESSING_CYC;
    
    // inputs
    reg clk;
    reg rst;
    reg start;
    reg in_en;
    reg [DATA_IN_WIDTH-1:0] data_in;
    // outputs
    wire [DATA_OUT_WIDTH-1:0] data_out;
    wire out_en;
    wire rdy;
    wire done;
    
    // init
    integer data_in_id, in_en_id, data_out_id;
    reg processing;
    initial begin
        clk = 0; rst = 0; in_en = 0; start = 0;
        data_in = 0; processing = 0; start = 0;
        data_in_id = $fopen({`PARAM_INPUTPATH, "BCEDN_TOP_tb_data_in.data"}, "r");
        in_en_id = $fopen({`PARAM_INPUTPATH, "BCEDN_TOP_tb_in_en.data"}, "r");
        data_out_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_out.rst"},"wt");
        #(10*CLK_PERIOD)
        rst = 1;
        start = 1;
        processing = 1;
        # CLK_PERIOD
        start = 0;
        # (PROCESSING_CYC*CLK_PERIOD)
        processing = 0;
        $fclose(data_out_id);
        $fclose(data_in_id);
        $fclose(in_en_id);
        $finish;
    end
    
    // clk
    always #(CLK_PERIOD/2) clk = ~clk;
    
    // in_en and data_in
    integer in_en_rd;
    always@(posedge clk or U.ad_inst.ad_ctrl_inst.pad_mux_sel) begin
        if (~rst) begin
            in_en <= 0;
            data_in <= 0;
        end
        else begin
            if (processing && !$feof(in_en_id) && ~U.ad_inst.ad_ctrl_inst.pad_mux_sel) begin   
                $fscanf(in_en_id, "%b\n", in_en_rd);
                in_en <= in_en_rd;
                if (in_en_rd)
                    $fscanf(data_in_id, "%b\n", data_in);
                else
                    data_in <= 0;
            end
            else begin
                in_en <= 0;
                data_in <= 0;
            end
        end
    end
    
    // 

    initial begin
//        $vcdplusfile({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_waveform.vpd"});
        $vcdplusfile({"/home/tensor_v1/mnt/BCEDN_TMP/", "BCEDN_TOP_tb_waveform.vpd"});
        $vcdpluson;
        $vcdplusmemon(0);
        $vcdplusdeltacycleon(0);
    end

    BCEDN_TOP U (.clk(clk), .rst(rst), .start(start), .data_in(data_in), .in_en(in_en), .data_out(data_out), .out_en(out_en), .rdy(rdy), .done(done));
        
endmodule

