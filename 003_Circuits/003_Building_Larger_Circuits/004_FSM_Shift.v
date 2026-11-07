module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    reg [2:0]state, next_state;
    parameter A = 3'b0 , B = 3'd1 , C = 3'd2 , D = 3'd3 ,E = 3'd4;
    always @(*) begin
        case(state)
            A : next_state = B;
            B : next_state = C;
            C : next_state = D;
            D : next_state = E;
            E : next_state = E;
            default :
                next_state = E;
        endcase
    end
    always @(posedge clk) begin
        if(reset)
          state <= A;
        else
            state <= next_state;
    end
    assign shift_ena = ~(state == E);
endmodule

