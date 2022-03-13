`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2020 08:37:45 PM
// Design Name: 
// Module Name: lab_design_7segment
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


module lab_design_7segment(
   input clock_100Mhz, // 100 Mhz clock source on Basys 3 FPGA
    input reset, // reset
    input[3:0] X,Y,M,
    input c_in,
    input Control,
    output reg [7:0] Anode_Activate, // anode signals of the 7-segment LED display
    output reg [6:0] LED_out// cathode patterns of the 7-segment LED display
    );
    reg [26:0] one_second_counter; // counter for generating 1 second clock enable
    wire one_second_enable;// one second enable for counting numbers
    reg [15:0] displayed_number; // counting number to be displayed
    reg [3:0] LED_BCD;
    reg [19:0] refresh_counter; // 20-bit for creating 10.5ms refresh period or 380Hz refresh rate
             // the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms digit period
    wire [3:0] LED_activating_counter; 
                 // count     0    ->  1  ->  2  ->  3
              // activates    LED1    LED2   LED3   LED4
             // and repeat
     reg [3:0] s = 4'b0000;
     
    always @(posedge clock_100Mhz or posedge reset)
    begin
        if(reset==1)
            one_second_counter <= 0;
        else begin
            if(one_second_counter>=99999999) 
                 one_second_counter <= 0;
            else
                one_second_counter <= one_second_counter + 1;
        end
    end 
    assign one_second_enable = (one_second_counter==99999999)?1:0;
    always @(posedge clock_100Mhz or posedge reset)
    begin
        if(reset==1)
            displayed_number <= 0;
        else if(one_second_enable==1)
            displayed_number <= displayed_number + 1;
    end
    always @(posedge clock_100Mhz or posedge reset)
    begin 
        if(reset==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end 
    assign LED_activating_counter = refresh_counter[19:18];
    // anode activating signals for 4 LEDs, digit period of 2.6ms
    // decoder to generate anode signals 
    always @(*)
    begin
        case(LED_activating_counter)
        3'b000: begin
            Anode_Activate = 8'b10000000; 
            // activate LED1 and Deactivate LED2, LED3, LED4
            LED_BCD = 4'b0000;
            // the first digit of the 16-bit number
              end
        3'b001: begin
            Anode_Activate = 8'b01000000; 
            // activate LED1 and Deactivate LED2, LED3, LED4
            LED_BCD = 4'b0000;
            // the first digit of the 16-bit number
              end
        3'b010: begin
            Anode_Activate = 8'b00100000; 
            // activate LED1 and Deactivate LED2, LED3, LED4
            LED_BCD = 4'b0000;
            // the first digit of the 16-bit number
              end
        3'b011: begin
            Anode_Activate = 8'b00010000; 
            // activate LED1 and Deactivate LED2, LED3, LED4
            LED_BCD = 4'b0000;
            // the first digit of the 16-bit number
              end
        3'b100: begin
            Anode_Activate = 8'b00001000; 
             if(Control==0)
             begin
              LED_BCD = 4'b0000;
              end
              else
              begin
              case (M)
        4'b0000,4'b0001,4'b0010,4'b0011,4'b0100,4'b0101, 4'b0110, 4'b0111 : 
                 case(s)
                    4'b1000,4'b1001,4'b1011,4'b1100,4'b1101,4'b1110,4'b1111:
                    begin 
                        LED_BCD = 4'b0001;
                    end
         default:
                  LED_BCD = 4'b0000;
                    endcase
          default:
                  LED_BCD = 4'b0000;
                  endcase
              end 
            end  
        3'b101: begin
            Anode_Activate = 8'b00000100; 
             if(Control==0)
             begin
                LED_BCD = M;
             end
             else
              begin
              case (M)
        4'b0000,4'b0001,4'b0010,4'b0011,4'b0100,4'b0101, 4'b0110, 4'b0111 : 
                 case(s)
                    4'b0100,4'b0101,4'b0110,4'b0111,4'b1100,4'b1101,4'b1110,4'b1111:
                    begin 
                        LED_BCD = 4'b0001;
                    end
          default:
                  LED_BCD = 4'b0000;
                  endcase
         4'b1000,4'b1001:
            LED_out = 8'b00000001;
            default:
             LED_BCD = 4'b0000;
             endcase
              end 
              end
        3'b110: begin
            Anode_Activate = 8'b00000010; 
             if(Control==0)
             begin
              LED_BCD = X;
              end
            else
              begin
              case (M)
        4'b0000,4'b0001,4'b0010,4'b0011,4'b0100,4'b0101, 4'b0110, 4'b0111 : 
                 case(s)
                    4'b0010,4'b0011,4'b0111,4'b1111,4'b1011,4'b1010,4'b0110,4'b1110:
                    begin 
                        LED_BCD = 4'b0001;
                    end
          default:
                  LED_BCD = 4'b0000;
                  endcase
         4'b1000,4'b1001,4'b1010,4'b1011,4'b1100,4'b1101, 4'b1110, 4'b1111:
            case(s)
                    4'b1010,4'b1011,4'b1100,4'b1101,4'b1110,4'b1111:
                    begin 
                        LED_BCD = 4'b0001;
                    end
          default:
                  LED_BCD = 4'b0000;
                  endcase
             endcase
              end
              end
        3'b111: begin
            Anode_Activate = 8'b00000001; 
             if(Control==0)
             begin
              LED_BCD = Y;
              end
              else
              begin
              case (M)
        4'b0000,4'b0001,4'b0010,4'b0011,4'b0100,4'b0101, 4'b0110, 4'b0111 : 
                 case(s)
                    4'b0001,4'b0011,4'b0111,4'b1111,4'b1011,4'b1001,4'b1101,4'b0101:
                    begin 
                        LED_BCD = 4'b0001;
                    end
          default:
                  LED_BCD = 4'b0000;
                  endcase
         4'b1000,4'b1001,4'b1010,4'b1011,4'b1100,4'b1101, 4'b1110, 4'b1111:
            case(s)
                    4'b0000,4'b1010 : LED_BCD  = 4'b0000;
                    4'b0001,4'b1011 : LED_BCD  = 4'b0001;
                    4'b0010,4'b1100 : LED_BCD  = 4'b0010;
                    4'b0011,4'b1101 : LED_BCD  = 4'b0011;
                    4'b0100,4'b1110 : LED_BCD  = 4'b0100;          
                    4'b0101,4'b1111 : LED_BCD  = 4'b0101;
                    4'b0110 : LED_BCD  = 4'b0110;
                    4'b0111 : LED_BCD  = 4'b0111;
                    4'b1000 : LED_BCD  = 4'b1000;
                    4'b1001 : LED_BCD  = 4'b1001;
          default:
                  LED_BCD = 4'b0000;
                  endcase
             endcase
              end
              end                            
        endcase
    end
    // Cathode patterns of the 7-segment LED display 
    always @(*)
    begin
        case(LED_BCD)
        4'b0000 : LED_out  <= 7'h1;
        4'b0001 : LED_out  <= 7'h4F;     //A
        4'b0010 : LED_out  <= 7'h12;
        4'b0011 : LED_out  <= 7'h6;
        4'b0100 : LED_out  <= 7'h4C;          
        4'b0101 : LED_out  <= 7'h24;
        4'b0110 : LED_out  <= 7'h20;
        4'b0111 : LED_out  <= 7'hF;
        4'b1000 : LED_out  <= 7'h0;
        4'b1001 : LED_out  <= 7'hC;
        4'b1010 : LED_out  <= 7'hA;
        4'b1011 : LED_out  <= 7'h60;
        4'b1100 : LED_out  <= 7'h31;
        4'b1101 : LED_out  <= 7'h42;
        4'b1110 : LED_out  <= 7'h30;
        4'b1111 : LED_out  <= 7'h38;
        endcase
    end
 endmodule