module tb;
reg clk, rst_n, wr_en, rd_en;
reg [7:0] wr_data;
wire full, empty;
wire [7:0] rd_data; 

integer i;

sync_fifo dut (clk, rst_n, wr_en, rd_en, wr_data, rd_data, full, empty);

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb);
end

  // Clock generation
  initial clk = 1;
  always #5 clk = ~clk; // 10ns clock period

  // Testbench logic
  initial begin
    // Initialize signals
    rst_n = 1'b1;
    wr_en = 1'b0;
    rd_en = 1'b0;
    wr_data = 8'b0;

    // Apply reset
    rst_n = 1'b0;
    #20 rst_n = 1'b1;

      // Write 16 data into the FIFO
      $display("Writing 16 data into FIFO...");
      repeat (16) begin
      	@(posedge clk);
        if (!full) begin
          wr_en = 1'b1;
          wr_data = wr_data + 1;
          #10;
        end
      end
      wr_en = 1'b0;

      // Wait for some time
      #30;

          // Test writing when FIFO is full
    $display("Testing write when FIFO is full...");
    wr_en = 1'b1;
    wr_data = 8'hFF; #10;
    if (full) $display("FIFO is full. Write ignored.");
    #10;
    wr_data = 8'd0;
    wr_en = 1'b0;
    #10;

      // Read 16 data from the FIFO
      $display("Reading 16 data from FIFO...");
      repeat (16) begin
      	@ (posedge clk);
        if (!empty) begin
          rd_en = 1'b1;
          #10;
        end
      end
      rd_en = 1'b0;

      // Wait for some time
      #50;  

    // Test reading when FIFO is empty
    $display("Testing read when FIFO is empty...");
    rd_en = 1'b1;
    if (empty) $display("FIFO is empty. Read ignored.");
    #10;
    rd_en = 1'b0;
    #10;

	// apply reset
	rst_n = 1'b0;
	#10 rst_n = 1'b1;
	
	// write new data to empty fifo and start reading
    wr_en = 1'b1;
    wr_data = 8'hFF; #10;
    wr_data = 8'hAB; #10;
    wr_data = 8'hEB; rd_en = 1'b1; #10;
    wr_data = 8'h66; #10;
	  wr_data = 8'd0;
    wr_en = 1'b0;
    #20;
    rd_en = 1'b0;
    #10; 

   	rst_n = 1'b0;  

    // End simulation after extended time
    #100;
    $display("Testbench completed.");
    $finish;
  end

  // Monitor key signals
  initial begin
    $monitor("Time=%0t | wr_en=%b | rd_en=%b | wr_data=%h | rd_data=%h | full=%b | empty=%b",
             $time, wr_en, rd_en, wr_data, rd_data, full, empty);
  end

endmodule
