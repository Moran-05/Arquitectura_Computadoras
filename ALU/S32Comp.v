module S32Comp (
	input [31:0] So1,
	input [31:0] So2,
	output [31:0] Rs
);

assign Rs = So1 + So2;

endmodule