module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter A = 0,B = 1,C = 2 , D = 3;
    reg [3:0] state , next_state;
    always @(*) begin
        case(state)
            A : next_state = ground ? (bump_left ? B : A) : C;
            B : next_state = ground ? (bump_right ? A : B) : D;
            C : next_state = ground ? A : C;
            D: next_state = ground ? B : D; 
        endcase
    end
    always @(posedge clk or posedge areset) begin
        if(areset)
            state <= A;
        else
            state <= next_state;
    end
    assign aaah = (state == C || state == D);
    assign walk_left = (state == A);
    assign walk_right = (state == B);
endmodule

