/* PWM DRIVER TOP MODULE
* Exposes a parameterized pwm
* driver block with 8 bit precision,
* useful for digital control of passive
* circuit elements. */

`include "../CNTR/CNTR.sv"

module driver #(
	parameter	DUTY_CYCLE, // Total clock cycles per low period 
	parameter PERIOD			// Total clock cycles per period
) (
	input 	i_clk,
	input 	i_rst,
	output 	pwm_out
);

reg 	[7:0]	threshold = DUTY_CYCLE;  
wire 	[7:0] w_count;

CNTR #(PERIOD) counter (
	.I_RST(i_rst),
	.I_CLK(i_clk),
	.O_CNT(w_count)	
);

assign pwm_out = (w_count > threshold);

endmodule
