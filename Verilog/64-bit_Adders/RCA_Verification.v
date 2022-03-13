`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2022 12:47:29 PM
// Design Name: 
// Module Name: RCA_Verification
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


module RCA_Verification(c_out, sum, a, b, c_in);
    
    input [3:0]	 a, b;
    input c_in;
    output  [3:0] sum;
    output c_out;
    
    assign {c_out, sum} = a + b + c_in;
    
endmodule
