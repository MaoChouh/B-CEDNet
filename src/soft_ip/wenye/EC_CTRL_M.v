`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: EC_CTRL
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module EC_CTRL(
    // inputs
    clk,
    rst,
    start,
    data_in_en,
    // outputs
    fmap_in_shiftreg_en,
    fmap_out_shiftreg_en,
    w_rom_en,
    w_rom_addr,
    index_sram_en,
    index_sram_wr,
    index_sram_addr,
    pe_en,
    pad_mux_sel,
    data_out_en,
    tg_next
    );
    
    parameter H = 8;
    parameter W = 32;
    parameter D = 512;
    parameter FH = 3;
    parameter FW = 3;
    parameter FD = 512;
    parameter PAD = 1;
    parameter POOL_H = 2;
    parameter POOL_W = 2;
    parameter STRIDE_H = 1;
    parameter STRIDE_W = 1;
    parameter W_ROM_DATA_DEPTH = 128;
    parameter N_PE = 2;
    parameter TG_NEXT_H = 1; // row num start from 0,  
    parameter TG_NEXT_W = 0; // and the 'tg_next' will be asserted in the last cycle of row and col indicated by TG_NEXT_H and TG_NEXT_W
    parameter M = 1; // this parameter is used to cover ec_block-4 that has 512 cycle processing delay but
                         // maximum output_count of 1024. M = 1 is applied for ec_block-1 to ec_block-3 and M
                         // = 2 is used to ec_block-4
    parameter P = 1; // this parameter is used create time gap between row, 'P = 1' means 'row_count' will increase
                     // once 'col_count' reach its maximum.
    
    localparam W_ROM_ADDR_IN_WIDTH = $clog2(W_ROM_DATA_DEPTH);
    localparam H_OUT = H/POOL_H;
    localparam W_OUT = W/POOL_W;
    localparam D_OUT = FD;
    localparam INDEX_SRAM_DEPTH = H_OUT*W_OUT*D_OUT/N_PE;
    localparam INDEX_ADDR_WIDTH = $clog2(INDEX_SRAM_DEPTH);
    localparam IN_WINDOW_H = (POOL_H-1)*STRIDE_H+FH;
    localparam IN_WINDOW_W = (POOL_W-1)*STRIDE_W+FW;
    
    // state const
    localparam S0 = 0; localparam S1 = 1; localparam S2 = 2; 
    localparam S3 = 3; localparam S4 = 4; localparam S5 = 5;
    localparam S1p = 6;
    localparam S2p = 7;
    localparam S3p = 8;
    localparam S4p = 9;
    localparam S5p = 10;
    localparam S6 = 11; localparam S6p = 12;
    
    // inputs
    input clk, rst, data_in_en, start;
    
    // outputs
    output logic fmap_in_shiftreg_en;
    output logic fmap_out_shiftreg_en;
    output logic w_rom_en;
    output logic [W_ROM_ADDR_IN_WIDTH-1:0] w_rom_addr;
    output logic index_sram_en;
    output logic index_sram_wr;
    output logic [INDEX_ADDR_WIDTH-1:0] index_sram_addr;
    output logic pe_en;
    output logic pad_mux_sel;
    output logic data_out_en;
    output logic tg_next;
    
    logic [$clog2(M*D_OUT/N_PE)-1:0] output_count;
    reg [$clog2(W+2*PAD)-1:0] col_count;
    reg [$clog2(H+2*PAD)-1:0] row_count;
    reg [$clog2(P)-1:0] p_count;
    // fmap_in_shiftreg_en, fmap_out_shiftreg_en, w_rom_en, index_sram_en, index_sram_wr, pe_en, pad_mux_sel
    logic [3:0] state;
    //Modify to blocking assignment in combinational always
    always@(state or output_count or row_count or col_count) begin
        case (state)
            S0: begin
                fmap_in_shiftreg_en = 1'b0; fmap_out_shiftreg_en = 1'b0; w_rom_en = 1'b0;
                index_sram_en = 1'b0; index_sram_wr = 1'b0; pe_en = 1'b0; pad_mux_sel = 1'b0;
                end
            S1: begin
                fmap_in_shiftreg_en = 1'b1; fmap_out_shiftreg_en = 1'b0; w_rom_en = 1'b0;
                index_sram_en = 1'b0; index_sram_wr = 1'b0; pe_en = 1'b0; pad_mux_sel = 1'b1;
                end
            S1p: begin
                fmap_in_shiftreg_en = 1'b0; fmap_out_shiftreg_en = 1'b0; index_sram_en = 1'b0; 
                index_sram_wr = 1'b0; pad_mux_sel = 1'b0;
                if ((output_count == M*D_OUT/N_PE-1) && (row_count == H+1) && (col_count >= PAD+1)) begin
                    w_rom_en = 1'b1;
                    pe_en = 1'b1;
                end
                else begin
                    w_rom_en = 1'b0;
                    pe_en = 1'b0;
                end
                end
            S2: begin
                fmap_in_shiftreg_en = 1'b1; fmap_out_shiftreg_en = 1'b0; w_rom_en = 1'b0;               
                index_sram_en = 1'b0; index_sram_wr = 1'b0; pe_en = 1'b0; pad_mux_sel = 1'b0;
                end
            S2p:begin
                fmap_in_shiftreg_en = 1'b0; fmap_out_shiftreg_en = 1'b0;
                if ((output_count == M*D_OUT/N_PE-1) && (row_count >= IN_WINDOW_H-1 && row_count <= H+PAD-1 && row_count[0] == 1) 
                    &&(col_count >= IN_WINDOW_W-2 && col_count <= W+PAD-1)) begin
                    w_rom_en = 1'b1;
                    pe_en = 1'b1;
                end
                else begin
                    w_rom_en = 1'b0;
                    pe_en = 1'b0;
                end
                index_sram_en = 1'b0; index_sram_wr = 1'b0; pad_mux_sel = 1'b0;
                end
            S3: begin
                fmap_in_shiftreg_en = 1'b1; fmap_out_shiftreg_en = 1'b1  ; w_rom_en = 1'b1;
                index_sram_en = 1'b1; index_sram_wr = 1'b1; pe_en = 1'b1; pad_mux_sel = 1'b0;
                end
            S3p: begin
                fmap_in_shiftreg_en = 1'b0; 
                if (output_count <= D_OUT/N_PE-2) begin
                    w_rom_en = 1'b1; pe_en = 1'b1; 
                end
                else begin
                    w_rom_en = 1'b0; pe_en = 1'b0;
                end
                
                if (output_count <= D_OUT/N_PE-1) begin
                    fmap_out_shiftreg_en = 1'b1; index_sram_en = 1'b1; index_sram_wr = 1'b1;
                end
                else begin
                    fmap_out_shiftreg_en = 1'b0; index_sram_en = 1'b0; index_sram_wr = 1'b0;
                end
                pad_mux_sel = 1'b0;
                end
            S4: begin
                fmap_in_shiftreg_en = 1'b1; fmap_out_shiftreg_en = 1'b1; w_rom_en = 1'b1;
                index_sram_en = 1'b1; index_sram_wr = 1'b1; pe_en = 1'b1; pad_mux_sel = 1'b1;
                end
            S4p: begin
                fmap_in_shiftreg_en = 1'b0; 
                if (output_count <= D_OUT/N_PE-2) begin
                    w_rom_en = 1'b1; pe_en = 1'b1; 
                end
                else begin
                    w_rom_en = 1'b0; pe_en = 1'b0;
                end
                
                if (output_count <= D_OUT/N_PE-1) begin
                    fmap_out_shiftreg_en = 1'b1; index_sram_en = 1'b1; index_sram_wr = 1'b1;
                end
                else begin
                    fmap_out_shiftreg_en = 1'b0; index_sram_en = 1'b0; index_sram_wr = 1'b0;
                end
                
                pad_mux_sel = 1'b0;
                end
            S5: begin
                fmap_in_shiftreg_en = 1'b1; fmap_out_shiftreg_en = 1'b1; w_rom_en = 1'b1;
                index_sram_en = 1'b1; index_sram_wr = 1'b1; pe_en = 1'b1; pad_mux_sel = 1'b0;
                end
            S5p: begin
                fmap_in_shiftreg_en = 1'b0; 
                if (output_count <= D_OUT/N_PE-2) begin
                    w_rom_en = 1'b1; pe_en = 1'b1; 
                end
                else begin
                    w_rom_en = 1'b0; pe_en = 1'b0;
                end
                
                if (output_count <= D_OUT/N_PE-1) begin
                    fmap_out_shiftreg_en = 1'b1; index_sram_en = 1'b1; index_sram_wr = 1'b1;
                end
                else begin
                    fmap_out_shiftreg_en = 1'b0; index_sram_en = 1'b0; index_sram_wr = 1'b0;
                end
                
                pad_mux_sel = 1'b0;
                end
            S6: begin
                    fmap_in_shiftreg_en = 1'b0; fmap_out_shiftreg_en = 1'b0; w_rom_en = 1'b0;
                    index_sram_en = 1'b0; index_sram_wr = 1'b0; pe_en = 1'b0; pad_mux_sel = 1'b0;
                end
            S6p:begin
                    fmap_in_shiftreg_en = 1'b0; fmap_out_shiftreg_en = 1'b0; w_rom_en = 1'b0;
                    index_sram_en = 1'b0; index_sram_wr = 1'b0; pe_en = 1'b0; pad_mux_sel = 1'b0;
                end
        endcase
    end
    
    // w_rom_addr    
    always@(posedge clk) begin
        if (~rst) begin
            w_rom_addr <= 0;
        end            
        else if ((state == S2p && output_count == D_OUT/N_PE-1) 
                    || (state == S3) || ((state == S3p) && output_count <= D_OUT/N_PE-2)
                    || (state == S5) || ((state == S5p) && output_count <= D_OUT/N_PE-2)) begin
            if (w_rom_addr < D_OUT/N_PE-1)
                w_rom_addr <= w_rom_addr + 1;
            else
                w_rom_addr <= 0;
        end
        else if ((state == S1p && output_count == D_OUT/N_PE-1) 
                    || (state == S4) || ((state == S4p) && output_count <= D_OUT/N_PE-2)) begin
            if (w_rom_addr < D_OUT/N_PE-1)
                w_rom_addr <= w_rom_addr + 1;
            else
                w_rom_addr <= 0;
        end
        else begin
            w_rom_addr <= 0;
        end
            
    end
    
    // index_sram_addr
    always@(posedge clk) begin
        if (~rst) begin
            index_sram_addr <= 0;
        end            
        else if (index_sram_wr) begin
            if (index_sram_addr < D_OUT/N_PE-1)
                index_sram_addr <= index_sram_addr + 1;
            else
                index_sram_addr <= 0;
        end
    end
    
    // output_count
    always@(posedge clk) begin
        if (~rst)
            output_count <= 0;
        else if (state != S0) begin
            if (output_count >= M*D_OUT/N_PE-1)
                output_count <= 0;
            else
                output_count <= output_count + 1;
        end
        else
            output_count <= 0;
    end
    
    // col_count
    always@(posedge clk) begin
        if (~rst)
            col_count <= 0;
        else if (state == S0)
            col_count <= 0;
        else if (state != S0) begin
            if (output_count == M*D_OUT/N_PE-1) begin
                if (col_count >= W+PAD)
                    col_count <= 0;
                else 
                    col_count <= col_count + 1;
            end
        end           
    end
    
    // p_count
    always@(posedge clk) begin
        if (~rst)
            p_count <= 0;
        else if (state == S0)
            p_count <= 0;
        else if (state != S0) begin
            if ((col_count == W+PAD) && output_count == M*D_OUT/N_PE-1) begin
                if (p_count >= P-1)
                    p_count <= 0;
                else
                    p_count <= p_count + 1;
            end
        end
    end
    
    // row_count
    always@(posedge clk) begin
        if (~rst)
            row_count <= 0;
        else if (state == S0)
            row_count <= 0;
        else if (state != S0) begin
            if ((col_count == W+PAD) && (output_count == M*D_OUT/N_PE-1) && (p_count == P-1)) begin
                if (row_count >= H+PAD)
                    row_count <= 0;
                else
                    row_count <= row_count + 1;
            end            
        end      
    end
    
    //Modify to blocking assignment
    // tg_next
    always@(col_count or row_count or output_count) begin
        if (row_count == TG_NEXT_H && col_count == TG_NEXT_W && output_count == M*D_OUT/N_PE-1 && p_count == 0) begin
            tg_next = 1;
        end
        else begin
            tg_next = 0;
        end
    end
    
    //Modify to blocking assignment
    // data_out_en
    always@(output_count or state) begin
        if (output_count == D_OUT/N_PE-1 && (state == S3p || state == S4p || state == S5p))
            data_out_en = 1'b1;
        else
            data_out_en = 1'b0;
    end
    
    // state
    always@(posedge clk) begin
        if (~rst)
            state <= S0;
        else begin
            case (state)
                S0: begin
                        if (start)
                            state <= S1;
                    end
                S1: begin
                        if ((row_count >= 1) && (row_count <= 8) && (col_count == 0) && output_count == M*D_OUT/N_PE-1)
                            state <= S2;
                        //else if ((row_count == H+PAD) && (col_count == 1) && (output_count == M*D_OUT/N_PE-1))
                        //    state <= S4;
                        else begin
                            state <= S1p;
                        end
                    end
                S1p: begin
                        if (output_count == M*D_OUT/N_PE-1) begin
                            if ((row_count >= PAD) && (row_count <= 8) && (col_count == 0))
                                state <= S2;
                            //else if ((row_count == H+PAD) && (col_count >= 2))
                            //    state <= S4;
                            else if (P > 1&& (col_count == W+PAD))
                                state <= S6;
                            else
                                state <= S1;                  
                        end         
                     end
                S2: begin
                        if (((row_count == 1) || (row_count >= (POOL_H*POOL_W-2) && row_count <= H && row_count[0] == 0)) 
                                && (col_count == W+PAD) && (output_count == M*D_OUT/N_PE-1)) // RV: (col_count == W) is defined by Yixing and revised by Zichuan
                            state <= S1;
                        else if ((row_count >= (POOL_H*POOL_W-1) && row_count <= H-1 && row_count[0] == 1) && col_count == 1 && (output_count == M*D_OUT/N_PE-1)) 
                            state <= S3;
                        else begin
                            state <= S2p;
                        end
                    end
                S2p: begin
                        if (output_count == M*D_OUT/N_PE-1) begin
                            if (((row_count == 1) || (row_count >= (POOL_H*POOL_W-2) && row_count <= H && row_count[0] == 0)) 
                                        && (col_count == W)) 
                                state <= S1;
                            else if (((row_count >= (POOL_H*POOL_W-1) && row_count <= 7-1 
                                    && row_count[0] == 1) && col_count >= 2 && col_count <= W-2)
                                    ||(((row_count >=(POOL_H*POOL_W-1)) && (row_count == 8) && (row_count[0] == 0)) && col_count >= 2 && col_count <= W-2)) //Add additon when row equal to 8 transfer to S3 state by Wenye 
                                state <= S3; 
                            else if ((row_count >= (POOL_H*POOL_W-1) && row_count <= H-1 
                                    && row_count[0] == 1) && col_count >= 2 && col_count == W)
                                state <= S4;
                            else
                                state <= S2;
                        end
                    end
                S3: begin
                        if ((row_count >= (POOL_H*POOL_W-1) && row_count <= H-1 
                            && row_count[0] == 1) && (col_count == W) && (output_count == M*D_OUT/N_PE-1))
                            // RV:  && col_count == W-1 is defined by Yixing and revised by Zichuan
                            state <= S5;
                        else
                            state <= S3p;
                    end
                S3p:begin
                        if (output_count == M*D_OUT/N_PE-1) begin
                            if ((row_count >= (POOL_H*POOL_W-1) && row_count <= H-1 && row_count[0] == 1) && col_count == W) 
                            // RV:  && col_count == W-1 is defined by Yixing and revised by Zichuan
                                state <= S5;
                            else
                                state <= S2;
                        end 
                    end                   
                S4: begin
                        if ((row_count == H+1) && (col_count == W+PAD) && output_count == M*D_OUT/N_PE-1)
                            state <= S0;
                        else
                            state <= S4p;
                    end
                S4p:begin
                        if (output_count == M*D_OUT/N_PE-1) begin
                            if ((row_count == H+1) && (col_count == W+PAD))
                                state <= S0;
                            else
                                state <= S1;
                        end
                    end
                S5: begin
                        if ((row_count >= (POOL_H*POOL_W-1) && row_count <= H-1 && row_count[0] == 1) 
                            && (col_count == W+PAD) && (output_count == M*D_OUT/N_PE-1))
                            state <= S1;                   
                        else
                            state <= S5p;
                    end
                S5p:begin
                        if (output_count == M*D_OUT/N_PE-1) begin
                            if ((row_count >= (POOL_H*POOL_W-1) && row_count <= H-1 
                                && row_count[0] == 1) && col_count == W+PAD)
                                if (P == 1) begin
                                    state <= S1;
                                end
                                else begin
                                    state <= S6;
                                end
                            else
                                state <= S5;
                        end
                    end
                S6: begin
                        state <= S6p;
                    end
                S6p:begin
                        if (output_count == M*D_OUT/N_PE-1) begin
                            if ((col_count == W+PAD) && (p_count == P-1)) begin
                                state <= S1;
                            end
                            else begin
                                state <= S6;
                            end
                        end
                    end
            endcase
        end
    end
    
endmodule
