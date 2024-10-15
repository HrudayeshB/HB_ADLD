module not_gate (
	input a,
	output y
);

mux_2x1 not_gate (1'b1, 1'b0, a, y);

endmodule
