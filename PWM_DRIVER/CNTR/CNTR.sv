/* SIMPLE CLOCK COUNTER
* Count up to an 8-Bit threshold and restart
* Good for high frequency applications */

module CNTR #(
	parameter 	MAX_COUNT
) (
	input 	wire 			I_RST,
	input 	wire 			I_CLK,
	output 	reg	[7:0]	O_CNT
);

reg [7:0] MAX_COUNT = MAX_COUNT;

always @(posedge I_CLK) begin
	if (~I_RST) begin
		O_CNT <= 8'b0;
	end

	if (O_CNT == MAX_COUNT) begin
		O_CNT <= 8'b0;
	end else begin
		O_CNT <= O_CNT + 8'b1;
	end
end
endmodule
