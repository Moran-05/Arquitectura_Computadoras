module MEMA (
    input [4:0]DIR,
    input WE,
    input [31:0]DATA_IN,
    output reg [31:0]DATA_OUT
);
    reg [31:0]mem[0:31];
    always @* begin
        if (WE) begin
            mem[DIR] <= DATA_IN;
        end
        DATA_OUT <= mem[DIR];
    end
endmodule