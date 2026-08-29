module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c;
    wire [15:0]s1,s2;
    add16 sel(
        .a(a[15:0]),
        .b(b[15:0]),
        .sum(sum[15:0]),
        .cin(1'b0),
        .cout(c)
    );
    
    add16 a1(
        .a(a[31:16]),
        .b(b[31:16]),
        .sum(s1),
        .cin(1'b0),
        .cout()
    );
    add16 b1(
        .a(a[31:16]),
        .b(b[31:16]),
        .sum(s2),
        .cin(1'b1),
        .cout()
    );
    assign sum[31:16] = c ? s2:s1;
endmodule

