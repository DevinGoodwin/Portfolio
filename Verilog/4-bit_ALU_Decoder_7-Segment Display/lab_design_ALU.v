`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 11:01:23 PM
// Design Name: 
// Module Name: lab_design_ALU
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


module lab_design_ALU(
    input[3:0] A,
    input[3:0] B,
    input c_in,
    input[2:0] Op,
    input M,
    output reg[3:0] s,
    output c_out
    );
    
     wire[2:0] c;
     wire[3:0] d,e,f;
     reg [3:0] in2_adder;
     reg [3:0] in_adder;
     reg temp;
     
      always @ (*)
      begin
      if(!M)
        begin
            
            if(Op[2]==1'b0 && Op[1] == 1'b0 && Op[0] == 1'b0)
            begin
                s <= A&B;
                temp <= 1;
                //c_out <= 1; 
            end
            else if(Op[2]==1'b0 && Op[1] == 1'b0 && Op[0] == 1'b1)
            begin
                s <= A | B;
            end
            else if(Op[2]==1'b0 && Op[1] == 1'b1 && Op[0] == 1'b0)
            begin
                s = ~A+~B;
            end
            else if(Op[2]==1'b0 && Op[1] == 1'b1 && Op[0] == 1'b1)
            begin
                s = ~A&~B;
            end
            else if(Op[2]==1'b1 && Op[1] == 1'b0 && Op[0] == 1'b0)
            begin
                s = A ^ B;
            end
            else if(Op[2]==1'b1 && Op[1] == 1'b0 && Op[0] == 1'b1)
            begin
                s = (A&B)||(~A&~B);
            end
            else if(Op[2]==1'b1 && Op[1] == 1'b1 && Op[0] == 1'b0)
            begin
                s = ~A;
            end
            else if(Op[2]==1'b1 && Op[1] == 1'b1 && Op[0] == 1'b1)
            begin
                s = ~B;
            end
            end
        else   
        begin
            
            if(Op[2]==1'b0 && Op[1] == 1'b0 && Op[0] == 1'b0)
            begin
                s = A;
                temp <= 1;
            end
            else if(Op[2]==1'b0 && Op[1] == 1'b0 && Op[0] == 1'b1)
            begin
                s = B;
            end
            else if(Op[2]==1'b0 && Op[1] == 1'b1 && Op[0] == 1'b0)
            begin
                in_adder = A;
                in2_adder = B;
                s=d;
            end
            else if(Op[2]==1'b0 && Op[1] == 1'b1 && Op[0] == 1'b1)
            begin
                in_adder = A;
                in2_adder = e;
                s=d;
            end
            else if(Op[2]==1'b1 && Op[1] == 1'b0 && Op[0] == 1'b0)
            begin
                s = A*B;
                
                
                
                
              
            end
            else if(Op[2]==1'b1 && Op[1] == 1'b0 && Op[0] == 1'b1)
            begin
                in_adder = B;
                in2_adder = f;
                s=d;
            end
            else if(Op[2]==1'b1 && Op[1] == 1'b1 && Op[0] == 1'b0)
            begin
                in_adder = A;
                in2_adder = {4'b0001};
                s=d;   
            end
            else if(Op[2]==1'b1 && Op[1] == 1'b1 && Op[0] == 1'b1)
            begin
                in_adder = A;
                in2_adder = {4'b1111};
                s=d;
            end            
        end                             
        end
     
     
                       
            assign e = B ^ {4{Op[0]}};
            assign f = A ^ {4{Op[0]}};
             
     lab_design_fulladder add_full_1(c_in,in_adder[0],in2_adder[0],d[0],c[0]);
     lab_design_fulladder add_full_2(c[0],in_adder[1],in2_adder[1],d[1],c[1]);
     lab_design_fulladder add_full_3(c[1],in_adder[2],in2_adder[2],d[2],c[2]);
     lab_design_fulladder add_full_4(c[2],in_adder[3],in2_adder[3],d[3],c_out);
endmodule