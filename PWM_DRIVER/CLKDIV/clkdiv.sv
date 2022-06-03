/* CLOCK DIVIDER MODULE
* Generic parameterized clock divider 
* good for realtime operations. */

module clkdiv #(
	parameter divisor	
) (
	input		i_rst,
	input		i_clk,
	output	o_clk
);

reg [31:0]	r_mask;
reg [31:0]	r_count;

// Check data type for floating points
assign	r_mask = 100_000_000 / divisor; 
assign	o_clk = (r_count == r_mask);

always @(posedge i_clk or posedge o_clk or negedge i_rst) begin begin
	if (~i_rst || o_clk) begin
		r_count <= 0;
	end else begin
		r_count <= r_count + 1;
	end
end
endmodule
