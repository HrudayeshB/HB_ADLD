module tb;
    reg clk, rst_n, in;
    wire out;
    integer i;

    seq_det uut (clk, rst_n, in, out);
    
    // Initial setup
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb);
        clk = 1'b0;  // Start with clock low
        rst_n = 1'b0;  // Apply reset
        #10 rst_n = 1'b1;  // Deassert reset after 3 time units 
    end


    // Correct clock toggling
    always #5 clk = ~clk;

    // Input stimulus
    initial begin
        #5;
        in = 0; #10  // Idle state
        in = 1; #10  // Start sequence
        in = 0; #10  // '10'
        in = 1; #10  // '101' detected
        in = 1; #10  // Overlapping '110' detected
        in = 0; #10  // Resetting to '10'
        in = 1; #10  // Another '101'
        in = 0; #10  // Start of '101' again
        in = 1; #10  // Overlapping '101' detected
        in = 0; #10
        $finish;     // End simulation
    end

    // for (i = 0; i < 20; i = i + 1) begin
    //     @ (posedge clk);
    //     x = $random;    
    // end

     // Monitor signals
    initial begin
        $monitor("Time: %0t | clk: %b | rst: %b | x: %b | z: %b", $time, clk, rst_n, in, out);
    end

    // Monitor outputs every 10 time units
    //initial begin
    //    forever begin
    //        #10;
    //        $display("Time=%0t | clk=%b | rst=%b | x=%b | z=%b | PS=%b", 
    //                 $time, clk, rst, x, z, uut.PS);
    //    end
    //end


endmodule
