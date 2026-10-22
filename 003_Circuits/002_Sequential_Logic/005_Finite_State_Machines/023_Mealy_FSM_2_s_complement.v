module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
reg state,next_state;
    parameter S0 = 1, S1 = 0;
    always @(*) begin
        case(state)
            S0 : next_state = x ? S1 : S0;
            S1 : next_state = S1;
        endcase
    end
    always @(posedge clk or posedge areset)begin
        if(areset)
            state <= S0;
        else
            state <= next_state;
    end
    assign z = (state == S0) && x || (state == S1) && ~x;
endmodule

