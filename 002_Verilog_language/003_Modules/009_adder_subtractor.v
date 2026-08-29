module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0]b1;
    assign b1 = b^{32{sub}};
    wire c;
    add16 upper(
        .a(a[15:0]),
        .b(b1[15:0]),
        .sum(sum[15:0]),
        .cin(sub),
        .cout(c)
    );
    
    add16 lower(
        .a(a[31:16]),
        .b(b1[31:16]),
        .sum(sum[31:16]),
        .cin(c),
        .cout()
         );
endmodule

