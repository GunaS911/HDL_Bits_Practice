module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [2:0]c;
    fa add0(
        .x(x[0]),
        .y(y[0]),
        .sum(sum[0]),
        .cin(0),
        .cout(c[0])
    );
    fa add1(
        .x(x[1]),
        .y(y[1]),
        .sum(sum[1]),
        .cin(c[0]),
        .cout(c[1])
    );
    fa add2(
        .x(x[2]),
        .y(y[2]),
        .sum(sum[2]),
        .cin(c[1]),
        .cout(c[2])
    );
    fa add3(
        .x(x[3]),
        .y(y[3]),
        .sum(sum[3]),
        .cin(c[2]),
        .cout(sum[4])
    );
endmodule
    module fa(input x,y ,cin ,
              output sum,cout);
        assign sum = x^y^cin;
        assign cout = x&y | x&cin | y&cin;
    endmodule

