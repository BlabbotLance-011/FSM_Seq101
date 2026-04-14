//testbench for sequence 101 w/clk_div
module testbench;
//tb signals
	reg			in;
	reg			rst_n;
	reg			clk;
	wire			out;
	wire	[1:0] state;



	//instantiate seq_101
	seq_101 dut(
		.out(out), 
		.state(state), 
		.clk(clk), 
		.rst_n(rst_n), 
		.in(in));

	//apply stimuli
	initial clk = 1'b0;

	always #1 clk = ~clk;

	initial begin
	rst_n = 0; 
	repeat(3)@(negedge clk);
	rst_n = 1;
	@(negedge clk); in = 1;
	@(negedge clk); in = 0;
	@(negedge clk); in = 1;
	@(negedge clk); in = 0;
	@(negedge clk); in = 1;
	@(negedge clk); in = 1;
	@(negedge clk); in = 0;
	@(negedge clk); in = 0;
	@(negedge clk); in = 0;
	end //end of initial

endmodule