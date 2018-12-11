//****************************************************************************** */
//*        Software       : TSMC MEMORY COMPILER 2007.11.00.b.120a                 */
//*        Technology     : 45 nm CMOS Logic General Purpose Superb 1P10M 0.9V   */
//*                         Standard-vt logic, with cell implant SRAM            */
//*        Memory Type    : TSMC 45nm General Purpose Superb High Density        */
//*                         Read-Only Memory                                     */
//*        Library Name   : ts3n45gsa768x128m8 (user specify : TS3N45GSA768X128M8) */
//*        Library Version: 120a                                                 */
//*        Generated Time : 2017/03/20, 14:47:50                                 */
//****************************************************************************** */
//****************************************************************************** */
//*                                                                              */
//*STATEMENT OF USE                                                              */
//*                                                                              */
//*This information contains confidential and proprietary information of TSMC.   */
//*No part of this information may be reproduced, transmitted, transcribed,      */
//*stored in a retrieval system, or translated into any human or computer        */
//*language, in any form or by any means, electronic, mechanical, magnetic,      */
//*optical, chemical, manual, or otherwise, without the prior written permission */
//*of TSMC. This information was prepared for informational purpose and is for   */
//*use by TSMC's customers only. TSMC reserves the right to make changes in the  */
//*information at any time and without notice.                                   */
//*                                                                              */
//****************************************************************************** */




`timescale 1ns/1ps

`celldefine

`ifdef TSMC_UNIT_DELAY
//`define SRAM_DELAY 0.010
`define SRAM_DELAY 0
`endif

`suppress_faults
`enable_portfaults

module TS3N45GSA768X128M8
  (A, CEB, CLK, DELAY, TEST, 
   Q);

// Parameter declarations
parameter  N = 128;
parameter  W = 768;
parameter  M = 10;

// Input-Output declarations
   input [M-1:0] A;
   input CEB;
   input CLK;
   input [1:0] DELAY;
   input [1:0] TEST;

   output [N-1:0] Q;

