module OR32Comp (
	input [31:0] Oo1,
	input [31:0] Oo2,
	output [31:0] RO
);

assign RO = Oo1 | Oo2;

endmodule
