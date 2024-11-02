module async_async_rst (
	input clk, rst,
	output [2:0] q
);

t_ff t1 (1'b1, rst, clk, q[0]);
t_ff t2 (1'b1, rst, ~q[0], q[1]);
t_ff t3 (1'b1, rst, ~q[1], q[2]);

endmodule
