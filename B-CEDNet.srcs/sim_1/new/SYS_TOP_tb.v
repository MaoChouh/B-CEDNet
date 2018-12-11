`timescale 1ns / 1ps
/*
    Copyright
    All right reserved.
    Module Name: SYS_TOP
    Author  : Jiaming Huang.
    Description: SYS_TOP module.
*/


module SYS_TOP_tb();
    parameter  CLK_DUTY=10;
    reg clk=0;
    reg rst;
    wire rst_n;
    always #(CLK_DUTY/2) clk=~clk;
    initial begin
    rst=0;
//    rst_n=0;
    #(CLK_DUTY)
    rst=1;
//    #(10*CLK_DUTY*13)
//    rst_n=1;
//    #(20*CLK_DUTY*13)
//    start=1;
//    #(CLK_DUTY*13)
//    start=0;
    end
    
    reg [8:0] rst_cnt; 
    always @(posedge clk or negedge rst)begin
    if(~rst)
        rst_cnt=0;
     else if(rst_cnt <='d130)
        rst_cnt <= rst_cnt +1;
    end
    assign rst_n=(rst_cnt<='d130)?0:1;
    
    
    
    reg a1,a2;
    always@(negedge clk)begin
    a1<=clkw;
    a2<=a1;
    end
    
    wire clkw_edge;
    assign clkw_edge=a1&&(~a2);
    
    
    
    reg [7:0] data_in=0;
//    wire [7:0] data_in_probe = data_in;
    wire [7:0] data_in_dly;
    reg [11:0] data_in_addr=0;
//    wire [11:0] data_in_addr_probe=data_in_addr;
    data_in_ROM your_instance_name (
    .clka(clkw),    // input wire clka
    .addra(data_in_addr),  // input wire [11 : 0] addra
    .douta(data_in_dly)  // output wire [7 : 0] douta
);
    
    // inputs
    wire start;
    reg in_en=0;
    // outputs
    wire out_en;
    wire rdy, fifo_wfull;
    wire done;
    //sys_count used to control the flow , mostly 'start'
    reg [5:0] sys_count=0;
    always @(posedge clk)begin
    if(~rst_n)
    sys_count<=0;
    else if(clkw_edge)
         if(sys_count<40)
           sys_count<=sys_count+1;
    end
    
    assign start=(sys_count=='d39)?1:0;
  
 
    reg c1,c2;
        wire out_en_edge;
        always@(negedge clk)begin
        c1<=out_en;
        c2<=c1;
        end
        assign out_en_edge=c1&&(~c2);
        
        
        reg [16:0] data_out_count;
        always@(posedge clk)begin
        if(~rst_n)
            data_out_count<=0;
        else if(out_en_edge)
            data_out_count<=data_out_count+1;
        end 
 
 
 
    always@(posedge clk) begin
        if (~rst_n)
            in_en <= 0;
        else if (clkw_edge) begin
             if  (~fifo_wfull) begin
                in_en <= 1;
            end
            else begin
                in_en <= 0;
            end
        end
    end
    //data_in_addr
    always@(posedge clk) begin
        if(~rst_n)
            data_in_addr<=0;
        else if (clkw_edge)
             if (~fifo_wfull)
                data_in_addr<=data_in_addr+1;
        end
    // data_in
    always@(posedge clk) begin
        if (~rst_n)
            data_in <= 0;
        else if (clkw_edge)
             if (~fifo_wfull)
            data_in <= data_in_dly;
        end

    
    wire [23:0] data_out;
    BCEDN_TOP U (.clkw(clkw), .clk(clk), .rst(rst_n), .start(start), .data_in(data_in), .in_en(in_en), .data_out(data_out), .out_en(out_en), .done(done), .fifo_wfull(fifo_wfull));
        
endmodule

