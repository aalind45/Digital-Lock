`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:29 03/20/2017 
// Design Name: 
// Module Name:    Lock 
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
module Lock(
    input inp0, // input
	 input inp1,
	 input clock,
    input reset,
	 output out // output
    );
	 // state 000 -> 0
	 // state 001 -> 01
	 // state 011 -> 011
	 // state 111 -> 0110
	 // state 110 -> 01100
	 // state 100 -> 011001
	 
	 // state 010 -> XXXXXX
	 parameter S_RESET = 3'b000;
	 parameter S_0 = 3'b001;
	 parameter S_01 = 3'b010;
	 parameter S_011 = 3'b011;
	 parameter S_0110 = 3'b100;
	 parameter S_01100 = 3'b101;
	 parameter S_011001 = 3'b110;
//	 integer count=0;
	 reg [2:0] A;
	 always @ (posedge clock) 
	 begin	 
		 if(reset) A <= S_RESET; 
		 else case (A)
		 S_RESET: A	<=	inp0	?	S_0	:	inp1	?	S_RESET	: 	A;
		 S_0:		 A	<=	inp0	?	S_0	:	inp1	?	S_01 		: 	A;
		 S_01:	 A	<=	inp0	?	S_0	:	inp1	?	S_011		: 	A;
		 S_011:	 A	<=	inp0	?	S_0110:	inp1	?	S_RESET 	: 	A;
		 S_0110:	 A <= inp0	?	S_01100:	inp1	?	S_RESET	:	A;
		 S_01100: A <= inp0	?	S_0	:	inp1	?	S_011001	:	A;
		 S_011001:A	<=	inp0	?	S_0	:	inp1	?	S_RESET	:	A;
		 default: A <=	S_RESET;
		 endcase
	 end
	 
	 assign out = (A==S_011001);

endmodule
 