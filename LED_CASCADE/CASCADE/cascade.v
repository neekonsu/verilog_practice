`include "../TIMER/timer.v"

module cascade (
	input rst,
	input clk,

	output reg [7:0] leds
);

wire trigger;

timer delay (
	.rst(rst),
	.clk(clk),
	.trigger(trigger)
);

always @ (posedge trigger) begin
	if (leds == 8'b1 || rst == 1'b0) begin
		leds <= 8'b0;
	end else begin
		leds <= leds + 1'b1;
	end
end

endmodule
