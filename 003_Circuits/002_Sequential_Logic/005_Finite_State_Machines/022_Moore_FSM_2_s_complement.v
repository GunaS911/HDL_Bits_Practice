module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    reg [1:0]state,next_state;
    parameter S0 = 0, S1 = 1 , S3=3,S2=2;
    always @(*) begin
        case(state)
            S0 : next_state = x ? S1 : S0;
            S1 : next_state = x ? S3 : S2;
            S2 : next_state = x ? S3 : S2;
            S3 : next_state = x ? S3 : S2;
        endcase
    end
    always @(posedge clk or posedge areset)begin
        if(areset)
            state <= S0;
        else
            state <= next_state;
    end
            assign z = (state == S2) || (state == S1);
endmodule

