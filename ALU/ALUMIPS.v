module ALUMIPS (
	input [31:0] A,
	input [31:0] B,
	input [3:0] Sel,
	output [31:0] R
);

wire [31:0]RS1, RR2, RO3, AR4, RSlt5; 

S32Comp sum(.So1(A), .So2(B), .Rs(RS1));
R32Comp res(.Ro1(A), .Ro2(B), .RR(RR2));
OR32Comp orcom(.Oo1(A), .Oo2(B), .RO(RO3));
And32Comp andcom(.Ao1(A), .Ao2(B), .AR(AR4));
SLT32 sltt(.Slto1(A), .Slto2(B), .RSlt(RSlt5));

MuxSa1 muxi(.suma(RS1), .resta(RR2), ._or(RO3), ._and(AR4), ._slt(RSlt5), .ALUctl(Sel), .R(R));

endmodule