`ifdef TSMC_NO_WARNING
parameter MES_ALL = "OFF";
`else
parameter MES_ALL = "ON";
`endif

// Registers
reg [M-1:0] AL;
reg valid_a;
reg valid_ck;
reg EN;


wire [1:0] bDELAY;
wire [1:0] bTEST;
wire [M-1:0] bA;
wire bCLK;
wire bCEB;
wire [N-1:0] bQ;
integer i;
 
// Read Address
buf sA0 (bA[0], A[0]);
buf sA1 (bA[1], A[1]);
buf sA2 (bA[2], A[2]);
buf sA3 (bA[3], A[3]);
buf sA4 (bA[4], A[4]);
buf sA5 (bA[5], A[5]);
buf sA6 (bA[6], A[6]);
buf sA7 (bA[7], A[7]);
buf sA8 (bA[8], A[8]);
buf sA9 (bA[9], A[9]);

buf sV0 (bDELAY[0], DELAY[0]);
buf sV1 (bDELAY[1], DELAY[1]);
buf sV2 (bTEST[0], TEST[0]);
buf sV3 (bTEST[1], TEST[1]);

// Output Data
buf sQ0 (Q[0], bQ[0]);
buf sQ1 (Q[1], bQ[1]);
buf sQ2 (Q[2], bQ[2]);
buf sQ3 (Q[3], bQ[3]);
buf sQ4 (Q[4], bQ[4]);
buf sQ5 (Q[5], bQ[5]);
buf sQ6 (Q[6], bQ[6]);
buf sQ7 (Q[7], bQ[7]);
buf sQ8 (Q[8], bQ[8]);
buf sQ9 (Q[9], bQ[9]);
buf sQ10 (Q[10], bQ[10]);
buf sQ11 (Q[11], bQ[11]);
buf sQ12 (Q[12], bQ[12]);
buf sQ13 (Q[13], bQ[13]);
buf sQ14 (Q[14], bQ[14]);
buf sQ15 (Q[15], bQ[15]);
buf sQ16 (Q[16], bQ[16]);
buf sQ17 (Q[17], bQ[17]);
buf sQ18 (Q[18], bQ[18]);
buf sQ19 (Q[19], bQ[19]);
buf sQ20 (Q[20], bQ[20]);
buf sQ21 (Q[21], bQ[21]);
buf sQ22 (Q[22], bQ[22]);
buf sQ23 (Q[23], bQ[23]);
buf sQ24 (Q[24], bQ[24]);
buf sQ25 (Q[25], bQ[25]);
buf sQ26 (Q[26], bQ[26]);
buf sQ27 (Q[27], bQ[27]);
buf sQ28 (Q[28], bQ[28]);
buf sQ29 (Q[29], bQ[29]);
buf sQ30 (Q[30], bQ[30]);
buf sQ31 (Q[31], bQ[31]);
buf sQ32 (Q[32], bQ[32]);
buf sQ33 (Q[33], bQ[33]);
buf sQ34 (Q[34], bQ[34]);
buf sQ35 (Q[35], bQ[35]);
buf sQ36 (Q[36], bQ[36]);
buf sQ37 (Q[37], bQ[37]);
buf sQ38 (Q[38], bQ[38]);
buf sQ39 (Q[39], bQ[39]);
buf sQ40 (Q[40], bQ[40]);
buf sQ41 (Q[41], bQ[41]);
buf sQ42 (Q[42], bQ[42]);
buf sQ43 (Q[43], bQ[43]);
buf sQ44 (Q[44], bQ[44]);
buf sQ45 (Q[45], bQ[45]);
buf sQ46 (Q[46], bQ[46]);
buf sQ47 (Q[47], bQ[47]);
buf sQ48 (Q[48], bQ[48]);
buf sQ49 (Q[49], bQ[49]);
buf sQ50 (Q[50], bQ[50]);
buf sQ51 (Q[51], bQ[51]);
buf sQ52 (Q[52], bQ[52]);
buf sQ53 (Q[53], bQ[53]);
buf sQ54 (Q[54], bQ[54]);
buf sQ55 (Q[55], bQ[55]);
buf sQ56 (Q[56], bQ[56]);
buf sQ57 (Q[57], bQ[57]);
buf sQ58 (Q[58], bQ[58]);
buf sQ59 (Q[59], bQ[59]);
buf sQ60 (Q[60], bQ[60]);
buf sQ61 (Q[61], bQ[61]);
buf sQ62 (Q[62], bQ[62]);
buf sQ63 (Q[63], bQ[63]);
buf sQ64 (Q[64], bQ[64]);
buf sQ65 (Q[65], bQ[65]);
buf sQ66 (Q[66], bQ[66]);
buf sQ67 (Q[67], bQ[67]);
buf sQ68 (Q[68], bQ[68]);
buf sQ69 (Q[69], bQ[69]);
buf sQ70 (Q[70], bQ[70]);
buf sQ71 (Q[71], bQ[71]);
buf sQ72 (Q[72], bQ[72]);
buf sQ73 (Q[73], bQ[73]);
buf sQ74 (Q[74], bQ[74]);
buf sQ75 (Q[75], bQ[75]);
buf sQ76 (Q[76], bQ[76]);
buf sQ77 (Q[77], bQ[77]);
buf sQ78 (Q[78], bQ[78]);
buf sQ79 (Q[79], bQ[79]);
buf sQ80 (Q[80], bQ[80]);
buf sQ81 (Q[81], bQ[81]);
buf sQ82 (Q[82], bQ[82]);
buf sQ83 (Q[83], bQ[83]);
buf sQ84 (Q[84], bQ[84]);
buf sQ85 (Q[85], bQ[85]);
buf sQ86 (Q[86], bQ[86]);
buf sQ87 (Q[87], bQ[87]);
buf sQ88 (Q[88], bQ[88]);
buf sQ89 (Q[89], bQ[89]);
buf sQ90 (Q[90], bQ[90]);
buf sQ91 (Q[91], bQ[91]);
buf sQ92 (Q[92], bQ[92]);
buf sQ93 (Q[93], bQ[93]);
buf sQ94 (Q[94], bQ[94]);
buf sQ95 (Q[95], bQ[95]);
buf sQ96 (Q[96], bQ[96]);
buf sQ97 (Q[97], bQ[97]);
buf sQ98 (Q[98], bQ[98]);
buf sQ99 (Q[99], bQ[99]);
buf sQ100 (Q[100], bQ[100]);
buf sQ101 (Q[101], bQ[101]);
buf sQ102 (Q[102], bQ[102]);
buf sQ103 (Q[103], bQ[103]);
buf sQ104 (Q[104], bQ[104]);
buf sQ105 (Q[105], bQ[105]);
buf sQ106 (Q[106], bQ[106]);
buf sQ107 (Q[107], bQ[107]);
buf sQ108 (Q[108], bQ[108]);
buf sQ109 (Q[109], bQ[109]);
buf sQ110 (Q[110], bQ[110]);
buf sQ111 (Q[111], bQ[111]);
buf sQ112 (Q[112], bQ[112]);
buf sQ113 (Q[113], bQ[113]);
buf sQ114 (Q[114], bQ[114]);
buf sQ115 (Q[115], bQ[115]);
buf sQ116 (Q[116], bQ[116]);
buf sQ117 (Q[117], bQ[117]);
buf sQ118 (Q[118], bQ[118]);
buf sQ119 (Q[119], bQ[119]);
buf sQ120 (Q[120], bQ[120]);
buf sQ121 (Q[121], bQ[121]);
buf sQ122 (Q[122], bQ[122]);
buf sQ123 (Q[123], bQ[123]);
buf sQ124 (Q[124], bQ[124]);
buf sQ125 (Q[125], bQ[125]);
buf sQ126 (Q[126], bQ[126]);
buf sQ127 (Q[127], bQ[127]);

// CLK CEB
buf sCEB (bCEB, CEB);
buf sCLK (bCLK, CLK);
buf sCS (CS, !CEB);

`ifdef TSMC_UNIT_DELAY
`else
specify
   specparam PATHPULSE$CLK$Q = ( 0, 0.001 );
specparam
    clkpl = 0.293,
    clkph = 0.293,
    clkp = 1.508,
    as = 0.148,
    ah = 0.000,
    cs = 0.124,
    ch = 0.000,
    clkq = 1.098,
    clkqh = 0.889;
//
  $width (negedge CLK, clkpl, 0, valid_a);
  $width (posedge CLK, clkph, 0, valid_a);

  $period (negedge CLK &&& CS, clkp, valid_a);
  $period (posedge CLK &&& CS, clkp, valid_a);
 
  $setuphold (posedge CLK, posedge CEB, cs, ch, valid_a);
  $setuphold (posedge CLK, negedge CEB, cs, ch, valid_a);
  $setuphold (posedge CLK &&& CS, posedge A[0], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, negedge A[0], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, posedge A[1], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, negedge A[1], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, posedge A[2], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, negedge A[2], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, posedge A[3], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, negedge A[3], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, posedge A[4], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, negedge A[4], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, posedge A[5], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, negedge A[5], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, posedge A[6], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, negedge A[6], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, posedge A[7], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, negedge A[7], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, posedge A[8], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, negedge A[8], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, posedge A[9], as, ah, valid_a);
  $setuphold (posedge CLK &&& CS, negedge A[9], as, ah, valid_a);

  (posedge CLK => (Q[0] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[1] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[2] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[3] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[4] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[5] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[6] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[7] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[8] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[9] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[10] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[11] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[12] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[13] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[14] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[15] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[16] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[17] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[18] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[19] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[20] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[21] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[22] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[23] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[24] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[25] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[26] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[27] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[28] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[29] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[30] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[31] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[32] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[33] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[34] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[35] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[36] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[37] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[38] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[39] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[40] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[41] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[42] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[43] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[44] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[45] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[46] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[47] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[48] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[49] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[50] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[51] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[52] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[53] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[54] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[55] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[56] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[57] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[58] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[59] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[60] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[61] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[62] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[63] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[64] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[65] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[66] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[67] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[68] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[69] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[70] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[71] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[72] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[73] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[74] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[75] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[76] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[77] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[78] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[79] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[80] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[81] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[82] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[83] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[84] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[85] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[86] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[87] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[88] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[89] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[90] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[91] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[92] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[93] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[94] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[95] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[96] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[97] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[98] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[99] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[100] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[101] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[102] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[103] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[104] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[105] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[106] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[107] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[108] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[109] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[110] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[111] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[112] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[113] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[114] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[115] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[116] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[117] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[118] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[119] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[120] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[121] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[122] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[123] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[124] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[125] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[126] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);
  (posedge CLK => (Q[127] +: 1'bx)) = (clkq,clkq,clkqh,clkq,clkqh,clkq);

endspecify
`endif

