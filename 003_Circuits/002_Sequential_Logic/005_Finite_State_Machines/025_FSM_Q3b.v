module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    reg [2:0] y,Y;
    parameter S0 = 3'b000 , S1 = 3'b001 , S2 = 3'b010 , S3 = 3'b011 , S4 = 3'b100;
    always @(*) begin
        case(y)
            S0 : Y = x ? S1 : S0;
            S1 : Y = x ? S4 : S1;
            S2 : Y = x ? S1 : S2;
            S3 : Y = x ? S2 : S1;
            S4 : Y = x ? S4 : S3;
            default : 
                Y = S4;
        endcase
    end
    always @(posedge clk) begin
        if(reset)
            y <= S0;
        else
            y <= Y;
    end
    assign z = (y == S3 || y == S4); 
endmodule

