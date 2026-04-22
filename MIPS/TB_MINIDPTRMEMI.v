`timescale 1ns/1ps
module tb_alu_mem;
reg [31:0]ADRESS;
reg [31:0]SelAlu;
reg regWrite;
wire [31:0]InstTR;

minimini mymini(.InstTR(InstTR), .SelAlu(SelAlu), .regWrite(regWrite));
MEMI mymemi(.dir(ADRESS), .DSalida(InstTR));

initial begin
    //Escritura en memoria
    #1 regWrite<=0; ADRESS<=32'd0; SelAlu<=4'b0000;
    #10 regWrite<=1; SelAlu<=4'b0010;
    #10 regWrite<=0;
    #10 ADRESS<=32'd4;
    //Lectura de memoria
    $finish;
end
endmodule