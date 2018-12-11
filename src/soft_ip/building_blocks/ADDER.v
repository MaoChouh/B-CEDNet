`include "../../src/soft_ip/include/includes.vh"
`include "../../src/soft_ip/include/util.vh"
/*
    Copyright
    All right reserved.
    Module Name: ADDER
    Author  : Zichuan Liu, Yixing Li and Wenye Liu.
    Description: 
*/


module ADDER(
    inst_INPUT,
    OUT0_inst, 
    OUT1_inst
    );
    
    
    parameter N_INPUTS = 8;
    parameter INPUT_WIDTH = 8;
    parameter VERIF_EN = 1; // value 1 is a more aggressive verification
                            // mode
    
    input [N_INPUTS*INPUT_WIDTH-1 : 0] inst_INPUT;
    output [INPUT_WIDTH-1 : 0] OUT0_inst;
    output [INPUT_WIDTH-1 : 0] OUT1_inst;
    
    // Instance of DW02_tree
//    DW02_tree #(N_INPUTS, INPUT_WIDTH, VERIF_EN)
//      U1 ( .INPUT(inst_INPUT), .OUT0(OUT0_inst), .OUT1(OUT1_inst) );
endmodule
