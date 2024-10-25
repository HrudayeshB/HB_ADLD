module t_ff (
    input t, clk,
    output reg q
);
    always @(posedge clk) begin
    	q <= t ? ~q : q;
    end
endmodule
