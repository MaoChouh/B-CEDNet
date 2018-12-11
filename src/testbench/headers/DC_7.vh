/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the DC_7.
*/

`define PARAM_DC_7_INPUTPATH "../../test/DC_7/input/"
`define PARAM_DC_7_OUTPUTPATH "../../test/DC_7/output/"
`define PARAM_DC_7_BLOCK_NAME DC_7
`define PARAM_DC_7_M 1
`define PARAM_DC_7_P 2
`define PARAM_DC_7_H 64
`define PARAM_DC_7_W 16
`define PARAM_DC_7_D 512
`define PARAM_DC_7_FH 3
`define PARAM_DC_7_FW 3
`define PARAM_DC_7_FD 512
`define PARAM_DC_7_PAD 1
`define PARAM_DC_7_STRIDE_H 1
`define PARAM_DC_7_STRIDE_W 1
`define PARAM_DC_7_POOL_H 2
`define PARAM_DC_7_POOL_W 2
`define PARAM_DC_7_N_PE 16
`define PARAM_DC_7_NORMREF_WIDTH 14
`define PARAM_DC_7_INDEX_ADDR_WIDTH 15
`define PARAM_DC_7_PINDEX_WIDTH 2
`define PARAM_DC_7_DATA_OUT_WIDTH 512
`define PARAM_DC_7_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_DC_7_W_MEM_NAME "DC_7_W_ROM_F"
`define PARAM_DC_7_REF_MEM_NAME "DC_7_REF_ROM"
`define PARAM_DC_7_REF_SIGN_MEM_NAME "DC_7_REF_SIGN_ROM"
//`define PARAM_DC_7_ROM_INDEX {7 ,6 ,5, 4, 3, 2, 1, 0}
`define PARAM_DC_7_ROM_INDEX {15,14,13,12,11,10,9,8,7,6,5,4, 3, 2, 1, 0}
//`define PARAM_DC_7_MIN_ROM_UNIT_WIDTH 128
`define PARAM_DC_7_MIN_ROM_UNIT_WIDTH 0