`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2020 10:06:51 PM
// Design Name: 
// Module Name: lab_testbench_decoder1
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


module lab_testbench_decoder1(

    );
    reg clock_100Mhz;
    reg reset; 
    reg[3:0] X,Y,M,s;
    reg c_in;
    reg Control; 
    
    wire [7:0]Anode_Activate; 
    wire [6:0]LED_out;
    wire [3:0]A,B,Op;
    
    
    lab_design_decoder M1( clock_100Mhz, reset, X, Y, M, s, c_in,Control,Anode_Activate,LED_out,A,B,Op);
    
    initial begin
    #100 $finish;
    end
    
    initial begin
    
    
    end     
endmodule
