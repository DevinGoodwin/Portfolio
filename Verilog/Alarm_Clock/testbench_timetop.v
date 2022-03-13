`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2020 05:26:54 PM
// Design Name: 
// Module Name: testbench_timetop
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


module testbench_timetop(
    );
    
reg reset;
reg st_but;
reg nxt_but;
reg[5:0] in_time;
reg CLK100MHZ;
reg m;
wire[6:0] segment;
wire[7:0] ss_digit;
wire PM;
wire LED;
wire [2:0] state_LED;

design_time_and_set d0(.reset(reset),.st_but(st_but),.nxt_but(nxt_but),.in_time(in_time),.CLK100MHZ(CLK100MHZ),.m(m),.segment(segment),.ss_digit(ss_digit),.PM(PM),.LED(LED),.state_LED(state_LED));

initial begin
reset = 0; st_but=0;nxt_but=0;in_time=0; CLK100MHZ=0; m=0;
#20 st_but = 1;
#20 st_but = 0;
#20 in_time = 5'b10111;
#20 st_but = 1;in_time=0;
#20 st_but = 0;
#20 st_but = 1;
#20 st_but = 0;
#10 m =1; 
#20 st_but = 1;
#20 st_but = 0;
end

always #10 CLK100MHZ = ~CLK100MHZ;
endmodule