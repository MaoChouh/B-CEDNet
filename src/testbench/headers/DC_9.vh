/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the DC_9.
*/

`define PARAM_DC_9_INPUTPATH "../../test/DC_9/input/"
`define PARAM_DC_9_OUTPUTPATH "../../test/DC_9/output/"
`define PARAM_DC_9_BLOCK_NAME DC_9
`define PARAM_DC_9_M 1
`define PARAM_DC_9_P 1
`define PARAM_DC_9_H 128
`define PARAM_DC_9_W 32
`define PARAM_DC_9_D 512
`define PARAM_DC_9_FH 1
`define PARAM_DC_9_FW 1
`define PARAM_DC_9_FD 512
`define PARAM_DC_9_PAD 1
`define PARAM_DC_9_STRIDE_H 1
`define PARAM_DC_9_STRIDE_W 1
`define PARAM_DC_9_POOL_H 1
`define PARAM_DC_9_POOL_W 1
`define PARAM_DC_9_N_PE 16
`define PARAM_DC_9_NORMREF_WIDTH 11
`define PARAM_DC_9_INDEX_ADDR_WIDTH 18
`define PARAM_DC_9_PINDEX_WIDTH 0
`define PARAM_DC_9_DATA_OUT_WIDTH 512
`define PARAM_DC_9_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_DC_9_W_MEM_NAME "DC_9_W_ROM"
`define PARAM_DC_9_REF_MEM_NAME "DC_9_REF_ROM"
`define PARAM_DC_9_REF_SIGN_MEM_NAME "DC_9_REF_SIGN_ROM"
//`define PARAM_DC_9_ROM_INDEX {7, 6, 5, 4, 3, 2, 1, 0}
`define PARAM_DC_9_ROM_INDEX {15,14,13,12,11,10,9,8,7,6,5,4, 3, 2, 1, 0}