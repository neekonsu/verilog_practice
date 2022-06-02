`include "../TIMER/timer.v"

module cascade (
	input rst,
	input clk,

	output reg [7:0] leds
);

wire enable;

varclock #(
	.STATE_WIDTH(15),
	.CLOCK_CYCLES(1_000_000)
) slowclk (
	.rst(rst),
	.clk(clk),
	.trigger(enable)
);

always @ (posedge enable) begin
	if (leds == 8'b1) begin
		leds <= 8'b0;
	end else begin
		//leds <= leds + 1'b1;
		leds <= 8'b11111111;
	end
end

endmodule
