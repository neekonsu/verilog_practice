`timescale 1ns/1ps

// Comments are c-style in verilog and system verilog
// Module leds_on intends to turn all of the leds in the bank
// on and keep them on.
module leds_on (
	output reg [7:0] leds
);

assign leds[7:0] = 8'b11111111;
endmodule
