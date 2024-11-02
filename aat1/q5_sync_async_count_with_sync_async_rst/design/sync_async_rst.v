module sync_async_rst (
	input clk, rst,
	output reg [2:0] q
);

always @ (posedge clk or posedge rst) begin 

	if (rst) q <= 3'b0;
	else q <= q + 1;

end

endmodule
