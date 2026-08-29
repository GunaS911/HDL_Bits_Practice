module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always @(posedge clk) begin
        if (reset)
            q<=4'b0;
        else begin
            if (q[0]&~q[1]&~q[2]&q[3])
                q<=4'b0;
            else
                q<= q + 4'b0001;
        end
    end
endmodule
