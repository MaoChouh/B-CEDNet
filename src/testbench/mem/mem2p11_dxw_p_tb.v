`timescale 1ns/1ps
//`include "E:/work/Research/Projects/Sparse_Signal_Processing/ASIC/sparse_signal_decoder/memory/soft_model/mem2p11_dxw_p.v"

module mem2p11_dxw_p_tb;
	parameter DEPTH = 2048,
	          WIDTH = 24,
	          A = $clog2(DEPTH); //addr_width

		// BIST interface
	reg  [A-1:0]   addrr, addrw;
	reg  [WIDTH-1:0]   din;
	reg            clk;
	reg            mer, mew;
	wire [WIDTH-1:0]   dout;
	
	always # 50 clk = ~clk;
	
	initial
	begin
//		$dumpfile("TCAM_tb.vcd");
//  	$dumpvars(0, DUT);
//		$fsdbDumpfile("TCAM_tb.fsdb");
//  	$fsdbDumpvars(0, DUT);  	
//		$vcdpluson;
		addrr = 0 ;    
		addrw = 0 ;
		din = 0;     
		mer = 0;   
		mew = 0;       
    clk = 0;
//###################### reset ##########################
	# 200
//		WNR = 0;
		din = 104'habcdef;
//###################### write date ##########################
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;
	# 100
		mew = 1;
		mer = 1;
		addrr = 0;
		addrw = addrw+1;
		din = din+1;
	# 100
//		WNR = 1;
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;
	# 100
		mew = 0;
		mer = 0;
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;
		mew = 1;
		mer = 1;
	# 100
		mew = 0;
		mer = 0;
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;
		mew = 1;
		mer = 1;
	# 100
		mew = 0;
		mer = 0;
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;
		mew = 1;
		mer = 1;
	# 100
		mew = 0;
		mer = 0;
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;
		mew = 1;
		mer = 1;
	# 100
		mew = 0;
		mer = 0;
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;
		mew = 1;
		mer = 1;
	# 100
		mew = 0;
		mer = 0;
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;
		mew = 1;
		mer = 1;
	# 100
		mew = 0;
		mer = 0;
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;
		mew = 1;
		mer = 1;
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;		
//###################### read data ##########################
	# 100
		din = 104'hffff;
		addrr = 3;
		addrw = 3;
	# 100
		addrr = 3;
		addrw = addrw+1;
		din = din+1;	
	# 100
		mew = 0;
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;	
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;	
	# 100
		mer = 0;
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;	
	# 100
		addrr = addrr+1;
		addrw = addrw+1;
		din = din+1;	
		
//	# 1000
//		$dumpflush;
//		$fsdbDumpflush;
//		$finish;
end
	
mem2p11_dxw_p #(
  DEPTH,
  WIDTH
) DUT (
	addrr,
	addrw,
	din,
	mer,
	mew,
	clk,
	dout
	);
	 
endmodule
