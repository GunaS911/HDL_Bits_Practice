module top_module(
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging
);

    reg [4:0] count;
    reg [5:0] state, next_state;

    parameter A = 0,
              B = 1,
              C = 2,
              D = 3,
              E = 4,
              F = 5,
              G = 6;
    always @(*) begin
        case(state)
            A: begin
                if (ground) begin
                    if (dig)
                        next_state = E;
                    else if (bump_left)
                        next_state = B;
                    else
                        next_state = A;
                end
                else
                    next_state = C;
            end
            B: begin
                if (ground) begin
                    if (dig)
                        next_state = F;
                    else if (bump_right)
                        next_state = A;
                    else
                        next_state = B;
                end
                else
                    next_state = D;
            end
            C: begin
                if (ground) begin
                    if (count > 5'd19)
                        next_state = G;
                    else
                        next_state = A;
                end
                else
                    next_state = C;
            end
            D: begin
                if (ground) begin
                    if (count > 5'd19)
                        next_state = G;
                    else
                        next_state = B;
                end
                else
                    next_state = D;
            end
            E: begin
                next_state = ground ? E : C;
            end
            F: begin
                next_state = ground ? F : D;
            end
            G: begin
                next_state = G;
            end

        endcase
    end
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= A;
            count <= 5'd0;
        end
        else begin
            state <= next_state;

            if (state == C || state == D) begin
                if (count < 5'd21)
                    count <= count + 5'd1;
                else
                    count <= count;
            end
            else begin
                count <= 5'd0;
            end
        end
    end
    assign walk_left  = (state == A);
    assign walk_right = (state == B);
    assign aaah       = (state == C || state == D);
    assign digging    = (state == E || state == F);

endmodule
