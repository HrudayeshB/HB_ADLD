module xnor_gate (
	input a, b,
	output y
);

wire b_inv;
not_gate not1 (b, b_inv);

mux_2x1 xor_gate (b_inv, 1'b0, a, y);

endmodule
