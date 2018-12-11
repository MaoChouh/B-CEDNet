`timescale 1ns / 1ps
//`include "../../src/soft_ip/include/includes.vh"
//`include "../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: COMPARATOR
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: Comparing among N data with bitwidth of DATA_WIDTH. All N data 
    are ceacaded in the 'data_in'.
*/


module COMPARATOR(
    // inputs   
    data_in,
    s,
    // outputs
    data_out,
    index
    );
    
    parameter N = 4;
    parameter DATA_WIDTH = 13;
    
    localparam INDEX_WIDTH = $clog2(N);
    
    input [DATA_WIDTH*N-1:0] data_in;
    input s;
    
    output [DATA_WIDTH-1:0] data_out;
    output reg [INDEX_WIDTH-1:0] index;
    
    // implementation of comparison among N data with bitwidth of DATA_WIDTH within 'data_in'
    //logic [DATA_WIDTH-1:0]  data_tmp [0:N-1];
    reg   [DATA_WIDTH-1:0]  data_tmp1, data_tmp2;
    reg   [INDEX_WIDTH-1:0] index_tmp[0:N-2];
    reg  index_tmp1, index_tmp2, index_tmp3;

  generate
    if(N==2) begin
      comparator_2 #(.DATA_WIDTH(DATA_WIDTH)) comparator_2_0 (.data_in(data_in), .s(s), .data_out(data_out), .index(index));
    end

    else if(N==4) begin
      comparator_2 #(.DATA_WIDTH(DATA_WIDTH)) comparator_2_0 (.data_in(data_in[DATA_WIDTH*4-1:DATA_WIDTH*2]), .s(s), 
                                    .data_out(data_tmp1), .index(index_tmp1));

      comparator_2 #(.DATA_WIDTH(DATA_WIDTH)) comparator_2_1 (.data_in(data_in[DATA_WIDTH*2-1:0]), .s(s), 
                                    .data_out(data_tmp2), .index(index_tmp2));
      
      comparator_2 #(.DATA_WIDTH(DATA_WIDTH)) comparator_2_2 (.data_in({data_tmp1,data_tmp2}), .s(s), 
                                    .data_out(data_out),  .index(index_tmp3));

      comp_case  comp_case(.index(index), .index_tmp1(index_tmp1), .index_tmp2(index_tmp2), .index_tmp3(index_tmp3));
    end
  endgenerate

endmodule

module comparator_2 #(parameter DATA_WIDTH = 13)( 
  output reg [DATA_WIDTH-1:0] data_out,
  output reg index,
  input [DATA_WIDTH*2-1:0] data_in,
  input s
);

    logic [DATA_WIDTH-1:0]  data_tmp [0:1];
    reg   [DATA_WIDTH-1:0]  data_tmp1;
    reg   index_tmp;

    assign data_tmp[1] = data_in[DATA_WIDTH-1:0];
    assign data_tmp[0] = data_in[DATA_WIDTH*2-1:DATA_WIDTH];

  always @* begin
    if(s==1) begin
      if($signed(data_tmp[0]) < $signed(data_tmp[1])) begin
        index_tmp = 1'b1;
        data_tmp1 = data_tmp[1];
      end
      else begin 
        index_tmp = 1'b0;
        data_tmp1 = data_tmp[0];
      end
      index = index_tmp;
      data_out = data_tmp1;
    end

    else if(s==0) begin
      if($signed(data_tmp[0]) <= $signed(data_tmp[1])) begin
        index_tmp = 1'b0;
        data_tmp1 = data_tmp[0];
      end
      else begin index_tmp = 1'b1; data_tmp1 = data_tmp[1]; end
      index = index_tmp; 
      data_out = data_tmp1;
    end
  end
endmodule

module comp_case(
  output reg [1:0] index,
  input index_tmp1, index_tmp2, index_tmp3
);

  always @* begin
    case({index_tmp1,index_tmp2,index_tmp3})
        3'b000: index = 2'b00;
        3'b001: index = 2'b10;
        3'b010: index = 2'b00;
        3'b011: index = 2'b11;
        3'b100: index = 2'b01;
        3'b101: index = 2'b10;
        3'b110: index = 2'b01;
        3'b111: index = 2'b11;
      endcase
  end
endmodule
