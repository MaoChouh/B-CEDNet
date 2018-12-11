/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the EC_1.
*/

`define PARAM_EC_1_INPUTPATH "../../test/EC_1/input/"
`define PARAM_EC_1_OUTPUTPATH "../../test/EC_1/output/"
`define PARAM_EC_1_BLOCK_NAME EC_1
`define PARAM_EC_1_M 1
`define PARAM_EC_1_P 1
`define PARAM_EC_1_H 128
`define PARAM_EC_1_W 32
`define PARAM_EC_1_D 128
`define PARAM_EC_1_FH 3
`define PARAM_EC_1_FW 3
`define PARAM_EC_1_FD 512
`define PARAM_EC_1_PAD 1
`define PARAM_EC_1_STRIDE_H 1
`define PARAM_EC_1_STRIDE_W 1
`define PARAM_EC_1_POOL_H 2
`define PARAM_EC_1_POOL_W 2
`define PARAM_EC_1_N_PE 16
`define PARAM_EC_1_NORMREF_WIDTH 12
`define PARAM_EC_1_IN_WINDOW_H 4
`define PARAM_EC_1_IN_WINDOW_W 4
`define PARAM_EC_1_INDEX_ADDR_WIDTH 15
`define PARAM_EC_1_PINDEX_WIDTH 2
`define PARAM_EC_1_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_EC_1_W_MEM_NAME "EC_1_W_ROM_F"
`define PARAM_EC_1_REF_MEM_NAME "EC_1_REF_ROM"
`define PARAM_EC_1_REF_SIGN_MEM_NAME "EC_1_REF_SIGN_ROM"
//`define PARAM_EC_1_ROM_INDEX {7,6,5,4, 3, 2, 1, 0}
`define PARAM_EC_1_ROM_INDEX {15,14,13,12,11,10,9,8,7,6,5,4, 3, 2, 1, 0}
//`define PARAM_EC_1_MIN_ROM_UNIT_WIDTH 96
`define PARAM_EC_1_MIN_ROM_UNIT_WIDTH 0

