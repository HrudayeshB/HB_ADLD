module mux_6x1(
	input [3:0] a, b, c, d, e, f,
	input [2:0] sel,
	output [3:0] y
);

wire [3:0] w1, w2, w3, w4, w5;

// 1st stage
mux_2x1 mux1 (a, b, sel[0], w1);
mux_2x1 mux2 (c, d, sel[0], w2);
mux_2x1 mux3 (e, f, sel[0], w3);

// 2nd stage
mux_2x1 mux4 (w1, w2, sel[1], w4);
mux_2x1 mux5 (w3, 4'bx, sel[1], w5);

// 3rd stage
mux_2x1 mux6 (w4, w5, sel[2], y);

endmodule
