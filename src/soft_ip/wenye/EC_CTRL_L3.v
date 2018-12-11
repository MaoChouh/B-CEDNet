`timescale 1ns/1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
/*
  Copyright
  All Right reserved
  Module Name: EC_CTRL_L3
  Author : Zichuan Liu, Yixing Li and Wenye Liu
  Description:
      Modified state machine for Layer 3 Encoder
*/

module EC_CTRL_L3 #(parameter H = 8, W = 32, D = 512, FH = 3, FW = 3, FD = 512,
                              PAD = 1, POOL_H = 2, POOL_W = 2, STRIDE_H = 1, STRIDE_W = 1,
                              W_ROM_DATA_DEPTH = 128, N_PE = 2, TG_NEXT_H = 1, TG_NEXT_W = 0,
                              M = 1, P = 1,
                    localparam W_ROM_ADDR_IN_WIDTH = $clog2(W_ROM_DATA_DEPTH),
                               H_OUT = H/POOL_H, W_OUT = W/POOL_W, D_OUT = FD,
                               INDEX_SRAM_DEPTH = H_OUT*W_OUT*D_OUT/N_PE,
                               INDEX_ADDR_WIDTH = $clog2(INDEX_SRAM_DEPTH),
                               IN_WINDOW_H = (POOL_H-1)*STRIDE_H+FH,
                               IN_WINDOW_W = (POOL_W-1)*STRIDE_W+FW,
                    //state
                    S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, S4 = 4'd4, S5 = 4'd5, S6 = 4'd6,
                    S1p = 4'd7, S2p = 4'd8, S3p = 4'd9, S4p = 4'd10, S5p = 4'd11, S6p =4'd12)
  //outputs
  output logic fmap_in_shiftreg_en, fmap_out_shiftreg_en, w_rom_en,
  output logic [W_ROM_ADDR_IN_WIDTH-1:0] w_rom_addr,
  output logic index_sram_en, index_sram_wr,
  output logic [INDEX_ADDR_WIDTH-1:0] index_sram_addr,
  output logic pe_en, pad_mux_sel, data_out_en, tg_next,
  output logic mux2_sel, //Add for layer3

  //inputs
  input clk, rst, data_in_en, start
);

  logic [$clog2(M*D_OUT/N_PE)-1:0] output_count;
  logic [$clog2(W+2*PAD)-1:0] col_count;
  logic [$clog2(H+2*PAD)-1:0] row_count;
  logic [$clog2(P)-1:0] p_count;
  
  logic [3:0] state, next_state;

  //Two always block FSM
  always@(posedge clk)
    if(~rst) state <= S0;
    else     state <= next_state;

  always@(*) begin
    next_state = 4'bx;
    fmap_in_shiftreg_en = 1'b0; fmap_out_shiftreg_en = 1'b0;
    index_sram_en = 1'b0; index_sram_wr = 1'b0;
    pe_en = 1'b0; pad_mux_sel = 1'b0; w_rom_en = 1'b0;  
    mux2_sel = 1'b0;

    case(state)
      S0:  begin       w_rom_addr = 'b0; index_sram_addr = 'b0; 
             if(start) next_state = S1;
             else      next_state = S0;
           end

      S1:  begin       fmap_in_shifreg_en = 1'b1; pad_mux_sel = 1'b1;
                       next_state = S1p;
           end
      
      S1p: begin       next_state = S1p;
             if(output_count == M*D_OUT/N_PE-1) 
               if((row_count >= PAD)&&(row_count <= 8)&&
                  (col_count == 0))
                       next_state = S2;
               else      next_state = S1;
           end

      S2:  begin       fmap_in_shiftreg_en = 1'b1;
                       next_state = S2p;
           end

      // Row 8 has special implementation
      S2p: begin       next_state = S2p;

             if(output_count == M*D_OUT/N_PE-1)
               if(((row_count == 1)||(row_count >= (POOL_H*POOL_W-2)&&
                   row_count <= H && row_count[0] == 0))&&(col_count== W))
                     
                       next_state = S1;

               else if(((row_count >= (POOL_H*POOL_W-1)&& row_count <= H-1&&
                       row_count[0] == 1)&& (col_count >= 2)&&(col_count <= W-2))||
                       (((row_count >=(POOL_H*POOL_W-1))&&(row_count == 8)&&
                       (row_count[0] == 0))&&(col_count >= 2)&&(col_count <= W-2)))
                     
                       next_state = S3;
             
               else if(row_count >= (POOL_H*POOL_W-1)&&(row_count <= H-1)&&
                       ((row_count[0] == 1)||(row_count == 8))&&(col_count>=2)&&
                       col_count == W)
           
                       next_state = S4;
              else     next_state = S2;
            end

       S3:  begin      fmap_in_shiftreg_en = 1'b1; fmap_out_shifreg_en = 1'b1;
                       w_rom_en = 1'b1; w_rom_addr = w_rom_addr+1;
                       index_sram_en = 1'b1; index_sram_wr = 1'b1; 
                       index_sram_addr = index_sram_addr+1;
                       pe_en = 1'b1;
              if(row_count == 8) 
                       mux2_sel = 1'b1;
              else     mux2_Sel = 1'b0;

                       next_state = S3p;
            end

       S3p: begin      next_state = S3p;
                       fmap_out_shiftreg = 1'b1; w_rom_en = 1'b1;
                       w_rom_addr = w_rom_addr+1; index_sram_en = 1'b1;
                       index_sram_wr = 1'b1; index_sram_addr = index_sram_addr+1;
                       pe_en = 1'b1;
              if(row_count == 8)
                       mux2_sel = 1'b1;
              else     mux2_sel = 1'b0;

              if(((row_count >= 3)&&(row_count<=7))&&(row_count[0]==1)||(row_count == 8))
                if(((col_count >= 3)&&(col_count<=31))&&(row_count[0] == 1))
                       next_state = S2;
            end

       S4:  begin      fmap_in_shiftreg_en = 1'b1; fmap_out_shiftreg_en = 1'b1;
                       w_rom_en = 1'b1; w_rom_addr = w_rom_addr+1;
                       index_sram_en = 1'b1; index_sram_wr = 1'b1;
                       index_sram_addr = index_sram_addr+1;
                       pe_en = 1'b1; pad_mux_sel = 1'b1;
              if(row_count == 8)
                       mux2_sel = 1'b1;
              else     mux2_sel = 1'b0;

                       next_state = S4p;

       S4p: begin      fmap_out_shiftreg_en = 1'b1; w_rom_en = 1'b1;
                       w_rom_addr = w_rom_addr+1; index_sram_en = 1'b1;
                       index_sram_wr = 1'b1; index_sram_addr = index_sram_addr+1;
                       pe_en = 1'b1;
              if(row_count == 8)
                       mux2_sel = 1'b1;
              else     mux2_sel = 1'b0;




