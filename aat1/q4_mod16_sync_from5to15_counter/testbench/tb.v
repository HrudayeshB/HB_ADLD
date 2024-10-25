module tb;
reg clk, rst;
wire [3:0] out;

mod16_count uut (clk, rst, out);

initial begin
	$dumpfile("waveform.vcd");
	$dumpvars(0, tb);
	clk = 1; rst = 1; 
	#1 rst = 0;
	#200 $finish;
end

always #5 clk = ~clk;

endmodule
