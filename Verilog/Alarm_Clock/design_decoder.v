`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2020 08:37:03 PM
// Design Name: 
// Module Name: design_decoder
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


module design_decoder(
    input[2:0] state,
    input[5:0] seconds, //6 bits to hold up to 59
    input[5:0] minutes, // 6 bits to hold up to 59
    input[4:0] hours, // 5 bits to hold up to 24
    input[5:0] s_seconds, //6 bits to hold up to 59
    input[5:0] s_minutes, // 6 bits to hold up to 59
    input[4:0] s_hours, // 5 bits to hold up to 24
    input[5:0] a_seconds, //6 bits to hold up to 59
    input[5:0] a_minutes, // 6 bits to hold up to 59
    input[4:0] a_hours, // 5 bits to hold up to 24
    output [1:0]  H_MSB, 
    output [3:0]  H_LSB, 
    output [3:0]  M_MSB, 
    output [3:0]  M_LSB, 
    output [3:0]  S_MSB, 
    output [3:0]  S_LSB 
    );
    
 reg [1:0] c_hour1 = 2'b00; 
/* The most significant hour digit of the temp clock and alarm. */ 
 reg [3:0] c_hour0 = 4'b0000;
/* The least significant hour digit of the temp clock and alarm. */ 
 reg [3:0] c_min1= 4'b0000;
/* The most significant minute digit of the temp clock and alarm.*/ 
 reg [3:0] c_min0= 4'b0000;
/* The least significant minute digit of the temp clock and alarm.*/ 
 reg [3:0] c_sec1= 4'b0000;
/* The most significant second digit of the temp clock and alarm.*/ 
 reg [3:0] c_sec0= 4'b0000 ;
/* The least significant minute digit of the temp clock and alarm.*/ 

 function [3:0] mod_10;
 input [5:0] number;
 begin
 mod_10 = (number >=50) ? 5 : ((number >= 40)? 4 :((number >= 30)? 3 :((number >= 20)? 2 :((number >= 10)? 1 :0))));
 end
 endfunction

always @(*) begin
 if (state == 3'b000||3'b110)
 begin
 if(hours>=20) begin
 c_hour1 = 2;
 end
 else begin
 if(hours >=10) 
 c_hour1  = 1;
 else
 c_hour1 = 0;
 end
 c_hour0 = hours - c_hour1*10; 
 c_min1 = mod_10(minutes); 
 c_min0 = minutes - c_min1*10;
 c_sec1 = mod_10(seconds);
 c_sec0 = seconds - c_sec1*10;
 end
 
 else if(state==3'b010)
 begin
// #10 c_hour1 =2;
// #10 c_hour0 =2;
// #10  c_min1 = 1;
  if(s_hours>=20) begin
 c_hour1 = 2;
 end
 else begin
 if(s_hours >=10) 
 c_hour1  = 1;
 else
 c_hour1 = 0;
 end
 c_hour0 = s_hours - c_hour1*10; 
 c_min1 = mod_10(s_minutes); 
 c_min0 = s_minutes - c_min1*10;
 c_sec1 = mod_10(s_seconds);
 c_sec0 = s_seconds - c_sec1*10;
 end
 
  else if(state==3'b100)
 begin
  if(a_hours>=20) begin
 c_hour1 = 2;
 end
 else begin
 if(a_hours >=10) 
 c_hour1  = 1;
 else
 c_hour1 = 0;
 end
 c_hour0 = a_hours - c_hour1*10; 
 c_min1 = mod_10(a_minutes); 
 c_min0 = a_minutes - c_min1*10;
 c_sec1 = mod_10(a_seconds);
 c_sec0 = a_seconds - c_sec1*10;
 end
 end

 
 assign H_MSB = c_hour1; // the most significant hour digit of the clock
 assign H_LSB = c_hour0; // the least significant hour digit of the clock
 assign M_MSB = c_min1;  // the most significant minute digit of the clock
 assign M_LSB = c_min0;  // the least significant minute digit of the clock
 assign S_MSB = c_sec1;  // the most significant second digit of the clock
 assign S_LSB = c_sec0;  // the least significant second digit of the clock

endmodule
