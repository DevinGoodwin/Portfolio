`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 01:01:17 PM
// Design Name: 
// Module Name: seven_seg
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


module seven_segment(
    input modeDisp,
    input clk,
    input[1:0] H_MSB,
    input[3:0] H_LSB,M_MSB,M_LSB,S_MSB,S_LSB,
    output reg[6:0] hexnum,
    output reg[7:0] Anode_Activate,
    output reg PM
    );

    reg[19:0] refresh=0;
    reg[4:0] num;
    reg[4:0] H1,H2,M1,M2,S1,S2;
    wire[2:0] counter;

   
    always @(posedge clk )
    begin 
        if(refresh ==2000000)
            refresh <= 0;
        else
            refresh <= refresh + 1;
    end 
     assign counter = refresh[19:17];
    // anode activating signals for 4 LEDs, digit period of 2.6ms
    // decoder to generate anode signals 
    always @(*)
    begin
    PM=0;
    if(modeDisp == 1)
    begin
    if(H_MSB >= 2'b10 || (H_MSB == 2'b10 && H_LSB >= 4'b0011))
        PM = 1;
        else
        PM = 0;
    end
    
        case(counter)

          3'b000: begin
            Anode_Activate = 8'b01111111;
            if(modeDisp==1'b0)
                begin
                num = H1;
                end
            else
            begin
                if(H1==2'b10 && H2==4'b0100)
                  num = 5'b00001;
                else if(H1==2'b10 && H2==4'b0011)
                  num = 5'b00001;
                else if(H1==2'b10 && H2==4'b0010)
                  num = 5'b00001;
                else if(H1==2'b10 && H2==4'b0001)
                  num = 5'b00000;
                else if(H1==2'b10 && H2==4'b0000)
                  num = 5'b00000;
                  //10
                else if(H1==2'b01 && H2==4'b1001)
                  num = 5'b00000;
                else if(H1==2'b01 && H2==4'b1000)
                  num = 5'b00110;
                else if(H1==2'b01 && H2==4'b0111)
                  num = 5'b00000;
                else if(H1==2'b01 && H2==4'b0110)
                  num = 5'b00000;
                else if(H1==2'b01 && H2==4'b0101)
                  num = 5'b00000;
                else if(H1==2'b01 && H2==4'b0100)
                  num = 5'b00000;
                else if(H1==2'b01 && H2==4'b0011)
                  num = 5'b00000;
                else
                    num = H1;
                end
            end
               
        3'b001: begin
          Anode_Activate = 8'b10111111;
          
              if(modeDisp==1'b0)
                 begin
            num = H2;
            end
            else
            begin
                if(H1==2'b10 && H2==4'b0100)
                  num =5'b00010;
                else if(H1==2'b10 && H2==4'b0011)
                  num = 5'b00001;
                else if(H1==2'b10 && H2==4'b0010)
                  num = 5'b00000;
                else if(H1==2'b10 && H2==4'b0001)
                  num = 5'b01001;
                else if(H1==2'b10 && H2==4'b0000)
                  num = 5'b01000;
                  //10
                else if(H1==2'b01 && H2==4'b1001)
                  num = 5'b00111;
                else if(H1==2'b01 && H2==4'b1000)
                  num = 5'b00110;
                else if(H1==2'b01 && H2==4'b0111)
                  num = 5'b00101;
                else if(H1==2'b01 && H2==4'b0110)
                  num = 5'b00100;
                else if(H1==2'b01 && H2==4'b0101)
                  num = 5'b00011;
                else if(H1==2'b01 && H2==4'b0100)
                  num = 5'b00010;
                else if(H1==2'b01 && H2==4'b0011)
                  num = 5'b00001;
                else
                    num = H2;
                end
              end
         
        3'b010: begin
            Anode_Activate = 8'b11011111; 
       
            num = 5'b10000;
              
              end
        3'b011: begin
           Anode_Activate = 8'b11101111; 
            // activate LED1 and Deactivate the rest
            num = M1;
          
            // the third digit of the 16-bit number
                end
                
        3'b100: begin
           Anode_Activate = 8'b11110111; 
            // activate LED1 and Deactivate the rest
            num = M2;
          
            // the third digit of the 16-bit number
                end
                
        3'b101: begin
           Anode_Activate = 8'b11111011; 
            // activate LED1 and Deactivate the rest
            num = 5'b10000;
          
            // the third digit of the 16-bit number
                end
                
        3'b110: begin
           Anode_Activate = 8'b11111101; 
            // activate LED1 and Deactivate the rest
            num = S1;
          
            // the third digit of the 16-bit number
                end
                
        3'b111: begin
           Anode_Activate = 8'b11111110; 
            // activate LED1 and Deactivate the rest
            num = S2;
          
            // the third digit of the 16-bit number
                end
        default: begin
        hexnum = 7'b0000001;
        end                                                      
        endcase
        
       end

    always @(*)
    begin
    case (H_MSB)
       2'b00 : H1 <= 5'b00000;
       2'b01 : H1 <= 5'b00001;
       2'b10 : H1 <= 5'b00010;
       default: H1 <= 5'b00000;
    endcase
    
    case(H_LSB)
       4'b0000 : H2 <= 5'b00000;
       4'b0001 : H2 <= 5'b00001;
       4'b0010 : H2 <= 5'b00010;
       4'b0011 : H2 <= 5'b00011;
       4'b0100 : H2 <= 5'b00100;
       4'b0101 : H2 <= 5'b00101;
       4'b0110 : H2 <= 5'b00110;
       4'b0111 : H2 <= 5'b00111;
       4'b1000 : H2 <= 5'b01000;
       4'b1001 : H2 <= 5'b01001;
       default: H2 <= 5'b00000;
     endcase
     
     case(M_MSB)
       4'b0000 : M1 <= 5'b00000;
       4'b0001 : M1 <= 5'b00001;
       4'b0010 : M1 <= 5'b00010;
       4'b0011 : M1 <= 5'b00011;
       4'b0100 : M1 <= 5'b00100;
       4'b0101 : M1 <= 5'b00101;
       default: M1 <= 5'b00000;
     endcase
     
      case(M_LSB)
       4'b0000 : M2 <= 5'b00000;
       4'b0001 : M2 <= 5'b00001;
       4'b0010 : M2 <= 5'b00010;
       4'b0011 : M2 <= 5'b00011;
       4'b0100 : M2 <= 5'b00100;
       4'b0101 : M2 <= 5'b00101;
       4'b0110 : M2 <= 5'b00110;
       4'b0111 : M2 <= 5'b00111;
       4'b1000 : M2 <= 5'b01000;
       4'b1001 : M2 <= 5'b01001;
       default: M2 <= 5'b00000;
     endcase
 
case(S_MSB)
       4'b0000 : S1 <= 5'b00000;
       4'b0001 : S1 <= 5'b00001;
       4'b0010 : S1 <= 5'b00010;
       4'b0011 : S1 <= 5'b00011;
       4'b0100 : S1 <= 5'b00100;
       4'b0101 : S1 <= 5'b00101;
       default: S1 <= 5'b00000;
     endcase
     
      case(S_LSB)
       4'b0000 : S2 <= 5'b00000;
       4'b0001 : S2 <= 5'b00001;
       4'b0010 : S2 <= 5'b00010;
       4'b0011 : S2 <= 5'b00011;
       4'b0100 : S2 <= 5'b00100;
       4'b0101 : S2 <= 5'b00101;
       4'b0110 : S2 <= 5'b00110;
       4'b0111 : S2 <= 5'b00111;
       4'b1000 : S2 <= 5'b01000;
       4'b1001 : S2 <= 5'b01001;
       default: S2 <= 5'b00000;
     endcase 
     
        case (num)
       5'b00000 : hexnum <= 7'h01;  
       5'b00001 : hexnum <= 7'h4F;
       5'b00010 : hexnum <= 7'h12;
       5'b00011 : hexnum <= 7'h06;
       5'b00100 : hexnum <= 7'h4C;          
       5'b00101 : hexnum <= 7'h24;
       5'b00110 : hexnum <= 7'h20;
       5'b00111 : hexnum <= 7'h0F;
       5'b01000 : hexnum <= 7'h00;
       5'b01001 : hexnum <= 7'h04;
       5'b01010 : hexnum <= 7'h08; // 0001000
       5'b01011 : hexnum <= 7'h60; //1100000
       5'b01100 : hexnum <= 7'h31; //0110001
       5'b01101 : hexnum <= 7'h42; //1000010
       5'b01110 : hexnum <= 7'h30; //0110000
       5'b01111 : hexnum <= 7'h38; //0111000
       5'b10000 : hexnum <= 7'h7F; // Blank
        
        
        endcase
    end
    
//    assign A = ~hexnum[6];
//    assign B = ~hexnum[5];
//    assign C = ~hexnum[4];
//    assign D = ~hexnum[3];
//    assign E = ~hexnum[2];
//    assign F = ~hexnum[1];
//    assign G = ~hexnum[0];
    
endmodule
