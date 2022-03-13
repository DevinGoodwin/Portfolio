`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 07:09:30 PM
// Design Name: 
// Module Name: full_adder_str_tb
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


module full_adder_str_tb;

// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg c_in;
	
	reg clk;

	// Outputs
	wire [3:0] c_out;
	wire sum;
	wire c_out_verify;
	wire sum_verify;
	wire error_flag;
	wire overflow;


	// Instantiate the Unit Under Test (UUT)
	full_adder FA (
		.A(a),
		.B(b),
		.C0(c_in),
		.output1(c_out),
		.cout(overflow)
	);
	
	/*
	
	// Verification module
	Verification_1bit Verification (
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Assign Error_flag
	assign error_flag = (c_out != c_out_verify || sum != sum_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end

*/
	// Derfine clk signal for Verfication purpose
	always #5 clk = ~clk;
	
	always begin
	#5 {a, b} = {a,b} + 1'b1;
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		
		a = 4'b0000;
		b = 4'b0000;
		c_in = 0;

		// Wait 10 ns
		/*#10;
		a = 1;
		b = 0;
		c_in = 1;
*/
	end
      
endmodule


