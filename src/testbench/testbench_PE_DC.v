`timescale 1ns / 1ps
`include "../../src/testbench/headers/testbench_PE_DC.vh"
/*
    Copyright
    All right reserved.
    Module Name: testbench_PE_EC
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module testbench_PE_DC();
    parameter D = `PARAM_D;
    parameter FH = `PARAM_FH;
    parameter FW = `PARAM_FW;
    parameter POOL_H = `PARAM_POOL_H;
    parameter POOL_W = `PARAM_POOL_W;
    parameter STRIDE_H = `PARAM_STRIDE_H;
    parameter STRIDE_W = `PARAM_STRIDE_W;
    parameter IN_WIDTH = `PARAM_IN_WIDTH;
    parameter NORMREF_WIDTH = `PARAM_REF_WIDTH;
    parameter PINDEX_WIDTH = `PARAM_PINDEX_WIDTH;
    parameter OUT_WIDTH = `PARAM_OUT_WIDTH;
    
    reg [IN_WIDTH-1:0] data_in;
    reg [FH*FW*D-1:0] weight_in;
    reg [NORMREF_WIDTH-1:0] norm_ref;
    reg [PINDEX_WIDTH-1:0] pindex;
    
    wire [OUT_WIDTH-1:0] data_out;
    
    integer i,f, data_in_fid, weight_fid, norm_ref_fid, pindex_fid;
    
    // initiate
    PE_DC # (.D(D), .FH(FH), .FW(FW), .POOL_H(POOL_H), .POOL_W(POOL_W), .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W))
    U1(
    .norm_ref (norm_ref), 
    .data_in (data_in), 
    .weight_in (weight_in), 
    .pindex (pindex), 
    .data_out (data_out)
    );
    
    initial begin
        // initial inputs
        data_in = 0;
        weight_in = 0;
        norm_ref = 0;
        
        #20
        data_in_fid = $fopen({`PARAM_INPUTPATH, "testbench_PE_DC_data_in.data"}, "r");
        weight_fid = $fopen({`PARAM_INPUTPATH, "testbench_PE_DC_weights.data"}, "r");
        norm_ref_fid = $fopen({`PARAM_INPUTPATH, "testbench_PE_DC_norm_ref.data"}, "r");
        pindex_fid = $fopen({`PARAM_INPUTPATH, "testbench_PE_DC_pindex.data"},"r");
        $fscanf(data_in_fid, "%b", data_in);
        $fscanf(norm_ref_fid, "%b", norm_ref);
        $fscanf(weight_fid, "%b", weight_in);
        $fscanf(pindex_fid, "%b", pindex);
        $fclose(data_in_fid);
        $fclose(weight_fid);
        $fclose(norm_ref_fid);
        $fclose(pindex_fid);
        
        #20
        // write out data_out
        f = $fopen({`PARAM_OUTPUTPATH, "testbench_PE_DC_data_out.rst"},"wt");
        for (i = OUT_WIDTH-1; i >= 0; i=i-1) begin
            $fwrite(f,"%b", data_out[i]);
        end
        $fclose(f);
        $finish;
    end
    
    initial begin
        $vcdplusfile({`PARAM_OUTPUTPATH, "testbench_PE_DC_waveform.vpd"});
        $vcdpluson;
        $vcdplusmemon(0);
        $vcdplusdeltacycleon(0);
    end
    
endmodule
