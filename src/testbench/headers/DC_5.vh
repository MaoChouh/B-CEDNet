/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the DC_5.
*/

`define PARAM_DC_5_INPUTPATH "../../test/DC_5/input/"
`define PARAM_DC_5_OUTPUTPATH "../../test/DC_5/output/"
`define PARAM_DC_5_BLOCK_NAME DC_5
`define PARAM_DC_5_M 1
`define PARAM_DC_5_P 8
`define PARAM_DC_5_H 16
`define PARAM_DC_5_W 4
`define PARAM_DC_5_D 512
`define PARAM_DC_5_FH 3
`define PARAM_DC_5_FW 3
`define PARAM_DC_5_FD 512
`define PARAM_DC_5_PAD 1
`define PARAM_DC_5_STRIDE_H 1
`define PARAM_DC_5_STRIDE_W 1
`define PARAM_DC_5_POOL_H 2
`define PARAM_DC_5_POOL_W 2
`define PARAM_DC_5_N_PE 4
`define PARAM_DC_5_NORMREF_WIDTH 14
`define PARAM_DC_5_INDEX_ADDR_WIDTH 13
`define PARAM_DC_5_PINDEX_WIDTH 2
`define PARAM_DC_5_DATA_OUT_WIDTH 512
`define PARAM_DC_5_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_DC_5_W_MEM_NAME "DC_5_W_ROM_F"
`define PARAM_DC_5_REF_MEM_NAME "DC_5_REF_ROM"
`define PARAM_DC_5_REF_SIGN_MEM_NAME "DC_5_REF_SIGN_ROM"
//`define PARAM_DC_5_ROM_INDEX {1, 0}
`define PARAM_DC_5_ROM_INDEX {3,2,1, 0}
//`define PARAM_DC_5_MIN_ROM_UNIT_WIDTH 128
`define PARAM_DC_5_MIN_ROM_UNIT_WIDTH 0