`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: DC_CTRL
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module DC_CTRL(
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
//    index_sram_en,
    index_sram_rd,
    index_sram_addr,
    pe_en,
    pad_mux_sel,
    upool_mux_sel,
    data_out_en,
    tg_next,
    done
    );
    
    parameter H = 32;
    parameter W = 128;
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
    parameter TG_NEXT_W = 1; // and the 'tg_next' will be asserted in the last cycle of row and col indicated by TG_NEXT_H and TG_NEXT_W
    parameter M = 1; // this parameter successes the functionaliity of the same parameter in EC_CTRL module, but we is still
                     // not know how to use it in DC_CTRL.
    parameter P = 1; // this parameter is used create time gap between row, 'P = 1' means 'row_count' will increase
                         // once 'col_count' reach its maximum.
    parameter N_V_PE = 1; // this parameter is used to treat the 'DC_CTRL' to have shorter perocessing period.
    
    localparam W_ROM_ADDR_IN_WIDTH = $clog2(W_ROM_DATA_DEPTH);
    localparam H_OUT = H*POOL_H;
    localparam W_OUT = W*POOL_W;
    localparam D_OUT = FD;
    localparam INDEX_SRAM_DEPTH = (POOL_H*POOL_W > 1)? H*W*D/N_V_PE:1;
    localparam INDEX_ADDR_WIDTH = ($clog2(INDEX_SRAM_DEPTH) > 0)? $clog2(INDEX_SRAM_DEPTH):1;
    localparam IN_WINDOW_H = FH;
    localparam IN_WINDOW_W = FW;
    localparam PINDEX_WIDTH = ($clog2(POOL_H*POOL_W) > 1)? $clog2(POOL_H*POOL_W):1;
    localparam P_COUNT_WIDTH = ($clog2(P) > 1)? $clog2(P):1;
    
    // state const
    localparam S0 = 0; localparam S1 = 1; localparam S2 = 2; 
    localparam S3 = 3; localparam S4 = 4;
    localparam S1p = 6;
    localparam S2p = 7;
    localparam S3p = 8;
    localparam S4p = 9;
    localparam S6 = 11; localparam S6p = 12;
    
    // inputs
    input clk, rst, data_in_en, start;
    
    // outputs
    output logic fmap_in_shiftreg_en;
    output logic fmap_out_shiftreg_en;
    output logic w_rom_en;
    output logic [W_ROM_ADDR_IN_WIDTH-1:0] w_rom_addr;
    output logic index_sram_rd;
    output logic [INDEX_ADDR_WIDTH-1:0] index_sram_addr;
    output logic pe_en, pad_mux_sel;
    output logic [PINDEX_WIDTH-1:0] upool_mux_sel;
    output logic data_out_en;
    output logic tg_next;
    output logic done;
    
    genvar i;
    
    logic [$clog2(M*D*POOL_W/N_V_PE)-1:0] output_count;
    logic [3:0] state;
    reg [$clog2(W+2*PAD)-1:0] col_count;
    reg [$clog2(H+2*PAD)-1:0] row_count;
    reg [P_COUNT_WIDTH-1:0] p_count;
    logic fmap_out_shiftreg_en_shedow;
    
    // output_count
    always@(posedge clk) begin
        if (~rst)
            output_count <= 0;
        else if (state != S0) begin
            if (output_count >= M*D*POOL_W/N_V_PE-1)
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
            if (output_count == M*D*POOL_W/N_V_PE-1) begin
                if (P == 1 || p_count == 0) begin
                    if (col_count >= W+2*PAD-1)
                        col_count <= 0;
                    else 
                        col_count <= col_count + 1;
                end
                else begin // for inserted row
                    if (col_count >= W+2*PAD-3) 
                        col_count <= 0;
                    else 
                        col_count <= col_count + 1;
                end
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
            if ((col_count == W+2*PAD-1) && output_count == M*D*POOL_W/N_V_PE-1) begin
                if (p_count >= P-1)
                    p_count <= 0;
                else
                    p_count <= p_count + 1;
            end
            else if ((col_count == W+2*PAD-3) && output_count == M*D*POOL_W/N_V_PE-1 && p_count > 0) begin
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
            if (P == 1) begin
                if ((col_count == W+2*PAD-1) && (output_count == M*D*POOL_W/N_V_PE-1)) begin
                    if (row_count >= H+2*PAD-1)
                        row_count <= 0;
                    else
                        row_count <= row_count + 1;
                end     
            end       
            else begin
                if ((col_count == W+2*PAD-3) && (output_count == M*D*POOL_W/N_V_PE-1) && (p_count == P-1)) begin
                    if (row_count >= H+2*PAD)
                        row_count <= 0;
                    else
                        row_count <= row_count + 1;
                end
            end           
        end       
    end
    
    // state
    always@(posedge clk) begin
        if (~rst)
            state <= S0;
        else begin
            case (state)
                S0: begin
                        if (start) begin
                            state <= S1;
                        end
                    end
                S1: begin
                        state <= S1p;
                    end
                S1p: begin
                        if (output_count == M*D*POOL_W/N_V_PE-1) begin
                            if (IN_WINDOW_H*IN_WINDOW_W == 1) begin
                                if (row_count >= PAD && row_count <= H+PAD-1 && col_count < PAD)
                                    state <= S3;
                                else if (row_count == H+2*PAD-1 && col_count == W+2*PAD-1)
                                    state <= S0;
                                else
                                    state <= S1;
                            end
                            else begin
                                if ((row_count >= PAD) && (row_count <= H) && (col_count == 0))
                                    state <= S2;
                                else if ((row_count == H+2*PAD-1) && (col_count == PAD))
                                    state <= S4;
                                else if (P > 1 && (col_count == W+2*PAD-1))
                                    state <= S6;
                                else
                                    state <= S1;    
                            end
                        end         
                     end
                S2: begin
                        state <= S2p;
                    end
                S2p: begin
                        if (output_count == M*D*POOL_W/N_V_PE-1) begin
                            if ((row_count == 1) && (col_count == W)) 
                                state <= S1;
                            else if ((row_count >= FH-1) && (row_count <= H) && (col_count == PAD)) 
                                state <= S3; 
                            else
                                state <= S2;
                        end
                    end
                S3: begin
                        state <= S3p;
                    end
                S3p:begin
                        if (output_count == M*D*POOL_W/N_V_PE-1) begin
                            if (IN_WINDOW_H*IN_WINDOW_W == 1) begin
                                if (col_count == W+PAD-1)
                                    state <= S1;
                                else
                                    state <= S3;
                            end 
                            else begin
                                if ((row_count >= FH-1) && (row_count <= H) && (col_count == W)) 
                                    state <= S4;
                                else if (POOL_W*POOL_H == 1 && IN_WINDOW_W*IN_WINDOW_H == 1 && PAD == 0
                                        && row_count == H+2*PAD-1 && col_count == W+2*PAD-1) begin
                                    state <= S0;
                                end
                                else
                                    state <= S3;
                            end
                        end 
                    end                   
                S4: begin
                        state <= S4p;
                    end
                S4p:begin
                        if (output_count == M*D*POOL_W/N_V_PE-1) begin
                            if ((row_count >= FH-1 && row_count <= H)) begin
                                if (P > 1)
                                    state <= S6;
                                else
                                    state <= S1;
                            end
                            else if (row_count == H+2*PAD-1 && col_count == W+2*PAD-1) begin
                                if (P > 1)
                                    state <= S6;
                                else
                                    state <= S0;
                            end
                            else 
                                state <= S4;
                        end
                    end
                S6: begin
                        state <= S6p;
                    end
                S6p:begin
                        if (output_count == M*D*POOL_W/N_V_PE-1) begin
//                            if ((col_count == W+2*PAD-1) && (p_count == P-1)) begin
                            if ((col_count == W+2*PAD-3) && (p_count == P-1)) begin // tuning the timing
                                if (row_count == H+1)
                                    state <= S0;
                                else
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
    
    // pad_mux_sel
    always@(start or state or row_count or col_count or output_count or p_count) begin
        if (state == S0)
            pad_mux_sel = start;
        else if (state == S1p && output_count == M*D*POOL_W/N_V_PE-1) begin
            if (col_count == 2*PAD+W-1) begin
                if (P > 1)
                    pad_mux_sel = 1'b0;
                else
                    pad_mux_sel = 1'b1;
            end
            else if (row_count >= PAD && row_count <= PAD+H-1)
                pad_mux_sel = 1'b0;
            else    
                pad_mux_sel = 1'b1;
        end
        else if (state == S2p && output_count == M*D*POOL_W/N_V_PE-1) begin
            if (row_count == PAD && col_count == PAD+W-1)
                pad_mux_sel = 1'b1;
            else
                pad_mux_sel = 1'b0;
        end
        else if (state == S3p && output_count == M*D*POOL_W/N_V_PE-1) begin
            if (row_count >= FH-1 && row_count <= PAD+H-1 && col_count == PAD+W-1)
                pad_mux_sel = 1'b1;
            else
                pad_mux_sel = 1'b0;
        end
        else if (state == S4p && output_count == M*D*POOL_W/N_V_PE-1) begin
            if (row_count >= FH-1 && row_count <= PAD+H-1 && col_count == 2*PAD+W-1) begin
                if (P > 1)
                    pad_mux_sel = 1'b0;
                else
                    pad_mux_sel = 1'b1;
            end
            else if (row_count == 2*PAD+H-1 && col_count == 2*PAD+W-1)
                pad_mux_sel = 1'b0;
            else
                pad_mux_sel = 1'b1;
        end
        else if (state == S6p && output_count == M*D*POOL_W/N_V_PE-1) begin
            if (p_count == P-1 && col_count == 2*PAD+W-3)
                pad_mux_sel = 1'b1;
            else
                pad_mux_sel = 1'b0;
        end
        else
            pad_mux_sel = 1'b0;
    end
    
    // fmap_in_shiftreg_en
    always@(start or state or row_count or col_count or output_count or p_count) begin
        if (state == S0)
            fmap_in_shiftreg_en <= start;
        else if (state == S1p && output_count == M*D*POOL_W/N_V_PE-1) begin
            if (col_count == 2*PAD+W-1 && P>1) begin
                fmap_in_shiftreg_en = 1'b0; 
            end
            else    
                fmap_in_shiftreg_en = 1'b1;
        end
        else if (state == S4p && output_count == M*D*POOL_W/N_V_PE-1) begin
            if (row_count >= FH-1 && row_count <= PAD+H-1 && col_count == 2*PAD+W-1) begin
                if (P > 1)
                    fmap_in_shiftreg_en = 1'b0;
                else
                    fmap_in_shiftreg_en = 1'b1;
            end
            else if (row_count == 2*PAD+H-1 && col_count == 2*PAD+W-1)
                fmap_in_shiftreg_en = 1'b0;
            else
                fmap_in_shiftreg_en = 1'b1;
        end
        else if (state == S2p && output_count == M*D*POOL_W/N_V_PE-1)
            fmap_in_shiftreg_en = 1'b1;
        else if (state == S3p && output_count == M*D*POOL_W/N_V_PE-1)
            fmap_in_shiftreg_en = 1'b1;
        else if (state == S6p && output_count == M*D*POOL_W/N_V_PE-1 && p_count == P-1 && col_count == W+2*PAD-3 && row_count != H+2*PAD-1) // insert row 
            fmap_in_shiftreg_en = 1'b1;
        else begin
            fmap_in_shiftreg_en = 1'b0;
        end      
    end
    
    // fmap_out_shiftreg_en
    always@(state or row_count or col_count or output_count or p_count or upool_mux_sel_dl_2[2*FD/N_PE-1] or fmap_out_shiftreg_en_shedow) begin
        if (POOL_H*POOL_W == 1) begin
            if ((state == S3) || (state == S3p && output_count <= D_OUT/N_PE-1)
                || state == S4 || (state == S4p && output_count <= D_OUT/N_PE-1)) begin
                fmap_out_shiftreg_en = 1'b1;
            end
            else 
                fmap_out_shiftreg_en = 1'b0;
        end
        else begin
            if ((state == S3) || (state == S3p && output_count <= D_OUT/N_PE-1)
                || state == S4 || (state == S4p && output_count <= D_OUT/N_PE-1)) begin
                fmap_out_shiftreg_en = 1'b1;
            end
            else if (p_count >= P/POOL_W && p_count <= P-1 && row_count >= FH-1)
                fmap_out_shiftreg_en = fmap_out_shiftreg_en_shedow;
            else if (P == 2 && ((p_count == 0 && col_count < PAD) || (col_count >= FW-1 && p_count >= P/POOL_W && p_count <= P-1))) 
                fmap_out_shiftreg_en = fmap_out_shiftreg_en_shedow;
            else 
                fmap_out_shiftreg_en = 1'b0;
        end
    end
    
    // fmap_out_shiftreg_en_shedow
    logic fmap_out_shiftreg_en_shedow_dl [2*FD/N_PE-1:0];
    always@(state or row_count or col_count or output_count or p_count or upool_mux_sel_dl_2[2*FD/N_PE-1]) begin
        if (row_count >= FW-1 && p_count == P/POOL_W && col_count >= PAD && col_count <= W+2*PAD-3 && upool_mux_sel_dl_2[0] == POOL_W) begin
            fmap_out_shiftreg_en_shedow_dl[0] = 'b1;
        end
        else
            fmap_out_shiftreg_en_shedow_dl[0] = 'b0;
    end
    
    generate
        for (i = 0; i < 2*FD/N_PE; i = i+1) begin
            always@(posedge clk) begin
                if (~rst)
                    fmap_out_shiftreg_en_shedow_dl[i+1] <= 'b0;
                else if (i == 2*FD/N_PE-1)
                    fmap_out_shiftreg_en_shedow <= fmap_out_shiftreg_en_shedow_dl[i];
                else
                    fmap_out_shiftreg_en_shedow_dl[i+1] <= fmap_out_shiftreg_en_shedow_dl[i];
            end
        end
    endgenerate
    
    // w_rom_en
    always@(state or row_count or col_count or output_count) begin
        if (IN_WINDOW_W*IN_WINDOW_H > 1) begin
            if (((state == S1p) && (output_count == M*D*POOL_W/N_V_PE-1) && (row_count == H+PAD) && (col_count == PAD)) ||
                ((state == S2p) && (output_count == M*D*POOL_W/N_V_PE-1) && (row_count >= IN_WINDOW_H-1 && row_count <= H+PAD-1) &&(col_count == IN_WINDOW_W-2)) ||
                (state == S3) || (state == S3p && (output_count <= D_OUT/N_PE-2 || output_count == D*POOL_W/N_V_PE-1)) || (state == S4))
                 begin
                w_rom_en = 1'b1;
            end
            else if (state == S4p) begin
                if (row_count == H+PAD && (col_count > PAD && col_count < W+PAD) && output_count <= D_OUT/N_PE-2)
                    w_rom_en = 1'b1;
                else if (row_count == H+PAD && (col_count > PAD && col_count < W+PAD) && output_count == D*POOL_W/N_V_PE-1)
                    w_rom_en = 1'b1;
                else if (row_count >= IN_WINDOW_H-1 && row_count <= H+2*PAD-1 && col_count == W+2*PAD-1 && output_count <= D_OUT/N_PE-2)
                    w_rom_en = 1'b1;
                else 
                    w_rom_en = 1'b0;
            end
            else
                w_rom_en = 1'b0;
        end
        else begin
            if (state == S1p && row_count >= PAD && row_count <= H+PAD-1 && col_count < PAD && output_count == D*POOL_W/N_V_PE-1)
                w_rom_en = 1'b1;
            else if ((state == S3) || (state == S3p && col_count < W+PAD-1))
                if ((output_count <= D_OUT/N_PE-2) || (output_count == D/N_V_PE-1))
                    w_rom_en = 1'b1;
                else
                    w_rom_en = 1'b0;
            else if (state == S3p && (output_count <= D_OUT/N_PE-2) && col_count == W+PAD-1)
                w_rom_en = 1'b1;
            else
                w_rom_en = 1'b0;
        end
    end
    
    // w_rom_addr
    always@(posedge clk) begin
        if (IN_WINDOW_W*IN_WINDOW_H > 1) begin
            if (~rst) begin
                w_rom_addr <= 0;
            end            
            else if ((state == S2p && output_count == D*POOL_W/N_V_PE-1 && row_count >= FH-1 && row_count <= H+PAD-1) 
                        || (state == S3) || (state == S4) || ((state == S3p) && (output_count <= D_OUT/N_PE-2 || output_count == D*POOL_W/N_V_PE-1))) begin
                if (w_rom_addr < D_OUT/N_PE-1)
                    w_rom_addr <= w_rom_addr + 1;
                else
                    w_rom_addr <= 0;
            end
            else if (state == S4p) begin
                if (row_count >= FH-1 && col_count == W+2*PAD-1 && output_count <= D_OUT/N_PE-2) begin
                    if (w_rom_addr < D_OUT/N_PE-1)
                        w_rom_addr <= w_rom_addr + 1;
                    else
                        w_rom_addr <= 0;
                end
                else if (row_count >= H+PAD && col_count != W+2*PAD-1 && (output_count <= D_OUT/N_PE-2 || output_count == D*POOL_W/N_V_PE-1)) begin
                    if (w_rom_addr < D_OUT/N_PE-1)
                        w_rom_addr <= w_rom_addr + 1;
                    else
                        w_rom_addr <= 0;
                end
            end
            else if (state == S1p && (output_count == D*POOL_W/N_V_PE-1) && (row_count >= H+PAD) && (col_count == PAD)) begin
                if (w_rom_addr < D_OUT/N_PE-1)
                    w_rom_addr <= w_rom_addr + 1;
                else
                    w_rom_addr <= 0;
            end
            else begin
                w_rom_addr <= 0;
            end   
        end
        else begin
            if (~rst) begin
                w_rom_addr <= 0;
            end 
            else if (state == S1p && row_count >= PAD && row_count <= H+PAD-1 && col_count < PAD && output_count == D*POOL_W/N_V_PE-1) begin
                if (w_rom_addr < D_OUT/N_PE-1)
                    w_rom_addr <= w_rom_addr + 1;
                else
                    w_rom_addr <= 0;
            end
            else if ((state == S3) || (state == S3p && col_count < W+PAD-1)) begin
                if ((output_count <= D_OUT/N_PE-2) || (output_count == D/N_V_PE-1)) begin
                    if (w_rom_addr < D_OUT/N_PE-1)
                        w_rom_addr <= w_rom_addr + 1;
                    else
                        w_rom_addr <= 0;
                end
            end
            else if ((state == S3p && (output_count <= D_OUT/N_PE-2) && col_count == W+PAD-1))
                if (w_rom_addr < D_OUT/N_PE-1)
                    w_rom_addr <= w_rom_addr + 1;
                else
                    w_rom_addr <= 0;
            else
                w_rom_addr <= 0;
        end
    end
    
    // index_sram_rd
    always@(state or row_count or col_count or output_count) begin
        if (IN_WINDOW_W*IN_WINDOW_H > 1) begin
            if (((state == S1p) && (output_count == M*D*POOL_W/N_V_PE-1) && (row_count == H+PAD) && (col_count == PAD)) ||
                ((state == S2p) && (output_count == M*D*POOL_W/N_V_PE-1) && (row_count >= IN_WINDOW_H-1 && row_count <= H+PAD-1) &&(col_count == IN_WINDOW_W-2)) ||
                (state == S3) || (state == S3p && (output_count <= D_OUT/N_PE-2 || output_count == D*POOL_W/N_V_PE-1)) || (state == S4))
                 begin
                index_sram_rd = 1'b1;
            end
            else if (state == S4p) begin
                if (row_count == H+PAD && (col_count > PAD && col_count < W+PAD) && output_count <= D_OUT/N_PE-2)
                    index_sram_rd = 1'b1;
                else if (row_count == H+PAD && (col_count > PAD && col_count < W+PAD) && output_count == D*POOL_W/N_V_PE-1)
                    index_sram_rd = 1'b1;
                else if (row_count >= IN_WINDOW_H-1 && row_count <= H+2*PAD-1 && col_count == W+2*PAD-1 && output_count <= D_OUT/N_PE-2)
                    index_sram_rd = 1'b1;
                else 
                    index_sram_rd = 1'b0;
            end
            else
                index_sram_rd = 1'b0;
        end
        else begin
            if (state == S1p && row_count >= PAD && row_count <= H+PAD-1 && col_count < PAD && output_count == D*POOL_W/N_V_PE-1)
                index_sram_rd = 1'b1;
            else if ((state == S3) || (state == S3p && (output_count <= D_OUT/N_PE-1) && col_count < W+PAD-1))
                index_sram_rd = 1'b1;
            else if ((state == S3p && (output_count <= D_OUT/N_PE-2) && col_count == W+PAD-1))
                index_sram_rd = 1'b1;
            else
                index_sram_rd = 1'b0;
        end
    end
    
    // index_sram_addr
    always@(posedge clk) begin
        if (IN_WINDOW_H*IN_WINDOW_W > 1) begin
            if (~rst) begin
                index_sram_addr <= 0;
            end            
            else if ((state == S2p && output_count == D*POOL_W/N_V_PE-1 && row_count >= FH-1 && row_count <= H+PAD-1) 
                        || (state == S3) || (state == S4) || ((state == S3p) && (output_count <= D_OUT/N_PE-2 || output_count == D*POOL_W/N_V_PE-1))) begin
                if (index_sram_addr < INDEX_SRAM_DEPTH-1)
                    index_sram_addr <= index_sram_addr + 1;
                else
                    index_sram_addr <= 0;
            end
            else if (state == S4p) begin
                if (row_count >= FH-1 && col_count == W+2*PAD-1 && output_count <= D_OUT/N_PE-2) begin
                    if (index_sram_addr < INDEX_SRAM_DEPTH-1)
                        index_sram_addr <= index_sram_addr + 1;
                    else
                        index_sram_addr <= 0;
                end
                else if (row_count >= H+PAD && col_count != W+2*PAD-1 && (output_count <= D_OUT/N_PE-2 || output_count == D*POOL_W/N_V_PE-1)) begin
                    if (index_sram_addr < INDEX_SRAM_DEPTH-1)
                        index_sram_addr <= index_sram_addr + 1;
                    else
                        index_sram_addr <= 0;
                end
            end
            else if (state == S1p && (output_count == D*POOL_W/N_V_PE-1) && (row_count >= H+PAD) && (col_count == PAD)) begin
                if (index_sram_addr < INDEX_SRAM_DEPTH-1)
                    index_sram_addr <= index_sram_addr + 1;
                else
                    index_sram_addr <= 0;
            end
//            else begin
//                index_sram_addr <= 0;
//            end 
        end  
        else begin
            if (~rst) begin
                index_sram_addr <= 0;
            end 
            else if (state == S1p && row_count >= PAD && row_count <= H+PAD-1 && col_count < PAD && output_count == D*POOL_W/N_V_PE-1) begin
                if (index_sram_addr < INDEX_SRAM_DEPTH-1)
                    index_sram_addr <= index_sram_addr + 1;
                else
                    index_sram_addr <= 0;
            end
            else if ((state == S3) || (state == S3p && (output_count <= D_OUT/N_PE-1) && col_count < W+PAD-1)) begin
                if (index_sram_addr < INDEX_SRAM_DEPTH-1)
                    index_sram_addr <= index_sram_addr + 1;
                else
                    index_sram_addr <= 0;
            end
            else if (state == S3p && (output_count <= D_OUT/N_PE-2) && col_count == W+PAD-1) begin
                if (index_sram_addr < INDEX_SRAM_DEPTH-1)
                    index_sram_addr <= index_sram_addr + 1;
                else
                    index_sram_addr <= 0;
            end
//            else
//                index_sram_addr <= 0;
        end
    end
    
    // pe_en
    always@(state or row_count or col_count or output_count) begin
        if ((state == S3) || (state == S3p && output_count <= D_OUT/N_PE-1) || (state == S4))
             begin
            pe_en = 1'b1;
        end
        else if (state == S4p) begin
            if (row_count == H+PAD && (col_count > PAD && col_count <= W+2*PAD-1) && output_count <= D_OUT/N_PE-1)
                pe_en = 1'b1;
            else if ((row_count >= FH-1 && row_count <= H+PAD-1) && (col_count == W+2*PAD-1) && output_count <= D_OUT/N_PE-1)
                pe_en = 1'b1;
            else 
                pe_en = 1'b0;
        end
        else
            pe_en = 1'b0;
    end
    
    // upool_mux_sel
    logic [$clog2(POOL_H*POOL_W)-1:0] upool_mux_sel_dl_1;
    logic [$clog2(POOL_H*POOL_W)-1:0] upool_mux_sel_dl_2[2*FD/N_PE-1+1:0];
    
    // upool_mux_sel_dl_1
    always@(posedge clk) begin
        if (~rst)
            upool_mux_sel_dl_1 <= 'b0;
        else if (state == S3 || state == S4)
            upool_mux_sel_dl_1 <= 'b0;
        else if ((state == S3p || state == S4p) && (output_count[$clog2(M*D_OUT/N_PE)-1:0] == M*D_OUT/N_PE-1)
                && (row_count >= FH-1 && col_count >= FW-1) && p_count == 0) begin
            if (upool_mux_sel_dl_1 < POOL_H*POOL_W/POOL_H-1)
                upool_mux_sel_dl_1 <= upool_mux_sel_dl_1 + 1;
            else
                upool_mux_sel_dl_1 <= 'b0;
        end
    end
    
    // upool_mux_sel_dl_2
    always@(posedge clk) begin
        if (~rst)
            upool_mux_sel_dl_2[0] <= POOL_W;
        else if (state == S6 && (row_count >= FH-1 && col_count >= 0) && p_count == P/POOL_H && P > 1)
            upool_mux_sel_dl_2[0] <= POOL_W;
        else if ((state == S6p) && (output_count[$clog2(M*D_OUT/N_PE)-1:0] == M*D_OUT/N_PE-1)
                && (row_count >= FH-1 && col_count >= 0) && p_count == P/POOL_H && P > 1) begin
            if (upool_mux_sel_dl_2[0] < POOL_H*POOL_W-1)
                upool_mux_sel_dl_2[0] <= upool_mux_sel_dl_2[0] + 1;
            else
                upool_mux_sel_dl_2[0] <= POOL_W;
        end
    end
    
    // delay upool_mux_sel[0]
    logic [$clog2(POOL_H*POOL_W)-1:0] upool_mux_sel_1, upool_mux_sel_2;
    generate        
        always@(posedge clk) begin
            upool_mux_sel_1 <= upool_mux_sel_dl_1;
        end
    endgenerate
    
    generate        
        for (i = 0; i <= 2*FD/N_PE; i = i+1) begin 
            if (i < 2*FD/N_PE-1+1) begin    
                always@(posedge clk) begin
                    upool_mux_sel_dl_2[i+1] <= upool_mux_sel_dl_2[i];
                end
            end
            else begin 
                always@(posedge clk) begin
                    upool_mux_sel_2 <= upool_mux_sel_dl_2[i];
                end
            end           
        end
    endgenerate
    
    always@(upool_mux_sel_1 or upool_mux_sel_2 or p_count or col_count) begin
        if (P > 2) begin
            if (p_count >= P/POOL_W && p_count <= P-1)
                upool_mux_sel = upool_mux_sel_2;
            else
                upool_mux_sel = upool_mux_sel_1;
        end
        else if (P == 2) begin
            if ((p_count == 0 && col_count < FW-1) || (col_count >= PAD && p_count >= P/POOL_W && p_count <= P-1)) 
                upool_mux_sel = upool_mux_sel_2;
            else 
                upool_mux_sel = upool_mux_sel_1;
        end
        else
            upool_mux_sel = upool_mux_sel_1;
    end
    
    // data_out_en
    logic data_out_en_dl_1; // delay 1 cycle
    logic data_out_en_dl_2 [2*FD/N_PE-1+1:0]; // delay 2 more row time
    
    // data_out_en_dl_1
    always@(state or p_count or row_count or col_count or output_count) begin
        if (~rst)
            data_out_en_dl_1 = 1'b0;
        else begin
            if (output_count[$clog2(M*D_OUT/N_PE)-1:0] == D_OUT/N_PE-1  && (state == S3p || state == S4p)) begin
                if (output_count == D_OUT/N_PE-1)
                    data_out_en_dl_1 = 1'b1;
                else if (output_count == D*POOL_W/N_V_PE-1)
                    data_out_en_dl_1 = 1'b1;
                else    
                    data_out_en_dl_1 = 1'b0;
            end
            else
                data_out_en_dl_1 = 1'b0;
        end
    end
    
    // data_out_en_dl_2
    always@(state or p_count or row_count or col_count or output_count) begin
        if (~rst)
            data_out_en_dl_2[0] = 1'b0;
        else begin
            if (output_count[$clog2(M*D_OUT/N_PE)-1:0] == D_OUT/N_PE-1 && (state == S6p && p_count == P/POOL_H) && (row_count >= FH-1 && col_count >= 0 ))
                data_out_en_dl_2[0] = 1'b1;
            else
                data_out_en_dl_2[0] = 1'b0;
        end
    end
    
    // delay data_out_en_1, logic data_out_en_2;
    logic data_out_en_1;
    logic data_out_en_2;
    
    // data_out_en_1
    always@(posedge clk) begin
        data_out_en_1 <= data_out_en_dl_1;
    end
    
    // data_out_en_2
    generate
        for (i = 0; i <= 2*FD/N_PE; i = i+1) begin
            always@(posedge clk) begin
                if (~rst)
                    data_out_en_dl_2[i+1] <= 0;
                else if (i == 2*FD/N_PE)
                    data_out_en_2 <= data_out_en_dl_2[i];
                else
                    data_out_en_dl_2[i+1] <= data_out_en_dl_2[i];
            end
        end
    endgenerate
    
    always@(data_out_en_1 or data_out_en_2 or p_count or col_count) begin
        if (P > 2) begin
            if (p_count >= P/POOL_W && p_count <= P-1)
                data_out_en = data_out_en_2;
            else
                data_out_en = data_out_en_1;
        end
        else if (P == 2) begin
            if ((p_count == 0 && col_count < FW-1) || (col_count >= PAD && p_count >= P/POOL_W && p_count <= P-1)) 
                data_out_en = data_out_en_2;
            else 
                data_out_en = data_out_en_1;
        end
        else 
            data_out_en = data_out_en_1;
    end
    
    
    // tg_next
    always@(col_count or row_count or output_count or p_count) begin
        if (P > 1) begin
            if (row_count == TG_NEXT_H && col_count == TG_NEXT_W && output_count == 0 && p_count == P/POOL_H) begin
                tg_next = 1;
            end
            else begin
                tg_next = 0;
            end
        end
        else begin
            if (row_count == TG_NEXT_H && col_count == TG_NEXT_W && output_count == 0) begin
                tg_next = 1;
            end
            else begin
                tg_next = 0;
            end
        end        
    end
    
    always@(posedge clk) begin
        if (row_count == H+2*PAD-1 && col_count == W+2*PAD-1 && output_count == M*D*POOL_W/N_V_PE-1)
            done <= 1'b1;
        else
            done <= 1'b0;
    end
    
endmodule
