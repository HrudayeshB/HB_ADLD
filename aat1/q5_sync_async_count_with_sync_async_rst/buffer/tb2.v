module tb2;
reg clk, rst;
wire [2:0] q;

sync_async_rst uut (clk, rst, q);

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb2);
    rst = 1; clk = 1;
    #1 rst = 0;
    #99 $finish;
end

always #5 clk = ~clk;

endmodule
