`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2020 01:49:25 PM
// Design Name: 
// Module Name: State_Diagram
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


module State_Diagram(clk, rst, inp, outp
    );
    
   input clk, rst, inp;
   output reg [2:0] outp;
   
   reg [2:0] state = 3'b000;
   
   // 000 Time Clock
   // 001 Wait state1
   // 010 Set time
   // 011 Wait state2
   // 100 Set alarm
   // 101 Wait state3
   // 110 Set time format 
   // 111 Wait state4
   // 000 Time Clock
   
   always @(posedge clk, posedge rst)    // Changed to (*) for testbench 
   begin
    if( rst )
       state <= 3'b000;
   else
   begin
       case( state )
       3'b000: //Time Clock
       begin
            if( inp ) state <= 3'b001;
            else state <= 3'b000;
       end

       3'b001: // 001 Wait state1
       begin
            if( inp==1'b0 ) state <= 3'b010;
            else state <= 3'b001;
       end

       3'b010: // 010 Set time
       begin
            if( inp ) state <= 3'b011;
            else state <= 3'b010;
       end

       3'b011: // 011 Wait state2
       begin
            if(inp==1'b0) state <= 3'b100;
            else state <= 2'b011;
       end
       
       3'b100: // 100 Set alarm
       begin
            if(inp) state <= 3'b101;
            else state <= 3'b100;
       end 
           
       3'b101: // 101 Wait state3
       begin
            if(inp==1'b0) state <= 3'b110;
            else state <= 3'b101;
       end
       
       3'b110: // 110 Set time format
       begin
            if(inp) state <= 3'b111;
            else state <= 3'b110;
       end
       
       3'b111: // 111 Wait state4
       begin
            if(inp==1'b0) state <= 3'b000;
            else state <= 3'b111;
       end      
       
       endcase
   end
end
     
  always @(*)
  begin 
  
  outp = state;
  
  end 
  
endmodule
