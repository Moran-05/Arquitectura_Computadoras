module SLT32 (
	input [31:0] Slto1,
	input [31:0] Slto2,
	output [31:0] RSlt
);

assign RSlt = (Slto1 < Slto2) ? 1:0;

endmodule