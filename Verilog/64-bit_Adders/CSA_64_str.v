`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2022 02:47:16 PM
// Design Name: 
// Module Name: CSA_64_str
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


module CSA_64_str(
    input [63:0] a, b,
    input c_in,
    output  [63:0] s,
    output   c_out
    );
    
    wire [2:0] carry;
    wire [31:0] sA,sB; 
    wire [31:0] o1,o2;
    
    //first RCA
    thirtytwo_bit_adder RPC32_1(.cout(carry[0]), .output1(s[31:0]), .A(a[31:0]), .B(b[31:0]), .c0(c_in));
   
    //Select RCAs
    thirtytwo_bit_adder RPC32_2a(.cout(carry[1]), .output1(sA[31:0]), .A(a[63:32]), .B(b[63:32]), .c0(1'b0));
    thirtytwo_bit_adder RPC32_2b(.cout(carry[2]), .output1(sB[31:0]), .A(a[63:32]), .B(b[63:32]), .c0(1'b1));

    assign s[63:32] = carry[0]==1'b0 ? sA : sB;
    assign c_out = carry[0] == 1'b0 ? carry[1] : carry[2];
    
endmodule
