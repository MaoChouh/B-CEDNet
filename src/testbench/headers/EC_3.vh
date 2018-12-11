/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the EC_3.
*/

`define PARAM_EC_3_INPUTPATH "../../test/EC_3/input/"
`define PARAM_EC_3_OUTPUTPATH "../../test/EC_3/output/"
`define PARAM_EC_3_BLOCK_NAME EC_3
`define PARAM_EC_3_M 1
`define PARAM_EC_3_P 4
`define PARAM_EC_3_H 32
`define PARAM_EC_3_W 8
`define PARAM_EC_3_D 512
`define PARAM_EC_3_FH 3
`define PARAM_EC_3_FW 3
`define PARAM_EC_3_FD 512
`define PARAM_EC_3_PAD 1
`define PARAM_EC_3_STRIDE_H 1
`define PARAM_EC_3_STRIDE_W 1
`define PARAM_EC_3_POOL_H 2
`define PARAM_EC_3_POOL_W 2
`define PARAM_EC_3_N_PE 4
`define PARAM_EC_3_NORMREF_WIDTH 14
`define PARAM_EC_3_INDEX_ADDR_WIDTH 13
`define PARAM_EC_3_PINDEX_WIDTH 4
`define PARAM_EC_3_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_EC_3_W_MEM_NAME "EC_3_W_ROM_F"
`define PARAM_EC_3_REF_MEM_NAME "EC_3_REF_SOFT_ROM"
`define PARAM_EC_3_REF_SIGN_MEM_NAME "EC_3_REF_SIGN_ROM"
//`define PARAM_EC_3_ROM_INDEX {1, 0}
`define PARAM_EC_3_ROM_INDEX {3,2,1, 0}
//`define PARAM_EC_3_MIN_ROM_UNIT_WIDTH 128
`define PARAM_EC_3_MIN_ROM_UNIT_WIDTH 0