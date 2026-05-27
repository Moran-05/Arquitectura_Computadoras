module spi_master (
    input  wire clk,
    input  wire rst,
    input  wire start,
    input  wire [7:0] data_in,
    output reg  [7:0] data_out,
    output reg  done,

    output reg  sclk,
    output reg  ss,
    output reg  mosi,
    input  wire miso
);

reg [7:0] tx_reg;
reg [7:0] rx_reg;
reg [3:0] bit_cnt;
reg [7:0] clk_div;
reg [1:0] state;

parameter CLK_DIV_VAL = 8'd25;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state   <= 0;
        ss      <= 1'b1;
        sclk    <= 1'b0;
        done    <= 1'b0;
        bit_cnt <= 0;
        clk_div <= 0;
        mosi    <= 1'b0;
        tx_reg  <= 8'd0;
        rx_reg  <= 8'd0;
    end else begin
        case (state)
            0: begin // IDLE
                done <= 1'b0;
                ss   <= 1'b1;
                sclk <= 1'b0;

                if (start) begin
                    ss      <= 1'b0;         
                    state   <= 1;
                    bit_cnt <= 0;
                    clk_div <= 0;
                    tx_reg  <= data_in;
                    rx_reg  <= 8'd0;
                    mosi    <= data_in[7];   
                end
            end

            1: begin // TRANSFER
                if (clk_div == CLK_DIV_VAL) begin
                    clk_div <= 0;

                    if (sclk == 1'b0) begin
                        // Flanco ascendente: capturar dato (modo 0)
                        sclk   <= 1'b1;
                        rx_reg <= {rx_reg[6:0], miso};

                        if (bit_cnt == 3'd7) begin
                            state    <= 2;
                            done     <= 1'b1;
                            data_out <= {rx_reg[6:0], miso};
                        end
                    end else begin
                        // Flanco descendente: preparar siguiente bit
                        sclk <= 1'b0;

                        if (bit_cnt != 3'd7) begin
                            bit_cnt <= bit_cnt + 1'b1;
                            tx_reg  <= {tx_reg[6:0], 1'b0};
                            mosi    <= tx_reg[6];
                        end
                    end
                end else begin
                    clk_div <= clk_div + 1'b1;
                end
            end

            2: begin // CLEANUP
                sclk  <= 1'b0;
                ss    <= 1'b1;
                state <= 0;
            end
        endcase
    end
end

endmodule