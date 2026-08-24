module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    always @(posedge clk) begin
            if(reset)begin
                hh <= 8'h12;
                mm <= 8'h00;
                ss <= 8'h00;
                pm <= 1'b0;
            end
            else if(ena) begin
                if(ss == 8'h59)begin
                    ss<=8'h00;
                    if(mm == 8'h59)begin
                        mm <=8'h00;
                        if(hh == 8'h12)begin
                            hh<=8'h01;
                        end
                        else if(hh == 8'h11)begin
                            pm<=~pm;
                            hh <= hh + 8'h01;
                        end
                        else if(hh[3:0] == 4'h9)begin
                            hh <= hh + 8'h07;
                        end
                        else begin
                            hh <= hh +8'h01;
                        end
                    end
                        else if(mm[3:0] == 4'h9)begin
                            mm <= mm + 8'h07;
                        end
                        else begin
                            mm <= mm + 8'h01;
                        end
                end
                        else if(ss[3:0] == 4'h9) begin
                            ss <= ss+8'h07;
                        end
                        else begin
                            ss <= ss+8'h01;
                        end
                    end
                end
endmodule
                            
