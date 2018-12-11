/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the DC_8.
*/

`define PARAM_DC_8_INPUTPATH "../../test/DC_8/input/"
`define PARAM_DC_8_OUTPUTPATH "../../test/DC_8/output/"
`define PARAM_DC_8_BLOCK_NAME DC_8
`define PARAM_DC_8_M 1
`define PARAM_DC_8_P 1
`define PARAM_DC_8_H 128
`define PARAM_DC_8_W 32
`define PARAM_DC_8_D 512
`define PARAM_DC_8_FH 3
`define PARAM_DC_8_FW 3
`define PARAM_DC_8_FD 512
`define PARAM_DC_8_PAD 1
`define PARAM_DC_8_STRIDE_H 1
`define PARAM_DC_8_STRIDE_W 1
`define PARAM_DC_8_POOL_H 1
`define PARAM_DC_8_POOL_W 1
`define PARAM_DC_8_N_PE 16
`define PARAM_DC_8_NORMREF_WIDTH 14
`define PARAM_DC_8_INDEX_ADDR_WIDTH 17
`define PARAM_DC_8_PINDEX_WIDTH 0
`define PARAM_DC_8_DATA_OUT_WIDTH 512
`define PARAM_DC_8_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_DC_8_W_MEM_NAME "DC_8_W_ROM_F"
`define PARAM_DC_8_REF_MEM_NAME "DC_8_REF_ROM"
`define PARAM_DC_8_REF_SIGN_MEM_NAME "DC_8_REF_SIGN_ROM"
//`define PARAM_DC_8_ROM_INDEX {7, 6, 5, 4, 3, 2, 1, 0}
`define PARAM_DC_8_ROM_INDEX {15,14,13,12,11,10,9,8,7,6,5,4, 3, 2, 1, 0}
//`define PARAM_DC_8_MIN_ROM_UNIT_WIDTH 128
`define PARAM_DC_8_MIN_ROM_UNIT_WIDTH 0
