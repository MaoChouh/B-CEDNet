`timescale 1ns / 1ps
`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: EDC_CTRL
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module EDC_CTRL(
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
//    index_sram_rd,
//    index_sram_addr,
    pe_en,
    pad_mux_sel,
    upool_mux_sel,
    data_out_en,
    tg_next
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
    parameter TG_NEXT_H = 2; // row num start from 0,  
    parameter TG_NEXT_W = 3; // and the 'tg_next' will be asserted in the last cycle of row and col indicated by TG_NEXT_H and TG_NEXT_W
    parameter M = 1; // this parameter successes the functionaliity of the same parameter in EC_CTRL module, but we is still
                     // not know how to use it in DC_CTRL.
    parameter P = 1; // this parameter is used create time gap between row, 'P = 1' means 'row_count' will increase
                         // once 'col_count' reach its maximum.
    
    localparam W_ROM_ADDR_IN_WIDTH = $clog2(W_ROM_DATA_DEPTH);
    localparam H_OUT = H*POOL_H;
    localparam W_OUT = W*POOL_W;
    localparam D_OUT = FD;
    localparam INDEX_SRAM_DEPTH = H*W*D_OUT/N_PE;
    localparam INDEX_ADDR_WIDTH = $clog2(INDEX_SRAM_DEPTH);
    localparam IN_WINDOW_H = (POOL_H-1)*STRIDE_H+FH;
    localparam IN_WINDOW_W = (POOL_W-1)*STRIDE_W+FW;
    localparam PINDEX_WIDTH = ($clog2(POOL_H*POOL_W) > 1)? $clog2(POOL_H*POOL_W):1;
    localparam P_COUNT_WIDTH = ($clog2(P) > 1)? $clog2(P):1;
    
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
//    output logic index_sram_rd;
//    output logic [INDEX_ADDR_WIDTH-1:0] index_sram_addr;
    output logic pe_en, pad_mux_sel;
    output logic [PINDEX_WIDTH-1:0] upool_mux_sel;
    output logic data_out_en;
    output logic tg_next;
    
    genvar i;
    
    logic [$clog2(M*D_OUT/N_PE)-1:0] output_count;
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
            if ((col_count == W+2*PAD-1) && output_count == M*D_OUT/N_PE-1 && p_count == 0) begin
                if (p_count >= P-1)
                    p_count <= 0;
                else
                    p_count <= p_count + 1;
            end
            else if ((col_count == W+2*PAD-3) && output_count == M*D_OUT/N_PE-1 && p_count > 0) begin
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
            if (P == 1) begin // this is not correct but does not matter because this 'if' will never be true.
                if ((col_count == W+2*PAD-1) && (output_count == M*D_OUT/N_PE-1)) begin
                    if (row_count >= H+2*PAD-1)
                        row_count <= 0;
                    else
                        row_count <= row_count + 1;
                end     
            end       
            else begin
                if ((col_count == W+2*PAD-3) && (output_count == M*D_OUT/N_PE-1) && (p_count == P-1)) begin
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
                        if (start)
                            state <= S1;
                    end
                S1: begin
                        state <= S1p;
                    end
                S1p: begin
                        if (output_count == M*D_OUT/N_PE-1) begin
                            if ((row_count >= PAD) && (row_count <= H+PAD-1) && (col_count == 0))
                                state <= S2;
                            else if ((row_count == H+2*PAD-1) && (col_count >= 2))
                                state <= S4;
                            else if (P > 1&& (col_count == W+2*PAD-1) && row_count != H+2*PAD)
                                state <= S6;
                            else if ((col_count == W+2*PAD-1) && (row_count == H+2*PAD))
                                state <= S0;
                            else
                                state <= S1;                  
                        end         
                     end
                S2: begin
                        if (((row_count == 1) || (row_count >= (POOL_H*POOL_W-2) && row_count <= H && row_count[0] == 0)) 
                                && (col_count == W+2*PAD-1) && (output_count == M*D_OUT/N_PE-1)) // RV: (col_count == W) is defined by Yixing and revised by Zichuan
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
                            else if ((row_count >= (POOL_H*POOL_W-1) && row_count <= H-1 
                                    && row_count[0] == 1) && col_count >= 2 && col_count <= W-2) 
                                state <= S3; 
                            else if ((row_count >= (POOL_H*POOL_W-1) && row_count <= H-1 
                                    && row_count[0] == 1) && col_count >= 2 && col_count == W)
                                state <= S5;
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
                        if ((row_count == H+1) && (col_count == W+2*PAD-1) && output_count == M*D_OUT/N_PE-1)
                            state <= S0;
                        else
                            state <= S4p;
                    end
                S4p:begin
                        if (output_count == M*D_OUT/N_PE-1) begin
                            if ((row_count == H+2*PAD) && (col_count == W+2*PAD-1)) // we need a extral row to output the data
                                state <= S0;
                            else if (P > 1 && col_count == W+2*PAD-1 && p_count == 0)
                                state <= S6;
                            else
                                state <= S1;
                        end
                    end
                S5: begin
                        if ((row_count >= (POOL_H*POOL_W-1) && row_count <= H-1 && row_count[0] == 1) 
                            && (col_count == W+2*PAD-1) && (output_count == M*D_OUT/N_PE-1))
                            state <= S1;                   
                        else
                            state <= S5p;
                    end
                S5p:begin
                        if (output_count == M*D_OUT/N_PE-1) begin
                            if ((row_count >= (POOL_H*POOL_W-1) && row_count <= H-1 
                                && row_count[0] == 1) && col_count == W+2*PAD-1)
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
//                            if ((col_count == W+2*PAD-1) && (p_count == P-1)) begin // tuning the 
                            if ((col_count == W+2*PAD-3) && (p_count == P-1)) begin // tuning the timing
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
        else if (state == S1p && output_count == M*D_OUT/N_PE-1) begin
            if (col_count == 2*PAD+W-1 && P>1) begin
                pad_mux_sel = 1'b0;
            end
            else if (col_count == 2*PAD+W-1 && row_count != 2*PAD+H)
                pad_mux_sel = 1'b1;
            else if (col_count == 2*PAD+W-1 && row_count == 2*PAD+H)
                pad_mux_sel = 1'b0;
            else if (row_count >= PAD && row_count <= PAD+H-1)
                pad_mux_sel = 1'b0;
            else    
                pad_mux_sel = 1'b1;
        end
        else if (state == S2p && output_count == M*D_OUT/N_PE-1) begin
            if (col_count == PAD+W-1)
                pad_mux_sel = 1'b1;
            else
                pad_mux_sel = 1'b0;
        end
        else if (state == S3p && output_count == M*D_OUT/N_PE-1) begin
            if (row_count >= FH-1 && row_count <= PAD+H-1 && col_count == PAD+W-1)
                pad_mux_sel = 1'b1;
            else
                pad_mux_sel = 1'b0;
        end
        else if ((state == S4p || state == S5p) && output_count == M*D_OUT/N_PE-1) begin
            if (row_count >= FH-1 && row_count <= 2*PAD+H-1 && col_count == 2*PAD+W-1) begin
                if (P > 1)
                    pad_mux_sel = 1'b0;
                else
                    pad_mux_sel = 1'b1;
            end
            else if (row_count == 2*PAD+H && col_count == 2*PAD+W-1)
                pad_mux_sel = 1'b0; 
            else
                pad_mux_sel = 1'b1;
        end
        else if (state == S6p && output_count == M*D_OUT/N_PE-1) begin
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
            fmap_in_shiftreg_en = start;
        else if (state == S1p && output_count == M*D_OUT/N_PE-1) begin
            if ((col_count == 2*PAD+W-1) && P>1) begin
                fmap_in_shiftreg_en = 1'b0; 
            end
//            else if ((col_count == 2*PAD+W-1) && (row_count == 2*PAD+H))
            else if (row_count == 2*PAD+H) // Maybe the extra row does not need assert the 'fmap_in_shiftreg_en'.
                fmap_in_shiftreg_en = 1'b0;
            else    
                fmap_in_shiftreg_en = 1'b1;
        end
        else if ((state == S4p || state == S5p) && output_count == M*D_OUT/N_PE-1) begin
            if (row_count >= FH-1 && row_count <= 2*PAD+H-1 && col_count == 2*PAD+W-1) begin
                if (P > 1)
                    fmap_in_shiftreg_en = 1'b0;
                else
                    fmap_in_shiftreg_en = 1'b1;
            end
            else if (row_count == 2*PAD+H && col_count == 2*PAD+W-1)
                fmap_in_shiftreg_en = 1'b0; 
            else
                fmap_in_shiftreg_en = 1'b1;
        end
        else if (state == S2p && output_count == M*D_OUT/N_PE-1)
            fmap_in_shiftreg_en = 1'b1;
        else if (state == S3p && output_count == M*D_OUT/N_PE-1)
            fmap_in_shiftreg_en = 1'b1;
        else if (state == S6p && output_count == M*D_OUT/N_PE-1 && p_count == P-1 && col_count == W+2*PAD-3 && row_count != H+2*PAD-1) // insert row 
            fmap_in_shiftreg_en = 1'b1;
        else begin
            fmap_in_shiftreg_en = 1'b0;
        end    
    end
    
    // fmap_out_shiftreg_en
    always@(state or row_count or col_count or output_count or p_count or fmap_out_shiftreg_en_shedow) begin
        if ((state == S3) || (state == S3p && output_count <= D_OUT/N_PE-1)
            || state == S4 || state == S5 || ((state == S4p || state == S5p) && output_count <= D_OUT/N_PE-1)) begin
            fmap_out_shiftreg_en = 1'b1;
        end
        else if ((state == S2 || state == S2p || state == S1 || state == S1p) && row_count >= IN_WINDOW_H-1 && row_count[0] == 0) begin
            fmap_out_shiftreg_en = fmap_out_shiftreg_en_shedow;
        end
        else 
            fmap_out_shiftreg_en = 1'b0;
    end
    
    // fmap_out_shiftreg_en_shedow
    logic fmap_out_shiftreg_en_shedow_dl [2*FD/N_PE-1:0];
    always@(state or row_count or col_count or output_count or p_count) begin
        if ((state == S2p || state == S2) && row_count >= IN_WINDOW_W-1 && row_count[0] == 0 && p_count == 0 &&  col_count == W+2*PAD-3) begin
            fmap_out_shiftreg_en_shedow_dl[0] = 'b1;
        end
        else if ((state == S1p || state == S1) && row_count == H+2*PAD && p_count == 0 &&  col_count == W+2*PAD-3) begin
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
        if (((state == S1p) && (output_count == M*D_OUT/N_PE-1) && (row_count == 2*PAD+H-1) && (col_count >= IN_WINDOW_W-2)) ||
            ((state == S2p) && (output_count == M*D_OUT/N_PE-1) && (row_count >= IN_WINDOW_H-1 && row_count <= H+PAD-1) &&(col_count == IN_WINDOW_W-2) && row_count[0] == 1) ||
            (state == S3) || (state == S3p && output_count <= D_OUT/N_PE-1) || (state == S4 || state == S5))
             begin
            w_rom_en = 1'b1;
        end
        else if (state == S4p || state == S5p) begin
            if (row_count == H+1 && (col_count > PAD && col_count < W+1) && output_count <= D_OUT/N_PE-1)
                w_rom_en = 1'b1;
            else if ((row_count >= FH-1 && row_count <= H+1) && (col_count == W+1) && output_count <= D_OUT/N_PE-2)
                w_rom_en = 1'b1;
            else 
                w_rom_en = 1'b0;
        end
        else
            w_rom_en = 1'b0;
    end
    
    // w_rom_addr
    always@(posedge clk) begin
        if (~rst) begin
            w_rom_addr <= 0;
        end            
        else begin
            if (state == S2p && row_count >= IN_WINDOW_H-1 && row_count[0] == 1 && col_count >= IN_WINDOW_W-2 && output_count == FD/N_PE-1) begin
                if (w_rom_addr < D_OUT/N_PE-1)
                    w_rom_addr <= w_rom_addr + 1;
                else
                    w_rom_addr <= 0;
            end
            else if (state == S1p && row_count == H+2*PAD-1 && col_count >= IN_WINDOW_W-2 && output_count == FD/N_PE-1) begin
                if (w_rom_addr < D_OUT/N_PE-1)
                    w_rom_addr <= w_rom_addr + 1;
                else
                    w_rom_addr <= 0;
            end
            else if (state == S3 || state == S4 || state == S5) begin
                if (w_rom_addr < D_OUT/N_PE-1)
                    w_rom_addr <= w_rom_addr + 1;
                else
                    w_rom_addr <= 0;
            end
            else if ((state == S3p || state == S4p || state == S5p) && output_count <= FD/N_PE-2) begin
                if (w_rom_addr < D_OUT/N_PE-1)
                    w_rom_addr <= w_rom_addr + 1;
                else
                    w_rom_addr <= 0;
            end    
            else 
                w_rom_addr <= 0;
        end
    end
    
    // pe_en
    always@(state or row_count or col_count or output_count) begin
        if (((state == S1p) && (output_count == M*D_OUT/N_PE-1) && (row_count == 2*PAD+H-1) && (col_count >= IN_WINDOW_W-2)) ||
            ((state == S2p) && (output_count == M*D_OUT/N_PE-1) && (row_count >= IN_WINDOW_H-1 && row_count <= H+PAD-1) &&(col_count == IN_WINDOW_W-2) && row_count[0] == 1) ||
            (state == S3) || (state == S3p && output_count <= D_OUT/N_PE-1) || (state == S4 || state == S5))
             begin
            pe_en = 1'b1;
        end
        else if (state == S4p || state == S5p) begin
            if (row_count == H+1 && (col_count > PAD && col_count < W+1) && output_count <= D_OUT/N_PE-1)
                pe_en = 1'b1;
            else if ((row_count >= FH-1 && row_count <= H+1) && (col_count == W+1) && output_count <= D_OUT/N_PE-2)
                pe_en = 1'b1;
            else 
                pe_en = 1'b0;
        end
        else
            pe_en = 1'b0;
    end
    
    // upool_mux_sel
    logic [$clog2(POOL_H*POOL_W)-1:0] upool_mux_sel_dl[FD/N_PE:0];
    always@(posedge clk) begin
        if (~rst)
            upool_mux_sel_dl[0] <= 'b0;
        else if (output_count == 0 && row_count >= IN_WINDOW_H-1 && row_count <= 2*PAD+H && row_count[0] == 1 && col_count == IN_WINDOW_W-2)
            upool_mux_sel_dl[0] <= 'b0;
        else if (output_count == 0 && row_count >= IN_WINDOW_H-1 && row_count <= 2*PAD+H && row_count[0] == 0 && col_count == IN_WINDOW_W-2)
            upool_mux_sel_dl[0] <= POOL_H*POOL_W/POOL_W;
        else if (output_count == FD/N_PE-1 && row_count >= IN_WINDOW_H-1 && row_count <= 2*PAD+H && row_count[0] == 1 && col_count >= IN_WINDOW_W-2) begin
            if (upool_mux_sel_dl[0] < POOL_H*POOL_W/POOL_W-1)
                upool_mux_sel_dl[0] <= upool_mux_sel_dl[0]+1;
            else
                upool_mux_sel_dl[0] <= 'b0;
        end
        else if (output_count == FD/N_PE-1 && row_count >= IN_WINDOW_H-1 && row_count <= 2*PAD+H && row_count[0] == 0 && col_count >= IN_WINDOW_W-2) begin
            if (upool_mux_sel_dl[0] < POOL_H*POOL_W-1)
                upool_mux_sel_dl[0] <= upool_mux_sel_dl[0]+1;
            else
                upool_mux_sel_dl[0] <= POOL_H*POOL_W/POOL_W;
        end

    end
    
    // delay upool_mux_sel[0]
    generate        
        for (i = 0; i <= FD/N_PE; i = i+1) begin
            always@(posedge clk) begin
                if (i < FD/N_PE)
                    upool_mux_sel_dl[i+1] <= upool_mux_sel_dl[i];
                else
                    upool_mux_sel <= upool_mux_sel_dl[i];
            end
        end
    endgenerate
    
    // data_out_en
    logic data_out_en_dl [FD/N_PE:0];
    always@(row_count or col_count or output_count or rst) begin
        if (~rst)
            data_out_en_dl[0] = 1'b0;
        else if (output_count == FD/N_PE-1) begin
            if (row_count >= IN_WINDOW_H-1 && col_count >= IN_WINDOW_W-2 && p_count == 0)
                data_out_en_dl[0] = 1'b1;
            else
                data_out_en_dl[0] = 1'b0;
        end
        else
            data_out_en_dl[0] = 1'b0;
    end
    
    // delay data_out_en
    generate
        for (i = 0; i <= FD/N_PE; i = i+1) begin
            always@(posedge clk) begin
                if (~rst)
                    data_out_en_dl[i+1] <= 0;
                else if (i == FD/N_PE)
                    data_out_en <= data_out_en_dl[i];
                else
                    data_out_en_dl[i+1] <= data_out_en_dl[i];
            end
        end
    endgenerate
    
    // tg_next
    // WARN: this code is for primary synthesis, the timing is not correct.
    always@(col_count or row_count or output_count or p_count) begin
        if (row_count == TG_NEXT_H && col_count == TG_NEXT_W && output_count == 0 && p_count == 0) begin
            tg_next = 1;
        end
        else begin
            tg_next = 0;
        end
    end
    
endmodule
