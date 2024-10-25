// module mod16_count (
// 	input clk, rst,
// 	output reg [3:0] out
// );

// wire t1, t2, t3, t4;
// wire q1, q2, q3, q4;

// // Instantiate T Flip-Flops
// t_ff ff1 (t1, clk, rst, q1);
// t_ff ff2 (t2, clk, rst, q2);
// t_ff ff3 (t3, clk, rst, q3);
// t_ff ff4 (t4, clk, rst, q4);

// // Correct toggle conditions for T flip-flops based on the counter logic
// assign t1 = ~q1 | ~q2 | ~q3 | ~q4; // Custom K-map derived logic for t1
// assign t2 = q4;                     // Custom logic for t2
// assign t3 = q3 & q4 & (~q1 | ~q2);  // Custom logic for t3
// assign t4 = q2 & q3 & q4;           // Custom logic for t4

// always @ (posedge clk or posedge rst) begin

// 	if (rst) out <= 4'b0101;
// 	else out <= {q4, q3, q2, q1};

// end

// endmodule

module mod16_count (
	input clk, rst,
	output reg [3:0] out
);

always @ (posedge clk or posedge rst) begin
	if (rst || out == 4'd15) out <= 4'd5;
	else out <= out + 4'd1;
end

endmodule

