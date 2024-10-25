module divide_by_2_counter(
	input clk1, rst,
	output reg clk2
);

always @ (posedge clk1) begin
	if (rst) clk2 <= 1;
	else clk2 <= ~clk2;
end

endmodule
