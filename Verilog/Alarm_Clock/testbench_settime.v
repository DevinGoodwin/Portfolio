`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2020 02:03:50 PM
// Design Name: 
// Module Name: testbench_settime
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


module testbench_settime(
    );
    
reg[2:0] state;
reg nxt_but;
reg[5:0] in_time;
wire[5:0]seconds, minutes;
wire [4:0] hours;

set_time d0(.state(3'b010),.nxt_but(nxt_but),.in_time(in_time),.seconds(seconds),.minutes(minutes),.hours(hours));

initial begin
#10 nxt_but = 0; in_time = 6'b000000;
#10 in_time = 6'b000111;
#10 nxt_but = 1;
#10 nxt_but = 0;
#10 in_time = 6'b001000;
#10 nxt_but = 1;
#10 nxt_but = 0;
#10 in_time = 6'b001001;
end
 

endmodule
