`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2020 03:17:37 PM
// Design Name: 
// Module Name: design_time_and_set
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


module design_time_and_set(
input reset,
input st_but,
input nxt_but,
input[5:0] in_time,
input CLK100MHZ,
input m,

output[6:0] segment,
output[7:0] ss_digit,
output PM,
output reg LED,
output reg[2:0] state_LED
    );
    wire [5:0] set_sec,set_min;
    wire [4:0] set_hour;
    
    wire [5:0] sec,min;
    wire [4:0] hour;

    
    wire[1:0]H1;
    wire[3:0]H0,M1,M0,S1,S0;
    
    wire[2:0] state;
    
    wire[5:0] a_sec, a_min;
    wire[4:0] a_hour;
    wire mode;
    
    State_Diagram d0(.clk(CLK100MHZ), .rst(reset), .inp(st_but),.outp(state));
    
    set_time d1(.state(state),.nxt_but(nxt_but),.in_time(in_time),.seconds(set_sec),.minutes(set_min),.hours(set_hour));
    time_counter d2(.CLK100MHZ(CLK100MHZ),.state(state), .inseconds(set_sec), .inminutes(set_min), .inhours(set_hour),.seconds(sec),.minutes(min),.hours(hour));
    
    set_alarm d3(.state(state),.nxt_but(nxt_but), .in_time(in_time), .a_seconds(a_sec),.a_minutes(a_min),.a_hours(a_hour));
    set_format d4(.state(state),.modeDisp(m),.mode(mode));
    
    design_decoder d5(.state(state),.seconds(sec),.minutes(min),.hours(hour),.s_seconds(set_sec),.s_minutes(set_min),.s_hours(set_hour),.a_seconds(a_sec),.a_minutes(a_min),.a_hours(a_hour),.H_MSB(H1), .H_LSB(H0), .M_MSB(M1), .M_LSB(M0), .S_MSB(S1), .S_LSB(S0));
    seven_segment d6(.modeDisp(mode), .clk(CLK100MHZ), .H_MSB(H1), .H_LSB(H0), .M_MSB(M1), .M_LSB(M0), .S_MSB(S1), .S_LSB(S0), .hexnum(segment), .Anode_Activate(ss_digit),.PM(PM));
    
    
    initial begin
    LED = 0;
    end
    
    always @ (*)
    begin
    state_LED = state;
    if(a_hour==hour&&a_min==min&&a_sec==sec)
    begin
        #10 LED = ~LED;
    end
end


endmodule
