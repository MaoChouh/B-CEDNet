/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       ESILICON CORPORATION CONFIDENTIAL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      COPYRIGHT (C) 2000-2016 ESILICON CORPORATION. ALL RIGHTS RESERVED.
      NO PART OF THIS DOCUMENT MAY BE PHOTOCOPIED, REPRODUCED OR TRANSLATED
      TO ANOTHER PROGRAM LANGUAGE WITHOUT THE PRIOR WRITTEN CONSENT OF ESILICON
      CORPORATION. THIS DATA CAN ONLY BE USED AS AUTHORIZED BY A LICENSE
      FROM ESILICON CORPORATION. IN ADDITION, THIS DATA IS PROTECTED BY
      COPYRIGHT LAW AND INTERNATIONAL TREATIES.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~**
**                                                                       **
**      Revision : 0.5                                                   **
**      Generation date : December 19, 2016                              **
**                                                                       **
**~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~**
**                                                                       **
** View type      : Verilog behavioral model                             **
** Instance name  : b7dhd110g_512x64x16                                  **
** Words          : 512                                                  **
** Bits           : 64                                                   **
** Mux            : 16                                                   **
**                                                                       **
**~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~**
** Verified with:                                                        **
**    a. VCS, Y-2006.06                                                  **
**    b. VERILOG-XL, 05.10.007-s                                         **
**    c. NC-VERILOG, 05.10-s021                                          **
**                                                                       **
** Known bugs: None.                                                     **
**                                                                       **
** Known work arounds: N/A                                               **
**                                                                       **
** Comments:                                                             **
**   a. Usage for ROM_NO_xxx_CHECK:                                 **
**     - User can turn off these messages by directives,                 **
**       i.e. turn off: +define+ROM_NO_X_CHECK                      **
**     - Verilog model supports following directives:                    **
**       + ROM_NO_X_CHECK: Turn off hazard messages.                **
**       + ROM_NO_OVER_RANGE_CHECK: Turn off out of range messages. **
**   b. Usage for xxx_message_on:                                        **
**     - User can turn on/off these parameters in testbench,             **
**       i.e. turn off: top.memory_inst.xxx_message_on = 1'b0;           **
**       i.e. turn on: top.memory_inst.xxx_message_on = 1'b1;            **
**     - Verilog model supports following parameters:                    **
**         + all_message_on              (default on)                    **
**         + x_state_message_on          (default on)                    **
**         + over_range_message_on       (default on)                    **
**                                                                       **
**~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~**
** COMPILER DIRECTIVE.                                                   **
**~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

`celldefine
`timescale 1 ns /1 ps








//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Pin declaration for memory
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

module b7dhd110g_512x64x16 (     
            clk,
            cen_b,
            a,

            t_cen_b,
            t_a,
            t_mux,

            t_scan_en,
            t_sin,
            t_sout,  

            
            t_strd,

            t_burnin,

            
            rst_b,

            q
                                );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Define parameters
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/////  DEFAULT PARAMETERS  ////////////////////////////////////////////
  parameter ROM_NWORD = 512;       // Number of words in memory
  parameter ROM_NBIT  = 64;       // Number of bits in each word
  parameter ROM_NADDR =  9; // Number of address bits.
  parameter PRELOADFILE  = "";                // Preloading file.
  parameter ROM_CODE_BIN = "yes";              // specify rom code type: yes -> binary, no -> hexadecimal
  parameter ROM_REGISTER    = 1'b0;      // Selecting for output register or none

