`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2020 03:04:00 PM
// Design Name: 
// Module Name: testbench_time
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


module testbench_time();

    reg CLK100MHZ = 0;
    reg [2:0] state;
    reg [5:0] inseconds; //6 bits to hold up to 59
    reg [5:0] inminutes; // 6 bits to hold up to 59
    reg [4:0] inhours; // 5 bits to hold up to 24
    wire [5:0] seconds; //6 bits to hold up to 59
    wire [5:0] minutes; // 6 bits to hold up to 59
    wire [4:0] hours; // 5 bits to hold up to 24
    
    time_counter d0(.CLK100MHZ(CLK100MHZ),.state(state),.inseconds(inseconds),.inminutes(inminutes),.inhours(inhours),.seconds(seconds),.minutes(minutes),.hours(hours));
    
    initial begin
    #10 state = 0;inseconds=0;inminutes=0;inhours=0; CLK100MHZ=1;
    end
    
    always #10 CLK100MHZ = ~CLK100MHZ;
endmodule
