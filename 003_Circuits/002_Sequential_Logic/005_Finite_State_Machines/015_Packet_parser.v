module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    reg [1:0]state , next_state;
    parameter A = 0,B = 1,C =2,D=3;
    always @(posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    always @(*) begin
        case(state)
            A : next_state = in[3] ? B : A;
            B : next_state = in[3] ? C : C;
            C : next_state = in[3] ? D : D;
            D : next_state = in[3] ? B : A;
        endcase
    end
    assign done = (state == D);
endmodule

