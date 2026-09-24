module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    reg [1:0]state , next_state;
    parameter A = 0,B = 1,C =2,D=3;
    reg[7:0] byte1,byte2,byte3;
    always @(posedge clk) begin
        if(reset)begin
            state <= A;
            byte1 <= 0;
            byte2 <= 1;
            byte3 <= 0;
        end
        else begin
            state <= next_state;
            case(state)
                A:begin
                    if(in[3])
                        byte1 <= in;
                end
                B:byte2 <= in;
                C:byte3 <= in;
                D:begin
                    if(in[3])
                        byte1 <= in;
                end
            endcase
        end             
    end
    always @(*) begin
        case(state)
            A : next_state = in[3] ? B : A;
            B : next_state = in[3] ? C : C;
            C : next_state = in[3] ? D : D;
            D : next_state = in[3] ? B : A;
        endcase
    end
    assign out_bytes = {byte1 ,byte2,byte3};
    assign done = (state == D);
endmodule

