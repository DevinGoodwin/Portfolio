`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 04:31:45 PM
// Design Name: 
// Module Name: lab_design_calculator
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


module lab_design_calculator( 
    input clock_100Mhz, 
    input reset, 
    input[3:0] X,Y,M,
    input Control,
    output reg [7:0] Anode_Activate,
    output reg [6:0] LED_out
    );
    
    wire c_out;
    wire [3:0] s,A,B,Op;
    
   
   lab_design_decoder decoder(X,Y,M,s,c_out,Control,Anode_Activate,LED_out,A,B,Op,c_out);
   lab_design_ALU ALU(A,B,M[1:3],M[0],s,c_out);
    
endmodule
