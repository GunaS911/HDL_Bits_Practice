module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    reg [5:0] state , next_state;
    parameter A = 0 , B = 1, C = 2, D = 3, E = 4 , F = 5;
    always @(*) begin
        case(state)
            A: next_state = ground ? (dig ? E : (bump_left ? B : A)) : C; 
            B: next_state = ground ? (dig ? F : (bump_right ? A : B)) : D;
            C: next_state = ground ? A : C;
            D: next_state = ground ? B : D;
            E: next_state = ground ? E : C;
            F: next_state = ground ? F : D;
        endcase
    end
    always @(posedge clk or posedge areset)begin
        if(areset)
            state <= A;
        else
            state <= next_state;
    end
    assign walk_left = (state == A);
    assign walk_right = (state == B);
    assign aaah = (state == C || state == D);
    assign digging = (state ==  F || state == E);
endmodule
