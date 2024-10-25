module tb;
reg clk1, rst;
wire clk2;

// divide_by_2_counter by2 (clk1, rst, clk2);
divide_by_4_counter by4 (clk1, rst, clk2);

initial begin 
	$dumpfile("waveform.vcd");
	$dumpvars(0, tb);
	clk1 = 1; rst = 1;
	#1 rst = 0;
	#49 $finish;
end

always #5 clk1 = ~clk1;

endmodule
