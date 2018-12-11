/*
    Copyright
    All right reserved.
    Module Name: SYS_TOP
    Author  : Jiaming Huang.
    Description: SYS_TOP module.
*/


module SYS_TOP(
    input clk_p,
    input clk_n,
    input rst,
    output [7:0] led

);   
    // inputs
    wire start;
    reg in_en;
    // outputs
    wire out_en;
    wire rdy, fifo_wfull;
    wire done;
    wire rst_in=~rst;
    //clk and rst_in

  wire clk;
  clk_wiz_0 sys_clk
   (
    // Clock out ports
    .clk_out1(clk),     // output clk_out1_100MHz
   // Clock in ports
    .clk_in1_p(clk_p),    // input clk_in1_p
    .clk_in1_n(clk_n));    // input 
    
    reg [7:0] data_in;
    wire [7:0] data_in_dly, clkw;
    reg [11:0] data_in_addr;
    data_in_ROM your_instance_name (
    .clka(clkw),    // input wire clka
    .addra(data_in_addr),  // input wire [11 : 0] addra
    .douta(data_in_dly)  // output wire [7 : 0] douta
);

    //global_rst_n 
    reg [8:0] rst_cnt; 
    wire rst_n;
    always @(posedge clk or negedge rst_in)begin
    if(~rst_in)
        rst_cnt<=0;
    else if(rst_cnt <='d130)
        rst_cnt <= rst_cnt +1;
    end
    assign rst_n=(rst_cnt<='d130)?0:1;
    
    
    //input fps compute
    (* keep = "TRUE" *) reg [31:0] fps_count;
    always @(posedge clk or negedge rst_n)begin
    if(~rst_n)
        fps_count<=0;
    else if(data_in_addr<12'hfff)
        fps_count<=fps_count+'b1;
    end
        

    
    
    
    //capture clkw posedge
    reg a1,a2;
    wire clkw_edge;
    
    always@(negedge clk)begin
        a1<=clkw;
        a2<=a1;
    end
    assign clkw_edge=a1&&(~a2);
    

    

    //sys_count used to control the flow , mostly 'start'
    reg [5:0] sys_count;
    always @(posedge clk)begin
    if(~rst_n)
    sys_count<=0;
     else if(clkw_edge)
        if(sys_count<40)
            sys_count<=sys_count+1;
    end
    
    assign start=(sys_count=='d39)?1:0;
  
 
    always@(posedge clk) begin
        if (~rst_n)
            in_en <= 0;
        else if (clkw_edge) begin
             if (~fifo_wfull) begin
                in_en <= 1;
            end
            else begin
                in_en <= 0;
            end
        end
    end
//    data_in_addr
    always@(posedge clk) begin
        if(~rst_n)
            data_in_addr<=0;
        else if (clkw_edge)
            if(~fifo_wfull&&data_in_addr<12'hfff)
                data_in_addr<=data_in_addr+1;
    end
//     data_in
    always@(posedge clk) begin
        if (~rst_n)
            data_in <= 0;
        else if (clkw_edge)
            if (~fifo_wfull)
                data_in <= data_in_dly;
    end
    
    // data_out_count
    reg [16:0] data_out_count;
    always@(posedge clk)begin
    if(~rst_n)
        data_out_count<=0;
    else if(out_en)
        if(clkw_edge)
            data_out_count<=data_out_count+1;
    end
    
    
    //LED for test 
    
    reg b1,b2;
    wire done_edge;
    always@(negedge clk)begin
    b1<=done;
    b2<=b1;
    end
    assign done_edge=b1&&(~b2);
    
    reg led_done=0;
    always@(posedge clk)begin
    if(~rst_n)
        led_done<=0;
    else if(done_edge)
        led_done=1;
    end
    
    (* keep = "TRUE" *) reg [31:0] latency_count;
    always @(posedge clk or negedge rst_n)begin
        if(~rst_n)
            latency_count<=0;
        else if(data_in_addr>'b0&&~led_done)
            latency_count<=latency_count+'b1;
    end
    
    
    
    
    
    
    reg div1hz_o_r;
    reg [25:0] div1hz_cnt;
    always @(posedge clk)
    if(div1hz_cnt<26'd50_000_000)
        div1hz_cnt<=div1hz_cnt+1'b1;
     else
        div1hz_cnt<=0;
        
    always@(posedge clk)
        if(div1hz_cnt==26'd49_999_999)
            div1hz_o_r<=~div1hz_o_r;
        else
            div1hz_o_r<=div1hz_o_r;
    reg led_start=0;
    always@(negedge start)begin
    if(~rst_n)
        led_start<=0;
    else
        led_start<=1;
    end
    //led[7:0]
    assign led[0] = (data_in_addr=='hfff)?1:0;
    assign led[1] = (sys_count>='d20)?1:0;
    assign led[3] = (data_out_count=='d110592)?1:0;
    assign led[4] = led_done;
    assign led[5] = led_start;
    assign led[6] = (rst_n)?div1hz_o_r:1;
    
       
//    (* keep = "TRUE" *) reg  [23:0] data_out_buf;
//   wire [23:0] data_out_buf;
   wire [23:0] data_out;
//    always@(posedge clk) begin
//        if(out_en)
//            if(clkw_edge)
//                data_out_buf<=data_out;
//    end
//    c_shift_ram_0 shift_ram (
//      .D(data_out),      // input wire [23 : 0] D
//      .CLK(clkw),  // input wire CLK
//      .Q(data_out_buf)      // output wire [23 : 0] Q
//    );


    
    
    BCEDN_TOP U (.clkw(clkw), .clk(clk), .rst(rst_n), .start(start), .data_in(data_in), .in_en(in_en), .data_out(data_out), .out_en(out_en), .done(done), .fifo_wfull(fifo_wfull));
        
endmodule
