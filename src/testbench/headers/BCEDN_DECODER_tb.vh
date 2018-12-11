/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the BCEDN_DECODER_tb.
*/

`define PARAM_INPUTPATH "../../test/BCEDN_DECODER_tb/input/"
`define PARAM_OUTPUTPATH "../../test/BCEDN_DECODER_tb/output/"
`define PARAM_TESTBENCH BCEDN_DECODER_tb
`define PARAM_M 1
`define PARAM_P 2
`define PARAM_H 32
`define PARAM_W 128
`define PARAM_D 512
`define PARAM_FH 3
`define PARAM_FW 3
`define PARAM_FD 512
`define PARAM_PAD 1
`define PARAM_STRIDE_H 1
`define PARAM_STRIDE_W 1
`define PARAM_POOL_H 1
`define PARAM_POOL_W 1
`define PARAM_N_PE 4
`define PARAM_NORMREF_WIDTH 15
`define PARAM_INDEX_ADDR_WIDTH 19
`define PARAM_PINDEX_WIDTH 0
`define PARAM_DATA_OUT_WIDTH 512
`define PARAM_CLK_PERIOD 10
`define PARAM_PROCESSING_CYC 1131520
`define PARAM_READOUT_CYC 524288
`define PARAM_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_W_MEM_NAME "DC_W_ROM"
`define PARAM_REF_MEM_NAME "DC_REF_SOFT_ROM"
`define PARAM_ROM_INDEX {"3", "2", "1", "0"}
`define PARAM_INDEX_ROM_INDEX "0"
`define PARAM_INDEX_MEM_NAME "INDEX_ROM"
`define PARAM_INDEX_INST_TYPE "FULL_SOFT"
`define PARAM_INDEX_DATA_DEPTH 524288
`define PARAM_INDEX_DATA_WIDTH 0
