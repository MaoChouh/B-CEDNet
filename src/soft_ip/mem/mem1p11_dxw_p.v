/*
 ###############################################################################
 # Copyright (c) 2012 - by UCLA.
 # All rights reserved.
 #
 # Author     : Fengbo Ren (fren@ee.ucla.edu)
 #
 # Description:
 ###############################################################################
*/

`ifdef TCQ
`else
 `define TCQ #1
`endif

module mem1p11_dxw_p (
	addr,
	din,
	me,
	wnr,
	clk,
	dout
);

	//-----------------------------------
	// Parameter Defination
	//-----------------------------------
		
	parameter DEPTH = 2048,  // DEPTH
	          WIDTH = 24;   // WIDTH
	
	localparam A = $clog2(DEPTH)>0 ? $clog2(DEPTH) : 1; //addr_width
	
	//-----------------------------------
	// Port Defination
	//-----------------------------------
	
	input      [A-1:0]     addr;   
	input      [WIDTH-1:0] din;     
	input                  me;    
	input                  wnr;   
	input                  clk;          
	output reg [WIDTH-1:0] dout;
	
	//-----------------------------------
	// Internal Signal Defination
	//-----------------------------------
	reg [WIDTH-1:0] mem [DEPTH-1:0];
	reg [WIDTH-1:0] data_out;
	
	//-----------------------------------
	// Description
	//-----------------------------------
	
	// Write/Read data to mem                                    
	always @(posedge clk) 
	begin
		if (me)
		begin                                
			if (wnr) 
	  	begin                                    
	  		mem[addr] <= `TCQ din;
	  	end
	  	else 
	  	begin
	  		data_out <= `TCQ mem[addr];
			end
		end	                                                  
	end                                                        
	
	always @(posedge clk) 
	begin 
		dout <= `TCQ data_out;
	end

endmodule
