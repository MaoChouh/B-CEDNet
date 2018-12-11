/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the DC_6.
*/

`define PARAM_DC_6_INPUTPATH "../../test/DC_6/input/"
`define PARAM_DC_6_OUTPUTPATH "../../test/DC_6/output/"
`define PARAM_DC_6_BLOCK_NAME DC_6
`define PARAM_DC_6_M 1
`define PARAM_DC_6_P 4
`define PARAM_DC_6_H 32
`define PARAM_DC_6_W 8
`define PARAM_DC_6_D 512
`define PARAM_DC_6_FH 3
`define PARAM_DC_6_FW 3
`define PARAM_DC_6_FD 512
`define PARAM_DC_6_PAD 1
`define PARAM_DC_6_STRIDE_H 1
`define PARAM_DC_6_STRIDE_W 1
`define PARAM_DC_6_POOL_H 2
`define PARAM_DC_6_POOL_W 2
`define PARAM_DC_6_N_PE 8
`define PARAM_DC_6_REF_WIDTH_FROM_NET 11
`define PARAM_DC_6_NORMREF_WIDTH 14
`define PARAM_DC_6_INDEX_ADDR_WIDTH 14
`define PARAM_DC_6_PINDEX_WIDTH 2
`define PARAM_DC_6_DATA_OUT_WIDTH 512
`define PARAM_DC_6_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_DC_6_W_MEM_NAME "DC_6_W_ROM_F"
`define PARAM_DC_6_REF_MEM_NAME "DC_6_REF_ROM"
`define PARAM_DC_6_REF_SIGN_MEM_NAME "DC_6_REF_SIGN_ROM"
//`define PARAM_DC_6_ROM_INDEX {3, 2, 1, 0}
`define PARAM_DC_6_ROM_INDEX {7,6,5,4,3, 2, 1, 0}
//`define PARAM_DC_6_MIN_ROM_UNIT_WIDTH 128
`define PARAM_DC_6_MIN_ROM_UNIT_WIDTH 0