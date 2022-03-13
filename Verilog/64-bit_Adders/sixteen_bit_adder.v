`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 08:28:20 PM
// Design Name: 
// Module Name: sixteen_bit_adder
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


module sixteen_bit_adder(
    input [15:0] A,
    input [15:0] B,
    input c0,
    output [15:0] output1,
    output cout,
    output [7:0] t1,
    output [7:0] t2
    
    );
    
    wire [7:0] i1, i2, j1, j2, o1, o2;
    wire c1;
    
    assign i1 = A[7:0];
    assign i2 = A[15:8];
    assign j1 = B[7:0];
    assign j2 = B[15:8];
    
    
    eight_bit_adder g1(.A(i1), .B(j1), .c0(c0), .output1(o1), .cout(c1));
    eight_bit_adder g2(.A(i2), .B(j2), .c0(c1), .output1(o2), .cout(cout));
     
    assign output1[7:0] = o1[7:0];
    assign output1[15:8] = o2[7:0];
    
    assign t1 = o1;
    assign t2 = o2;
    
    
    
    
endmodule
