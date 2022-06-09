`include "../DRIVER/driver.sv"

module test (
	input clk,
	input rst,

	output leds
);

reg led_out;

assign leds[0] = led_out;

driver #(
	.DUTY_CYCLE(200),
	.PERIOD(255)
) pwm (
	.i_clk(clk),
	.i_rst(rst),
	.pwm_out(led_out)
);

endmodule
