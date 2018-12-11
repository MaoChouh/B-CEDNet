`timescale 1ns / 1ps
`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
`include "../../src/testbench/headers/BCEDN_TOP_tb.vh"
/*
    Copyright
    All right reserved.
    Module Name: BCEDN_TOP
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: BCEDN_TOP module.
*/


module BCEDN_TOP_tb();

    parameter DATA_IN_WIDTH = `PARAM_DATA_IN_WIDTH;
    parameter DATA_OUT_WIDTH = `PARAM_DATA_OUT_WIDTH;
    parameter CLK_P_PERIOD = `PARAM_CLK_P_PERIOD;
    parameter CLK_R_PERIOD = `PARAM_CLK_R_PERIOD;
    parameter PROCESSING_CYC = `PARAM_PROCESSING_CYC;
    
    // inputs
    reg clk;
    wire clkw;
    reg rst;
    reg start;
    reg in_en;
    reg [DATA_IN_WIDTH-1:0] data_in, data_in_dly;
    // outputs
    wire [DATA_OUT_WIDTH-1:0] data_out;
    wire out_en;
    wire rdy, fifo_wfull;
    wire done;
//    wire data_rdy;
    
    // init
    integer data_in_id, data_in_ad_id, data_ad_ec1_id, data_ec1_ec2_id, data_ec2_ec3_id, data_ec3_ec4_id, data_ec4_dc5_id,
            data_dc5_dc6_id, data_dc6_dc7_id, data_dc7_dc8_id, data_dc8_dc9_id, data_dc9_dc10_id, data_dc10_out_id;
    integer ad_conv_out_id_0, ad_conv_out_id_1, ad_normref_id_0, ad_normref_id_1, ad_normsign_id_0, ad_normsign_id_1, ad_weights_id_0, 
            ad_weights_id_1, ad_fmap_in_id_0, ad_fmap_in_id_1, ad_mult_out_id_0, ad_mult_out_id_1;
    integer ec1_fmap_id_0_0,ec1_fmap_id_0_1, ec1_fmap_id_1_0,ec1_fmap_id_1_1, ec1_w_id_0_0,ec1_w_id_0_1, ec1_w_id_1_0,ec1_w_id_1_1,
            ec1_conv_out_id_0_0,ec1_conv_out_id_0_1,ec1_conv_out_id_1_0,ec1_conv_out_id_1_1;
    reg processing;
    initial begin
