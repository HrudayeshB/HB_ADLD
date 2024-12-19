module sync_fifo (clk, rst_n, wr_en, rd_en, wr_data, rd_data, full, empty);

input clk, rst_n, wr_en, rd_en;
input [7:0] wr_data;
output reg [7:0] rd_data;
output full, empty;

reg [4:0] wr_ptr, rd_ptr; // 5 bit write and read pointers (includes msb bits as needed to compare full/empty) 
reg [7:0] fifo_mem [15:0]; // define fifo memory with 16 words each of size 8 bits

always @ (posedge clk) begin
	if (!rst_n) begin
		wr_ptr <= 5'd0; rd_ptr <= 5'd0;
		rd_data <= 8'd0;
	end 

	if (wr_en & !full) begin
		fifo_mem[wr_ptr[4:0]] <= wr_data;
		wr_ptr <= wr_ptr + 4'd1;
	end

	if (rd_en & !empty) begin
		rd_data <= fifo_mem[rd_ptr[4:0]];
		rd_ptr <= rd_ptr + 4'd1;
	end
end

// checking if the ptr has rolled over (wrapped around) if yes then msb bits will be diff - then xor - high
assign full = (wr_ptr[4] ^ rd_ptr[4]) & (wr_ptr[3:0] == rd_ptr[3:0]);

assign empty = (wr_ptr == rd_ptr);

//assign empty = ~(wr_ptr[4] ^ rd_ptr[4]) & (wr_ptr[3:0] == rd_ptr[3:0]);

//using combinational as above doesnt give proper timing
//always @(posedge clk) begin
//    if (!rst_n) begin
//      full <= 1'b0;
//      empty <= 1'b1;
//    end else begin
//      full <= (wr_ptr[3] ^ rd_ptr[3]) && (wr_ptr[2:0] == rd_ptr[2:0]);
//      empty <= (wr_ptr == rd_ptr);
//    end
//  end

endmodule
