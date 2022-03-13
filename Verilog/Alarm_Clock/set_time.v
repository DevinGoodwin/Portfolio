`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 01:08:39 PM
// Design Name: 
// Module Name: set_time
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


module set_time(
input[2:0] state,
input nxt_but,
input[5:0] in_time,
output reg[5:0]seconds, minutes,
output reg[4:0] hours
    );
    reg[1:0] change;
    initial begin
    change = 2'b00;
    end
    
  always @(*) begin
    if(state == 3'b010)
        begin
        if(nxt_but)
            change = change+1;
        
        case(change)
        2'b00:
            hours = in_time;
        2'b01:
            minutes = in_time;
        2'b10:
            seconds = in_time;
        endcase
        end
   end
endmodule
