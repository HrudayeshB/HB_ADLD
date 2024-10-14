module and_gate(
	input a, b,
	output y
);

mux_2x1 and_gate (1'b0, b, a, y);

endmodule
