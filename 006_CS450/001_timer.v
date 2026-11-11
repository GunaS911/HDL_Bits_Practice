module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg [9:0]q;
    always @(posedge clk) begin
        if(load)
            q <= data;
        else if(~load & q)
            q <= q - 10'd1;
    end
    assign tc = (q == 10'd0);
endmodule

