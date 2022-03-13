`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 10:07:12 PM
// Design Name: 
// Module Name: sixtyfour_bit_adder
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


module sixtyfour_bit_adder(

    input [63:0] A,
    input [63:0] B,
    input c0,
    output [63:0] output1,
    output cout,
    output [31:0] t1,
    output [31:0] t2
    
    );
    
    wire [31:0] i1, i2, j1, j2, o1, o2;
    wire c1;
    
    assign i1 = A[31:0];
    assign i2 = A[63:32];
    assign j1 = B[31:0];
    assign j2 = B[63:32];
    
    
    thirtytwo_bit_adder g1(.A(i1), .B(j1), .c0(c0), .output1(o1), .cout(c1));
    thirtytwo_bit_adder g2(.A(i2), .B(j2), .c0(c1), .output1(o2), .cout(cout));
     
    assign output1[31:0] = o1;
    assign output1[63:32] = o2;
    
    assign t1 = o1;
    assign t2 = o2;
    
    
    
    
endmodule