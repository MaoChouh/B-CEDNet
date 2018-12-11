`timescale 1ns / 1ps
`include "../../src/testbench/headers/W_ROM_tb.vh"
`include "../../src/testbench/headers/W_ROM_tb_memmacro.vh"
/*
    Copyright
    All right reserved.
    Module Name: W_ROM_tb
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: testbench of W_ROM
*/


module W_ROM_tb();
    parameter DATA_WIDTH = `PARAM_DATA_WIDTH;
    parameter DATA_DEPTH = `PARAM_DATA_DEPTH;
    parameter INST_TYPE = `PARAM_INST_TYPE; // FULL_SOFT, 512X64X16, 1024X32X32, 1152X32X32
    parameter PRELOADFILE = `PARAM_PRELOADFILE;
    parameter ADDR_WIDTH = `PARAM_ADDR_WIDTH;
    parameter CLK_PERIOD = `PARAM_CLK_PERIOD;
    parameter MEM_NAME = `PARAM_MEM_NAME;
    
    // inputs
    reg clk, r_en, burn_in_en, rst_b;
    reg [ADDR_WIDTH-1:0] addr_in;
    
    // outputs
    reg burned;
    reg [DATA_WIDTH-1:0] data_out;
    
    integer data_out_id;
    string str;
    
    `LOAD_MEM
    
    initial begin
        clk = 0;
        rst_b = 0;
        addr_in = 0;
        r_en = 0;
        burn_in_en = 0;
        data_out_id = $fopen({`PARAM_OUTPUTPATH, "W_ROM_tb_data_out.rst"},"wt");
        #(10*CLK_PERIOD)
        rst_b = 1;
        #(DATA_DEPTH*CLK_PERIOD)
        $fclose(data_out_id);
        $finish;
    end
    
    always #(CLK_PERIOD/2) clk = ~clk;
    
    always@ (negedge clk) begin
        if (rst_b)
            addr_in <= addr_in + 1;
    end
    
    always@(posedge clk) begin
        if (rst_b && ~r_en) begin
            $fwrite(data_out_id,"%b\n", data_out);
        end
    end
    
    initial begin
        $vcdplusfile({`PARAM_OUTPUTPATH, "testbench_W_ROM_waveform.vpd"});
        $vcdpluson;
        $vcdplusmemon(0);
        $vcdplusdeltacycleon(0);
    end
    
    W_ROM # (.MEM_NAME(MEM_NAME), .DATA_WIDTH(DATA_WIDTH), .DATA_DEPTH(DATA_DEPTH), .INST_TYPE(INST_TYPE), .PRELOADFILE(PRELOADFILE))
        U (.clk(clk), .r_en(r_en), .burn_in_en(burn_in_en), .rst_b(rst_b), .addr_in(addr_in), .burned(burned), .data_out(data_out));
    
endmodule
