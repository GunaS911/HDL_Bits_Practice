module top_module(
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    
    reg [6:1] yq,Y;
    parameter A = 6'b000001 , B = 6'b000010 , C = 6'b000100 , D = 6'b001000 , E = 6'b010000, F = 6'b100000;
    always @(*) begin
        yq = y;
        Y[6] = yq[4] & ~w; 
        Y[5] = (yq[5] & ~w) |(yq[3] & w); 
        Y[4] = (yq[5] & w) |(yq[6] & w) | (yq[2] & w) | (yq[3] & w); 
        Y[3] = (yq[6] & ~w) |(yq[2] & ~w); 
        Y[2] = (yq[1] & ~w); 
        Y[1] = (yq[1] & w) |(yq[4] & w); 
    end
    assign Y2 = Y[2];
    assign Y4 = Y[4];
endmodule