/////  DEFAULT PARAMETERS  ////////////////////////////////////////////
  parameter ROM_DATA_X = {ROM_NBIT{1'bx}};
  parameter ROM_DATA_0 = {ROM_NBIT{1'b0}};
  parameter ROM_ADR_X  = {ROM_NADDR{1'bx}};

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// I/O declaration
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
input clk;
input cen_b;
input t_cen_b;
input t_mux;

input t_scan_en;
input t_sin; 

input [3:0] t_strd;
input t_burnin;

input rst_b;

input  [ROM_NADDR-1:0] a;
input  [ROM_NADDR-1:0] t_a;
output [ROM_NBIT-1:0] q;

output t_sout;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// DECLARATION OF REG VARIABLES.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg latched_scan;
reg latched1_scan;
reg latched_tmux;
reg latched_mux_eb;
reg [ROM_NADDR-1:0] latched_mux_adr;
reg [ROM_NBIT-1:0] r_q;
reg latched_t_burnin;
reg latched_rst_b;
reg latched_pd_b;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// DECLARATION OF ANOTHER VARIABLES.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [ROM_NBIT-1 : 0] MEMCORE [0:ROM_NWORD-1];

reg pre_clk ;

reg   x_state_message_on;
reg   all_message_on;
reg   over_range_message_on;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// FLAGS FOR CHECKING TIMING VIOLATION
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg FlagPeriod_CLK;
reg FlagPulseWidthHigh_CLK;
reg FlagPulseWidthLow_CLK;
reg FlagSetupHold_pCEN_pCLK;
reg FlagSetupHold_nCEN_pCLK;
reg FlagSetupHold_pTCEN_pCLK;
reg FlagSetupHold_nTCEN_pCLK;
reg FlagSetupHold_pTMUX_pCLK;
reg FlagSetupHold_nTMUX_pCLK;
reg FlagSetupHold_pADR_pCLK;
reg FlagSetupHold_nADR_pCLK;
reg FlagSetupHold_pTADR_pCLK;
reg FlagSetupHold_nTADR_pCLK;
reg SetupHoldViolation_t_burnin_pclk;
reg    PulseWidthLowViolation_rst;
reg    SetupHoldViolation_pd_b_vdd;
reg    SetupHoldViolation_cen_b_pd_b;
reg    SetupHoldViolation_rst_b_clk;
reg    SetupHoldViolation_pd_b_clk;


reg SetupHoldViolation_t_strd_pclk;
reg PulseWidthHigh_CLK;

reg SetupHoldViolation_t_sin_pclk;
reg SetupHoldViolation_t_scan_en_pclk;


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// DECLARATION OF WIRES 
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire buf_vdd;
wire buf_vss;

wire buf_clk;
wire buf_eb;
wire buf_teb;
wire buf_tmux;
wire buf_mux_eb;
wire buf_t_burnin;
wire buf_rst_b;
wire buf_pd_b;
wire [ROM_NADDR-1:0] buf_adr;
wire [ROM_NADDR-1:0] buf_tadr;
wire [ROM_NADDR-1:0] buf_mux_adr;
wire [3:0] buf_STRD;


wire pclk_access_path_delay;

wire nt_pd_b_access_path_delay;
wire pt_pd_access_path_delay;

wire nt_rst_b_access_path_delay;
wire pt_rst_access_path_delay;

wire nt_t_burnin_access_path_delay;


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//      DECLARE FOR SCAN CHAIN
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire buf_scan;
wire SI,SO;
wire resetSO;
wire SI_cen_b;
wire [ROM_NADDR-1:0] SI_a;
wire   SI_burnin;

wire [3:0] SI_STRD;
wire [ROM_NBIT-1 : 0] SI_q;

reg SO_cen_b;
reg [ROM_NADDR-1:0] SO_a;
reg    SO_burnin;

reg [3:0] SO_STRD;
reg [ROM_NBIT-1 : 0] SO_q;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// CONNECTIONS OF NETS.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
buf vdd_buf  (buf_vdd,1'b1);
buf vss_buf  (buf_vss,1'b0);

buf clk_buf  (buf_clk,clk);
buf eb_buf  (buf_eb,cen_b); 
buf teb_buf (buf_teb,t_cen_b); 
buf tmux_buf (buf_tmux,t_mux); 
buf adr_buf  [ROM_NADDR-1:0] (buf_adr,a); 
buf tadr_buf [ROM_NADDR-1:0] (buf_tadr,t_a);
buf tburnin_buf (buf_t_burnin,t_burnin); 
buf rst_buf (buf_rst_b,rst_b); 
buf pd_buf (buf_pd_b,1'b1); 

buf scan_buf (buf_scan,t_scan_en);
buf si_buf (SI,t_sin);
buf so_buf (t_sout,resetSO);

buf STRD03 [3:0] (buf_STRD, t_strd);
wire yield, screen0, normal, screen1, burnin;
assign yield   = !buf_t_burnin&!buf_STRD[3]&!buf_STRD[2]&!buf_STRD[1]&buf_STRD[0];
assign screen0 = !buf_t_burnin&!buf_STRD[3]&buf_STRD[2]&!buf_STRD[1]&buf_STRD[0];
assign normal  = !buf_t_burnin&buf_STRD[3]&!buf_STRD[2]&buf_STRD[1]&!buf_STRD[0];
assign screen1 = !buf_t_burnin&buf_STRD[3]&buf_STRD[2]&buf_STRD[1]&buf_STRD[0];
assign burnin  = buf_t_burnin;


assign pclk_access_path_delay = 1'b1;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// OUTPUT BLOCK
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire [ROM_NBIT-1:0] wq1, wq2;
reg [ROM_NBIT-1:0] r_q1, r_q2;

always @(r_q)
begin
    if(latched_t_burnin === 1'b1) begin
        r_q1 <= r_q;
    end
    else if(latched_t_burnin === 1'b0) begin
        r_q1 <= r_q;
    end 
    else begin
        if (all_message_on || x_state_message_on) $display("\n[ERROR] > %m %t - t_burnin is unknown.", $realtime);
        r_q1 <= ROM_DATA_X;
    end
end

assign wq1 = latched_scan===1'b1 ? SO_q : (buf_scan===1'b0 ? r_q1 : ROM_DATA_X);

always @(posedge buf_clk) r_q2<= wq1;
assign  wq2 = r_q2;

wire    [ROM_NBIT-1:0] wi_q = ROM_REGISTER === 1'b1 ? wq2 : wq1 ;


assign resetSO = buf_rst_b===1'b0 ? 1'b0 : (buf_rst_b===1'b1 ? SO : 1'bx);
wire    [ROM_NBIT-1:0] rst_q = buf_rst_b===1'b0 ? ROM_DATA_0 : (buf_rst_b===1'b1 ? wi_q : ROM_DATA_X);
wire    [ROM_NBIT-1:0] pd_q  = buf_pd_b===1'b0 ? ROM_DATA_0 : (buf_pd_b===1'b1 ? rst_q : ROM_DATA_X);
//buf q_buf    [ROM_NBIT-1:0] (q,pd_q);
buf q_buf    [ROM_NBIT-1:0] (q,rst_q); //Disable pd_b function

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// MULTIPLEXER INPUT SIGNALS
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
assign buf_mux_eb = buf_tmux===1'b0 ? buf_eb : (buf_tmux===1'b1 ? buf_teb : 1'bx); 
assign buf_mux_adr = buf_tmux===1'b0 ? buf_adr : (buf_tmux===1'b1 ? buf_tadr : ROM_ADR_X);


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// MUX for SCAN
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire scan_mux_cen = buf_scan === 1'b1 ? SI_cen_b : ((buf_scan === 1'b0) ? buf_mux_eb : 1'bx); 
wire [ROM_NADDR-1:0] scan_mux_a = buf_scan === 1'b1 ? SI_a : ((buf_scan === 1'b0) ? buf_mux_adr : ROM_ADR_X);

wire scan_burnin = buf_scan === 1'b1 ? SI_burnin : ((buf_scan === 1'b0) ? buf_t_burnin : 1'bx);

wire [3:0] scan_STRD = buf_scan === 1'b1 ? SI_STRD : ((buf_scan === 1'b0) ? buf_STRD : 4'bxxxx); 

wire [ROM_NBIT-1:0] scan_q     = buf_scan === 1'b1 ? SI_q : ((buf_scan === 1'b0) ? wq1 : ROM_DATA_X);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// ASSIGN INPUT
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
always @(buf_rst_b) latched_rst_b <= buf_rst_b;
always @(buf_pd_b) latched_pd_b <= buf_pd_b; 


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// DFF for SCAN
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
always @(posedge clk)
if(buf_mux_eb===1'b0 || buf_scan===1'b1) begin
    SO_cen_b <= scan_mux_cen;
    SO_a <= scan_mux_a;
    SO_q <= scan_q;
    SO_STRD <= scan_STRD;
