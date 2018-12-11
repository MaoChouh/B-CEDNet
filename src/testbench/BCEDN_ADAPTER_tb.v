//`timescale 1ns / 1ps
//`timescale 1ns / 1ps
//`include "../../src/soft_ip/include/includes.vh"
//`include "../../src/soft_ip/include/util.vh"
//`include "../../src/testbench/headers/BCEDN_TOP_tb.vh"
///*
//    Copyright
//    All right reserved.
//    Module Name: BCEDN_TOP
//    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
//    Description: BCEDN_TOP module.
//*/


//module BCEDN_ADAPTER_tb();

//    parameter DATA_IN_WIDTH = `PARAM_DATA_IN_WIDTH;
//    parameter DATA_OUT_WIDTH = `PARAM_DATA_OUT_WIDTH;
//    parameter CLK_P_PERIOD = `PARAM_CLK_P_PERIOD;
//    parameter CLK_R_PERIOD = `PARAM_CLK_R_PERIOD;
//    parameter PROCESSING_CYC = `PARAM_PROCESSING_CYC;
    
//    // inputs
//    reg clk;
//    wire clkw;
//    reg rst;
//    reg start;
//    reg in_en;
//    reg [DATA_IN_WIDTH-1:0] data_in, data_in_dly;
//    // outputs
//    wire [DATA_OUT_WIDTH-1:0] data_out;
//    wire out_en;
//    wire rdy, fifo_wfull;
//    wire done;
////    wire data_rdy;
    
//    // init
//    integer data_in_id, data_in_ad_id, data_ad_ec1_id;
//    reg processing;
//    initial begin
////        clkw = 0;
//         clk = 0; rst = 0; start = 0; in_en = 0;
//        data_in = 0; processing = 0; start = 0;
//        data_in_id = $fopen({`PARAM_INPUTPATH, "BCEDN_TOP_tb_data_in.data"}, "r");
//        data_in_ad_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_in_ad.rst"},"w");
//        data_ad_ec1_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_ad_ec1.rst"},"w");
//        #(10*CLK_P_PERIOD)
//        rst = 1;
//        #(20*CLK_P_PERIOD)
//        start = 1;
//        processing = 1;
//        # CLK_P_PERIOD
//        start = 0;
//        # (PROCESSING_CYC*CLK_P_PERIOD)
//        processing = 0;
//        $fclose(data_in_id);
//        $fclose(data_in_ad_id);
//        $fclose(data_ad_ec1_id);
//        $finish;
//    end
    

    

    
//    // clkw
////    always #(CLK_P_PERIOD/2) clkw = ~clkw;
    
//    // clk
//    always #(CLK_R_PERIOD/2) clk = ~clk;
    
//    // in_en 
//    always@(posedge clkw) begin
//        if (~rst)
//            in_en <= 0;
//        else if (~fifo_wfull) begin
//            in_en <= 1;
//        end
//        else begin
//            in_en <= 0;
//        end
//    end
    
//    // data_in
//    always@(posedge clkw) begin
//        if (~rst) begin
//            data_in <= 0;
//            data_in_dly <= 0;
//        end
//        else if (~fifo_wfull) begin
//            if (!$feof(data_in_id)) begin   
//                $fscanf(data_in_id, "%b\n", data_in_dly);
//                data_in <= data_in_dly;
//            end
//            else begin
//                data_in <= 0;
//                data_in_dly <= 0;
//            end
//        end
//        else begin
//            data_in <= 0;
//            data_in_dly <= 0;
//        end
//    end
    

    
//    // input to AD
//    always@(posedge clkw) begin
//        if (U.data_rdy_dl) begin    
//            $fwrite(data_in_ad_id,"%b\n", U.ad_inst.data_in);
//        end            
//    end
    
//     //AD to EC-1
//    always@(posedge clkw) begin
//        if (U.ad_inst.out_en) begin    
//            $fwrite(data_ad_ec1_id,"%b\n", U.ad_inst.data_out);
//        end            
//    end


//    BCEDN_TOP U (.clkw(clkw), .clk(clk), .rst(rst), .start(start), .data_in(data_in), .in_en(in_en), .data_out(data_out), .out_en(out_en), .done(done), .fifo_wfull(fifo_wfull));
        
//endmodule




`timescale 1ns / 1ps
`include "../../src/testbench/headers/BCEDN_ADAPTER_tb.vh"
/*
    Copyright
    All right reserved.
    Module Name: BCEDN_ADAPTOR_tb
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: Testbench for BCEDN_ADAPTOR.
*/


