module SignExtend (
    input [15:0]Inst,
    output [31:0]DataOut
);

    assign DataOut = {{16{Inst[15]}}, Inst};
endmodule