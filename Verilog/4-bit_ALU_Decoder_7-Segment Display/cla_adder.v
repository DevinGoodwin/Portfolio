`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2020 01:17:24 PM
// Design Name: 
// Module Name: cla_adder
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


module cla_adder(   input [3:0] A,B,
            input cin,
            output [3:0] S,
            output cout
            );
            
wire [3:0] P,G;
wire [4:0] C;   
    
//first level
assign P = A ^ B;
assign G = A & B;

//second level
block gen_c(P,G,cin,C);

//third level
assign S = P ^ C[3:0];
assign cout = C[4];

endmodule