initial
begin
    $readmemh("/home/tensor_v1/project/B-CEDNet/src/soft_ip/building_blocks/TS3N45GSA768X128M8.rom.v",MX.mem,0,W-1);
    assign EN = 1;
end
 
`ifdef TSMC_NO_TESTPINS_WARNING
`else
always @(bCLK or bDELAY or bTEST)
   begin
   if ((bTEST !== 2'b00 || bDELAY !== 2'b00) && $realtime !=0)
          $display("\tError %m : Input DELAY and TEST should be set to 2'b00 at simulation time %.1f\n", $realtime);
   end
`endif

always @(bCLK)
   begin
      if (bCLK === 1'bx) 
      begin
     	if( MES_ALL=="ON" && $realtime != 0) $display("CLK Unknown >>");
	   AL = {M{1'bx}};
      end
   end
 
always @(posedge bCLK)
   if (bCLK === 1'b1) 
   begin
      if (bCEB === 1'b0) AL = bA;
      if (bCEB === 1'bx) AL = {M{1'bx}};
   end

always @(valid_a) AL = {M{1'bx}};
 
TS3N45GSA768X128M8_Int_RArray #(1,W,N,M,MES_ALL) MX (AL,EN,bQ);
 
endmodule
 
`disable_portfaults
`nosuppress_faults
`endcelldefine

