module mux_2x1(
	input [3:0] a, b,
	input sel,
	output [3:0] y
);

assign y = sel ? b : a;

endmodule
