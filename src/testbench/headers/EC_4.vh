/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the EC_4.
*/

`define PARAM_EC_4_INPUTPATH "../../test/EC_4/input/"
`define PARAM_EC_4_OUTPUTPATH "../../test/EC_4/output/"
`define PARAM_EC_4_BLOCK_NAME EC_4
`define PARAM_EC_4_M 1
`define PARAM_EC_4_P 8
`define PARAM_EC_4_H 16
`define PARAM_EC_4_W 4
`define PARAM_EC_4_D 512
`define PARAM_EC_4_FH 3
`define PARAM_EC_4_FW 3
`define PARAM_EC_4_FD 512
`define PARAM_EC_4_PAD 1
`define PARAM_EC_4_STRIDE_H 1
`define PARAM_EC_4_STRIDE_W 1
`define PARAM_EC_4_POOL_H 2
`define PARAM_EC_4_POOL_W 2
`define PARAM_EC_4_N_PE 2
`define PARAM_EC_4_NORMREF_WIDTH 14
`define PARAM_EC_4_INDEX_ADDR_WIDTH 12
`define PARAM_EC_4_PINDEX_WIDTH 2
`define PARAM_EC_4_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_EC_4_W_MEM_NAME "EC_4_W_ROM_F"
`define PARAM_EC_4_REF_MEM_NAME "EC_4_REF_SOFT_ROM"
`define PARAM_EC_4_REF_SIGN_MEM_NAME "EC_4_REF_SIGN_ROM"
//`define PARAM_EC_4_ROM_INDEX {0}
`define PARAM_EC_4_ROM_INDEX {1,0}
//`define PARAM_EC_4_MIN_ROM_UNIT_WIDTH 128
`define PARAM_EC_4_MIN_ROM_UNIT_WIDTH 0