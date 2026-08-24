module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    wire a,b,c,d;
    assign a = in[0];
    assign b = in[1];
    assign c= in[2];
    assign d = in[3];
    assign out_and = a&b&c&d;
    assign out_or = a|b|c|d;
    assign out_xor = a^b^c^d;
endmodule

