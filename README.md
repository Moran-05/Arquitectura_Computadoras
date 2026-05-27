# Arquitectura de Computadoras

Trabajo escolar para la materia de **Arquitectura de Computadoras**, impartida por el maestro **Jorge Ernesto López Arce Delgado**.

## Estado del proyecto

Proyecto **en desarrollo activo**. Se trata de la implementación progresiva de un procesador **MIPS** en Verilog, construyendo iterativamente el datapath (DPTR) y sus componentes. Cada commit refleja una versión incremental del avance.

## Actividades

El directorio `Actividades/` reúne los ejercicios y prácticas realizados a lo largo del semestre. Cada actividad construye gradualmente los conocimientos necesarios para llegar al diseño del procesador MIPS: desde el manejo del simulador y las compuertas lógicas básicas, pasando por sumadores y la ALU, hasta temas de organización como el ISA, el endianness y el protocolo de comunicación SPI. Cada carpeta incluye, según corresponda, el código en Verilog y la documentación (reporte o captura) entregada.

- `Actividad_01_ModelSim` — Primeros pasos con el simulador **ModelSim** y verificación del entorno de trabajo.
- `Actividad_02_Compuertas_logicas` — Implementación de **compuertas lógicas** básicas en Verilog.
- `Actividad_03_Nibble_8bits` — **Sumador de byte (8 bits)** y su testbench.
- `Actividad_04_Sumadores` — **Sumadores** descritos de forma comportamental e instanciada.
- `Actividad_05_Alu` — Construcción de la **ALU** de MIPS y sus módulos (AND, OR, suma/resta, SLT, multiplexores).
- `Actividad_ISA_Endianness` — Estudio del **ISA** (arquitectura del conjunto de instrucciones) y el **endianness**.
- `Actividad_SPI` — Implementación del protocolo **SPI** (maestro, esclavo y testbench).
- `Actividad_SPI_Inv` — Investigación complementaria sobre el protocolo **SPI**.

## Procesador MIPS

El directorio `MIPS-Personal/` contiene los módulos del procesador desarrollados hasta el momento:

- `DPTR.v` — Datapath principal que integra todos los componentes.
- `ALUMIPS.v` / `ALUCTRL.v` — Unidad Aritmético-Lógica y su control.
- `BR.v` — Banco de Registros.
- `MEMI.v` / `MEMA.v` — Memoria de instrucciones y memoria de datos.
- `PC.v` / `ADDER.v` — Contador de programa y sumador.
- `UNITCTRL.v` — Unidad de Control.
- `Mux2a1.v` / `Mux2a1_5b.v` — Multiplexores (de 32 y de 5 bits).
- `Sign-extend.v` — Extensor de signo.
- `SHL2.v` — Desplazador a la izquierda de 2 bits (para el cálculo de saltos).
- `ANDB.v` — Compuerta AND de 1 bit (control de branch).
- `BUFFER.v` — Registro/buffer sincronizado por flanco de reloj.
- `TB_DPTR.v` — Testbench del datapath.
- `files.f` — Lista de archivos fuente para la compilación.
- `inst.txt` — Programa de instrucciones de prueba.

## Notas

Conforme avance el curso se irán agregando nuevas funcionalidades al procesador (mas instrucciones tipo I, soporte completo del set MIPS, etc.) y refinando los módulos existentes.
