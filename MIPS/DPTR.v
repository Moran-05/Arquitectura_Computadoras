module DPTR (
    input [31:0]InstTR
);
//wire
    wire [31:0]C1;
    wire [31:0]C2;
    wire [31:0]C3;
    wire [4:0]C4;
    wire [31:0]C5;
    wire [31:0]C6;
//reg
//instancias
//RS = InstTR[25:21];
//RT = InstTR[20:16];
//RD = InstTR[15:11];
    BR br(.Regen(0), .AR1(InstTR[25:21]), .AR2(InstTR[20:16]), .AW(InstTR[15:11]), .DW(C6), .DR1(C2), .DR2(C1));
    ALUMIPS alu(.A(C2), .B(C1), .Sel(C4), .R(C3));
    MEMA mem(.DIR(C3), .WE(0), .RE(0), .DATA_IN(C1), .DATA_OUT(C5));
    Mux2a1 mux(.mem(C5), .alu(C3), .UCctl(0), .R(C6));

endmodule