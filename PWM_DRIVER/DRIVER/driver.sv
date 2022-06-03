/* PWM DRIVER TOP MODULE
* Exposes a parameterized pwm
* driver block with 32 bit precision,
* useful for digital control of passive
* circuit elements. */

module driver #(
	parameter	DUTY_CYCLE, // Ratio of high time to low time
	parameter PERIOD			// Total time elapsed over once cycle
) (
	input 	i_clk,
	input 	i_rst,
	output 	pwm_out
);

reg		r_mode_high; // Whether waiting high or low
wire 	w_mode_low;
wire	w_low_clk;
wire	w_high_clk;

integer		r_period_low;
integer		r_period_high;
integer		r_cycles_low;
integer		r_cycles_high;

assign	r_period_high = PERIOD / DUTY_CYCLE;
assign 	r_period_low 	= PERIOD - r_period_high;

assign 	r_cycles_low	= (100_000 * r_period_low);
assign 	r_cycles_high = (100_000 * r_period_high);

assign 	w_mode_low 	= ~r_mode_high;

clkdiv_cnt #(r_cycles_low) low_clk (
	.i_rst(r_mode_high),
	.i_clk(clk),
	.o_clk(w_low_clk)
);

clkdiv_cnt #(r_cycles_high) high_clk (
	.i_rst(w_mode_low),
	.i_clk(clk),
	.o_clk(w_high_clk)
);

// Rewrite the logic here, write out truth table and pick correct logic gate
/* l | h | out
* -------------
*  0 | 1 | 1
*  1 | 0 | 0
* -------------
*/
assign pwm_out = (w_low_clk ^~ w_high_clk);

endmodule
