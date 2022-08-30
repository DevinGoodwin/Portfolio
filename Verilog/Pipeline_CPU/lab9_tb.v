`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:32 03/21/2017 
// Design Name: 
// Module Name:    discussion_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lab9_tb;

	// Inputs
	reg clk;
	reg Reset;
	reg LoadInstructions;
	reg [31:0] Instruction;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.out(out), 
		.clk(clk), 
		.Reset(Reset), 
		.LoadInstructions(LoadInstructions), 
		.Instruction(Instruction)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Reset = 1;
		LoadInstructions = 0;
		Instruction = 0;
		#10;
		Reset = 0;
		LoadInstructions = 1;
		#10;
		// begin by loading values into registers
		Instruction = 32'b001000_00000_00001_0000000110100111; //addi $R1, $R0, 423
		#10;
		Instruction = 32'b001000_00000_00010_0000000001011100; //addi $R2, $R0, 92
		#10;
		Instruction = 32'b001000_00000_00011_0000000000001101; //addi $R3, $R0, 13
		#10;
		Instruction = 32'b001000_00000_00100_0000000010010010; //addi $R4, $R0, 146
		#10;
		Instruction = 32'b001000_00000_00101_0000000000000101; //addi $R5, $R0, 5
		#10;
		Instruction = 32'b000000_00001_00100_00101_00000_100000; //add  $R5, $R1, $R4  2 ahead
		//Instruction = 32'b100011_00000_00110_0000000000001000;	// LW $R6, 8(R0) one ahead value is 8 
		#10;
		Instruction = 32'b000000_00011_00101_00110_00000_101010; //slt  $R6, $R3, $R5 1 ahead
		//Instruction = 32'b000000_00110_00011_01001_00000_100101; //or  $R9, $R6, $R3 436 or 8 should result into 444
		#10;
		Instruction = 32'b100011_00000_00100_0000000000000000;	// LW $R4, 0(R0) one ahead value is 8 
		//Instruction = 32'b000000_00001_00010_01000_00000_100010; //sub  $R8, $R1, $R2 8-23 = -15
		#10;
	    Instruction = 32'b000000_00100_00110_00111_00000_100010; //sub  $R7, $R4, $R6 
		#10;
		Instruction = 32'b101011_00000_00111_0000000000000100; 	// SW	$R7, 4(R0)
		#10;
		Instruction = 32'b000000_00111_00010_01000_00000_100000; //add  $R8, $R7, $R2  2 ahead

		#10;
		LoadInstructions = 0;
      	Reset = 1;
		#10;
		Reset = 0;
		#100;
		// Add stimulus here

	end
	always begin
	#5;
	clk = ~clk;
	end
      
endmodule

