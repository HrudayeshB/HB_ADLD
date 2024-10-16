module tb;

reg a,b;
wire y_and, y_or, y_not, y_xor, y_xnor, y_nand;

and_gate and1 (a, b, y_and);
or_gate or1 (a, b, y_or);
not_gate not1 (a, y_not);
xor_gate xor1 (a, b, y_xor);
xnor_gate xnor1 (a, b, y_xnor);
nand_gate nand1 (a, b, y_nand);

initial begin
	$dumpfile("waveform.vcd");
	$dumpvars(0, tb);
end

initial begin
	$monitor("At time %t: a = %b, b = %b, AND = %b, OR = %b, NOT = %b, XOR = %b, XNOR = %b, NAND = %b", 
                  $time, a, b, y_and, y_or, y_not, y_xor, y_xnor, y_nand);

	a = 0; b = 0; #10;
	a = 0; b = 1; #10;
	a = 1; b = 0; #10;
	a = 1; b = 1; #10;

	$finish;
end
endmodule
