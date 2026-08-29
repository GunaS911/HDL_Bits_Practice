module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]q;
    always @(posedge clk)begin
        if (reset) begin
            out <= 32'b0;
        	q <= in;
        end
        else begin
            q <= in;
        	out <= out | (~in & q);
        end
    end
endmodule

