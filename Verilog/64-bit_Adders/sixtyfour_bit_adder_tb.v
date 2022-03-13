`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 10:14:04 PM
// Design Name: 
// Module Name: sixtyfour_bit_adder_tb
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


module sixtyfour_bit_adder_tb;


 // Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg c0;
	reg clk;

	// Outputs
	wire [63:0] c_out;
	wire [31:0] a1, a2;

	// Instantiate the Unit Under Test (UUT)
	sixtyfour_bit_adder FA (.A(a), .B(b), .c0(c0), .output1(c_out), .t1(a1), .t2(a2)
	);
	
	// Derfine clk signal for Verfication purpose
	always #5 clk = ~clk;
	
	
	always begin
	#5 {a} = {a} + 12'b111111111111;
	end
    
    always begin
	#5 {b} = {b} + 12'b111111111111;
	end
    
	initial begin
		// Initialize Inputs
		clk = 0;
		c0 = 1'b0;
		a = 15'd0;
		b = 15'd0;

		
	end

endmodule

