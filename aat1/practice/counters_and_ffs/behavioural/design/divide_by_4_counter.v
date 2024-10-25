module divide_by_4_counter(
	input clk1, rst,
	output reg clk2
);

reg [1:0] counter = 2'd0;

always @ (posedge clk1) begin
	if (rst) clk2 <= 1;
	else begin 
		if (counter == 1) begin
			clk2 <= ~clk2; // these changes appear in next cycle
			counter <= 0; end 
		else counter <= counter + 1;
	end
end

endmodule

