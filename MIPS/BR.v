module BR (
    input RegEn,
    input [4:0]AR1,
    input [4:0]AR2,
    input [4:0]AW,
    input [31:0]DW,
    output reg[31:0]DR1,
    output reg[31:0]DR2
);
    
    reg [31:0]mem[0:31];
    initial begin
        mem[0] = 8'd10; mem[1] = 8'd20;
        mem[2] = 8'd30; mem[3] = 8'd40;
        //$readmemb("Banco.txt", mem);
    end
    always @* begin
        DR1 = mem[AR1];
        DR2 = mem[AR2];
        if (RegEn) begin
            mem[AW] = DW;
        end
    end

endmodule