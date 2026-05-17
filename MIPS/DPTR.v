module DPTR (
    input CLK,
    input RESET
);
//wire
    wire [31:0] InstTR;
    wire [31:0]DIR; // Direccion
    wire [31:0]C1; // DR2
    wire [31:0]C2; // DR1
    wire [31:0]C3; // Result Alu
    wire [3:0]C4; // SelAlu
    wire [31:0]C5; // Salida Mem
    wire [31:0]C6; // Salida Mux
    wire [4:0]C7; //AW
    wire [31:0]C8; //ALU B
    wire [31:0]C9; //SignExtend
    wire [31:0]C10; // Cont + 4
    wire [31:0]CBR;
    wire [31:0]CBR2;
    wire [31:0]CONT;
    wire [31:0]CSHL;
    wire CRD, CRW, CMW, CMR, CMTR, CAS, CZ, CB, CAND, CJ;
    wire [2:0]CA;
//reg
//instancias
//RS = InstTR[25:21];
//RT = InstTR[20:16];
//RD = InstTR[15:11];
    PC pc1(.CLK(CLK), .RESET(RESET), .CONT(CONT), .Inst(DIR));
    MEMI mymemi(.dir(DIR), .DSalida(InstTR));
    BR br(.RegEn(CRW), .AR1(InstTR[25:21]), .AR2(InstTR[20:16]), .AW(C7), .DW(C6), .DR1(C2), .DR2(C1));
    ALUMIPS alu(.A(C2), .B(C8), .Sel(C4), .R(C3), .Zero(CZ));
    ALUCTRL aluctrl(.AluOp(CA), .func(InstTR[5:0]), .SelAlu(C4));
    Mux2a1 muxalu(.A(C9), .B(C1), .UCctl(CAS), .R(C8)); // mux Alusrc
    MEMA mem(.DIR(C3), .WE(CMW), .RE(CMR), .DATA_IN(C1), .DATA_OUT(C5));
    Mux2a1 mux(.A(C5), .B(C3), .UCctl(CMTR), .R(C6)); // mux MemToReg
    UNITCTRL uc(.Op(InstTR[31:26]), .RegDst(CRD), .AluSrc(CAS), .MemToReg(CMTR), .Regwrite(CRW), .MemRead(CMR), .MemWrite(CMW), .Branch(CB), .Jump(CJ), .AluOp(CA));
    Mux2a1_5b muxBR(.mem(InstTR[15:11]), .alu(InstTR[20:16]), .UCctl(CRD), .R(C7));
    SignExtend SignExt(.Inst(InstTR[15:0]), .DataOut(C9));
    ADDER adder1(.A(DIR), .B(32'd4), .R(C10));
    ANDB andb1(.A(CB), .B(CZ), .R(CAND));
    Mux2a1 muxbranch(.A(CBR), .B(C10), .UCctl(CAND), .R(CBR2)); // mux Branch
    Mux2a1 muxjump(.A({C10[31:28], InstTR[25:0], 2'b00}), .B(CBR2), .UCctl(CJ), .R(CONT));
    SHL2 shl1(.A(C9), .R(CSHL));
    ADDER adder2(.A(CSHL), .B(C10), .R(CBR));
endmodule