module BCEDN_ADAPTER_tb();
    parameter H = `PARAM_H;
    parameter W = `PARAM_W;
    parameter D = `PARAM_D;
    parameter FH = `PARAM_FH;
    parameter FW = `PARAM_FW;
    parameter FD = `PARAM_FD;
    parameter PAD = `PARAM_PAD;
    parameter STRIDE_H = `PARAM_STRIDE_H;
    parameter STRIDE_W = `PARAM_STRIDE_W;
    parameter POOL_H = `PARAM_POOL_H;
    parameter POOL_W = `PARAM_POOL_W;
    parameter N_PE = `PARAM_N_PE;
    parameter NORMREF_WIDTH = `PARAM_NORMREF_WIDTH;
    parameter DATA_IN_FP_WIDTH = `PARAM_DATA_IN_FP_WIDTH;
    parameter DATA_IN_FP_INT_WIDTH = `PARAM_DATA_IN_FP_INT_WIDTH;
    parameter W_MEM_NAME = `PARAM_W_MEM_NAME;
    parameter REF_MEM_NAME = `PARAM_REF_MEM_NAME;
    parameter REF_SIGN_MEM_NAME = `PARAM_REF_SIGN_MEM_NAME;
    parameter ROM_INST_TYPE = `PARAM_ROM_INST_TYPE;
    parameter CLK_PERIOD = `PARAM_CLK_PERIOD;
    parameter PROCESSING_CYC = `PARAM_PROCESSING_CYC;
    parameter integer ROM_INDEX [N_PE-1:0] = `PARAM_ROM_INDEX;
    parameter M = `PARAM_M; // this parameter is used to cover ec_block-4 that has 512 cycle processing delay but
                     // maximum output_count of 1024. M = 1 is applied for ec_block-1 to ec_block-3 and M
                     // = 2 is used to ec_block-4
    parameter P = `PARAM_P; // this parameter is used create time gap between row, 'P = 1' means 'row_count' will increase
                                                              // once 'col_count' reach its maximum.
    // inputs
    reg clk, rst, in_en, start;
    reg [DATA_IN_FP_WIDTH-1:0] data_in;
    
    // outputs
    wire out_en;
    wire [FD-1:0] data_out;
    wire data_rdy;
    // init
    integer data_in_id, in_en_id, data_out_id;
    reg processing;
    initial begin
        clk = 0; rst = 0; in_en = 0; start = 0;
        data_in = 0; processing = 0; start = 0;
        data_in_id = $fopen({`PARAM_INPUTPATH, "BCEDN_ADAPTER_tb_data_in.data"}, "r");
        in_en_id = $fopen({`PARAM_INPUTPATH, "BCEDN_ADAPTER_tb_in_en.data"}, "r");
        data_out_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_ADAPTER_tb_data_out.rst"},"w");
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
    always@(posedge clk or adapter_inst.ad_ctrl_inst.pad_mux_sel) begin
        if (~rst) begin
            in_en <= 0;
            data_in <= 0;
        end
        else begin
            if (processing && !$feof(in_en_id) && ~adapter_inst.ad_ctrl_inst.pad_mux_sel) begin   
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
    
    always@(posedge clk) begin
        if (out_en) begin    
            $fwrite(data_out_id,"%b\n", data_out);
        end            
    end
//    initial begin
//        $vcdplusfile({`PARAM_OUTPUTPATH, "BCEDN_ADAPTER_tb_waveform.vpd"});
//        $vcdpluson;
//        $vcdplusmemon(0);
//        $vcdplusdeltacycleon(0);
//    end

    
    BCEDN_ADAPTER # (.H(H), .W(W), .D(D), .FH(FH), .FW(FW), .FD(FD), .PAD(PAD),
                     .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W), .POOL_H(POOL_H), .POOL_W(POOL_W),
                     .NORMREF_WIDTH(NORMREF_WIDTH),
                     .DATA_IN_FP_WIDTH(DATA_IN_FP_WIDTH),
                     .N_PE(N_PE), .W_MEM_NAME(W_MEM_NAME), .REF_MEM_NAME(REF_MEM_NAME),.REF_SIGN_MEM_NAME(REF_SIGN_MEM_NAME),
                     .INST_TYPE(ROM_INST_TYPE),.ROM_INDEX(ROM_INDEX),  .M(M), .P(P))
     adapter_inst (
                     // inputs
                     .clk(clk),
                     .rst(rst),
                     .in_en(in_en),
                     .start(start),
                     .data_in(data_in),
                     // outputs
                     .tg_next(tg_next),
                     .data_out(data_out),
                     .out_en(out_en),
                     .data_rdy(data_rdy)
                     );
    
endmodule

