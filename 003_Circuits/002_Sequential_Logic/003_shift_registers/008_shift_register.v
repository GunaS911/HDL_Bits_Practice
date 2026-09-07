module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    MUXDFF one(
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
        .w(KEY[3]),
        .Q(LEDR[3]),
        .R(SW[3])
    );
      MUXDFF two(
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
          .w(LEDR[3]),
          .Q(LEDR[2]),
          .R(SW[2])
    );
      MUXDFF three(
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
          .w(LEDR[2]),
          .Q(LEDR[1]),
          .R(SW[1])
    );
      MUXDFF four(
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
          .w(LEDR[1]),
          .Q(LEDR[0]),
          .R(SW[0])
    );

endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output reg Q
);
    always @(posedge clk) begin
        if(E) begin
            if (L)
                Q <= R;
            else
                Q<=w; 
        end
        else begin
            if (L)
                Q <= R;
            else
                Q<=Q;
        end
    end       
endmodule
