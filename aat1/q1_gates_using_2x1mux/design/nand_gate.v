module nand_gate(
	input a, b,
	output y
);

wire b_inv;
not_gate not1 (b, b_inv);

mux_2x1 nand_gate (1'b1, b_inv, a, y);

endmodule
