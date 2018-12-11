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

module mem2p11_dxw_u (
	addrr,
	addrw,
	din,
	mer,
	mew,
	clk,
	dout
);

	//-----------------------------------
	// Parameter Defination
	//-----------------------------------
	parameter DEPTH = 2048,  // depth
	          WIDTH = 24;   // width
		
	localparam A = $clog2(DEPTH)>0 ? $clog2(DEPTH) : 1; //addr_width
	
	//-----------------------------------
	// Port Defination
	//-----------------------------------
	
	input      [A-1:0]     addrr; 
	input      [A-1:0]     addrw;   
	input      [WIDTH-1:0] din;     
	input                  mer;    
	input                  mew; 
	input                  clk;          
	output reg [WIDTH-1:0] dout;
	
	//-----------------------------------
	// Internal Signal Defination
	//-----------------------------------
	
	reg [WIDTH-1:0] mem [DEPTH-1:0];
	
	//-----------------------------------
	// Description
	//-----------------------------------
	
	always @(posedge clk) 
	begin                                
		if (mew) 
	  begin                                    
	  	mem[addrw] <= `TCQ din;
	  end
	end
	
	always @(posedge clk) 
	begin  
	  if (mer) 
	  begin
	  	dout <= `TCQ mem[addrr];
		end	                                                  
	end                                                        
	
endmodule
