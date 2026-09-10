module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(posedge clk, posedge areset) begin    
        if(areset) begin
            state <= B;
        end
        else begin
            state <= next_state;
            if(state == A && in == 1) 
                state  <= A;
            else if (state == A && in ==0)
                state <= B;
            else if(state == B && in == 0)
                state <= A;
            else if (state == B && in == 1)
                state <= B;
        end  
    end
assign out = state;
endmodule

