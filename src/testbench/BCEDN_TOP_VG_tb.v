`timescale 1ns / 1ps
`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
//`include "../../src/testbench/headers/BCEDN_TOP_tb.vh"
`define PARAM_INPUTPATH "../../test/BCEDN_TOP_VG_tb/input/"
`define PARAM_OUTPUTPATH "../../test/BCEDN_TOP_VG_tb/output/"
`define PARAM_TESTBENCH BCEDN_TOP_VG_tb
`define PARAM_DATA_IN_WIDTH 8
`define PARAM_DATA_OUT_WIDTH 24
`define PARAM_CLK_PERIOD 10
`define PARAM_PROCESSING_CYC 786432
`define PARAM_CLK_P_PERIOD 130
`define PARAM_CLK_DIV 13
`define PARAM_CLK_R_PERIOD 10
/*
    Copyright
    All right reserved.
    Module Name: BCEDN_TOP_VG
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: BCEDN_TOP_VG module.
*/


module BCEDN_TOP_VG_tb();

    parameter DATA_IN_WIDTH = `PARAM_DATA_IN_WIDTH;
    parameter DATA_OUT_WIDTH = `PARAM_DATA_OUT_WIDTH;
    parameter CLK_P_PERIOD = `PARAM_CLK_P_PERIOD;
    parameter CLK_R_PERIOD = `PARAM_CLK_R_PERIOD;
    parameter PROCESSING_CYC = `PARAM_PROCESSING_CYC;
    parameter PARAM_INPUTPATH = `PARAM_INPUTPATH;
    parameter PARAM_OUTPUTPATH = `PARAM_OUTPUTPATH;

    // inputs
    reg clk;
    reg clkw;
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
    integer data_in_id, data_in_ad_id, data_ad_ec1_id, data_ec1_ec2_id, data_ec2_ec3_id, data_ec3_edc45_id, 
            data_edc45_dc6_id, data_dc6_dc7_id, data_dc7_dc8_id, data_dc8_dc9_id, data_dc9_dc10_id, data_dc10_out_id;

    reg processing;
    initial begin
        clkw = 0; clk = 0; rst = 0; start = 0; in_en = 0;
        data_in = 0; processing = 0; start = 0;
        data_in_id = $fopen({`PARAM_INPUTPATH, "BCEDN_TOP_tb_data_in.data"}, "r");
        data_in_ad_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_data_in_ad.rst"},"wt");
        data_ad_ec1_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_data_ad_ec1.rst"},"wt");
        data_ec1_ec2_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_data_ec1_ec2.rst"},"wt");
        data_ec2_ec3_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_data_ec2_ec3.rst"},"wt");
        data_ec3_edc45_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_data_ec3_edc45.rst"},"wt");
        data_edc45_dc6_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_data_edc45_dc6.rst"},"wt");
        data_dc6_dc7_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_data_dc6_dc7.rst"},"wt");
        data_dc7_dc8_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_data_dc7_dc8.rst"},"wt");
        data_dc8_dc9_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_data_dc8_dc9.rst"},"wt");
        data_dc9_dc10_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_data_dc9_dc10.rst"},"wt");
        data_dc10_out_id = $fopen({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_data_dc10_out.rst"},"wt");
        #(10*CLK_P_PERIOD)
        rst = 1;
        #(20*CLK_P_PERIOD)
        start = 1;
        processing = 1;
        # CLK_P_PERIOD
        start = 0;
        # (PROCESSING_CYC*CLK_P_PERIOD)
//        # (594945)
        processing = 0;
        $fclose(data_in_id);
        $fclose(data_in_ad_id);
        $fclose(data_ad_ec1_id);
        $fclose(data_ec1_ec2_id);
        $fclose(data_ec2_ec3_id);
        $fclose(data_ec3_edc45_id);
        $fclose(data_edc45_dc6_id);
        $fclose(data_dc6_dc7_id);
        $fclose(data_dc7_dc8_id);
        $fclose(data_dc8_dc9_id);
        $fclose(data_dc9_dc10_id);
        $fclose(data_dc10_out_id);

        $finish;
    end
    
    // clkw
    always #(CLK_P_PERIOD/2) clkw = ~clkw;
    
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
    
    
/*    
    // input to AD
    always@(posedge clkw) begin
        if (U.BCEDN_TOP_inst.data_rdy_dl) begin    
            $fwrite(data_in_ad_id,"%b\n", U.BCEDN_TOP_inst.ad_inst.data_in);
        end            
    end
    
    // AD to EC-1
    always@(posedge U.BCEDN_TOP_inst.ec1_inst.clk) begin
        if (U.BCEDN_TOP_inst.ec1_inst.in_en) begin    
            $fwrite(data_ad_ec1_id,"%b\n", U.BCEDN_TOP_inst.ec1_inst.data_in);
        end            
    end
    
    // EC-1 to EC-2
    always@(posedge U.BCEDN_TOP_inst.ec2_inst.clk) begin
        if (U.BCEDN_TOP_inst.ec2_inst.in_en) begin    
            $fwrite(data_ec1_ec2_id,"%b\n", U.BCEDN_TOP_inst.ec2_inst.data_in);
        end            
    end
    
    // EC-2 to EC-3
    always@(posedge U.BCEDN_TOP_inst.ec3_inst.clk) begin
        if (U.BCEDN_TOP_inst.ec3_inst.in_en) begin    
            $fwrite(data_ec2_ec3_id,"%b\n", U.BCEDN_TOP_inst.ec3_inst.data_in);
        end            
    end
    
    // EC-3 to EDC-4-5
    always@(posedge U.BCEDN_TOP_inst.edc_4_5_inst.clk) begin
        if (U.BCEDN_TOP_inst.edc_4_5_inst.in_en) begin    
            $fwrite(data_ec3_edc45_id,"%b\n", U.BCEDN_TOP_inst.edc_4_5_inst.data_in);
        end            
    end
    
    
    // EDC-4-5 to DC-6
    always@(posedge U.BCEDN_TOP_inst.dc6_inst.clk) begin
        if (U.BCEDN_TOP_inst.dc6_inst.in_en) begin    
            $fwrite(data_edc45_dc6_id,"%b\n", U.BCEDN_TOP_inst.dc6_inst.data_in);
        end            
    end
    
    // DC-6 to DC-7
    always@(posedge U.BCEDN_TOP_inst.dc7_inst.clk) begin
        if (U.BCEDN_TOP_inst.dc7_inst.in_en) begin    
            $fwrite(data_dc6_dc7_id,"%b\n", U.BCEDN_TOP_inst.dc7_inst.data_in);
        end            
    end
    
    // DC-7 to DC-8
    always@(posedge U.BCEDN_TOP_inst.dc8_inst.clk) begin
        if (U.BCEDN_TOP_inst.dc8_inst.in_en) begin    
            $fwrite(data_dc7_dc8_id,"%b\n", U.BCEDN_TOP_inst.dc8_inst.data_in);
        end            
    end
    
    // DC-8 to DC-9
    always@(posedge U.BCEDN_TOP_inst.dc8_inst.clk) begin
        if (U.BCEDN_TOP_inst.dc8_inst.out_en) begin    
            $fwrite(data_dc8_dc9_id,"%b\n", U.BCEDN_TOP_inst.dc9_inst.data_in);
        end            
    end
    
//    // DC-9 to DC-10
//    always@(posedge clkw) begin
//        if (U.BCEDN_TOP_inst.dc10_inst.in_en) begin    
//            $fwrite(data_dc9_dc10_id,"%b\n", U.BCEDN_TOP_inst.dc10_inst.data_in);
//        end            
//    end
    
    // DC-10 to Output
    always@(posedge U.BCEDN_TOP_inst.dc10_inst.clk) begin
        if (U.BCEDN_TOP_inst.dc10_inst.out_en) begin    
            $fwrite(data_dc10_out_id,"%b\n", U.BCEDN_TOP_inst.dc10_inst.data_out);
        end            
    end
*/

    //Reset w_rom_addr[4]
    initial begin
      #1370  force U.BCEDN_TOP.dc8_inst.dc8_inst.dc_ctrl_inst.w_rom_addr[4] = 0;
      #100   release U.BCEDN_TOP.dc8_inst.dc8_inst.dc_ctrl_inst.w_rom_addr[4];
    end

    initial begin
       //$vcdplusfile({`PARAM_OUTPUTPATH, "BCEDN_TOP_VG_tb_waveform.vpd"});
        $vcdplusfile({"/home/tensor_v1/mnt/BCEDN_TMP/", "BCEDN_TOP_VG_FULLCHIP_tb_waveform_v3.vpd"});
        $vcdpluson(2,U.BCEDN_TOP.ad_inst);
        $vcdpluson(2,U.BCEDN_TOP.ad_inst.ad_inst.ad_ctrl_inst);
	$vcdpluson(2,U.BCEDN_TOP.ec1_inst);
        $vcdpluson(2,U.BCEDN_TOP.ec1_inst.ec1_inst.ec_ctrl_inst);
        $vcdpluson(2,U.BCEDN_TOP.ec1_inst.ec1_inst.index_sram_inst);
        $vcdpluson(2,U.BCEDN_TOP.ec2_inst);
        $vcdpluson(2,U.BCEDN_TOP.ec2_inst.ec2_inst.ec_ctrl_inst);
        $vcdpluson(2,U.BCEDN_TOP.ec2_inst.ec2_inst.index_sram_inst);
        $vcdpluson(2,U.BCEDN_TOP.ec3_inst);
        $vcdpluson(2,U.BCEDN_TOP.ec3_inst.ec3_inst.ec_ctrl_inst);
        $vcdpluson(2,U.BCEDN_TOP.ec3_inst.ec3_inst.index_sram_inst);
        $vcdpluson(2,U.BCEDN_TOP.edc_4_5_inst);
        $vcdpluson(2,U.BCEDN_TOP.edc_4_5_inst.ec4_inst.ec4_inst.edc_ctrl_inst);
        $vcdpluson(2,U.BCEDN_TOP.edc_4_5_inst.dc5_inst.dc5_inst.dc_ctrl_inst);
        $vcdpluson(2,U.BCEDN_TOP.dc6_inst);
        $vcdpluson(2,U.BCEDN_TOP.dc6_inst.dc6_inst.dc_ctrl_inst);
        $vcdpluson(2,U.BCEDN_TOP.dc7_inst);
        $vcdpluson(2,U.BCEDN_TOP.dc7_inst.dc7_inst.dc_ctrl_inst);
        $vcdpluson(2,U.BCEDN_TOP.dc8_inst);
        $vcdpluson(2,U.BCEDN_TOP.dc8_inst.dc8_inst.dc_ctrl_inst);
        $vcdpluson(2,U.BCEDN_TOP.dc9_inst);
        $vcdpluson(2,U.BCEDN_TOP.dc9_inst.dc9_inst.dc_ctrl_inst);
        $vcdpluson(2,U.BCEDN_TOP.dc10_inst);
        $vcdpluson(2,U.BCEDN_TOP.dc10_inst.dc10_inst.dc_ctrl_inst);
        $vcdplusmemon(0);
        $vcdplusdeltacycleon(0);
    end

    //BCEDN_TOP_WRAPPER U (.chip_clkw(clkw), 
    //                     .chip_clk(clk), 
    //                     .chip_rst(rst), 
    //                     .chip_start(start), 
    //                     .chip_data_in(data_in), 
    //                     .chip_in_en(in_en), 
    //                     .chip_data_out(data_out), 
    //                     .chip_out_en(out_en), 
    //                     .chip_done(done), 
    //                     .chip_fifo_wfull(fifo_wfull));
                         
    BCEDN_TOP_WRAPPER U (.chip_clkw(clkw), 
                         .chip_clk(clk), 
                         .chip_rst(rst), 
                         .chip_start(start), 
                         .chip_data_in(data_in), 
                         .chip_in_en(in_en), 
                         .chip_data_out(data_out), 
                         .chip_out_en(out_en), 
                         .chip_done(done), 
                         .chip_fifo_wfull(fifo_wfull));
    initial begin
      $sdf_annotate ("/home/tensor_v1/mnt/BCEDN_TMP/fullchip/BCEDN_TOP_WRAPPER_FULLCHIP.sdf", U);
    end    
endmodule