/*
   The module ports are parameterizable vectors.
*/
 
module TS3N45GSA768X128M8_Int_RArray (AR,EN,Q);
parameter Nread = 1;   // Number of Read Ports
parameter Nword = 2;   // Number of Words
parameter Ndata = 1;   // Number of Data Bits / Word
parameter Naddr = 1;   // Number of Address Bits / Word
parameter MES_ALL = "ON";
parameter dly = 0.001;
// Cannot define inputs/outputs as memories
input  EN;                    // Positive Write Enable
input  [Naddr*Nread-1:0] AR;  // Read Address(es)
output [Ndata*Nread-1:0] Q;   // Output Data Word(s)
reg    [Ndata*Nread-1:0] Q;
reg [Ndata-1:0] mem [Nword-1:0];
reg chgmem;            // Toggled when write to mem
integer address;       // Current address
reg [Naddr-1:0] abuf;  // Address of current port
reg [Ndata-1:0] dbuf;  // Data for current port
integer log;           // Log file descriptor
integer ip, ip2, ib, iw, iwb; // Vector indices
 
initial
   begin
   $timeformat (-9, 2, " ns", 9);
   if (log[0] === 1'bx)
      log = 1;
   end
// Read memory
always @(AR)
   begin //{
   for (ip = 0 ; ip < Nread ; ip = ip + 1)
      begin //{
      iw = ip * Naddr;
      for (ib = 0 ; ib < Naddr ; ib = ib + 1)
         begin
         abuf[ib] = AR[iw+ib];
         if (abuf[ib] !== 0 && abuf[ib] !== 1)
            ib = Naddr;
         end
      iw = ip * Ndata;
      if (ib == Naddr && abuf < Nword)
         begin //{ Read valid address
         `ifdef TSMC_UNIT_DELAY
          #(`SRAM_DELAY);
      `endif
         dbuf = mem[abuf];
 
         for (ib = 0 ; ib < Ndata ; ib = ib + 1)
            begin
            if (Q[iw+ib] == dbuf[ib])
                Q[iw+ib] <= #(dly) dbuf[ib];
            else
                begin
                Q[iw+ib] <= dbuf[ib];
                Q[iw+ib] <= #(dly) dbuf[ib];
                end // else
            end // for
         end //} valid address
      else  
         begin //{ Invalid address
         if( MES_ALL=="ON" && $realtime != 0)
         $fwrite (log, "\nWarning! Int_RArray instance, %m:",
                       "\n\t Port %0d read address", ip);
         if (ib > Naddr)
         if( MES_ALL=="ON" && $realtime != 0)
            $fwrite (log, " unknown");
         else
         if( MES_ALL=="ON" && $realtime != 0)
            $fwrite (log, " x'%0h' out of range", abuf);
         if( MES_ALL=="ON" && $realtime != 0)
         $fdisplay (log,
                    " at time %t.", $realtime,
                    "\n\t Port %0d outputs set to unknown.", ip);
         for (ib = 0 ; ib < Ndata ; ib = ib + 1)
            Q[iw+ib] <= #(dly) 1'bx;
         end //} invalid address
      end //} for each read port ip
   end //} always @(AR)
 
 
// Task for displaying contents of a memory
task show;   //{ USAGE: inst.show (low, high);
   input [31:0] low, high;
   integer i;
   begin //{
   $display ("\n%m: Memory content dump");
   if (low < 0 || low > high || high >= Nword)
      $display ("Error! Invalid address range (%0d, %0d).", low, high,
                "\nUsage: %m (low, high);",
                "\n       where low >= 0 and high <= %0d.", Nword-1);
   else
      begin
      $display ("\n    Address\tValue");
      for (i = low ; i <= high ; i = i + 1)
         $display ("%d\t%b", i, mem[i]);
      end   
   end //}
endtask //}
 
endmodule

