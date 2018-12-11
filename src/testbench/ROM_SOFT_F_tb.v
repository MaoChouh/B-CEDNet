`timescale 1ns / 1ps
`include "../../src/testbench/headers/ROM_SOFT_F_tb.vh"
/*
    Copyright
    All right reserved.
    Module Name: W_ROM_SOFT_F_tb
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/



module ROM_SOFT_F_tb(
    );
    parameter CLK_PERIOD = `PARAM_CLK_PERIOD;
    parameter CLK_R_PERIOD = `PARAM_CLK_R_PERIOD;
    parameter DATA_DEPTH = `PARAM_DATA_DEPTH;
    parameter DATA_WIDTH = `PARAM_DATA_WIDTH;
    parameter DATA_DIV = `PARAM_DATA_DIV;
    
    localparam ADDR_IN_WIDTH = $clog2(DATA_DEPTH);
    localparam TRUE_DATA_WITH = DATA_WIDTH/DATA_DIV;
    localparam TRUE_DATA_DEPTH = DATA_DEPTH*DATA_DIV;
    
    wire clk;
    reg clk_r, r_en, rst, running, r_out_en;
    reg [ADDR_IN_WIDTH-1:0] addr_in;
    reg [$clog2((DATA_DIV+1)*2)-1:0] div_count;
    wire [DATA_WIDTH-1:0] data_out;
    
    integer data_out_id;
    
    always #(10/2) clk_r = ~clk_r;
    
    CLK_DIV #(.DIV(13)) 
    init(
        .clk_in(clk_r),
//        .rst(rst),
        .clk_out(clk)
        );
    
    
    // div_count
    always@(clk_r) begin
        if (div_count < (DATA_DIV+1)*2-1)
            div_count <= div_count + 1;
        else
            div_count <= 0;
    end
    
    // clk
//    always@(clk_r) begin
//        if ((div_count == DATA_DIV && clk_r == 0) || (div_count == 2*(DATA_DIV+1)-1 && clk_r == 1))
//            clk <= ~clk;
//    end
    
    // addr_in
    always@(posedge clk) begin
       if (~rst)
            addr_in <= 0;
       else if(running) begin
            if (addr_in < DATA_DEPTH-1)
                addr_in <= addr_in + 1;
            else
                addr_in <= 0;
        end
    end
    
    // r_en
    always@(running) begin
        r_en <= running;
    end
    
    // r_out_en
    always@(posedge clk) begin
        r_out_en <= r_en;
    end
    
    initial begin
        rst = 0; running = 0;
//        clk = 1;
        clk_r = 1;
        data_out_id = $fopen({"F:/Vivado_prj/B-CEDNet/test/ROM_SOFT_F_tb/output/", "ROM_SOFT_F_tb_data_out.rst"},"w");
        #(10*CLK_PERIOD)
        rst = 1;
        #(10*CLK_PERIOD)
//        rst = 0; 
        #(10*CLK_PERIOD+1)
        running = 1;
        #((DATA_DEPTH)*CLK_PERIOD)
        running = 0;
        #(CLK_PERIOD)
        $fclose(data_out_id);
        $finish;
    end
    
    // write output data to file
    always@(posedge clk) begin
        if (r_out_en) begin
            $fwrite(data_out_id,"%b\n", data_out);
        end
    end
    
//    initial begin
//        $vcdplusfile({`PARAM_OUTPUTPATH, "ROM_SOFT_F_tb_waveform.vpd"});
//        $vcdpluson;
//        $vcdplusmemon(0);
//        $vcdplusdeltacycleon(0);
//    end
    
    ROM_SOFT_F # (.DATA_WIDTH(DATA_WIDTH), .DATA_DEPTH(DATA_DEPTH), .DATA_DIV(DATA_DIV)) U (.clk(clk), .clk_r(clk_r), .r_en(r_en), .rst(rst),
                  .addr_in(addr_in), .data_out(data_out));
    
endmodule
