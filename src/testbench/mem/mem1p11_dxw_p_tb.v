`timescale 1ns/1ps
//`include "E:/work/Research/Projects/Sparse_Signal_Processing/ASIC/sparse_signal_decoder/memory/soft_model/mem1p11_dxw_p.v"


module mem1p11_dxw_p_tb;
	parameter DEPTH = 2048,
	          WIDTH = 24,
	          A = $clog2(DEPTH); //addr_width
	
		// BIST interface
	reg  [A-1:0]   addr;
	reg  [WIDTH-1:0]   din;
	reg            clk;
	reg            me;
	reg            wnr;
	wire [WIDTH-1:0]   dout;
	
	always # 50 clk = ~clk;
	
	initial
	begin
//		$dumpfile("sim_results.vcd");
// 	  $dumpvars(0, DUT);
//		$fsdbDumpfile("TCAM_tb.fsdb");
//  	$fsdbDumpvars(0, DUT);  	
//		$vcdpluson;
		addr = 0;    
		din = 0;     
		me = 0;      
		wnr = 0;      
    clk = 0;
//###################### reset ##########################
	# 200
		wnr = 0;
		din = 24'habcdef;
//###################### write date ##########################
	# 100
		addr = addr+1;
		din = din+1;
	# 100
		me = 1;
		addr = addr+1;
		din = din+1;
	# 100
		wnr = 1;
		addr = addr+1;
		din = din+1;
	# 100
		addr = addr+1;
		din = din+1;
	# 100
		addr = addr+1;
		din = din+1;	
	# 100
		addr = addr+1;
		din = din+1;		
//###################### read data ##########################
	# 100
		wnr = 0;
		addr = 0;
	# 100
		addr = addr+1;
	# 100
		addr = addr+1;
	# 100
		addr = addr+1;
	# 100	
		addr = addr+1;
	# 100	
		me = 0;
	# 100
		addr = addr+1;
		me = 1;
	# 100	
		me = 0;
	# 100
		addr = addr+1;
		me = 1;
	# 100
		addr = addr+1;
	# 100
		addr = addr+1;
	# 100
		addr = addr+1;
	# 100
		addr = addr+1;
	# 100
		addr = addr+1;
	# 100
		addr = addr+1;
		
//	# 1000
//		$dumpflush;
//		$fsdbDumpflush;
//		$finish;
	end
	
mem1p11_dxw_p #(
  DEPTH,
  WIDTH
) DUT (
	addr,
	din,
	me,
	wnr,
	clk,
	dout
	);
	 
endmodule
