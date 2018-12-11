`timescale 1ns / 1ps
`include "../../src/testbench/headers/testbench_PE_FP.vh"
/*
    Copyright
    All right reserved.
    Module Name: testbench_PE_EC
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module testbench_PE_FP();
    parameter D = `PARAM_D;
    parameter FH = `PARAM_FH;
    parameter FW = `PARAM_FW;
    parameter POOL_H = `PARAM_POOL_H;
    parameter POOL_W = `PARAM_POOL_W;
    parameter STRIDE_H = `PARAM_STRIDE_H;
    parameter STRIDE_W = `PARAM_STRIDE_W;
    parameter DATA_IN_FP_WIDTH = `PARAM_DATA_IN_FP_WIDTH;
    parameter DATA_IN_FP_FRAC_WIDTH = `PARAM_DATA_IN_FP_FRAC_WIDTH;
    parameter WEIGHT_WIDTH = `PARAM_WEIGHT_WIDTH;
    parameter WEIGHT_FRAC_WIDTH = `PARAM_WEIGHT_FRAC_WIDTH;
    parameter IN_WINDOW_H = `PARAM_IN_WINDOW_H;
    parameter IN_WINDOW_W = `PARAM_IN_WINDOW_W;
    parameter IN_WIDTH = `PARAM_IN_WIDTH;
    parameter NORMREF_WIDTH = `PARAM_REF_WIDTH;
    parameter OUT_WIDTH = `PARAM_OUT_WIDTH;
    
    // inputs
    reg [IN_WIDTH-1:0] data_in;
    reg [FH*FW*D*DATA_IN_FP_WIDTH-1:0] weight_in;
    reg [NORMREF_WIDTH-1:0] norm_ref;
    reg norm_sign;
    // outputs
    reg [OUT_WIDTH:0] data_out;
    
    integer i,data_out_fid, data_in_fid, weight_fid, norm_ref_fid, norm_sign_fid, conv_out_fid, mult_out_fid;
        
    // initiate
    PE_FP # (.D(D), .FH(FH), .FW(FW), .POOL_H(POOL_H), .POOL_W(POOL_W), 
             .WEIGHT_WIDTH(WEIGHT_WIDTH), .WEIGHT_FRAC_WIDTH(WEIGHT_FRAC_WIDTH), 
             .FMAP_WIDHT(DATA_IN_FP_WIDTH), .FMAP_FRAC_WIDHT(DATA_IN_FP_FRAC_WIDTH), 
             .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W), .NORMREF_WIDTH(NORMREF_WIDTH))
    U1(
    .norm_ref (norm_ref), 
    .s(norm_sign),
    .data_in (data_in), 
    .weight_in (weight_in), 
    .pindex (), 
    .in_en(1),
    .data_out (data_out)
    );
    
    initial begin
        // initial inputs
        data_in = 0;
        weight_in = 0;
        norm_ref = 0;
        
        #20
        data_in_fid = $fopen({`PARAM_INPUTPATH, "testbench_PE_FP_data_in.data"}, "r");
        weight_fid = $fopen({`PARAM_INPUTPATH, "testbench_PE_FP_weights.data"}, "r");
        norm_ref_fid = $fopen({`PARAM_INPUTPATH, "testbench_PE_FP_norm_ref.data"}, "r");
        norm_sign_fid = $fopen({`PARAM_INPUTPATH, "testbench_PE_FP_norm_sign.data"}, "r");
        $fscanf(data_in_fid, "%b", data_in);
        $fscanf(weight_fid, "%b", weight_in);
        $fscanf(norm_ref_fid, "%b", norm_ref);
        $fscanf(norm_sign_fid, "%b", norm_sign);
        
        
        $fclose(data_in_fid);
        $fclose(weight_fid);
        $fclose(norm_ref_fid);
        
        #20
        // write out data_out
        data_out_fid = $fopen({`PARAM_OUTPUTPATH, "testbench_PE_FP_data_out.rst"},"wt");
        conv_out_fid = $fopen({`PARAM_OUTPUTPATH, "testbench_PE_FP_conv_out.rst"},"wt");
        mult_out_fid = $fopen({`PARAM_OUTPUTPATH, "testbench_PE_FP_mult_out.rst"},"wt");
        $fwrite(conv_out_fid, "%b\n", U1.genblk2[0].genblk1[0].conv_kernel_inst.conv_out);
        $fwrite(mult_out_fid, "%b%b%b%b%b%b%b%b%b\n", U1.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[0],
                                                    U1.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[1],
                                                    U1.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[2],
                                                    U1.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[3],
                                                    U1.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[4],
                                                    U1.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[5],
                                                    U1.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[6],
                                                    U1.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[7],
                                                    U1.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[8]);
        $fclose(data_out_fid);
        $fclose(conv_out_fid);
        $fclose(mult_out_fid);
        $finish;
    end
    
    initial begin
        $vcdplusfile({`PARAM_OUTPUTPATH, "testbench_PE_FP_waveform.vpd"});
        $vcdpluson;
        $vcdplusmemon(0);
        $vcdplusdeltacycleon(0);
    end
    
endmodule
