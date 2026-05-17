module Mux2a1 (
	input [31:0] A, B,
    input UCctl,
	output reg[31:0] R
);

always @(*)
	begin
		case(UCctl)
			1'd0: R = B;
			1'd1: R = A;
		endcase
	end

endmodule
