module or_gate (
	input a, b,
	output y
);

mux_2x1 or_gate (b, 1'b1, a, y);

endmodule
