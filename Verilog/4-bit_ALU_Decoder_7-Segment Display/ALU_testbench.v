`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 09:38:52 PM
// Design Name: 
// Module Name: ALU_testbench
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


module ALU_testbench(


    );
    
    reg[0:3] A,B;
    reg[0:2] Op;
    reg c_in,M; 
    
    wire[0:3] s;
    wire c_out;
    
    
    lab_design_ALU M1( A, B, c_in, Op, M, s, c_out);
    
    initial begin
    #100 $finish;
    end
    
    initial begin
    #10 M = 1;
    Op = 3'b101;
    A = 4'b1111;
    B = 4'b1111;
    c_in = 0;
    
    
    end     
     
endmodule
