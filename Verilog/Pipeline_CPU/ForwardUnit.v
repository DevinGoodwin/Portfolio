`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 06:27:24 PM
// Design Name: 
// Module Name: ForwardUnit
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


module ForwardUnit(IDEX_Rs,IDEX_Rt, MemDest, WriteBackDest,oneAheadSrcA,oneAheadSrcB,twoAheadSrcA,twoAheadSrcB);

    input [4:0] IDEX_Rs, IDEX_Rt, MemDest, WriteBackDest; //register destinations and Rs and Rt
    
    output reg oneAheadSrcA,oneAheadSrcB,twoAheadSrcA,twoAheadSrcB;
    
   always @(*)
    begin
        oneAheadSrcA <= 1'b0;
        oneAheadSrcB <= 1'b0;
        twoAheadSrcA <= 1'b0;
        twoAheadSrcB <= 1'b0;
    


       if(IDEX_Rs == WriteBackDest)
       twoAheadSrcA <= 1'b1;
       if(IDEX_Rt == WriteBackDest)
       twoAheadSrcB <= 1'b1;
       if((IDEX_Rs == MemDest) && !(IDEX_Rs == WriteBackDest))
       oneAheadSrcA <= 1'b1;
       if((IDEX_Rt == MemDest) && !(IDEX_Rt == WriteBackDest))
       oneAheadSrcB <= 1'b1;
     
     end

endmodule
