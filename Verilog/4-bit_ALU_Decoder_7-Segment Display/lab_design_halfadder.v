`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2020 12:36:48 PM
// Design Name: 
// Module Name: lab_design_halfadder
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


module lab_design_halfadder(a,b,sum,c_out
    );
    
    input a,b;
    output sum,c_out;

xor xor1 (sum,a,b);
and and1 (c_out,a,b);
    
endmodule
