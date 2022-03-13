`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 01:31:30 PM
// Design Name: 
// Module Name: set_format
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


module set_format(
input [2:0] state,
input modeDisp,
output reg mode
    );
    
  always @(*)
    begin
        if(state == 3'b110)
        begin
        mode = modeDisp;
        end
    end
endmodule
