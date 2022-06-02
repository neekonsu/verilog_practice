// Timer module handles triggering a timed event
module varclock #(
	parameter STATE_WIDTH = 15,						// Bus width for the internal counter
	parameter CLOCK_CYCLES = 100_000_000 	// Upper inclusive limit of clock cycles
)
(
	input clk,
	input rst,

	output wire trigger
);

reg [STATE_WIDTH:0] state;
assign trigger = (CLOCK_CYCLES == state);

always @(negedge rst) begin
	state <= STATE_WIDTH'b0;
end

always @(posedge clk) begin	
	state <= state + 1;
end

endmodule
