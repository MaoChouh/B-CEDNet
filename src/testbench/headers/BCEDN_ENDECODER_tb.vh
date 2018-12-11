/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the BCEDN_ENDECODER_tb.
*/

`define PARAM_INPUTPATH "../../test/BCEDN_ENDECODER_tb/input/"
`define PARAM_OUTPUTPATH "../../test/BCEDN_ENDECODER_tb/output/"
`define PARAM_TESTBENCH BCEDN_ENDECODER_tb
`define PARAM_M 1
`define PARAM_P 1
`define PARAM_H 4
`define PARAM_W 16
`define PARAM_D 512
`define PARAM_FH 3
`define PARAM_FW 3
`define PARAM_FD 512
`define PARAM_PAD 1
`define PARAM_STRIDE_H 1
`define PARAM_STRIDE_W 1
`define PARAM_POOL_H 2
`define PARAM_POOL_W 2
`define PARAM_N_PE 1
`define PARAM_IN_WINDOW_H 4
`define PARAM_IN_WINDOW_W 4
`define PARAM_NORMREF_WIDTH 15
`define PARAM_IN_WIDTH 8192
`define PARAM_PINDEX_WIDTH 2
`define PARAM_CLK_PERIOD 10
`define PARAM_PROCESSING_CYC 221184
`define PARAM_READOUT_CYC 8192
`define PARAM_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_W_MEM_NAME "EDC_W_ROM"
`define PARAM_W_MEM_DEPTH 512
`define PARAM_W_MEM_WIDTH 8192
`define PARAM_REF_MEM_NAME "EDC_REF_ROM"
`define PARAM_ROM_INDEX {"0"}
`define PARAM_REF_MEM_DEPTH 512
`define PARAM_REF_MEM_WIDTH 15
`define PARAM_PRELOADFILE ""
