module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    reg [1:0] state,next_state;
    parameter S0 = 0,S1 = 1, S2 =2;
    always @(*) begin
        case(state)
            S0 : next_state = x ? S1 : S0;
            S1 : next_state = x ? S1 : S2;
            S2 : next_state = x ? S1 : S0;
            default :
                next_state = S0;
        endcase
        if(state == S2 && x == 1)
            z = 1;
        else
            z = 0;
    end
    always @(posedge clk or negedge aresetn) begin
        if(!aresetn)
            state <= S0;
        else
            state <=next_state;
    end
    
endmodule

