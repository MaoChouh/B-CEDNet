`timescale 1ns / 1ps
`include "../../src/testbench/headers/BCEDN_ENDECODER_tb.vh"
/*
    Copyright
    All right reserved.
    Module Name: BCEDN_ENDECODER_tb
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: Testbench for BCEDN_ENDECODER.
*/


module BCEDN_ENDECODER_tb();
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
//    parameter INDEX_ADDR_WIDTH = `PARAM_INDEX_ADDR_WIDTH;
    parameter PINDEX_WIDTH = `PARAM_PINDEX_WIDTH;
//    parameter DATA_OUT_WIDTH = `PARAM_DATA_OUT_WIDTH;
    parameter CLK_PERIOD = `PARAM_CLK_PERIOD;
    parameter PROCESSING_CYC = `PARAM_PROCESSING_CYC;
    parameter READOUT_CYC = `PARAM_PROCESSING_CYC;
    parameter ROM_INST_TYPE = `PARAM_ROM_INST_TYPE;
    parameter W_MEM_NAME = `PARAM_W_MEM_NAME;
    parameter REF_MEM_NAME = `PARAM_REF_MEM_NAME;
//    parameter INDEX_MEM_NAME = `PARAM_INDEX_MEM_NAME;
//    parameter INDEX_DATA_WIDTH = `PARAM_INDEX_DATA_WIDTH;
//    parameter INDEX_DATA_DEPTH = `PARAM_INDEX_DATA_DEPTH;
//    parameter INDEX_INST_TYPE = `PARAM_INDEX_INST_TYPE;
//    parameter INDEX_ROM_INDEX = `PARAM_INDEX_ROM_INDEX;
    parameter integer ROM_INDEX [N_PE-1:0] = `PARAM_ROM_INDEX;
    parameter M = `PARAM_M; // this parameter is used to cover ec_block-4 that has 512 cycle processing delay but
                     // maximum output_count of 1024. M = 1 is applied for ec_block-1 to ec_block-3 and M
                     // = 2 is used to ec_block-4
    parameter P = `PARAM_P; // this parameter is used create time gap between row, 'P = 1' means 'row_count' will increase
                                                              // once 'col_count' reach its maximum.
  
    // inputs
    reg clk, rst, start, in_en;
    reg [D-1:0] data_in;
    
    // outputs
    wire out_en;
    wire [FD-1:0] data_out;
    
    // init
    reg processing;
    integer data_in_id, in_en_id, data_out_id;
    initial begin
        clk = 0; rst = 0; in_en = 0;
        data_in = 0; processing = 0; start = 0;
        data_in_id = $fopen({`PARAM_INPUTPATH, "BCEDN_ENDECODER_tb_data_in.data"}, "r");
        in_en_id = $fopen({`PARAM_INPUTPATH, "BCEDN_ENDECODER_tb_in_en.data"}, "r");
        data_out_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_ENDECODER_tb_data_out.rst"},"wt");
        #(10*CLK_PERIOD)
        rst = 1;
        start = 1;
        processing = 1;
        # CLK_PERIOD
        start = 0;
        # (PROCESSING_CYC*CLK_PERIOD/10)
        processing = 0;
        # (READOUT_CYC*CLK_PERIOD)
        $fclose(data_out_id);
        $finish;
    end
    
    // clk
    always #(CLK_PERIOD/2) clk = ~clk;
    
    // in_en and data_in
    integer in_en_rd;
    always@(posedge clk or endecoder_inst.edc_ctrl_inst.pad_mux_sel) begin
        if (~rst) begin
            in_en <= 0;
            data_in <= 0;
        end
        else begin
            if (processing && !$feof(in_en_id) && ~endecoder_inst.edc_ctrl_inst.pad_mux_sel) begin   
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
    
    initial begin
        $vcdplusfile({`PARAM_OUTPUTPATH, "BCEDN_ENDECODER_tb_waveform.vpd"});
        $vcdpluson;
        $vcdplusmemon(0);
        $vcdplusdeltacycleon(0);
    end
    
    // initiate BCEDN_DECODER
    BCEDN_ENDECODER # (.H(H), .W(W), .D(D), .FH(FH),.FW(FW),.FD(FD),
                     .POOL_H(POOL_H),.POOL_W(POOL_W),.PAD(PAD),
                     .STRIDE_H(STRIDE_H),.STRIDE_W(STRIDE_W), .N_PE(N_PE), 
                     .NORMREF_WIDTH(NORMREF_WIDTH), .INST_TYPE(ROM_INST_TYPE), 
                     .W_MEM_NAME(W_MEM_NAME), .REF_MEM_NAME(REF_MEM_NAME), .ROM_INDEX(ROM_INDEX), .M(M), .P(P))
     endecoder_inst (
                     // input
                     .clk(clk),
                     .rst(rst),
                     .start(start),
                     .in_en(in_en),
                     .data_in(data_in),
                     // output   
                     .data_out(data_out),
                     .tg_next(tg_next),
                     .out_en(out_en)
                     );
    
endmodule
