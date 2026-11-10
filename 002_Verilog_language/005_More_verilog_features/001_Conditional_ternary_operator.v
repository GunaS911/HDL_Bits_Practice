module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
   
    wire [7:0]mino;
    wire [7:0]mini;
    assign mino = (a > b) ? b : a;
    assign mini = (c > d) ? d : c;
    assign min = (mino > mini) ? mini : mino;

endmodule

