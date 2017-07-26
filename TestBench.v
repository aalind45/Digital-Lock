`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:40:26 03/20/2017
// Design Name:   Lock
// Module Name:   G:/Sem-4/ECN-252/Lock/TestBench.v
// Project Name:  Lock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Lock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBench;

	// Inputs
	reg inp0;
	reg inp1;
	reg reset;

	// Outputs
	wire out;

	reg clock = 0;
	//reg A[2:0];
	// Instantiate the Unit Under Test (UUT)
	Lock uut (
		.inp0(inp0), 
		.inp1(inp1), 
		.clock(clock),
		.reset(reset), 
		.out(out)
	);

	always
		begin
			#10 clock = 0;
			#10 clock = 1;
		end
	initial begin
		// Initialize Inputs
		inp0 = 0;
		inp1 = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#20
		inp0 = 1;
		inp1 = 0;
		#20
		inp0 = 0;
		inp1 = 1;
		#20
		inp0 = 0;
		inp1 = 1;
		#20
		inp0 = 1;
		inp1 = 0;
		#20
		inp0 = 1;
		inp1 = 0;
		#20
		inp0 = 0;
		inp1 = 1;
		#20
		inp0 = 0;
		inp1 = 0;
		#20
		inp0 = 1;
		inp1 = 0;
		#20
		inp0 = 1;
		inp1 = 0;
		#20
		inp0 = 0;
		inp1 = 1;
		#20
		inp0 = 0;
		inp1 = 1;
		#20
		inp0 = 1;
		inp1 = 0;
		#20
		inp0 = 0;
		inp1 = 0;
		#20
		inp0 = 1;
		inp1 = 0;
        
		// Add stimulus here

	end
      
endmodule

