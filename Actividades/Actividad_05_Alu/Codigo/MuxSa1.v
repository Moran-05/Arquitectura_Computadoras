module MuxSa1 (
	input [31:0] suma, resta, _or, _and, _slt,
	input [3:0] ALUctl,
	output reg[31:0] R
);

//2. declaracion de wires: NA, regs: SI

//3. cuerpo del modulo, instancias: NA, assigns: NA, Bloque secuencial: SI

always @(ALUctl) // Cualquier asignacion dentro de un bloque secuencial
	begin
		case(ALUctl)
			4'd0: R = suma;
			4'd1: R = resta;
			4'd2: R = _or;
			4'd3: R = _and;
			4'd4: R = _slt;
		endcase
	end

endmodule
