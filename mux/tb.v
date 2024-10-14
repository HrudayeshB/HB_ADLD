module tb;
reg [3:0] a,b,c,d,e,f;
reg [2:0] sel;
wire [3:0] y;

mux_6x1 uut (a,b,c,d,e,f,sel,y);

initial begin 

	// Open a dump file for waveform output
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb);
    
	a=4'hA; b=4'hB; c=4'hC; d=4'hD; e=4'hE; f=4'hF; sel=3'h0;
	#10 sel=1;
	#10 sel=2;
	#10 sel=3;
	#10 sel=4;
	#10 sel=5;
	#10 sel=6;
	#10 sel=7;
	#10
	$finish;

	end
	
endmodule
