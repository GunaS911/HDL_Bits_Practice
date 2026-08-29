module top_module ();
reg clk;
    reg reset;
    reg t;
    wire q;
    tff uut(
        .clk(clk),
        .reset(reset),
        .t(t),
        .q(q)
    );
    always #5 clk = ~clk;
    initial begin
        clk =0;
        t = 1;reset =0;#10;
        t = 0 ; reset =1;#10;
        t = 1;reset =0;#10;
    end
endmodule

