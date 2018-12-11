`timescale 1ns / 1ps
`include "../../src/testbench/headers/testbench_PE_EC.vh"
/*
    Copyright
    All right reserved.
    Module Name: testbench_PE_EC
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module testbench_PE_EC();

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
    
    localparam CONV_OUT_WIDTH = $clog2(D*FW*FH+1);
    reg [IN_WIDTH-1:0] data_in;
    reg [FH*FW*D-1:0] weight_in;
    reg [NORMREF_WIDTH-1:0] norm_ref;
        
    reg [PINDEX_WIDTH-1:0] pindex;
    reg [OUT_WIDTH-1:0] data_out;
    
    integer i,f1,f2,f3,f4,f5,f6,f7, data_in_fid, weight_fid, norm_ref_fid;
    
    // initiate
    PE_EC # (.D(D), .FH(FH), .FW(FW), .POOL_H(POOL_H), .POOL_W(POOL_W), .STRIDE_H(STRIDE_H), .STRIDE_W(STRIDE_W), .NORMREF_WIDTH(NORMREF_WIDTH))
    U1(
    .norm_ref (norm_ref), 
    .data_in (data_in), 
    .weight_in (weight_in), 
    .in_en(1'b1),
    .s(1'b1),
    .conv_out_1(),
    .conv_out_2(),
    .conv_out_3(),
    .conv_out_4(),
    .max_conv(),
    .pindex (pindex), 
    .data_out (data_out)
    );
    
    initial begin
        // initial inputs
        data_in = 0;
        weight_in = 0;
        norm_ref = 0;
        
        #20
        data_in_fid = $fopen({`PARAM_INPUTPATH, "testbench_PE_EC_data_in.data"}, "r");
        weight_fid = $fopen({`PARAM_INPUTPATH, "testbench_PE_EC_weights.data"}, "r");
        norm_ref_fid = $fopen({`PARAM_INPUTPATH, "testbench_PE_EC_norm_ref.data"}, "r");
        $fscanf(data_in_fid, "%b", data_in);
        $fscanf(weight_fid, "%b", weight_in);
        $fscanf(norm_ref_fid, "%b", norm_ref);
        $fclose(data_in_fid);
        $fclose(weight_fid);
        $fclose(norm_ref_fid);
        
        #20
        // write out pindex
        f1 = $fopen({`PARAM_OUTPUTPATH, "testbench_PE_EC_pindex.rst"},"w");
        for (i = PINDEX_WIDTH-1; i >= 0; i=i-1) begin
            $fwrite(f1,"%b", pindex[i]);
        end
        $fclose(f1);
        // write out data_out
        f2 = $fopen({`PARAM_OUTPUTPATH, "testbench_PE_EC_data_out.rst"},"w");
//        $display("data_out = %b", data_out);
        for (i = OUT_WIDTH-1; i >= 0; i=i-1) begin
            $fwrite(f2,"%b", data_out[i]);
        end
        $fclose(f2);
        
        f3 = $fopen({`PARAM_OUTPUTPATH, "testbench_PE_EC_conv1.rst"},"w");
        for (i = CONV_OUT_WIDTH-1; i >= 0; i=i-1) begin
            $fwrite(f3,"%b",U1.conv_out_1[i]);
        end
        $fclose(f3);
        f4 = $fopen({`PARAM_OUTPUTPATH, "testbench_PE_EC_conv2.rst"},"w");
        for (i = CONV_OUT_WIDTH-1; i >= 0; i=i-1) begin
            $fwrite(f4,"%b",U1.conv_out_2[i]);
        end
        $fclose(f4);
        f5 = $fopen({`PARAM_OUTPUTPATH, "testbench_PE_EC_conv3.rst"},"w");
        for (i = CONV_OUT_WIDTH-1; i >= 0; i=i-1) begin
            $fwrite(f5,"%b",U1.conv_out_3[i]);
        end
        $fclose(f5);
        f6 = $fopen({`PARAM_OUTPUTPATH, "testbench_PE_EC_conv4.rst"},"w");
        for (i = CONV_OUT_WIDTH-1; i >= 0; i=i-1) begin
            $fwrite(f6,"%b",U1.conv_out_4[i]);
        end
        $fclose(f7);
        f7 = $fopen({`PARAM_OUTPUTPATH, "testbench_PE_EC_conv_max.rst"},"w");
        for (i = CONV_OUT_WIDTH-1; i >= 0; i=i-1) begin
            $fwrite(f7,"%b",U1.max_conv[i]);
        end
        $fclose(f7);
        $finish;
    end
    
//    initial begin
//        $vcdplusfile({`PARAM_OUTPUTPATH, "testbench_PE_EC_waveform.vpd"});
//        $vcdpluson;
//        $vcdplusmemon(0);
//        $vcdplusdeltacycleon(0);
//    end

endmodule
