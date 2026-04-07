/*============================================
	         CLOCK DIVIDER
==============================================
Description:
 This module takes a high frequency input clock (clk_in), a 50Mhz clock input, and divides
 it down to a lower frequency to produce 3Hz clock output. By default, it divides a 50MHz
 input clock down to 1 sec clock period toggling the outputs every 25 million ticks.

Design Engineer:
 Salanap, Lance Kelly D.

Date:
Apr 7, 2026
-----------------------------------------------
*/
module  clk_div(clk_out,clk_led,clk_in);
 //ports
 input clk_in;
 output reg clk_out = 1'b0;
 output reg clk_led = 1'b0;
 
 // division factor
 parameter integer  FREQ_IN = 50_000_000; 					// 50 MHz
 parameter integer  PERIOD_OUT = 1;							// 1 seconds
 localparam integer TICKS = (FREQ_IN * PERIOD_OUT)/2; // No. of ticks every period

// clock generator
 integer tick_cnt = 0; 

 always@(posedge clk_in) begin
    if(tick_cnt == TICKS-1) begin
       clk_out <= ~clk_out;
       clk_led <= ~clk_led;
       tick_cnt <= 27'b0;
    end
    
    else tick_cnt <= tick_cnt + 27'b1;
 
 end


endmodule