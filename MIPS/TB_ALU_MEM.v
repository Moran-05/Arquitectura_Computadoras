`timescale 1ns/1ps
module tb_alu_mem;
reg clk;
reg [4:0]DIR;
reg WE;
reg [31:0]DATA_IN1;
reg [31:0]DATA_IN2;
reg [3:0]Sel;
wire [31:0]ALU_DATA_OUT;
wire [31:0]MEMS_DATA_OUT;
wire [31:0]MEMA_DATA_OUT;

ALUMIPS alu (
    .A (DATA_IN1),
    .B (DATA_IN2),
    .Sel (Sel),
    .R (ALU_DATA_OUT)
); 
MEMS mems (
    .CLK (clk),
    .DIR (DIR),
    .WE (WE),
    .DATA_IN (ALU_DATA_OUT),
    .DATA_OUT (MEMS_DATA_OUT)
);
MEMA mema (
    .DIR (DIR),
    .WE (WE),
    .DATA_IN (ALU_DATA_OUT),
    .DATA_OUT (MEMA_DATA_OUT)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    //Escritura en memoria
    #1 clk<=1'b0; DIR<=5'd0; WE<=1'b1; DATA_IN1<=32'd5; DATA_IN2<=32'd3; Sel<=4'b0000;
    #10 clk<=1'b1;
    #10 clk<=1'b0; DIR<=5'd1; WE<=1'b1; DATA_IN1<=32'd5; DATA_IN2<=32'd3; Sel<=4'b0001;
    #10 clk<=1'b1;
    #10 clk<=1'b0; DIR<=5'd2; WE<=1'b1; DATA_IN1<=32'd5; DATA_IN2<=32'd3; Sel<=4'b0010;
    #10 clk<=1'b1;
    #10 clk<=1'b0; DIR<=5'd3; WE<=1'b1; DATA_IN1<=32'd5; DATA_IN2<=32'd3; Sel<=4'b0011;
    #10 clk<=1'b1;
    //Lectura de memoria
    #10 clk<=1'b0; DIR<=5'd0; WE<=1'b0;
    #10 clk<=1'b1;
    #10 clk<=1'b0; DIR<=5'd1; WE<=1'b0;
    #10 clk<=1'b1;
    #10 clk<=1'b0; DIR<=5'd2; WE<=1'b0;
    #10 clk<=1'b1;
    #10 clk<=1'b0; DIR<=5'd3; WE<=1'b0;
    #10 clk<=1'b1;
    $finish;
end
endmodule