//        clkw = 0;
         clk = 0; rst = 0; start = 0; in_en = 0;
        data_in = 0; processing = 0; start = 0;
        data_in_id = $fopen({`PARAM_INPUTPATH, "BCEDN_TOP_tb_data_in.data"}, "r");
        data_in_ad_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_in_ad.rst"},"w");
        data_ad_ec1_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_ad_ec1.rst"},"w");
        data_ec1_ec2_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_ec1_ec2.rst"},"w");
        data_ec2_ec3_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_ec2_ec3.rst"},"w");
        data_ec3_ec4_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_ec3_ec4.rst"},"w");
        data_ec4_dc5_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_ec4_dc5.rst"},"w");
        data_dc5_dc6_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_dc5_dc6.rst"},"w");
        data_dc6_dc7_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_dc6_dc7.rst"},"w");
        data_dc7_dc8_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_dc7_dc8.rst"},"w");
        data_dc8_dc9_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_dc8_dc9.rst"},"w");
        data_dc9_dc10_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_dc9_dc10.rst"},"w");
        data_dc10_out_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_data_dc10_out.rst"},"w");
        #(10*CLK_P_PERIOD)
        rst = 1;
        #(20*CLK_P_PERIOD)
        start = 1;
        processing = 1;
        # CLK_P_PERIOD
        start = 0;
        # (PROCESSING_CYC*CLK_P_PERIOD)
        processing = 0;
        $fclose(data_in_id);
        $fclose(data_in_ad_id);
        $fclose(data_ad_ec1_id);
        $fclose(data_ec1_ec2_id);
        $fclose(data_ec2_ec3_id);
        $fclose(data_ec3_ec4_id);
        $fclose(data_ec4_dc5_id);
        $fclose(data_dc5_dc6_id);
        $fclose(data_dc6_dc7_id);
        $fclose(data_dc7_dc8_id);
        $fclose(data_dc8_dc9_id);
        $fclose(data_dc9_dc10_id);
        $fclose(data_dc10_out_id);
//        $fclose(ad_conv_out_id_0);
//        $fclose(ad_conv_out_id_1);
//        $fclose(ad_normref_id_0);
//        $fclose(ad_normref_id_1);
//        $fclose(ad_normsign_id_0);
//        $fclose(ad_normsign_id_1);
//        $fclose(ad_weights_id_0);
//        $fclose(ad_weights_id_1);
//        $fclose(ad_fmap_in_id_0);
//        $fclose(ad_fmap_in_id_1);
        
//        $fclose(ec1_fmap_id_0_0);
//        $fclose(ec1_fmap_id_0_1);
//        $fclose(ec1_fmap_id_1_0);
//        $fclose(ec1_fmap_id_1_1);
//        $fclose(ec1_w_id_0_0);
//        $fclose(ec1_w_id_0_1);
//        $fclose(ec1_w_id_1_0);
//        $fclose(ec1_w_id_1_1);
//        $fclose(ec1_conv_out_id_0_0);
//        $fclose(ec1_conv_out_id_0_1);
//        $fclose(ec1_conv_out_id_1_0);
//        $fclose(ec1_conv_out_id_1_1);
        $finish;
    end
    
//    initial begin
//       ec1_fmap_id_0_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec1_fmap_id_0_0.rst"}, "w");
//       ec1_fmap_id_0_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec1_fmap_id_0_1.rst"}, "w");
//       ec1_fmap_id_1_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec1_fmap_id_1_0.rst"}, "w");
//       ec1_fmap_id_1_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec1_fmap_id_1_1.rst"}, "w");
//       ec1_w_id_0_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec1_w_id_0_0.rst"}, "w");
//       ec1_w_id_0_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec1_w_id_0_1.rst"}, "w");
//       ec1_w_id_1_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec1_w_id_1_0.rst"}, "w");
//       ec1_w_id_1_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec_w_id_1_1.rst"}, "w");
//       ec1_conv_out_id_0_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec1_conv_out_id_0_0.rst"}, "w");
//       ec1_conv_out_id_0_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec1_conv_out_id_0_1.rst"}, "w");
//       ec1_conv_out_id_1_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec1_conv_out_id_1_0.rst"}, "w");
//       ec1_conv_out_id_1_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ec1_conv_out_id_1_1.rst"}, "w");
//    end
    
//    initial begin
//       ad_conv_out_id_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_conv_out_0.rst"}, "w");
//       ad_conv_out_id_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_conv_out_1.rst"}, "w");
//       ad_normref_id_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_normref_0.rst"}, "w");
//       ad_normref_id_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_normref_1.rst"}, "w");
//       ad_normsign_id_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_normsign_0.rst"}, "w");
//       ad_normsign_id_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_normsign_1.rst"}, "w");
//       ad_weights_id_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_weights_0.rst"}, "w");
//       ad_weights_id_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_weights_1.rst"}, "w");
//       ad_fmap_in_id_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_fmap_in_0.rst"}, "w");
//       ad_fmap_in_id_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_fmap_in_1.rst"}, "w");
//       ad_mult_out_id_0 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_mult_out_0.rst"}, "w");
//       ad_mult_out_id_1 = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_ad_mult_out_1.rst"}, "w");
//    end
    
    // clkw
//    always #(CLK_P_PERIOD/2) clkw = ~clkw;
    
    // clk
    always #(CLK_R_PERIOD/2) clk = ~clk;
    
    // in_en 
    always@(posedge clkw) begin
        if (~rst)
            in_en <= 0;
        else if (~fifo_wfull) begin
            in_en <= 1;
        end
        else begin
            in_en <= 0;
        end
    end
    
    // data_in
    always@(posedge clkw) begin
        if (~rst) begin
            data_in <= 0;
            data_in_dly <= 0;
        end
        else if (~fifo_wfull) begin
            if (!$feof(data_in_id)) begin   
                $fscanf(data_in_id, "%b\n", data_in_dly);
                data_in <= data_in_dly;
            end
            else begin
                data_in <= 0;
                data_in_dly <= 0;
            end
        end
        else begin
            data_in <= 0;
            data_in_dly <= 0;
        end
    end
    
    // output all the input and output of each layer
    
    // ec1 conv_out, weight, fmap
   /* always@(posedge clkw) begin
        if (U.ec1_inst.ec_ctrl_inst.fmap_out_shiftreg_en) begin
            $fwrite(ec1_fmap_id_0_0,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[0].genblk1[0].conv_kernel_inst.fmap_in);
            $fwrite(ec1_fmap_id_0_1,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[0].genblk1[1].conv_kernel_inst.fmap_in);
            $fwrite(ec1_fmap_id_1_0,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[1].genblk1[0].conv_kernel_inst.fmap_in);
            $fwrite(ec1_fmap_id_1_1,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[1].genblk1[1].conv_kernel_inst.fmap_in);
            $fwrite(ec1_w_id_0_0,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[0].genblk1[0].conv_kernel_inst.weight);
            $fwrite(ec1_w_id_0_1,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[0].genblk1[1].conv_kernel_inst.weight);
            $fwrite(ec1_w_id_1_0,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[1].genblk1[0].conv_kernel_inst.weight);
            $fwrite(ec1_w_id_1_1,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[1].genblk1[1].conv_kernel_inst.weight);
            $fwrite(ec1_conv_out_id_0_0,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[0].genblk1[0].conv_kernel_inst.conv_out);
            $fwrite(ec1_conv_out_id_0_1,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[0].genblk1[1].conv_kernel_inst.conv_out);
            $fwrite(ec1_conv_out_id_1_0,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[1].genblk1[0].conv_kernel_inst.conv_out);
            $fwrite(ec1_conv_out_id_1_1,"%b\n", U.ec1_inst.PEs[7].pe_ec_inst.genblk2[1].genblk1[1].conv_kernel_inst.conv_out);
        end
    end
    */
//    // ad_conv_out, ad_normref
//    always@(posedge clkw) begin
//        if (U.ad_inst.ad_ctrl_inst.fmap_out_shiftreg_en) begin
//            $fwrite(ad_conv_out_id_0,"%b\n", U.ad_inst.genblk1[0].pe_fp_inst.conv_out);
//            $fwrite(ad_conv_out_id_1,"%b\n", U.ad_inst.genblk1[1].pe_fp_inst.conv_out);
//            $fwrite(ad_normref_id_0,"%b\n", U.ad_inst.genblk1[0].pe_fp_inst.norm_ref);
//            $fwrite(ad_normref_id_1,"%b\n", U.ad_inst.genblk1[1].pe_fp_inst.norm_ref);
//            $fwrite(ad_normsign_id_0,"%b\n", U.ad_inst.genblk1[0].pe_fp_inst.s);
//            $fwrite(ad_normsign_id_1,"%b\n", U.ad_inst.genblk1[1].pe_fp_inst.s);
//            $fwrite(ad_weights_id_0,"%b\n", U.ad_inst.genblk1[0].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.weight);
//            $fwrite(ad_weights_id_1,"%b\n", U.ad_inst.genblk1[1].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.weight);
//            $fwrite(ad_fmap_in_id_0,"%b\n", U.ad_inst.genblk1[0].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.fmap_in);
//            $fwrite(ad_fmap_in_id_1,"%b\n", U.ad_inst.genblk1[1].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.fmap_in);
//            $fwrite(ad_mult_out_id_0,"%b%b%b%b%b%b%b%b%b\n", U.ad_inst.genblk1[0].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[0],
//                                                             U.ad_inst.genblk1[0].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[1],
//                                                             U.ad_inst.genblk1[0].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[2],
//                                                             U.ad_inst.genblk1[0].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[3],
//                                                             U.ad_inst.genblk1[0].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[4],
//                                                             U.ad_inst.genblk1[0].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[5],
//                                                             U.ad_inst.genblk1[0].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[6],
//                                                             U.ad_inst.genblk1[0].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[7],
//                                                             U.ad_inst.genblk1[0].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[8]);
//            $fwrite(ad_mult_out_id_1,"%b%b%b%b%b%b%b%b%b\n", U.ad_inst.genblk1[1].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[0],
//                                                             U.ad_inst.genblk1[1].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[1],
//                                                             U.ad_inst.genblk1[1].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[2],
//                                                             U.ad_inst.genblk1[1].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[3],
//                                                             U.ad_inst.genblk1[1].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[4],
//                                                             U.ad_inst.genblk1[1].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[5],
//                                                             U.ad_inst.genblk1[1].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[6],
//                                                             U.ad_inst.genblk1[1].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[7],
//                                                             U.ad_inst.genblk1[1].pe_fp_inst.genblk2[0].genblk1[0].conv_kernel_inst.mult_out[8]);
//        end
//    end
    
    // input to AD
    always@(posedge clkw) begin
        if (U.data_rdy_dl) begin    
            $fwrite(data_in_ad_id,"%b\n", U.ad_inst.data_in);
        end            
    end
    
     //AD to EC-1
    always@(posedge clkw) begin
        if (U.ec1_inst.in_en) begin    
            $fwrite(data_ad_ec1_id,"%b\n", U.ec1_inst.data_in);
        end            
    end
     // EC-1 output
//    always@(posedge clkw) begin
//        if (U.ec1_inst.out_en) begin    
//            $fwrite(data_ec1_ec2_id,"%b\n", U.ec1_inst.data_out);
//        end            
//    end   
    // EC-1 to EC-2
    always@(posedge clkw) begin
        if (U.ec2_inst.in_en) begin    
            $fwrite(data_ec1_ec2_id,"%b\n", U.ec2_inst.data_in);
        end            
    end
    
    // EC-2 to EC-3
    always@(posedge clkw) begin
        if (U.ec3_inst.in_en) begin    
            $fwrite(data_ec2_ec3_id,"%b\n", U.ec3_inst.data_in);
        end            
    end
    
    // EC-3 to EC-4
    always@(posedge clkw) begin
        if (U.ec4_inst.in_en) begin    
            $fwrite(data_ec3_ec4_id,"%b\n", U.ec4_inst.data_in);
        end            
    end
    
    // EC-4 to DC-5
    always@(posedge clkw) begin
        if (U.dc5_inst.in_en) begin    
            $fwrite(data_ec4_dc5_id,"%b\n", U.dc5_inst.data_in);
        end            
    end
    
    // DC-5 to DC-6
    always@(posedge clkw) begin
        if (U.dc6_inst.in_en) begin    
            $fwrite(data_dc5_dc6_id,"%b\n", U.dc6_inst.data_in);
        end            
    end
    
    // DC-6 to DC-7
    always@(posedge clkw) begin
        if (U.dc7_inst.in_en) begin    
            $fwrite(data_dc6_dc7_id,"%b\n", U.dc7_inst.data_in);
        end            
    end
    
    // DC-7 to DC-8
    always@(posedge clkw) begin
        if (U.dc8_inst.in_en) begin    
            $fwrite(data_dc7_dc8_id,"%b\n", U.dc8_inst.data_in);
        end            
    end
    
    // DC-8 to DC-9
    always@(posedge clkw) begin
        if (U.dc9_inst.in_en) begin    
            $fwrite(data_dc8_dc9_id,"%b\n", U.dc9_inst.data_in);
        end            
    end
    
    // DC-9 to DC-10
    always@(posedge clkw) begin
        if (U.dc10_inst.in_en) begin    
            $fwrite(data_dc9_dc10_id,"%b\n", U.dc10_inst.data_in);
        end            
    end
    
    // DC-10 to Output
    always@(posedge clkw) begin
        if (U.dc10_inst.out_en) begin    
            $fwrite(data_dc10_out_id,"%b\n", U.dc10_inst.data_out);
        end            
    end

    //For testing sram read
//    initial begin 
//      //force U.ec1_inst.ec1_inst.index_sram_inst.U.EC_1_MEM_1.bBWEBB[15:0] = 16'h0000;
//      //force U.ec1_inst.ec1_inst.index_sram_inst.U.EC_1_MEM_1.BWEBA[15:0] = 16'h0000;
//      //force U.ec1_inst.ec1_inst.index_sram_inst.U.EC_1_MEM_1.WEBA = 1'b1;
//      #105335915 $finish;
//    end

    //For testing dc8 w_rom_addr BCEDN_TOP_tb.U.dc8_inst.dc8_inst.dc_ctrl_inst.w_rom_addr[4]
//    initial begin 
//      # 1370 force U.dc8_inst.dc_ctrl_inst.w_rom_addr[4] = 1;
//      # 100  release U.dc8_inst.dc_ctrl_inst.w_rom_addr[4];
//    end

//    initial begin
//        //$vcdplusfile({`PARAM_OUTPUTPATH, "BCEDN_TOP_tb_waveform.vpd"});
//        $vcdplusfile({"/home/tensor_v1/mnt/BCEDN_TMP/", "BCEDN_TOP_tb_waveform_debug_dc8_ckbd.vpd"});
//        //$vcdpluson;
//        //$vcdpluson(2,U.ad_inst);
//        //$vcdpluson(2,U.ad_inst.ad_ctrl_inst);
//        //$vcdpluson(2,U.ec1_inst);
//        //$vcdpluson(0,U.ec1_inst.ec1_inst.index_sram_inst);
//        //$vcdpluson(2,U.ec2_inst);
//        //$vcdpluson(0,U.ec2_inst.ec2_inst.index_sram_inst);
//        //$vcdpluson(2,U.ec3_inst);
//        //$vcdpluson(0,U.ec3_inst.ec3_inst.index_sram_inst);
//        $vcdpluson(2,U.dc8_inst);
//        $vcdpluson(0,U.dc8_inst.dc_ctrl_inst);
//        //$vcdpluson(2,U.ec1_inst.ec_ctrl_inst);
//        //$vcdpluson(2,U.ec2_inst);
//        //$vcdpluson(5,U.ec2_inst.ec2_inst.ec_ctrl_inst);
//        $vcdplusmemon(0);
//        $vcdplusdeltacycleon(0);
//    end

    BCEDN_TOP U (.clkw(clkw), .clk(clk), .rst(rst), .start(start), .data_in(data_in), .in_en(in_en), .data_out(data_out), .out_en(out_en), .done(done), .fifo_wfull(fifo_wfull));
        
endmodule
