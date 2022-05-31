// Timer module handles triggering a timed event
module timer (
	input wire clk,
	input wire rst,

	output wire trigger
);
//TODO: parameterize module to accept arbitrary time limit
reg [7:0] state_reg;
reg trigger_reg;

assign trigger_reg = trigger;

always @ (posedge clk or posedge rst)
begin
	if (rst == 1) begin
		state_reg <= 8'b0;
		trigger_reg <= 1'b0;
		end else if (state_reg == 1000000) begin
		state_reg <= 8'b0;
		trigger_reg <= 1'b0;
	end else begin
		state_reg <= state_reg + 1;
		trigger_reg <= 1'b0;
	end
end

endmodule
