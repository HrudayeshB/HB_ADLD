module seq_det (input clk, rst_n, in, output reg out);

parameter [1:0] A=2'b00, B=2'b01, C=2'b10, D=2'b11;
reg [1:0] PS, NS;

always @ (posedge clk, negedge rst_n) begin
	if (!rst_n) begin PS <= A;
	out <= 1'b0; end
	else PS <= NS;
end

always @ (*) begin 
	NS = A;
	out = 1'b0;

	case(PS)
	A: if (in) begin NS = B; out = 1'b0; end else begin NS = A; out = 1'b0; end// reset
	B: if (in) begin NS = D; out = 1'b0; end else begin NS = C; out = 1'b0; end  // '1' detected
	C: if (in) begin NS = B; out = 1'b1; end else begin NS = A; out = 1'b0; end // '10' detected
	D: if (in) begin NS = D; out = 1'b0; end else begin NS = A; out = 1'b1; end  // '11' detected
	default: begin NS = A; out = 1'b0; end
	endcase
end

endmodule 

