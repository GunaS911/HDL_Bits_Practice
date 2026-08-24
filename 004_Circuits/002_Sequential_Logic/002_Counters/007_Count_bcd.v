module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = ena[1] && (q[7:4] == 4'd9);
    assign ena[3] = ena[2] && (q[11:8] == 4'd9);
    bcd_counter one (
        .clk(clk),
        .reset(reset),
        .ena(1'b1),
        .q(q[3:0])
    );

    bcd_counter two (
        .clk(clk),
        .reset(reset),
        .ena(ena[1]),
        .q(q[7:4])
    );

    bcd_counter three (
        .clk(clk),
        .reset(reset),
        .ena(ena[2]),
        .q(q[11:8])
    );

    bcd_counter four (
        .clk(clk),
        .reset(reset),
        .ena(ena[3]),
        .q(q[15:12])
    );
endmodule
module bcd_counter(
    input clk,
    input reset,
    input ena,
    output [3:0]q);
    	always @(posedge clk) begin
            if(reset)
                q <= 4'b0;
            else if(ena) begin
                if(q==4'b1001)
                    q<=4'b0000;
         else
                q<=q+4'b0001;
            end
        end
endmodule
