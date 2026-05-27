module spi_slave (
    input  wire       sclk,
    input  wire       ss,
    input  wire       mosi,
    output reg        miso,
    input  wire [7:0] data_in,
    output reg  [7:0] data_out,
    output reg        done
);

reg [7:0] tx_reg;
reg [7:0] rx_reg;
reg [2:0] bit_cnt;

// Al seleccionar el slave, cargamos el dato a transmitir
always @(negedge ss) begin
    tx_reg   <= data_in;
    rx_reg   <= 8'b00000000;
    bit_cnt  <= 3'b000;
    miso     <= data_in[7];
    done     <= 1'b0;
end

// En SPI modo 0, MISO cambia en flanco de bajada
always @(negedge sclk) begin
    if (!ss) begin
        tx_reg <= {tx_reg[6:0], 1'b0};
        miso   <= tx_reg[6];
    end
end

// En SPI modo 0, MOSI se captura en flanco de subida
always @(posedge sclk) begin
    if (!ss) begin
        rx_reg <= {rx_reg[6:0], mosi};

        if (bit_cnt == 3'b111) begin
            data_out <= {rx_reg[6:0], mosi};
            done     <= 1'b1;
            bit_cnt  <= 3'b000;
        end else begin
            bit_cnt  <= bit_cnt + 1'b1;
            done     <= 1'b0;
        end
    end
end

endmodule