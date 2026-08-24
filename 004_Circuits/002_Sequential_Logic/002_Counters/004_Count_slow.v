module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @(posedge clk) begin
        if (reset  || q==9 &slowena)
            q<=4'b000;
        else if (~slowena)
            q<=q;
        else
            q<=q+4'b0001;
    end
endmodule
