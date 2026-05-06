module Mux2a1 (
	input [31:0] mem, alu,
    input UCctl,
	output reg[31:0] R
);

always @(*)
	begin
		case(UCctl)
			1'd0: R <= alu;
			1'd1: R <= mem;
		endcase
	end

endmodule