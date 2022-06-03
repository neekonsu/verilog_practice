module test (
	input clk,
	input rst,

	output leds[0]
);

driver #(
	.DUTY_CYCLE(0.5),
	.PERIOD(10)
) pwm (
	.i_clk(clk),
	.i_rst(rst),
	.o_clk(leds[0])
);

endmodule
