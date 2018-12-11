`timescale 1ns / 1ps
`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
`include "../../src/testbench/headers/BCEDN_TOP_tb.vh"
/*
    Copyright
    All right reserved.
    Module Name: SYS_TOP
    Author  : Jiaming Huang.
    Description: SYS_TOP module.
*/


module BCEDN_TOP_tb(
    input clk_p,
    input clk_n,
    input rst_n,
    output [7:0] led

);

    wire clk;
    wire clkw;


  clk_wiz_0 sys_clk
   (
    // Clock out ports
    .clk_out1(clk),     // output clk_out1_100MHz
    .clk_out2(clkw),     // output clk_out2_7MHz
   // Clock in ports
    .clk_in1_p(clk_p),    // input clk_in1_p
    .clk_in1_n(clk_n));    // input 
    
    reg [7:0] data_in, data_in_dly;
    reg [11:0] data_in_addr;
    data_in_ROM your_instance_name (
    .clka(clkw),    // input wire clka
    .addra(data_in_addr),  // input wire [11 : 0] addra
    .douta(data_in_dly)  // output wire [7 : 0] douta
);
    
    // inputs
    wire start;
    reg in_en;
    // outputs
    reg [23:0] data_out;
    wire out_en;
    wire rdy, fifo_wfull;
    wire done;
    //sys_count used to control the flow , mostly 'start'
    reg [4:0] sys_count;
    always @(posedge clk)begin
    if(~rst_n)
    sys_count<=0;
    else if(~sys_count[4]==1)
        sys_count<=sys_count+1;
    end
    
    assign start=(sys_count=='d20)?1:0;
  
 
    always@(posedge clkw) begin
        if (~rst_n)
            in_en <= 0;
        else if (~fifo_wfull) begin
            in_en <= 1;
        end
        else begin
            in_en <= 0;
        end
    end
    //data_in_addr
    always@(posedge clkw) begin
        if(~rst_n)
            data_in_addr<=0;
        else
            data_in_addr<=data_in_addr+1;
    end
    // data_in
    always@(posedge clkw) begin
        if (~rst_n)
            data_in <= 0;
        else if (~fifo_wfull)
            data_in <= data_in_dly;
    end
    reg [16:0] data_out_count;
    always@(posedge out_en)begin
    if(~rst_n)
        data_out_count<=0;
    else
        data_out_count<=data_out_count+1;
    end
    reg led_done;
    always@(posedge done)begin
    if(~rst_n)
        led_done<=0;
    else
        led_done=1;
    end
    //led[7:0]
    assign led[0] = (data_in_addr=='hfff)?1:0;
    assign led[1] = (sys_count>='d20)?1:0;
    assign led[3] = (data_out_count=='d110592)?1:0;
    assign led[4] = led_done;

    BCEDN_TOP U (.clkw(clkw), .clk(clk), .rst(rst_n), .start(start), .data_in(data_in), .in_en(in_en), .data_out(data_out), .out_en(out_en), .done(done), .fifo_wfull(fifo_wfull));
        
endmodule
