`timescale 1ns/100ps
`include "../TIMER/timer.v"

module cascade (
	input rst,
	input clk,

	output reg [7:0] leds
);

 
wire 			w_enable;
reg [7:0] r_state = 8'b10000000;

assign leds[0] = ~r_state[0];
assign leds[1] = ~r_state[1];
assign leds[2] = ~r_state[2];
assign leds[3] = ~r_state[3];
assign leds[4] = ~r_state[4];
assign leds[5] = ~r_state[5];
assign leds[6] = ~r_state[6];
assign leds[7] = ~r_state[7];

varclock #(
	.LIMIT(5_000_000),
	.WIDTH(32)
) slowclk (
	.rst(rst),
	.clk(clk),
	.trigger(enable)
);


always @ (posedge enable) begin
	if (r_state == 8'b00000001) begin
		r_state <= 8'b10000000;
	end else begin
		r_state <= r_state >> 1;
		//leds <= 8'b11111111;
	end
end

endmodule
