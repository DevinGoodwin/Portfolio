`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2022 06:56:31 PM
// Design Name: 
// Module Name: CSA_64_tb
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


module CSA_64_tb();

//Inputs
reg [63:0] a, b;
reg c_in;

reg clk;

//Outputs
wire [63:0] s;
wire c_out;
wire c_out_verify;
wire [63:0] sum_verify;
wire error_flag;

CSA_64_str CSA(
    .a(a),
    .b(b),
    .c_in(c_in),
    .s(s),
    .c_out(c_out));
    
Verification_64bit Verification (
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
// Assign Error_flag
assign error_flag = (c_out != c_out_verify || s != sum_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
		
	// Derfine clk signal for Verfication purpose
	always #5 clk = ~clk;
    
   initial begin
   // Initialize Inputs
		clk = 0;
		
		//check carry out
		a = 64'hFFFFFFFFFFFFFFFF;
		b = 64'hFFFFFFFFFFFFFFFF;
		c_in = 1;

        //random large a&b
		// Wait 10 ns
		#10;
		a = 64'hFFFFFFFFFFFFFFFF;
		b = 64'hFFFFFFFFFFFFFFFE;
		c_in = 1;
		
		#10;
		a = 64'hFFFFFF0000000001;
		b = 64'hFFFFFF0000000760;
		c_in = 1;
		
		//random large a&b
		// Wait 10 ns
		#10;
		a = 64'hFFFFFFFFFFFFFFFF;
		b = 64'hFFFFFFFFFFFFFFFE;
		c_in = 0;

        //random small a&b
		// Wait 10 ns
		#10;
		a = 64'h12;
		b = 64'h11;
		c_in = 1;
		
		//random small a&b
		// Wait 10 ns
		#10;
		a = 64'h12;
		b = 64'h11;
		c_in = 0;
		
	   //random combo
	   // Wait 10 ns
		#10;
		a = 64'h124552;
		b = 64'h47264;
		c_in = 1;
		
	   //random combo
	   // Wait 10 ns
		#10;
		a = 64'h124552;
		b = 64'h47264;
		c_in = 0;
		
		
		end

endmodule