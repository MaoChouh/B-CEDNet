/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the BCEDN_ADAPTER_tb.
*/

`define PARAM_INPUTPATH "F:/Vivado_prj/B-CEDNet/test/BCEDN_ADAPTER_tb/input/"
`define PARAM_OUTPUTPATH "F:/Vivado_prj/B-CEDNet/test/BCEDN_ADAPTER_tb/output/"
`define PARAM_TESTBENCH BCEDN_ADAPTER_tb
`define PARAM_M 1
`define PARAM_P 1
`define PARAM_H 128
`define PARAM_W 32
`define PARAM_D 1
`define PARAM_FH 3
`define PARAM_FW 3
`define PARAM_FD 128
`define PARAM_PAD 1
`define PARAM_STRIDE_H 1
`define PARAM_STRIDE_W 1
`define PARAM_POOL_H 1
`define PARAM_POOL_W 1
`define PARAM_N_PE 2
`define PARAM_DATA_IN_FP_WIDTH 17
`define PARAM_DATA_IN_FP_INT_WIDTH 8
`define PARAM_IN_WINDOW_H 3
`define PARAM_IN_WINDOW_W 3
`define PARAM_NORMREF_WIDTH 22
`define PARAM_IN_WIDTH 784
`define PARAM_PINDEX_WIDTH 1
`define PARAM_CLK_PERIOD 10
`define PARAM_PROCESSING_CYC 2433024
`define PARAM_READOUT_CYC 524288
`define PARAM_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_W_MEM_NAME "AD_W_ROM"
`define PARAM_W_MEM_DEPTH 128
`define PARAM_W_MEM_WIDTH 784
`define PARAM_REF_MEM_NAME "AD_REF_SOFT_ROM"
`define PARAM_REF_SIGN_MEM_NAME "AD_REF_SIGN_ROM"
`define PARAM_ROM_INDEX {1,0}
`define PARAM_REF_MEM_DEPTH 128
`define PARAM_REF_MEM_WIDTH 16
