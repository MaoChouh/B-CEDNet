`timescale 1ns/10ps

module conv_kernel_tb;
  reg                       in_en;
  reg  [4607:0]             fmap_in;
  reg  [4607:0]             weight;
  wire [12:0]               conv_out;
  
  //===============
  // Instantiation
  //===============
  conv_kernel conv_kernel(
    .in_en         (in_en),
    .fmap_in       (fmap_in),
    .weight        (weight),
    .conv_out      (conv_out)
  );
  
  //Initialization
  initial begin
    in_en = 1'b1;
    fmap_in = 'b0;
    weight = 'b0;
  end
  
  //Simulation time
  initial # 100000 $finish;
  
  //Random stimulus
  always #100 fmap_in = $random;
  always #70  weight = $random;
  
  //Reference
  wire [4607:0] fmap_xor;
  reg [12:0]   count_ones;  
  reg [4:0] error_count;
  integer i;
  
  initial error_count = 0;
  
  assign fmap_xor = fmap_in ^ weight;
  always @(fmap_in or weight) begin
    #5 count_ones = 0;
    for(i=0;i<4608;i=i+1) 
      count_ones = count_ones + fmap_xor[i];
    #1 if(count_ones !== conv_out) error_count = error_count + 1;
  end  
  
  always @(error_count)
    if(error_count != 0) begin
      $display("!!!!!!!!!!!!!!!!!!!!!!");
      $display("        ERROR         ");
      $display("!!!!!!!!!!!!!!!!!!!!!!");
    end

  //Dump waveform
  initial begin
    $vcdplusfile("./conv_kernel.vpd");
    $vcdpluson;
    $vcdplusmemon(0);
    $vcdplusdeltacycleon(0);
  end
    
    
endmodule
