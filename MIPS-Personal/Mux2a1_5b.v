module Mux2a1_5b (
	input [4:0] mem, alu,
    input UCctl,
	output reg[4:0] R
);

always @(*)
	begin
		case(UCctl)
			1'd0: R = alu;
			1'd1: R = mem;
		endcase
	end

endmodule
