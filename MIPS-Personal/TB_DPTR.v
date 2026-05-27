`timescale 1ns/1ns
module TB_DPTR;
reg CLK;
reg RESET;
DPTR mydptr(.CLK(CLK), .RESET(RESET));

initial CLK = 0;
always #(100/2) CLK = ~CLK;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, TB_DPTR);
    RESET = 1'b1;
    #100 RESET = 1'b0;
    mydptr.br.dump_mem();
    #(100 * 14);
    mydptr.br.dump_mem();
    $finish;
end
endmodule
