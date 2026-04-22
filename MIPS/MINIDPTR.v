module minimini (
    input [31:0]InstTR,
    input [3:0]SelAlu,
    input regWrite
);
//wire
    wire [31:0]C1;
    wire [31:0]C2;
    wire [31:0]C3;
//reg
//instancias
//RS = InstTR[25:21];
//RT = InstTR[20:16];
//RD = InstTR[15:11];
    BR br(.Regen(regWrite), .AR1(InstTR[25:21]), .AR2(InstTR[20:16]), .AW(InstTR[15:11]), .DW(C3), .DR1(C2), .DR2(C1));
    ALUMIPS alu(.A(C2), .B(C1), .Sel(SelAlu), .R(C3));

endmodule