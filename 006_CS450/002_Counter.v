module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    reg [1:0] gstate,next_state;
    parameter S = 2'd0 , W = 2'd1 , T = 2'd2 , NT = 2'd3;
    always @(*) begin
        case(gstate)
            S :begin
                if(train_valid)
                    next_state = train_taken ? W : S;
                else
                    next_state = S;
            end
            W :begin
                if(train_valid)
                    next_state = train_taken ? T : S;
                else
                    next_state = W;
            end
            T :begin
                if(train_valid)
                    next_state = train_taken ? NT : W;
                else
                    next_state = T;
            end
            NT :begin
                if(train_valid)
                    next_state = train_taken ? NT : T;
                else
                    next_state = NT;
            end
        endcase
    end
    always @(posedge clk or posedge areset) begin
        if(areset)
            gstate <= W;
        else
            gstate <= next_state;
    end
    assign state = gstate;
endmodule

