`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
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
    logic [DATA_WIDTH-1:0]  data_tmp [0:N-1];
    reg   [DATA_WIDTH-1:0]  data_tmp1, data_tmp2, data_tmp3;
    reg   [INDEX_WIDTH-1:0] index_tmp[0:N-2];

    assign data_tmp[N-1] = data_in[DATA_WIDTH-1:0];
    assign data_tmp[N-2] = data_in[DATA_WIDTH*2-1:DATA_WIDTH];

    always @* begin
      if(N==4) begin 
        data_tmp[N-3] = data_in[DATA_WIDTH*3-1:DATA_WIDTH*2];
        data_tmp[N-4] = data_in[DATA_WIDTH*4-1:DATA_WIDTH*3];
      end
    end

    always @* begin
      if(s==1) begin
        if($signed(data_tmp[0]) < $signed(data_tmp[1])) begin
          index_tmp[0] = 2'b01;
          data_tmp1 = data_tmp[1];
        end
        else begin 
          index_tmp[0] = 2'b00;
          data_tmp1 = data_tmp[0];
        end

        if(N==4) begin
          if($signed(data_tmp[2]) < $signed(data_tmp[3])) begin
            index_tmp[1] = 2'b11;
            data_tmp2 = data_tmp[3];
          end
          else begin 
            index_tmp[1] = 2'b10;
            data_tmp2 = data_tmp[2];
          end
        end
      end
      
      else if(s==0) begin
        if($signed(data_tmp[0]) < $signed(data_tmp[1])) begin
          index_tmp[0] = 2'b00;
          data_tmp1 = data_tmp[0];
        end
        else begin 
          index_tmp[0] = 2'b01;
          data_tmp1 = data_tmp[1];
        end

        if(N==4) begin
          if($signed(data_tmp[2]) < $signed(data_tmp[3])) begin
            index_tmp[1] = 2'b10;
            data_tmp2 = data_tmp[2];
          end
          else begin 
            index_tmp[1] = 2'b11;
            data_tmp2 = data_tmp[3];
          end
        end
      end
    
    end
    
    always @(data_tmp1 or data_tmp2) begin
      if(s==1) begin
        if(N==4) begin
          if(data_tmp1 < data_tmp2) begin
            index = index_tmp[1];
            data_tmp3 = data_tmp2;
          end
          else begin 
            index = index_tmp[0]; 
            data_tmp3 = data_tmp1;
          end
        end
        else begin 
            index = index_tmp[0];
            data_tmp3 = data_tmp1;
        end
      end

      else if(s==0) begin
        if(N==4) begin
          if(data_tmp1 < data_tmp2) begin
            index = index_tmp[0];
            data_tmp3 = data_tmp1;
          end
          else begin 
            index = index_tmp[1]; 
            data_tmp3 = data_tmp2;
          end
        end
        else begin 
            index = index_tmp[0];
            data_tmp3 = data_tmp1;
        end
      end
    
    end
    
    assign data_out = data_tmp3;

endmodule
