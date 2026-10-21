module top_module(
    input clk,
    input reset,
    input in,
    output disc,
    output flag,
    output err
);

    reg [3:0] state, next_state;

    localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3,
               S4 = 4, S5 = 5, S6 = 6,
               DISC = 7, FLG = 8, ERR = 9;

    always @(*) begin
        next_state = state;

        case (state)
            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S2 : S0;
            S2: next_state = in ? S3 : S0;
            S3: next_state = in ? S4 : S0;
            S4: next_state = in ? S5 : S0;
            S5: next_state = in ? S6 : DISC;
            S6: next_state = in ? ERR : FLG;
            DISC: next_state = in ? S1 : S0;
            FLG:  next_state = in ? S1 : S0;
            ERR:  next_state = in ? ERR : S0;

            default: next_state = S0;
        endcase
    end

    always @(posedge clk) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    assign disc = (state == DISC);
    assign flag = (state == FLG);
    assign err  = (state == ERR);

endmodule
