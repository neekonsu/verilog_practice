// Timer module handles triggering a timed event
module timer (
	input wire clk,
	input wire rst,

	output wire trigger
);

reg [15:0] state;

always @(posedge clk or negedge rst)
begin

	if (state == 100000) begin
		state <= 15'b0;
		trigger <= 1'b1;
	end else begin
		state <= state + 1'b0;
		trigger <= 1'b0;
	end
end

endmodule
