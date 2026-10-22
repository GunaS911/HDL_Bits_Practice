module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A = 1'b0, B = 1'b1;

    reg state;
    reg [1:0] cycle;   
    reg [1:0] ones;    
    reg z_reg;

    assign z = z_reg;

    always @(posedge clk) begin
        if (reset) begin
            state  <= A;
            cycle  <= 2'd0;
            ones   <= 2'd0;
            z_reg  <= 1'b0;
        end
        else begin
            z_reg <= 1'b0;                

            case (state)
                A: begin
                    if (s) state <= B;
                    cycle <= 2'd0;
                    ones  <= 2'd0;
                end

                B: begin
                    if (cycle == 2'd2) begin
                        z_reg <= (ones + w == 2'd2);
                        cycle <= 2'd0;
                        ones  <= 2'd0;
                    end
                    else begin
                        cycle <= cycle + 2'd1;
                        ones  <= ones + w;
                    end
                end
            endcase
        end
    end
endmodule
