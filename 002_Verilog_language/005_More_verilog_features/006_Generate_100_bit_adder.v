module top_module(
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);
    wire [100:0] carry;
    assign carry[0] = cin;
    genvar i;
    generate
        for(i = 0; i < 100; i = i + 1) begin : gen_adders
            adder add(
                a[i],
                b[i],
                carry[i],
                carry[i+1],
                sum[i]
            );
            assign cout[i] = carry[i+1];
        end
    endgenerate
endmodule

module adder(
    input a, b, cin,
    output cout, sum
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule

