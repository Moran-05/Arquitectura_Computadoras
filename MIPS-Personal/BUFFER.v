module BUFFER (
    input clk,
    input A,
    output reg B
);

always @(posedge clk) begin
    B <= A;
end

endmodule
