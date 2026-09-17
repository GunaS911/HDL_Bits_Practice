module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter A =0, B =1;
    reg state, next_state;

    always @(*) begin
        case(state)
            A : next_state = bump_left ? B : A;
            B : next_state = bump_right ? A : B;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= A;
        else
            state <= next_state;
            
    end

    assign walk_left = (state == A);
    assign walk_right = (state == B);

endmodule

