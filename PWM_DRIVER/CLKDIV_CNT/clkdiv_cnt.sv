/* CLOCK DIVIDER BY COUNT MODULE
* Generic parameterized clock divider
* based on static clock-cycle count. */

module clkdiv_cnt #(
	parameter LIMIT // Consider making this an input register to allow continuous reconfiguration
) (
	input 	i_clk,
	input 	i_rst,
	output 	o_clk
);

reg [31:0]	r_count;

assign o_clk = (r_count == LIMIT);

always @(posedge clk or posedge o_clk or negedge i_rst) begin
	if (~i_rst || o_clk) begin
		r_count <= 0;
	end else begin
		r_count <= r_count + 1;
	end
end
endmodule
