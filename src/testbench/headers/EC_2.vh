/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the EC_2.
*/

`define PARAM_EC_2_INPUTPATH "../../test/EC_2/input/"
`define PARAM_EC_2_OUTPUTPATH "../../test/EC_2/output/"
`define PARAM_EC_2_BLOCK_NAME EC_2
`define PARAM_EC_2_M 1
`define PARAM_EC_2_P 2
`define PARAM_EC_2_H 64
`define PARAM_EC_2_W 16
`define PARAM_EC_2_D 512
`define PARAM_EC_2_FH 3
`define PARAM_EC_2_FW 3
`define PARAM_EC_2_FD 512
`define PARAM_EC_2_PAD 1
`define PARAM_EC_2_STRIDE_H 1
`define PARAM_EC_2_STRIDE_W 1
`define PARAM_EC_2_POOL_H 2
`define PARAM_EC_2_POOL_W 2
`define PARAM_EC_2_N_PE 8
`define PARAM_EC_2_NORMREF_WIDTH 14
`define PARAM_EC_2_INDEX_ADDR_WIDTH 14
`define PARAM_EC_2_PINDEX_WIDTH 2
`define PARAM_EC_2_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_EC_2_W_MEM_NAME "EC_2_W_ROM_F"
`define PARAM_EC_2_REF_MEM_NAME "EC_2_REF_ROM"
`define PARAM_EC_2_REF_SIGN_MEM_NAME "EC_2_REF_SIGN_ROM"
//`define PARAM_EC_2_ROM_INDEX {3, 2, 1, 0}
`define PARAM_EC_2_ROM_INDEX {7,6,5,4,3, 2, 1, 0}
//`define PARAM_EC_2_MIN_ROM_UNIT_WIDTH 128
`define PARAM_EC_2_MIN_ROM_UNIT_WIDTH 0