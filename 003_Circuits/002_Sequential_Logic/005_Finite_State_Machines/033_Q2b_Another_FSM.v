module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
);

    parameter A    = 4'd0, 
              F1   = 4'd1, 
              X0   = 4'd2, 
              X1   = 4'd3, 
              X10  = 4'd4, 
              G1   = 4'd5, 
              G2   = 4'd6, 
              GP   = 4'd7,  
              GN   = 4'd8;  

    reg [3:0] state, next_state;

    always @(posedge clk) begin
        if (!resetn)
            state <= A;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            A:   next_state = F1;                 
            F1:  next_state = X0;
            X0:  next_state = x ? X1 : X0;
            X1:  next_state = x ? X1 : X10;
            X10: next_state = x ? G1 : X0;
            G1:  next_state = y ? GP : G2;
            G2:  next_state = y ? GP : GN;
            GP:  next_state = GP;
            GN:  next_state = GN;
            default: next_state = A;
        endcase
    end

    assign f = (state == F1);
    assign g = (state == G1) || (state == G2) || (state == GP);

endmodule
