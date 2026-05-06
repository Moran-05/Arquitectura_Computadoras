# Arquitectura de Computadoras

Trabajo escolar para la materia de **Arquitectura de Computadoras**, impartida por el maestro **Jorge Ernesto López Arce Delgado**.

## Estado del proyecto

Proyecto **en desarrollo activo**. Se trata de la implementación progresiva de un procesador **MIPS** en Verilog, construyendo iterativamente el datapath (DPTR) y sus componentes. Cada commit refleja una versión incremental del avance.

## Contenido

El directorio `MIPS/` contiene los módulos del procesador desarrollados hasta el momento:

- `DPTR.v` — Datapath principal que integra todos los componentes.
- `ALUMIPS.v` / `ALUCTRL.v` — Unidad Aritmético-Lógica y su control.
- `BR.v` — Banco de Registros.
- `MEMI.v` / `MEMA.v` — Memoria de instrucciones y memoria de datos.
- `PC.v` / `ADD.v` — Contador de programa y sumador.
- `UNITCTRL.v` — Unidad de Control.
- `Mux2a1.v` / `Mux2a1_5b.v` — Multiplexores.
- `Sign-extend.v` — Extensor de signo.
- `TB_DPTR.v` — Testbench del datapath.
- `inst.txt` — Programa de instrucciones de prueba.

## Notas

Conforme avance el curso se irán agregando nuevas funcionalidades al procesador (instrucciones tipo branch, jump, soporte completo del set MIPS, etc.) y refinando los módulos existentes.
