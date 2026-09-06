module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0]q,d;
    always @(posedge clk) begin
        if(!resetn)
            q<=0;
        else begin
            q[0] <= in;
            q[1] <= q[0];
            q[2] <= q[1];
            q[3] <= q[2];
        end
    end
    assign out = q[3];
endmodule
