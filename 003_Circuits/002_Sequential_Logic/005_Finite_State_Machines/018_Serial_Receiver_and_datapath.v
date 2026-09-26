module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
    reg [7:0] out;
    reg [4:0]state,next_state;
parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6, H = 7,I = 8, J = 9,K = 10,L = 11;
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
            J : next_state = in ? K : L;
            K : next_state = in ? A : B;
            L : next_state = in ? A : L;
        endcase
    end
    always @(posedge clk) begin
        if(reset)
            state <= A;
        else begin
            state <= next_state;
            case(state)
                B : out[0] <= in;
                C : out[1] <= in;
                D : out[2] <= in;
                E : out[3] <= in;
                F : out[4] <= in;
                G : out[5] <= in;
                H : out[6] <= in;
                I : out[7] <= in;
            endcase
        end
    end
    assign out_byte = out;
    assign done = (state == K);
endmodule
