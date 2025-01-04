module tb;
    reg clk, rst_n, in;
    wire out;

    seq_det uut (clk, rst_n, in, out);
    
    // Initial setup
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb);
        clk = 1'b0;  // Start with clock low
        rst_n = 1'b0;  // Apply reset
        in = 1'b0;
        #3 rst_n = 1'b1;  // Deassert reset after 3 time units 
    end


    // Correct clock toggling
    always #5 clk = ~clk;

    // Input stimulus
    initial begin
        @(posedge clk); in = 1'b0; // Idle state
        @(posedge clk); in = 1'b1;  // Start sequence
        @(posedge clk); in = 1'b0;  // '10'
        @(posedge clk); in = 1'b1;  // '101' detected
        @(posedge clk); in = 1'b1;  // Overlapping '110' detected
        @(posedge clk); in = 1'b0;  // Resetting to '10'
        @(posedge clk); in = 1'b1;  // Another '101'
        @(posedge clk); in = 1'b0;  // Start of '101' again
        @(posedge clk); in = 1'b1;  // Overlapping '101' detected
        @(posedge clk); in = 1'b0; 
        $finish;     // End simulation
    end

    // for (i = 0; i < 20; i = i + 1) begin
    //     @ (posedge clk);
    //     in = $random;    
    // end

     // Monitor signals
    initial begin
        $monitor("Time: %0t | clk: %b | rst: %b | in: %b | out: %b", $time, clk, rst_n, in, out);
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
