`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2020 01:08:59 PM
// Design Name: 
// Module Name: lab_design_fulladder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab_design_fulladder(
    input a,
    input b,
    input c_in,
    output sum,
    output c_out
    );
    wire w1,w2,w3;
    
   lab_design_halfadder add_half_1(a, b,w1, w2);
   lab_design_halfadder add_half_2(w1, c_in,sum, w3);
   
    or or1 (c_out,w3,w2);
    
endmodule
