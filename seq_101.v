/*====================================
				SEQUENCE 101
======================================
Description:
	This Moore FSM detects the
	non-overlapping sequence 101,
	assuming the input stream arrives the
	LSB first.

Design Engineer:
Salanap, Lance Kelly D.

Date:
5 Apr 2026

------------------------------------*/
module seq_101(out,  state, clk, rst_n, in);
	//ports
	input 				in;
	input					clk;
	input 				rst_n;
	output reg			out;
	output reg [1:0]  state;

	
	// States
	localparam [1:0] S0 = 2'b00;
	localparam [1:0] S1 = 2'b01;
	localparam [1:0] S2 = 2'b10;
	localparam [1:0] S3 = 2'b11;
	reg [1:0] pres; //present state
	reg [1:0] next; //next state
	
 
	// Input Block
	always @(in,pres) begin
		case(pres)
			S0 : next = in ? S1 : S0;
			S1 : next = in ? S1 : S2;
			S2 : next = in ? S3 : S0;
			S3 : next = in ? S1 : S2;
			default: next = S0;
		endcase //end of case
	end //end of always @(in,pre)
	
	//Sequential Block
	always @(posedge clk, negedge rst_n) begin
		if(!rst_n) pres = S0;
		else pres = next;

	end //end of always@(posedge clk, negedge rst_n)

	//Output Block
	always@(pres)begin
		case (pres)
			S0: begin	
					out = 0;
					state = S0;
				 end //end of S0
			S1: begin	
					out = 0;
					state = S1;
				 end //end of S1
			S2: begin	
					out = 0;
					state = S2;
				 end //end of S2
			S3: begin	
					out = 1;
					state = S3;
				 end //end of S3
			default: begin	
					out = 0;
					state = S0;
					end //end of default
		endcase //end of case
	 end //end of always@(pre)
endmodule