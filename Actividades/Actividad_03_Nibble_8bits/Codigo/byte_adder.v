module byte_adder (
    input [7:0] a,
    input [7:0] b,
    output [8:0] c
);

wire c1;

nibble_adderC na0(.a(a[3:0]), .b(b[3:0]), .ci(0), .co(c1, c[3:0]));
nibble_adderC na0(.a(a[7:4]), .b(b[7:4]), .ci(c1), .co(c[8:4]));

endmodule