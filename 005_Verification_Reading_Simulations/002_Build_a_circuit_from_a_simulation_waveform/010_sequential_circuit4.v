module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
assign q = a ^ b ^ state;
    always @ (posedge clk) begin
        if(state == 1'b0)
            state <= a&b;
        else
            state <= a|b;
    end
endmodule

