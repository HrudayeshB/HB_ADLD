module tb_tff;
reg t, clk, set;
wire q1, q2;

t_ff uut1 (t, clk, set, q1);
t_ff uut2 (t, q1, set, q2);

initial begin 
	$dumpfile("waveform.vcd");
	$dumpvars(0, tb_tff);
	clk = 1; set = 1; t = 1;
	#1 set = 0;
	#49 $finish;
end

always #5 clk = ~clk;

endmodule
