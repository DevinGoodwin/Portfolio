`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 07:51:16 PM
// Design Name: 
// Module Name: eight_bit_adder
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


module eight_bit_adder(
    
    input [7:0] A,
    input [7:0] B,
    input c0,
    output [7:0] output1,
    output cout,
    output [3:0] t1,
    output [3:0] t2
    );
    
    wire [3:0] i1, i2, j1, j2, o1, o2; //i is for 4 bit blocks of A, j is for 4 bit blocks of B o is 4 bit blocks of output
    wire c1; //the carryout of block 1 and 2
    
    
    assign i1 = A[3:0];
    assign j1 = B[3:0];
    assign i2 = A[7:4];
    assign j2 = B[7:4];
    
    full_adder g1(.A(i1), .B(j1), .C0(c0), .output1(o1), .cout(c1));
    full_adder g2(.A(i2), .B(j2), .C0(c1), .output1(o2), .cout(cout));
    
    assign output1[3:0] = o1[3:0];
    assign output1[7:4] = o2[3:0];

    assign t1 = o1;
    assign t2 = o2;
   
    
    
endmodule
