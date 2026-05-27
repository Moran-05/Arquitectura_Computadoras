`timescale 1ns / 1ps

module spi_tb();

    // Señales del Reloj y Control
    reg clk;
    reg rst;
    reg start;
    
    // Datos
    reg [7:0] master_data_in;
    wire [7:0] master_data_out;
    wire master_done;
    
    reg [7:0] slave_data_in;
    wire [7:0] slave_data_out;
    wire slave_done;

    // Líneas del Bus SPI
    wire sclk, ss, mosi, miso;

    // Instancia del Master
    spi_master master_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .data_in(master_data_in),
        .data_out(master_data_out),
        .done(master_done),
        .sclk(sclk),
        .ss(ss),
        .mosi(mosi),
        .miso(miso)
    );

    // Instancia de TU Slave
    spi_slave slave_inst (
        .sclk(sclk),
        .ss(ss),
        .mosi(mosi),
        .miso(miso),
        .data_in(slave_data_in),
        .data_out(slave_data_out),
        .done(slave_done)
    );

    // Generador de Reloj del Sistema (100MHz aprox)
    always #5 clk = ~clk;

    initial begin
        // Inicialización general
        clk = 0;
        rst = 1;
        start = 0;
        
        #20 rst = 0; // Soltamos el reset
        
        // ====== Prueba 1: Master envía 165, Slave responde 60 ======
        #20;
        master_data_in = 8'd165;  // 10100101
        slave_data_in = 8'd60;    // 00111100
        start = 1;
        #10 start = 0;
        
        wait(master_done);
        #50;
        $display("Prueba 1:");
        $display("  Master envió: %d (0x%h), Recibió: %d (0x%h)", master_data_in, master_data_in, master_data_out, master_data_out);
        $display("  Slave recibió: %d (0x%h), Tenía listo: %d (0x%h)", slave_data_out, slave_data_out, slave_data_in, slave_data_in);
        
        // ====== Prueba 2: Master envía 255, Slave responde 0 ======
        #20;
        master_data_in = 8'd255;  // 11111111
        slave_data_in = 8'd0;     // 00000000
        start = 1;
        #10 start = 0;
        
        wait(master_done);
        #50;
        $display("Prueba 2:");
        $display("  Master envió: %d (0x%h), Recibió: %d (0x%h)", master_data_in, master_data_in, master_data_out, master_data_out);
        $display("  Slave recibió: %d (0x%h), Tenía listo: %d (0x%h)", slave_data_out, slave_data_out, slave_data_in, slave_data_in);
        
        // ====== Prueba 3: Master envía 85, Slave responde 170 ======
        #20;
        master_data_in = 8'd85;   // 01010101
        slave_data_in = 8'd170;   // 10101010
        start = 1;
        #10 start = 0;
        
        wait(master_done);
        #50;
        $display("Prueba 3:");
        $display("  Master envió: %d (0x%h), Recibió: %d (0x%h)", master_data_in, master_data_in, master_data_out, master_data_out);
        $display("  Slave recibió: %d (0x%h), Tenía listo: %d (0x%h)", slave_data_out, slave_data_out, slave_data_in, slave_data_in);
        
        // ====== Prueba 4: Master envía 18, Slave responde 52 ======
        #20;
        master_data_in = 8'd18;   // 00010010
        slave_data_in = 8'd52;    // 00110100
        start = 1;
        #10 start = 0;
        
        wait(master_done);
        #50;
        $display("Prueba 4:");
        $display("  Master envió: %d (0x%h), Recibió: %d (0x%h)", master_data_in, master_data_in, master_data_out, master_data_out);
        $display("  Slave recibió: %d (0x%h), Tenía listo: %d (0x%h)", slave_data_out, slave_data_out, slave_data_in, slave_data_in);
        
        #50;
        $display("Todas las pruebas completadas.");
        $finish;
    end

endmodule