module logic_gates(
	input a,
	input b,
	output o_and,
	output o_or,
	output o_not,
	output o_nand,
	output o_nor,
	output o_xor,
	output o_xnor
);

assign o_and = a & b; //AND
assign o_or = a | b; //OR
assign o_not = ~a; // NOT
assign o_nand = ~(a & b); //NAND
assign o_nor = ~(a | b); //NOR
assign o_xor = (a ^ b); //XOR
assign o_xnor = ~(a ^ b); //XNOR

endmodule
