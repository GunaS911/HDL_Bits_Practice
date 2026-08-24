module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always @(posedge clk) begin
        if (reset || q==10)
            q<=4'b001;
        else
            q<= q + 4'b0001;
    end
endmodule