end

// SCAN_CHAIN_CONNECTIONS_0

//******************* Start of SCAN_CHAIN_CONNECTIONS_0 *******************

buf buf_SI_a8 (SI_a[8],     SI);

 
buf buf_SI_a7 (SI_a[7], SO_a[8]);  
buf buf_SI_a6 (SI_a[6], SO_a[7]);  
buf buf_SI_a5 (SI_a[5], SO_a[6]);  
buf buf_SI_a4 (SI_a[4], SO_a[5]);  
buf buf_SI_a1 (SI_a[1], SO_a[4]);
buf buf_SI_a0 (SI_a[0], SO_a[1]);
buf buf_SI_a3 (SI_a[3], SO_a[0]);
buf buf_SI_a2 (SI_a[2], SO_a[3]);
buf buf_SI_cen_b (SI_cen_b, SO_a[2]);
buf buf_SI_STRD3 (SI_STRD[3], SO_cen_b);


buf buf_SI_STRD2 (SI_STRD[2],  SO_STRD[3]);
buf buf_SI_STRD1 (SI_STRD[1],  SO_STRD[2]);
buf buf_SI_STRD0 (SI_STRD[0],  SO_STRD[1]);
buf buf_SI_q0 (SI_q[0],          SO_STRD[0]);

buf buf_SI_q1 (SI_q[1],    SO_q[0]); 
buf buf_SI_q2 (SI_q[2],    SO_q[1]); 
buf buf_SI_q3 (SI_q[3],    SO_q[2]); 
buf buf_SI_q4 (SI_q[4],    SO_q[3]); 
buf buf_SI_q5 (SI_q[5],    SO_q[4]); 
buf buf_SI_q6 (SI_q[6],    SO_q[5]); 
buf buf_SI_q7 (SI_q[7],    SO_q[6]); 
buf buf_SI_q8 (SI_q[8],    SO_q[7]); 
buf buf_SI_q9 (SI_q[9],    SO_q[8]); 
buf buf_SI_q10 (SI_q[10],    SO_q[9]); 
buf buf_SI_q11 (SI_q[11],    SO_q[10]); 
buf buf_SI_q12 (SI_q[12],    SO_q[11]); 
buf buf_SI_q13 (SI_q[13],    SO_q[12]); 
buf buf_SI_q14 (SI_q[14],    SO_q[13]); 
buf buf_SI_q15 (SI_q[15],    SO_q[14]); 
buf buf_SI_q16 (SI_q[16],    SO_q[15]); 
buf buf_SI_q17 (SI_q[17],    SO_q[16]); 
buf buf_SI_q18 (SI_q[18],    SO_q[17]); 
buf buf_SI_q19 (SI_q[19],    SO_q[18]); 
buf buf_SI_q20 (SI_q[20],    SO_q[19]); 
buf buf_SI_q21 (SI_q[21],    SO_q[20]); 
buf buf_SI_q22 (SI_q[22],    SO_q[21]); 
buf buf_SI_q23 (SI_q[23],    SO_q[22]); 
buf buf_SI_q24 (SI_q[24],    SO_q[23]); 
buf buf_SI_q25 (SI_q[25],    SO_q[24]); 
buf buf_SI_q26 (SI_q[26],    SO_q[25]); 
buf buf_SI_q27 (SI_q[27],    SO_q[26]); 
buf buf_SI_q28 (SI_q[28],    SO_q[27]); 
buf buf_SI_q29 (SI_q[29],    SO_q[28]); 
buf buf_SI_q30 (SI_q[30],    SO_q[29]); 
buf buf_SI_q31 (SI_q[31],    SO_q[30]); 
buf buf_SI_q32 (SI_q[32],    SO_q[31]); 
buf buf_SI_q33 (SI_q[33],    SO_q[32]); 
buf buf_SI_q34 (SI_q[34],    SO_q[33]); 
buf buf_SI_q35 (SI_q[35],    SO_q[34]); 
buf buf_SI_q36 (SI_q[36],    SO_q[35]); 
buf buf_SI_q37 (SI_q[37],    SO_q[36]); 
buf buf_SI_q38 (SI_q[38],    SO_q[37]); 
buf buf_SI_q39 (SI_q[39],    SO_q[38]); 
buf buf_SI_q40 (SI_q[40],    SO_q[39]); 
buf buf_SI_q41 (SI_q[41],    SO_q[40]); 
buf buf_SI_q42 (SI_q[42],    SO_q[41]); 
buf buf_SI_q43 (SI_q[43],    SO_q[42]); 
buf buf_SI_q44 (SI_q[44],    SO_q[43]); 
buf buf_SI_q45 (SI_q[45],    SO_q[44]); 
buf buf_SI_q46 (SI_q[46],    SO_q[45]); 
buf buf_SI_q47 (SI_q[47],    SO_q[46]); 
buf buf_SI_q48 (SI_q[48],    SO_q[47]); 
buf buf_SI_q49 (SI_q[49],    SO_q[48]); 
buf buf_SI_q50 (SI_q[50],    SO_q[49]); 
buf buf_SI_q51 (SI_q[51],    SO_q[50]); 
buf buf_SI_q52 (SI_q[52],    SO_q[51]); 
buf buf_SI_q53 (SI_q[53],    SO_q[52]); 
buf buf_SI_q54 (SI_q[54],    SO_q[53]); 
buf buf_SI_q55 (SI_q[55],    SO_q[54]); 
buf buf_SI_q56 (SI_q[56],    SO_q[55]); 
buf buf_SI_q57 (SI_q[57],    SO_q[56]); 
buf buf_SI_q58 (SI_q[58],    SO_q[57]); 
buf buf_SI_q59 (SI_q[59],    SO_q[58]); 
buf buf_SI_q60 (SI_q[60],    SO_q[59]); 
buf buf_SI_q61 (SI_q[61],    SO_q[60]); 
buf buf_SI_q62 (SI_q[62],    SO_q[61]); 
buf buf_SI_q63 (SI_q[63],    SO_q[62]); 
buf buf_SO          (SO,               SO_q[63]);

