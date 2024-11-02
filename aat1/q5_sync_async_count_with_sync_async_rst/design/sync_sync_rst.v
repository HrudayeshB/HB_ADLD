module sync_sync_rst (
	input clk, rst,
	output reg [2:0] q
);

always @ (posedge clk) begin 

	if (rst) q <= 3'b0;
	else q <= q + 1;

end

endmodule
