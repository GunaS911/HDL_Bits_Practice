module top_module (input a, input b, input c, output out);//
wire outq;
    andgate inst1 (outq,a, b, c,1'b1,1'b1);
    assign out = ~outq;

endmodule