//******************* End of SCAN_CHAIN_CONNECTIONS_0 *********************

// END


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// SPECIFY BLOCK
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
specify
        specparam       tchch  = 0.000;  
        specparam       tchcl  = 0.000;
        specparam       tclch  = 0.000;
    
        specparam       tchcl_NORMAL  = 0.000;
        specparam       tchcl_YIELD  = 0.000;
        specparam       tchcl_SCREEN0  = 0.000;
        specparam       tchcl_SCREEN1  = 0.000;
       
        specparam       tscenb = 0.000;
        specparam       thcenb = 0.000;
        specparam       tsa    = 0.000;
        specparam       tha    = 0.000;
        specparam       tstmuxb = 0.000;
        specparam       thtmuxb = 0.000;
        specparam       tchqvr   = 0.001;
        specparam       tchqvf   = 0.001;
        
        specparam       trshrsl = 0.001;
        specparam       tpdin  = 0.001;
        specparam       tpdout = 0.001;
        specparam       tcenpd = 0.001;
        specparam       tpdcen = 0.001;
        specparam       ttcenpd = 0.001;
        specparam       tpdtcen = 0.001;
        specparam       tpdq0  = 0.001;
        specparam       tpdqr  = 0.001;
        specparam       trstlq0 = 0.001;
        specparam       trsthqr = 0.001;
        
        specparam       tburvch = 0.001;
        specparam       tchburx = 0.001;
        specparam       tclqvr = 0.001;
        specparam       tclqvf = 0.001;
        
        specparam       tsSIN = 0.001;
        specparam       thSIN = 0.001;
        specparam       tsSCAN_EN = 0.001;
        specparam       thSCAN_EN = 0.001;
        specparam       tchsor = 0.001;
        specparam       tchsof = 0.001;
        
        specparam       tsSTRD = 0.001;
        specparam       thSTRD = 0.001;

  
    
        if (yield) (posedge clk => (q[0]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[1]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[2]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[3]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[4]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[5]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[6]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[7]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[8]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[9]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[10]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[11]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[12]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[13]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[14]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[15]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[16]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[17]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[18]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[19]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[20]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[21]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[22]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[23]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[24]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[25]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[26]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[27]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[28]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[29]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[30]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[31]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[32]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[33]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[34]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[35]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[36]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[37]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[38]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[39]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[40]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[41]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[42]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[43]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[44]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[45]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[46]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[47]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[48]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[49]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[50]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[51]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[52]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[53]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[54]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[55]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[56]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[57]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[58]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[59]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[60]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[61]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[62]:1'bx)) = (tchqvr,tchqvf);
        if (yield) (posedge clk => (q[63]:1'bx)) = (tchqvr,tchqvf);
    
        if (screen0) (posedge clk => (q[0]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[1]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[2]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[3]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[4]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[5]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[6]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[7]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[8]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[9]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[10]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[11]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[12]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[13]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[14]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[15]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[16]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[17]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[18]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[19]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[20]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[21]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[22]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[23]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[24]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[25]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[26]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[27]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[28]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[29]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[30]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[31]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[32]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[33]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[34]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[35]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[36]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[37]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[38]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[39]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[40]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[41]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[42]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[43]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[44]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[45]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[46]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[47]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[48]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[49]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[50]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[51]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[52]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[53]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[54]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[55]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[56]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[57]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[58]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[59]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[60]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[61]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[62]:1'bx)) = (tchqvr,tchqvf);
        if (screen0) (posedge clk => (q[63]:1'bx)) = (tchqvr,tchqvf);
    
        if (normal) (posedge clk => (q[0]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[1]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[2]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[3]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[4]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[5]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[6]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[7]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[8]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[9]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[10]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[11]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[12]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[13]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[14]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[15]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[16]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[17]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[18]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[19]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[20]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[21]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[22]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[23]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[24]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[25]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[26]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[27]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[28]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[29]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[30]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[31]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[32]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[33]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[34]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[35]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[36]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[37]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[38]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[39]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[40]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[41]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[42]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[43]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[44]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[45]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[46]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[47]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[48]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[49]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[50]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[51]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[52]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[53]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[54]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[55]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[56]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[57]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[58]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[59]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[60]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[61]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[62]:1'bx)) = (tchqvr,tchqvf);
        if (normal) (posedge clk => (q[63]:1'bx)) = (tchqvr,tchqvf);
    
        if (screen1) (posedge clk => (q[0]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[1]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[2]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[3]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[4]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[5]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[6]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[7]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[8]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[9]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[10]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[11]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[12]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[13]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[14]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[15]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[16]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[17]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[18]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[19]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[20]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[21]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[22]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[23]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[24]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[25]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[26]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[27]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[28]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[29]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[30]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[31]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[32]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[33]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[34]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[35]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[36]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[37]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[38]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[39]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[40]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[41]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[42]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[43]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[44]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[45]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[46]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[47]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[48]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[49]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[50]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[51]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[52]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[53]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[54]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[55]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[56]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[57]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[58]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[59]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[60]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[61]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[62]:1'bx)) = (tchqvr,tchqvf);
        if (screen1) (posedge clk => (q[63]:1'bx)) = (tchqvr,tchqvf);
    
        if (burnin) (posedge clk => (q[0]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[1]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[2]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[3]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[4]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[5]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[6]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[7]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[8]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[9]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[10]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[11]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[12]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[13]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[14]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[15]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[16]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[17]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[18]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[19]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[20]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[21]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[22]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[23]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[24]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[25]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[26]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[27]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[28]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[29]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[30]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[31]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[32]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[33]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[34]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[35]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[36]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[37]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[38]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[39]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[40]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[41]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[42]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[43]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[44]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[45]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[46]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[47]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[48]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[49]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[50]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[51]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[52]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[53]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[54]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[55]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[56]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[57]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[58]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[59]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[60]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[61]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[62]:1'bx)) = (tchqvr,tchqvf);
        if (burnin) (posedge clk => (q[63]:1'bx)) = (tchqvr,tchqvf);
  

    
        (negedge rst_b => (q[0]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[1]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[2]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[3]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[4]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[5]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[6]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[7]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[8]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[9]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[10]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[11]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[12]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[13]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[14]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[15]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[16]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[17]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[18]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[19]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[20]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[21]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[22]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[23]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[24]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[25]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[26]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[27]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[28]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[29]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[30]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[31]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[32]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[33]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[34]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[35]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[36]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[37]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[38]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[39]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[40]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[41]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[42]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[43]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[44]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[45]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[46]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[47]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[48]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[49]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[50]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[51]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[52]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[53]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[54]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[55]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[56]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[57]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[58]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[59]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[60]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[61]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[62]:1'bx)) = (0.0, trstlq0); 
        (negedge rst_b => (q[63]:1'bx)) = (0.0, trstlq0); 
        
        (posedge rst_b => (q[0]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[1]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[2]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[3]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[4]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[5]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[6]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[7]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[8]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[9]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[10]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[11]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[12]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[13]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[14]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[15]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[16]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[17]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[18]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[19]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[20]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[21]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[22]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[23]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[24]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[25]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[26]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[27]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[28]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[29]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[30]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[31]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[32]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[33]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[34]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[35]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[36]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[37]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[38]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[39]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[40]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[41]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[42]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[43]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[44]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[45]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[46]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[47]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[48]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[49]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[50]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[51]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[52]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[53]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[54]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[55]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[56]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[57]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[58]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[59]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[60]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[61]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[62]:1'bx)) = (trsthqr, 0.0); 
        (posedge rst_b => (q[63]:1'bx)) = (trsthqr, 0.0);  
    
        (posedge clk => (t_sout:1'bx)) = (tchsor,tchsof);
        (negedge rst_b => (t_sout:1'bx)) = (0.0,tchsof);
        (posedge rst_b => (t_sout:1'bx)) = (tchsor,0.0);
    
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// TIMING CHECK BLOCK
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        // For CLOCK
      
        $period(posedge clk &&& yield, tchch, FlagPeriod_CLK);
        $period(posedge clk &&& burnin, tchch, FlagPeriod_CLK);
        $period(posedge clk &&& screen0, tchch, FlagPeriod_CLK);
        $period(posedge clk &&& normal, tchch, FlagPeriod_CLK);
        $period(posedge clk &&& screen1, tchch, FlagPeriod_CLK);
      
        $width(posedge clk, tchcl, 0, FlagPulseWidthHigh_CLK);
        $width(negedge clk, tclch, 0, FlagPulseWidthLow_CLK);
        // For CEN_B
        $setuphold(posedge clk, posedge cen_b, tscenb, thcenb, FlagSetupHold_pCEN_pCLK);
        $setuphold(posedge clk, negedge cen_b, tscenb, thcenb, FlagSetupHold_nCEN_pCLK);
    
        // For T_CEN_B
        $setuphold(posedge clk, posedge t_cen_b, tscenb, thcenb, FlagSetupHold_pTCEN_pCLK);
        $setuphold(posedge clk, negedge t_cen_b, tscenb, thcenb, FlagSetupHold_nTCEN_pCLK);

        // For T_MUX_B
        $setuphold(posedge clk, posedge t_mux, tstmuxb, thtmuxb, FlagSetupHold_pTMUX_pCLK);
        $setuphold(posedge clk, negedge t_mux, tstmuxb, thtmuxb, FlagSetupHold_nTMUX_pCLK);
    
        // For A address 
        
        $setuphold(posedge clk, posedge a[0], tsa, tha, FlagSetupHold_pADR_pCLK);
        $setuphold(posedge clk, negedge a[0], tsa, tha, FlagSetupHold_nADR_pCLK);
        $setuphold(posedge clk, posedge a[1], tsa, tha, FlagSetupHold_pADR_pCLK);
        $setuphold(posedge clk, negedge a[1], tsa, tha, FlagSetupHold_nADR_pCLK);
        $setuphold(posedge clk, posedge a[2], tsa, tha, FlagSetupHold_pADR_pCLK);
        $setuphold(posedge clk, negedge a[2], tsa, tha, FlagSetupHold_nADR_pCLK);
        $setuphold(posedge clk, posedge a[3], tsa, tha, FlagSetupHold_pADR_pCLK);
        $setuphold(posedge clk, negedge a[3], tsa, tha, FlagSetupHold_nADR_pCLK);
        $setuphold(posedge clk, posedge a[4], tsa, tha, FlagSetupHold_pADR_pCLK);
        $setuphold(posedge clk, negedge a[4], tsa, tha, FlagSetupHold_nADR_pCLK);
        $setuphold(posedge clk, posedge a[5], tsa, tha, FlagSetupHold_pADR_pCLK);
        $setuphold(posedge clk, negedge a[5], tsa, tha, FlagSetupHold_nADR_pCLK);
        $setuphold(posedge clk, posedge a[6], tsa, tha, FlagSetupHold_pADR_pCLK);
        $setuphold(posedge clk, negedge a[6], tsa, tha, FlagSetupHold_nADR_pCLK);
        $setuphold(posedge clk, posedge a[7], tsa, tha, FlagSetupHold_pADR_pCLK);
        $setuphold(posedge clk, negedge a[7], tsa, tha, FlagSetupHold_nADR_pCLK);
        $setuphold(posedge clk, posedge a[8], tsa, tha, FlagSetupHold_pADR_pCLK);
        $setuphold(posedge clk, negedge a[8], tsa, tha, FlagSetupHold_nADR_pCLK);
    
        // For T_A address
        
        $setuphold(posedge clk, posedge t_a[0], tsa, tha, FlagSetupHold_pTADR_pCLK);
        $setuphold(posedge clk, negedge t_a[0], tsa, tha, FlagSetupHold_nTADR_pCLK);
        $setuphold(posedge clk, posedge t_a[1], tsa, tha, FlagSetupHold_pTADR_pCLK);
        $setuphold(posedge clk, negedge t_a[1], tsa, tha, FlagSetupHold_nTADR_pCLK);
        $setuphold(posedge clk, posedge t_a[2], tsa, tha, FlagSetupHold_pTADR_pCLK);
        $setuphold(posedge clk, negedge t_a[2], tsa, tha, FlagSetupHold_nTADR_pCLK);
        $setuphold(posedge clk, posedge t_a[3], tsa, tha, FlagSetupHold_pTADR_pCLK);
        $setuphold(posedge clk, negedge t_a[3], tsa, tha, FlagSetupHold_nTADR_pCLK);
        $setuphold(posedge clk, posedge t_a[4], tsa, tha, FlagSetupHold_pTADR_pCLK);
        $setuphold(posedge clk, negedge t_a[4], tsa, tha, FlagSetupHold_nTADR_pCLK);
        $setuphold(posedge clk, posedge t_a[5], tsa, tha, FlagSetupHold_pTADR_pCLK);
        $setuphold(posedge clk, negedge t_a[5], tsa, tha, FlagSetupHold_nTADR_pCLK);
        $setuphold(posedge clk, posedge t_a[6], tsa, tha, FlagSetupHold_pTADR_pCLK);
        $setuphold(posedge clk, negedge t_a[6], tsa, tha, FlagSetupHold_nTADR_pCLK);
        $setuphold(posedge clk, posedge t_a[7], tsa, tha, FlagSetupHold_pTADR_pCLK);
        $setuphold(posedge clk, negedge t_a[7], tsa, tha, FlagSetupHold_nTADR_pCLK);
        $setuphold(posedge clk, posedge t_a[8], tsa, tha, FlagSetupHold_pTADR_pCLK);
        $setuphold(posedge clk, negedge t_a[8], tsa, tha, FlagSetupHold_nTADR_pCLK);
    
        
        $setuphold(posedge clk, posedge t_burnin, tburvch, tchburx, SetupHoldViolation_t_burnin_pclk);
        $setuphold(posedge clk, negedge t_burnin, tburvch, tchburx, SetupHoldViolation_t_burnin_pclk); 
        
        
        //$setup( negedge pd_b, posedge clk, tpdin, SetupHoldViolation_pd_b_clk);
        //$setup( posedge pd_b, posedge clk, tpdin, SetupHoldViolation_pd_b_clk);
        $setup( negedge rst_b, posedge clk, tpdin, SetupHoldViolation_rst_b_clk);
        $setup( posedge rst_b, posedge clk, tpdin, SetupHoldViolation_rst_b_clk);
        
        
    
        $setuphold(posedge clk, posedge t_strd[0], tsSTRD, thSTRD, SetupHoldViolation_t_strd_pclk);
        $setuphold(posedge clk, negedge t_strd[0], tsSTRD, thSTRD, SetupHoldViolation_t_strd_pclk); 
        $setuphold(posedge clk, posedge t_strd[1], tsSTRD, thSTRD, SetupHoldViolation_t_strd_pclk);
        $setuphold(posedge clk, negedge t_strd[1], tsSTRD, thSTRD, SetupHoldViolation_t_strd_pclk); 
        $setuphold(posedge clk, posedge t_strd[2], tsSTRD, thSTRD, SetupHoldViolation_t_strd_pclk);
        $setuphold(posedge clk, negedge t_strd[2], tsSTRD, thSTRD, SetupHoldViolation_t_strd_pclk); 
        $setuphold(posedge clk, posedge t_strd[3], tsSTRD, thSTRD, SetupHoldViolation_t_strd_pclk);
        $setuphold(posedge clk, negedge t_strd[3], tsSTRD, thSTRD, SetupHoldViolation_t_strd_pclk); 
        
        $setuphold(posedge clk, posedge t_sin, tsSIN, thSIN, SetupHoldViolation_t_sin_pclk);
        $setuphold(posedge clk, negedge t_sin, tsSIN, thSIN, SetupHoldViolation_t_sin_pclk); 
        $setuphold(posedge clk, posedge t_scan_en, tsSCAN_EN, thSCAN_EN, SetupHoldViolation_t_scan_en_pclk);
        $setuphold(posedge clk, negedge t_scan_en, tsSCAN_EN, thSCAN_EN, SetupHoldViolation_t_scan_en_pclk); 
        
endspecify

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// INITIAL 
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
initial
begin
    all_message_on = 1'b1;
    x_state_message_on = 1'b1;
    over_range_message_on= 1'b1;
    `ifdef ROM_NO_X_CHECK
       all_message_on = 1'b0;
       x_state_message_on = 1'b0;
    `endif
    `ifdef ROM_NO_OVER_RANGE_CHECK
       all_message_on = 1'b0;
       over_range_message_on = 1'b0;
    `endif
/*    // ----- Preload feature
    if(PRELOADFILE !== "") begin
        if(ROM_CODE_BIN === "yes") begin
            $readmemb(PRELOADFILE,MEMCORE);
        end
        else begin
            $readmemh(PRELOADFILE,MEMCORE);
        end
    end //if(PRELOADFILE !== "") begin
*/
    pre_clk = 1'b0;

end  

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  EXECUTION OF OPERATIONS
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
always @(buf_clk)
begin
    case ({pre_clk,buf_clk})
    2'b01 : begin
        latched_mux_eb = buf_mux_eb;
        latched_mux_adr = buf_mux_adr;
        latched_tmux = buf_tmux;
        latched1_scan = latched_scan;
        latched_scan = buf_scan;
        latched_t_burnin  = buf_t_burnin;

        if (latched_scan===1'bx) begin
            if (all_message_on || x_state_message_on) $display("\n[ERROR] > %m %t - scan is unknown.", $realtime);
            r_q = ROM_DATA_X;
        end
        else if (latched_tmux===1'bx && latched_scan===1'b0) begin
            if (all_message_on || x_state_message_on) $display("\n[ERROR] > %m %t - t_mux is unknown.", $realtime);
            r_q = ROM_DATA_X;
        end
        else begin
            if (latched_mux_eb===1'bx && latched_scan===1'b0) begin
                if (all_message_on || x_state_message_on) $display("\n[ERROR] > %m %t - cen_b/t_cen_b is unknown.", $realtime);
                r_q = ROM_DATA_X;
            end
            else if(latched_mux_eb===1'b0 && latched_scan===1'b0) begin
                if(buf_vdd !== 1'b1) begin
                    if (all_message_on || x_state_message_on ) $display("\n[ERROR] > %m %t - vdd is invalid.\n",$realtime);
                    r_q = ROM_DATA_X;
                end
                if(^latched_mux_adr===1'bx) begin
                    if (all_message_on || x_state_message_on) $display("\n[ERROR] > %m %t - Read address is unknown.", $realtime);
                    r_q = ROM_DATA_X;
                end
                else if (latched_mux_adr >= ROM_NWORD) begin
                    if(latched1_scan===1'b0 && (all_message_on || over_range_message_on)) $display("\n[ERROR] > %m %t - Read address is out of range.", $realtime);
                    r_q = ROM_DATA_X;
                end
                else begin
                    r_q = MEMCORE[latched_mux_adr];        
                end
            end
        end
    end
    2'b10 : begin
        // Nothing
    end
    default :if (^{pre_clk, buf_clk} === 1'bx) begin 
        if (all_message_on || x_state_message_on ) $display("\n[ERROR] > %m %t - clk is unknown\n",$realtime);
        latched_tmux = 1'bx;
        latched_mux_eb = buf_mux_eb;
        latched_mux_adr = buf_mux_adr;
        r_q = ROM_DATA_X;
    end
    endcase
    pre_clk <= buf_clk;
end 

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Power port functionality
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//always @(buf_vdd or buf_vss) begin
//    if(buf_vdd !== 1'b1 && buf_pd_b===1'b1)  begin
//        r_q = ROM_DATA_X;
//        if (all_message_on || x_state_message_on ) $display("\n[ERROR] > %m %t - vdd is invalid.\n",$realtime);
//    end
//    if(buf_vss !== 1'b0 && buf_pd_b===1'b1) begin
//        r_q = ROM_DATA_X;
//        if (all_message_on || x_state_message_on ) $display("\n[ERROR] > %m %t - vss is invalid.\n",$realtime);
//    end
//end

endmodule
`endcelldefine