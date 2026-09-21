module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
);
    reg [2:0]state, next_state;
    parameter A =0,B=1,C=2,D=3,E=4,F=5;
    always @(posedge clk) begin
        if(reset)
            state <= F;
        else
            state <= next_state;
    end
    always @(*)begin
        case(state)
            A : begin
                if(~s[3])
                    next_state = B;
                else
                    next_state = A;
            end
            B : begin
                if(s[3])
                    next_state = A;
                else if(~s[2]&~s[3])
                    next_state = D;
                else 
                    next_state = B;
            end
            C : begin
                 if(s[3])
                    next_state = A;
                else if(~s[2]&~s[3])
                    next_state = D;
                else 
                    next_state = C;
            end
            D : begin
                if(s[1]&s[2])
                    next_state = C;
                else if(~s[1]&~s[2]&~s[3])
                    next_state = F;
                else 
                    next_state = D;
            end
          E : begin
              if(s[1]&s[2])
                    next_state = C;
                else if(~s[1]&~s[2]&~s[3])
                    next_state = F;
                else 
                    next_state = E;
            end
         F : begin
             if(s[1])
                    next_state = E;
                else 
                    next_state = F;
            end
        endcase
    end
    assign fr3 = (state == F);
    assign fr2 = (state == F || state == D || state == E);
    assign fr1 = (state == F || state == D || state == E || state == C || state == B);
    assign dfr = (state == F || state == D || state == B);           
endmodule

