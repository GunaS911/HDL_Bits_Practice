module top_module (
    input [4:1] x, 
    output f );
    wire a,b,c,d;
    assign a = x[1];
    assign b = x[2];
    assign c = x[3];
    assign d = x[4];
assign f = ~a&c | b&d; 
endmodule

