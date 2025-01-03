module seq_det (input clk, rst_n, in, output reg out);

parameter [1:0] A=2'b00, B=2'b01, C=2'b10, D=2'b11;
reg [1:0] PS, NS;

always @ (posedge clk, negedge rst_n) begin
	PS <= (!rst_n) ? A : NS;
end

always @ (in or PS) begin 
	case(PS)

	A: begin NS = in ? B : A; out = 0; end 
	B: begin NS = in ? D : C; out = 0; end
	C: begin NS = in ? B : A; out = in ? 1 : 0; end
	D: begin NS = in ? D : C; out = in ? 0 : 1; end
	default: begin NS = A; out = 0; end

	endcase
end

endmodule 
