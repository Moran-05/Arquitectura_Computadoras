module ALUCTRL (
    input [2:0]AluOp,
    input [5:0]func,
    output reg[3:0]SelAlu
);
    always @(*) begin
        case (AluOp)
            3'b010 : begin
                case (func)
                    6'b100000 : SelAlu = 4'b0010; // ADD
                    6'b100010 : SelAlu = 4'b0110; // SUB
                    6'b100100 : SelAlu = 4'b0000; // AND
                    6'b100101 : SelAlu = 4'b0001; // OR
                    6'b101010 : SelAlu = 4'b0111; // SLT
                    6'b100111 : SelAlu = 4'b1100; // NOR
                endcase
            end
            3'b000 : begin // SW, LW y ADDI
                SelAlu = 4'b0010;
            end
            3'b001 : begin // BEQ
                SelAlu = 4'b0110;
            end
            3'b011 : begin // ANDI
                SelAlu = 4'b0000;
            end
            3'b100 : begin // ORI
                SelAlu = 4'b0001;
            end
            3'b101 : begin // SLTI
                SelAlu = 4'b0111;
            end
        endcase
    end
endmodule
