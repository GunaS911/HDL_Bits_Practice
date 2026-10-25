module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    reg [1:0] state,next_state;
    parameter A = 2'd0,B = 2'd1, C = 2'd2, D = 2'd3;
    always @(*)begin
        if(state == A) begin
            if(r[1])
                next_state = B;
            else if(~r[1]&r[2])
                next_state = C;
            else if(~r[1]&~r[2]&r[3])
                next_state = D;
            else if(~r[1]&~r[2]&~r[3])
                next_state = A;
        end
        if(state == B) begin
            if(r[1])
                next_state = B;
            else if(~r[1])
                next_state = A;
        end
        if(state == C) begin
            if(~r[2])
                next_state = A;
            else if(r[2])
                next_state = C;
        end
        if(state == D) begin
            if(~r[3])
                next_state = A;
            else if(r[3])
                next_state = D;
        end
    end
    always @(posedge clk) begin
        if(!resetn)
            state <= A;
        else
            state <= next_state;
    end    
    assign g[1] = (state == B);
    assign g[2] = (state == C);
    assign g[3] = (state == D);
endmodule

