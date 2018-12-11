/*
Copyright
All right reserved.
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description: This is the header file for configure the AD.
*/

`define PARAM_AD_INPUTPATH "../../test/AD/input/"
`define PARAM_AD_OUTPUTPATH "../../test/AD/output/"
`define PARAM_AD_BLOCK_NAME AD
`define PARAM_AD_M 1
`define PARAM_AD_P 1
`define PARAM_AD_H 128
`define PARAM_AD_W 32
`define PARAM_AD_D 1
`define PARAM_AD_FH 3
`define PARAM_AD_FW 3
`define PARAM_AD_FD 128
`define PARAM_AD_PAD 1
`define PARAM_AD_STRIDE_H 1
`define PARAM_AD_STRIDE_W 1
`define PARAM_AD_POOL_H 1
`define PARAM_AD_POOL_W 1
`define PARAM_AD_N_PE 4
`define PARAM_AD_INPUT_WIDTH 8
`define PARAM_AD_DATA_IN_FP_FRAC_WIDTH 8
`define PARAM_AD_DATA_IN_FP_WIDTH 17
`define PARAM_AD_WEIGHT_WIDTH 17
`define PARAM_AD_WEIGHT_FRAC_WIDTH 8
`define PARAM_AD_NORMREF_WIDTH 22
`define PARAM_AD_IN_WINDOW_H 3
`define PARAM_AD_IN_WINDOW_W 3
`define PARAM_AD_IN_WIDTH 153
`define PARAM_AD_PINDEX_WIDTH 1
`define PARAM_AD_ROM_INST_TYPE "FULL_SOFT"
`define PARAM_AD_W_MEM_NAME "AD_W_ROM"
`define PARAM_AD_REF_MEM_NAME "AD_REF_ROM"
`define PARAM_AD_REF_SIGN_MEM_NAME "AD_REF_SIGN_ROM"
`define PARAM_AD_ROM_INDEX {3,2,1, 0}
//`define PARAM_AD_ROM_INDEX {1,0}
