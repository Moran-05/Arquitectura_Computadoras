`timescale 1ns/1ps
module TB_byte_adder ();

reg [7:0] a;
reg [7:0] b;
wire [8:0] c;

byte_adder(.a(a[7:0]), .b(b[7:0]), .c(c[8:0]));

initial begin
    a = 8'd150;
    b = 8'd30;
    #100;
    a = 8'd200;
    b = 8'd10;
    #100;
    a = 8'd98;
    b = 8'd78;
    #100;
    a = 8'd35;
    b = 8'd47;
    #100;
    $stop;
end
    
endmodule