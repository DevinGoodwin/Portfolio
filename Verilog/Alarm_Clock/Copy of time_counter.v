`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2020 04:09:43 PM
// Design Name: 
// Module Name: time_counter
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


module time_counter(
    input CLK100MHZ,
    input [2:0] state,
    input [5:0] inseconds, //6 bits to hold up to 59
    input [5:0] inminutes, // 6 bits to hold up to 59
    input [4:0] inhours, // 5 bits to hold up to 24
    output  reg[5:0] seconds, //6 bits to hold up to 59
    output  reg[5:0] minutes, // 6 bits to hold up to 59
    output  reg[4:0] hours // 5 bits to hold up to 24
    );
    
    reg [26:0] count = 0; //27 bits to count up to 100 million
    
    initial begin
        seconds = 0;
        minutes = 0;
        hours = 0;
    end
    
    always @ (posedge CLK100MHZ)
    begin
    count = count + 1;
    //State for setting the time is 01, so if this is the current statem set the regs
        if(state == 2'b010)
        begin
            seconds = inseconds;
            minutes = inminutes;
            hours = inhours;
        end 
        else begin
            if(count >= 100000000) // If count == 100 million, then reset count+increment seconds
            begin
                count <= 0;
                seconds <= seconds + 1;
            end
            if(hours == 24 && minutes == 60 && seconds == 60) 
            // Once there reaches 23:59:59 hours, then reset back to 0
            begin
                hours <= 0;
                minutes <= 0;
                seconds <= 0;
            end
            else if(minutes == 60 && seconds == 60) 
            // If there have been 59 minutes , 59 seconds , then reset minutes and increment hour
            begin 
                minutes <= 0;
                seconds <= 0;
                hours <= hours +1;
            end
            else if(seconds == 60) 
            // If there have been 59 seconds then reset seconds and increment minutes
            begin    
                seconds <= 0;
                minutes <= minutes +1;
            end
        end
    end
    
endmodule
