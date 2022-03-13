`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 06:45:59 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(

    input [3:0] A,
    input [3:0] B,
    input C0,
    output [3:0] output1,
    output cout
   
);
    
    wire [3:0] inputB;
    wire carry1, carry2, carry3, carry4;
    
    FA_str bit1(.a(A[0]), .b(B[0]), .c_in(C0), .c_out(carry1), .sum(output1[0]));
    FA_str bit2(.a(A[1]), .b(B[1]), .c_in(carry1), .c_out(carry2), .sum(output1[1]));
    FA_str bit3(.a(A[2]), .b(B[2]), .c_in(carry2), .c_out(carry3), .sum(output1[2]));
    FA_str bit4(.a(A[3]), .b(B[3]), .c_in(carry3), .c_out(carry4), .sum(output1[3]));
    
    assign cout = carry4;
    
    
endmodule
