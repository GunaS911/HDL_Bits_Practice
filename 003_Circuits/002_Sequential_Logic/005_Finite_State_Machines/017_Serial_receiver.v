module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
parameter A = 0,B =1, C= 2,D =3,E=4,F=5,G=6,H=7,I=8,J=9,K =10,L=11;
    reg [4:0] state,next_state;
    always @(*) begin
        case(state)
            A : next_state = in ? A : B;
            B : next_state = C;
            C : next_state = D;
            D : next_state = E;
            E : next_state = F;
            F : next_state = G;
            G : next_state = H;
            H : next_state = I;
            I : next_state = J;
            J : next_state = in ? K :L;
            K : next_state = in ? A : B;
            L : next_state = in ? A : L;
        endcase
    end
    always@(posedge clk)begin
        if(reset)
            state <= A;
        else
            state<=next_state;
    end
    assign done = (state == K) ;
endmodule

