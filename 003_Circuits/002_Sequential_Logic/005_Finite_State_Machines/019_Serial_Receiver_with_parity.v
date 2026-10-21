module top_module(
    input clk,
    input in,
    input reset,
    output reg [8:0] out_byte,
    output reg done
);

    localparam IDLE       = 3'd0,
               DATA       = 3'd1,
               PARITY     = 3'd2,
               STOP       = 3'd3,
               WAIT_STOP  = 3'd4;

    reg [2:0] state;
    reg [2:0] bit_count;
    reg parity_xor;

    always @(posedge clk) begin
        if (reset) begin
            state      <= IDLE;
            bit_count  <= 3'd0;
            parity_xor <= 1'b0;
            out_byte   <= 9'd0;
            done       <= 1'b0;
        end else begin
            // done is a one-cycle pulse
            done <= 1'b0;

            case (state)

                IDLE: begin
                    if (in == 1'b0) begin
                        state      <= DATA;
                        bit_count  <= 3'd0;
                        parity_xor <= 1'b0;
                    end
                end

                DATA: begin
                    out_byte[bit_count] <= in;
                    parity_xor <= parity_xor ^ in;

                    if (bit_count == 3'd7)
                        state <= PARITY;
                    else
                        bit_count <= bit_count + 1'b1;
                end

                PARITY: begin
                    out_byte[8] <= in;
                    parity_xor <= parity_xor ^ in;

                    // Include the parity bit in the odd-parity check.
                    if (parity_xor ^ in)
                        state <= STOP;
                    else
                        state <= WAIT_STOP;
                end

                STOP: begin
                    if (in == 1'b1) begin
                        done  <= 1'b1;
                        state <= IDLE;
                    end else begin
                        state <= WAIT_STOP;
                    end
                end

                WAIT_STOP: begin
                    // Recover only after the line becomes high.
                    if (in == 1'b1)
                        state <= IDLE;
                end

                default: state <= IDLE;

            endcase
        end
    end

endmodule
