module t_ff(
	input t, clk, set,
	output reg q
);

always @ (posedge clk or posedge set) begin
	if (set) q <= 1;
	else begin 
		q <= t ? ~q : q; 
	end
end

endmodule
