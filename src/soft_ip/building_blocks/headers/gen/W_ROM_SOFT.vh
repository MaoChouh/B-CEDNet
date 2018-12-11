/*
Copyright
All right reserved.
Module Name: ROM_HEADER
Author  : Zichuan Liu, Yixing Li and Wenye Liu.
Description:
A synthesized ROM header.
*/
`define GEN_ROM_SOFT generate\
	if (MEM_NAME == "") begin\
	end\
	else if ({MEM_NAME} == "TOP_MEAN_ROM" && MEM_INDEX == 0) begin\
		TOP_MEAN_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "AD_W_ROM" && MEM_INDEX == 0) begin\
		AD_W_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "AD_W_ROM" && MEM_INDEX == 1) begin\
		AD_W_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "AD_W_ROM" && MEM_INDEX == 2) begin\
        AD_W_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
        end\
    else if ({MEM_NAME} == "AD_W_ROM" && MEM_INDEX == 3) begin\
        AD_W_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
        end\
	else if ({MEM_NAME} == "AD_REF_ROM" && MEM_INDEX == 0) begin\
		AD_REF_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "AD_REF_ROM" && MEM_INDEX == 1) begin\
		AD_REF_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "AD_REF_ROM" && MEM_INDEX == 2) begin\
		AD_REF_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "AD_REF_ROM" && MEM_INDEX == 3) begin\
		AD_REF_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "AD_REF_SIGN_ROM" && MEM_INDEX == 0) begin\
		AD_REF_SIGN_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "AD_REF_SIGN_ROM" && MEM_INDEX == 1) begin\
		AD_REF_SIGN_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "AD_REF_SIGN_ROM" && MEM_INDEX == 2) begin\
		AD_REF_SIGN_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "AD_REF_SIGN_ROM" && MEM_INDEX == 3) begin\
		AD_REF_SIGN_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 0) begin\
		EC_1_W_ROM_F_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 1) begin\
		EC_1_W_ROM_F_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 2) begin\
		EC_1_W_ROM_F_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 3) begin\
		EC_1_W_ROM_F_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 4) begin\
		EC_1_W_ROM_F_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 5) begin\
		EC_1_W_ROM_F_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 6) begin\
		EC_1_W_ROM_F_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 7) begin\
		EC_1_W_ROM_F_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 8) begin\
        EC_1_W_ROM_F_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 9) begin\
        EC_1_W_ROM_F_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 10) begin\
        EC_1_W_ROM_F_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 11) begin\
        EC_1_W_ROM_F_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 12) begin\
        EC_1_W_ROM_F_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 13) begin\
        EC_1_W_ROM_F_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 14) begin\
        EC_1_W_ROM_F_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_W_ROM_F" && MEM_INDEX == 15) begin\
        EC_1_W_ROM_F_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 0) begin\
		EC_1_REF_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 1) begin\
		EC_1_REF_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 2) begin\
		EC_1_REF_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 3) begin\
		EC_1_REF_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 4) begin\
		EC_1_REF_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 5) begin\
		EC_1_REF_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 6) begin\
		EC_1_REF_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 7) begin\
		EC_1_REF_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 8) begin\
        EC_1_REF_ROM_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 9) begin\
        EC_1_REF_ROM_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 10) begin\
        EC_1_REF_ROM_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 11) begin\
        EC_1_REF_ROM_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 12) begin\
        EC_1_REF_ROM_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 13) begin\
        EC_1_REF_ROM_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 14) begin\
        EC_1_REF_ROM_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_ROM" && MEM_INDEX == 15) begin\
        EC_1_REF_ROM_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 0) begin\
		EC_1_REF_SIGN_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 1) begin\
		EC_1_REF_SIGN_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 2) begin\
		EC_1_REF_SIGN_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 3) begin\
		EC_1_REF_SIGN_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 4) begin\
		EC_1_REF_SIGN_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 5) begin\
		EC_1_REF_SIGN_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 6) begin\
		EC_1_REF_SIGN_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 7) begin\
		EC_1_REF_SIGN_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 8) begin\
        EC_1_REF_SIGN_ROM_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 9) begin\
        EC_1_REF_SIGN_ROM_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 10) begin\
        EC_1_REF_SIGN_ROM_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 11) begin\
        EC_1_REF_SIGN_ROM_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 12) begin\
        EC_1_REF_SIGN_ROM_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 13) begin\
        EC_1_REF_SIGN_ROM_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 14) begin\
        EC_1_REF_SIGN_ROM_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_1_REF_SIGN_ROM" && MEM_INDEX == 15) begin\
        EC_1_REF_SIGN_ROM_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_2_W_ROM_F" && MEM_INDEX == 0) begin\
		EC_2_W_ROM_F_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_W_ROM_F" && MEM_INDEX == 1) begin\
		EC_2_W_ROM_F_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_W_ROM_F" && MEM_INDEX == 2) begin\
		EC_2_W_ROM_F_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_W_ROM_F" && MEM_INDEX == 3) begin\
		EC_2_W_ROM_F_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_W_ROM_F" && MEM_INDEX == 4) begin\
        EC_2_W_ROM_F_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_2_W_ROM_F" && MEM_INDEX == 5) begin\
        EC_2_W_ROM_F_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_2_W_ROM_F" && MEM_INDEX == 6) begin\
        EC_2_W_ROM_F_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_2_W_ROM_F" && MEM_INDEX == 7) begin\
        EC_2_W_ROM_F_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_2_REF_ROM" && MEM_INDEX == 0) begin\
		EC_2_REF_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_REF_ROM" && MEM_INDEX == 1) begin\
		EC_2_REF_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_REF_ROM" && MEM_INDEX == 2) begin\
		EC_2_REF_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_REF_ROM" && MEM_INDEX == 3) begin\
		EC_2_REF_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_REF_ROM" && MEM_INDEX == 4) begin\
        EC_2_REF_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_2_REF_ROM" && MEM_INDEX == 5) begin\
        EC_2_REF_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_2_REF_ROM" && MEM_INDEX == 6) begin\
        EC_2_REF_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_2_REF_ROM" && MEM_INDEX == 7) begin\
        EC_2_REF_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_2_REF_SIGN_ROM" && MEM_INDEX == 0) begin\
		EC_2_REF_SIGN_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_REF_SIGN_ROM" && MEM_INDEX == 1) begin\
		EC_2_REF_SIGN_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_REF_SIGN_ROM" && MEM_INDEX == 2) begin\
		EC_2_REF_SIGN_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_REF_SIGN_ROM" && MEM_INDEX == 3) begin\
		EC_2_REF_SIGN_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_2_REF_SIGN_ROM" && MEM_INDEX == 4) begin\
        EC_2_REF_SIGN_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_2_REF_SIGN_ROM" && MEM_INDEX == 5) begin\
        EC_2_REF_SIGN_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_2_REF_SIGN_ROM" && MEM_INDEX == 6) begin\
        EC_2_REF_SIGN_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_2_REF_SIGN_ROM" && MEM_INDEX == 7) begin\
        EC_2_REF_SIGN_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_3_W_ROM_F" && MEM_INDEX == 0) begin\
		EC_3_W_ROM_F_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_3_W_ROM_F" && MEM_INDEX == 1) begin\
		EC_3_W_ROM_F_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_3_W_ROM_F" && MEM_INDEX == 2) begin\
        EC_3_W_ROM_F_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_3_W_ROM_F" && MEM_INDEX == 3) begin\
        EC_3_W_ROM_F_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_3_REF_SOFT_ROM" && MEM_INDEX == 0) begin\
		EC_3_REF_SOFT_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_3_REF_SOFT_ROM" && MEM_INDEX == 1) begin\
		EC_3_REF_SOFT_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_3_REF_SOFT_ROM" && MEM_INDEX == 2) begin\
        EC_3_REF_SOFT_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_3_REF_SOFT_ROM" && MEM_INDEX == 3) begin\
        EC_3_REF_SOFT_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_3_REF_SIGN_ROM" && MEM_INDEX == 0) begin\
		EC_3_REF_SIGN_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_3_REF_SIGN_ROM" && MEM_INDEX == 1) begin\
		EC_3_REF_SIGN_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_3_REF_SIGN_ROM" && MEM_INDEX == 2) begin\
        EC_3_REF_SIGN_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_3_REF_SIGN_ROM" && MEM_INDEX == 3) begin\
        EC_3_REF_SIGN_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_4_W_ROM_F" && MEM_INDEX == 0) begin\
		EC_4_W_ROM_F_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_4_W_ROM_F" && MEM_INDEX == 1) begin\
        EC_4_W_ROM_F_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_4_W_ROM_F" && MEM_INDEX == 2) begin\
        EC_4_W_ROM_F_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_4_W_ROM_F" && MEM_INDEX == 3) begin\
        EC_4_W_ROM_F_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_4_REF_SOFT_ROM" && MEM_INDEX == 0) begin\
		EC_4_REF_SOFT_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_4_REF_SOFT_ROM" && MEM_INDEX == 1) begin\
        EC_4_REF_SOFT_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_4_REF_SOFT_ROM" && MEM_INDEX == 2) begin\
        EC_4_REF_SOFT_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_4_REF_SOFT_ROM" && MEM_INDEX == 3) begin\
        EC_4_REF_SOFT_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_4_REF_SIGN_ROM" && MEM_INDEX == 0) begin\
        EC_4_REF_SIGN_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "EC_4_REF_SIGN_ROM" && MEM_INDEX == 1) begin\
        EC_4_REF_SIGN_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "EC_4_REF_SIGN_ROM" && MEM_INDEX == 2) begin\
		EC_4_REF_SIGN_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "EC_4_REF_SIGN_ROM" && MEM_INDEX == 3) begin\
        EC_4_REF_SIGN_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_5_W_ROM_F" && MEM_INDEX == 0) begin\
		DC_5_W_ROM_F_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_5_W_ROM_F" && MEM_INDEX == 1) begin\
		DC_5_W_ROM_F_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_5_W_ROM_F" && MEM_INDEX == 2) begin\
        DC_5_W_ROM_F_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_5_W_ROM_F" && MEM_INDEX == 3) begin\
        DC_5_W_ROM_F_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_5_REF_ROM" && MEM_INDEX == 0) begin\
		DC_5_REF_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_5_REF_ROM" && MEM_INDEX == 1) begin\
		DC_5_REF_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_5_REF_ROM" && MEM_INDEX == 2) begin\
        DC_5_REF_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_5_REF_ROM" && MEM_INDEX == 3) begin\
        DC_5_REF_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_5_REF_SIGN_ROM" && MEM_INDEX == 0) begin\
		DC_5_REF_SIGN_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_5_REF_SIGN_ROM" && MEM_INDEX == 1) begin\
		DC_5_REF_SIGN_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_5_REF_SIGN_ROM" && MEM_INDEX == 2) begin\
        DC_5_REF_SIGN_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_5_REF_SIGN_ROM" && MEM_INDEX == 3) begin\
        DC_5_REF_SIGN_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_6_W_ROM_F" && MEM_INDEX == 0) begin\
		DC_6_W_ROM_F_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_W_ROM_F" && MEM_INDEX == 1) begin\
		DC_6_W_ROM_F_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_W_ROM_F" && MEM_INDEX == 2) begin\
		DC_6_W_ROM_F_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_W_ROM_F" && MEM_INDEX == 3) begin\
		DC_6_W_ROM_F_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_W_ROM_F" && MEM_INDEX == 4) begin\
        DC_6_W_ROM_F_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_6_W_ROM_F" && MEM_INDEX == 5) begin\
        DC_6_W_ROM_F_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_6_W_ROM_F" && MEM_INDEX == 6) begin\
        DC_6_W_ROM_F_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_6_W_ROM_F" && MEM_INDEX == 7) begin\
        DC_6_W_ROM_F_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_6_REF_ROM" && MEM_INDEX == 0) begin\
		DC_6_REF_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_REF_ROM" && MEM_INDEX == 1) begin\
		DC_6_REF_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_REF_ROM" && MEM_INDEX == 2) begin\
		DC_6_REF_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_REF_ROM" && MEM_INDEX == 3) begin\
		DC_6_REF_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_REF_ROM" && MEM_INDEX == 4) begin\
        DC_6_REF_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_6_REF_ROM" && MEM_INDEX == 5) begin\
        DC_6_REF_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_6_REF_ROM" && MEM_INDEX == 6) begin\
        DC_6_REF_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_6_REF_ROM" && MEM_INDEX == 7) begin\
        DC_6_REF_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_6_REF_SIGN_ROM" && MEM_INDEX == 0) begin\
		DC_6_REF_SIGN_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_REF_SIGN_ROM" && MEM_INDEX == 1) begin\
		DC_6_REF_SIGN_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_REF_SIGN_ROM" && MEM_INDEX == 2) begin\
		DC_6_REF_SIGN_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_REF_SIGN_ROM" && MEM_INDEX == 3) begin\
		DC_6_REF_SIGN_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_6_REF_SIGN_ROM" && MEM_INDEX == 4) begin\
        DC_6_REF_SIGN_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_6_REF_SIGN_ROM" && MEM_INDEX == 5) begin\
        DC_6_REF_SIGN_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_6_REF_SIGN_ROM" && MEM_INDEX == 6) begin\
        DC_6_REF_SIGN_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_6_REF_SIGN_ROM" && MEM_INDEX == 7) begin\
        DC_6_REF_SIGN_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 0) begin\
		DC_7_W_ROM_F_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 1) begin\
		DC_7_W_ROM_F_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 2) begin\
		DC_7_W_ROM_F_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 3) begin\
		DC_7_W_ROM_F_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 4) begin\
		DC_7_W_ROM_F_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 5) begin\
		DC_7_W_ROM_F_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 6) begin\
		DC_7_W_ROM_F_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 7) begin\
		DC_7_W_ROM_F_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 8) begin\
        DC_7_W_ROM_F_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 9) begin\
        DC_7_W_ROM_F_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 10) begin\
        DC_7_W_ROM_F_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 11) begin\
        DC_7_W_ROM_F_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 12) begin\
        DC_7_W_ROM_F_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 13) begin\
        DC_7_W_ROM_F_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 14) begin\
        DC_7_W_ROM_F_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_W_ROM_F" && MEM_INDEX == 15) begin\
        DC_7_W_ROM_F_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 0) begin\
		DC_7_REF_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 1) begin\
		DC_7_REF_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 2) begin\
		DC_7_REF_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 3) begin\
		DC_7_REF_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 4) begin\
		DC_7_REF_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 5) begin\
		DC_7_REF_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 6) begin\
		DC_7_REF_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 7) begin\
		DC_7_REF_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 8) begin\
        DC_7_REF_ROM_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 9) begin\
        DC_7_REF_ROM_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 10) begin\
        DC_7_REF_ROM_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 11) begin\
        DC_7_REF_ROM_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 12) begin\
        DC_7_REF_ROM_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 13) begin\
        DC_7_REF_ROM_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 14) begin\
        DC_7_REF_ROM_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_ROM" && MEM_INDEX == 15) begin\
        DC_7_REF_ROM_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 0) begin\
		DC_7_REF_SIGN_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 1) begin\
		DC_7_REF_SIGN_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 2) begin\
		DC_7_REF_SIGN_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 3) begin\
		DC_7_REF_SIGN_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 4) begin\
		DC_7_REF_SIGN_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 5) begin\
		DC_7_REF_SIGN_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 6) begin\
		DC_7_REF_SIGN_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 7) begin\
		DC_7_REF_SIGN_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 8) begin\
        DC_7_REF_SIGN_ROM_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 9) begin\
        DC_7_REF_SIGN_ROM_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 10) begin\
        DC_7_REF_SIGN_ROM_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 11) begin\
        DC_7_REF_SIGN_ROM_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 12) begin\
        DC_7_REF_SIGN_ROM_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 13) begin\
        DC_7_REF_SIGN_ROM_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 14) begin\
        DC_7_REF_SIGN_ROM_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_7_REF_SIGN_ROM" && MEM_INDEX == 15) begin\
        DC_7_REF_SIGN_ROM_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 0) begin\
		DC_8_W_ROM_F_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 1) begin\
		DC_8_W_ROM_F_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 2) begin\
		DC_8_W_ROM_F_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 3) begin\
		DC_8_W_ROM_F_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 4) begin\
		DC_8_W_ROM_F_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 5) begin\
		DC_8_W_ROM_F_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 6) begin\
		DC_8_W_ROM_F_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 7) begin\
		DC_8_W_ROM_F_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 8) begin\
        DC_8_W_ROM_F_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 9) begin\
        DC_8_W_ROM_F_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 10) begin\
        DC_8_W_ROM_F_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 11) begin\
        DC_8_W_ROM_F_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 12) begin\
        DC_8_W_ROM_F_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 13) begin\
        DC_8_W_ROM_F_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 14) begin\
        DC_8_W_ROM_F_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_W_ROM_F" && MEM_INDEX == 15) begin\
        DC_8_W_ROM_F_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 0) begin\
		DC_8_REF_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 1) begin\
		DC_8_REF_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 2) begin\
		DC_8_REF_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 3) begin\
		DC_8_REF_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 4) begin\
		DC_8_REF_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 5) begin\
		DC_8_REF_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 6) begin\
		DC_8_REF_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 7) begin\
		DC_8_REF_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 8) begin\
        DC_8_REF_ROM_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 9) begin\
        DC_8_REF_ROM_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 10) begin\
        DC_8_REF_ROM_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 11) begin\
        DC_8_REF_ROM_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 12) begin\
        DC_8_REF_ROM_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 13) begin\
        DC_8_REF_ROM_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 14) begin\
        DC_8_REF_ROM_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_ROM" && MEM_INDEX == 15) begin\
        DC_8_REF_ROM_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 0) begin\
		DC_8_REF_SIGN_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 1) begin\
		DC_8_REF_SIGN_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 2) begin\
		DC_8_REF_SIGN_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 3) begin\
		DC_8_REF_SIGN_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 4) begin\
		DC_8_REF_SIGN_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 5) begin\
		DC_8_REF_SIGN_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 6) begin\
		DC_8_REF_SIGN_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 7) begin\
		DC_8_REF_SIGN_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 8) begin\
        DC_8_REF_SIGN_ROM_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 9) begin\
        DC_8_REF_SIGN_ROM_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 10) begin\
        DC_8_REF_SIGN_ROM_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 11) begin\
        DC_8_REF_SIGN_ROM_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 12) begin\
        DC_8_REF_SIGN_ROM_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 13) begin\
        DC_8_REF_SIGN_ROM_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 14) begin\
        DC_8_REF_SIGN_ROM_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_8_REF_SIGN_ROM" && MEM_INDEX == 15) begin\
        DC_8_REF_SIGN_ROM_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 0) begin\
		DC_9_W_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 1) begin\
		DC_9_W_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 2) begin\
		DC_9_W_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 3) begin\
		DC_9_W_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 4) begin\
		DC_9_W_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 5) begin\
		DC_9_W_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 6) begin\
		DC_9_W_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 7) begin\
		DC_9_W_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 8) begin\
        DC_9_W_ROM_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 9) begin\
        DC_9_W_ROM_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 10) begin\
        DC_9_W_ROM_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 11) begin\
        DC_9_W_ROM_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 12) begin\
        DC_9_W_ROM_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 13) begin\
        DC_9_W_ROM_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 14) begin\
        DC_9_W_ROM_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_W_ROM" && MEM_INDEX == 15) begin\
        DC_9_W_ROM_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 0) begin\
		DC_9_REF_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 1) begin\
		DC_9_REF_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 2) begin\
		DC_9_REF_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 3) begin\
		DC_9_REF_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 4) begin\
		DC_9_REF_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 5) begin\
		DC_9_REF_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 6) begin\
		DC_9_REF_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 7) begin\
		DC_9_REF_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 8) begin\
        DC_9_REF_ROM_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 9) begin\
        DC_9_REF_ROM_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 10) begin\
        DC_9_REF_ROM_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 11) begin\
        DC_9_REF_ROM_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 12) begin\
        DC_9_REF_ROM_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 13) begin\
        DC_9_REF_ROM_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 14) begin\
        DC_9_REF_ROM_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_ROM" && MEM_INDEX == 15) begin\
        DC_9_REF_ROM_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 0) begin\
		DC_9_REF_SIGN_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 1) begin\
		DC_9_REF_SIGN_ROM_1 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 2) begin\
		DC_9_REF_SIGN_ROM_2 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 3) begin\
		DC_9_REF_SIGN_ROM_3 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 4) begin\
		DC_9_REF_SIGN_ROM_4 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 5) begin\
		DC_9_REF_SIGN_ROM_5 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 6) begin\
		DC_9_REF_SIGN_ROM_6 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 7) begin\
		DC_9_REF_SIGN_ROM_7 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 8) begin\
        DC_9_REF_SIGN_ROM_8 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 9) begin\
        DC_9_REF_SIGN_ROM_9 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 10) begin\
        DC_9_REF_SIGN_ROM_10 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 11) begin\
        DC_9_REF_SIGN_ROM_11 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 12) begin\
        DC_9_REF_SIGN_ROM_12 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 13) begin\
        DC_9_REF_SIGN_ROM_13 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 14) begin\
        DC_9_REF_SIGN_ROM_14 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
    else if ({MEM_NAME} == "DC_9_REF_SIGN_ROM" && MEM_INDEX == 15) begin\
        DC_9_REF_SIGN_ROM_15 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
    end\
	else if ({MEM_NAME} == "DC_10_W_ROM" && MEM_INDEX == 0) begin\
		DC_10_W_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_10_REF_ROM" && MEM_INDEX == 0) begin\
		DC_10_REF_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else if ({MEM_NAME} == "DC_10_REF_SCALE_ROM" && MEM_INDEX == 0) begin\
		DC_10_REF_SCALE_ROM_0 U (.clk(clk), .addr(addr_in), .en(r_en), .dout(data_out));\
	end\
	else begin\
		$error("Unsupported ROM_SOFT type %s.", MEM_NAME);\
	end\
endgenerate
