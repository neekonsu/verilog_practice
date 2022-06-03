// Timer module handles triggering a timed event
`timescale 1ns/100ps

module varclock (
	input clk,
	input rst,

	output reg trigger
);

parameter LIMIT = 100_000_000;
parameter WIDTH = 32;

reg [WIDTH-1:0] counter;

always @ (posedge clk) begin
	if (~rst) begin
		counter <= 0;
		trigger <= 0;
	end else if (counter == LIMIT) begin
		counter <= 0;
		trigger <= 1;
	end else begin
		counter <= counter + 1;
		trigger <= 0;
	end
end

endmodule
