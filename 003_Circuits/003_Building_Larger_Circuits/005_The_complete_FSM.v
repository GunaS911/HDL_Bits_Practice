module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    reg [3:0]state,next_state;
parameter S0 = 4'd0 , S1 = 4'd1 , S2 = 4'd2 , S3 = 4'd3 , D0 = 4'd4 , D1 = 4'd5 , D2 = 4'd6 , D3 = 4'd7 , C = 4'd8 , W = 4'd9;
    always @(*) begin
        case(state)
            S0 : next_state = data ? S1 : S0;
            S1 : next_state = data ? S2 : S0;
            S2 : next_state = data ? S2 : S3;
            S3 : next_state = data ? D0 : S0;
            D0 : next_state = D1;
            D1 : next_state = D2;
            D2 : next_state = D3;
            D3 : next_state = C;
            C : begin
                if(done_counting)
                    next_state = W;
                else
                    next_state = C;
            end
            W :begin
                if(ack)
                    next_state = S0;
                else
                    next_state = W;
            end
        endcase
    end
    always @(posedge clk) begin
        if(reset)
            state <= S0;
        else
            state <= next_state;
    end
    assign shift_ena = (state == D0) || (state == D1) || (state == D2) || (state == D3);
    assign counting = (state == C);
    assign done = (state == W) ;
endmodule

