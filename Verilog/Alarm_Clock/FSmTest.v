`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 12:22:45 PM
// Design Name: 
// Module Name: FSmTest
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


module FSmTest();
    
reg clk, rst;
reg inp;
wire [2:0] outp;

 
State_Diagram M1(clk,rst,inp,outp);

initial begin
#100 $finish;
end
 
initial begin  

#10 inp = 0; clk = 1;

#10 inp = 1; clk = 1;
 
#10 inp = 0; clk = 1;

#10 inp = 1; clk = 1;

#10 inp = 0; clk = 1;

#10 inp = 1; clk = 1;

#10 inp = 0; clk = 1;

#10 inp = 1; clk = 1;

#10 inp = 0; clk = 1;
end
endmodule
