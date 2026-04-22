module MuxSa1 (
	input [31:0] suma, resta, _or, _and, _slt,
	input [2:0] ALUctl,
	output reg[31:0] R
);

//2. declaracion de wires: NA, regs: SI

//3. cuerpo del modulo, instancias: NA, assigns: NA, Bloque secuencial: SI

always @(ALUctl) // Cualquier asignacion dentro de un bloque secuencial
	begin
		case(ALUctl)
			3'd0: R = suma;
			3'd1: R = resta;
			3'd2: R = _or;
			3'd3: R = _and;
			3'd4: R = _slt;
		endcase
	end

endmodule
