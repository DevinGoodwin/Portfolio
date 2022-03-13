`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2020 02:19:39 PM
// Design Name: 
// Module Name: set_alarm
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


module set_alarm(
input[2:0] state,
input nxt_but,
input[5:0] in_time,
output reg[5:0]a_seconds, a_minutes,
output reg[4:0] a_hours
    );
    reg[1:0] change;
    initial begin
    change = 2'b00;
    end
    
  always @(*) begin
    if(state == 3'b110)
        begin
        if(nxt_but)
            change = change+1;
        
        case(change)
        2'b00:
            a_hours = in_time;
        2'b01:
            a_minutes = in_time;
        2'b10:
            a_seconds = in_time;
        endcase
        end
   end
endmodule
