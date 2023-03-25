module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    always @(posedge clk) begin
        if(ena) begin
            ss[3:0] = ss[3:0] + 1;
            ss[7:4] = ss[3:0] == 4'ha ? ss[7:4] + 1 : ss[7:4];
            mm[3:0] = (ss[7:4] == 4'h6 && ss[3:0] == 4'ha) ? mm[3:0] + 1 : mm[3:0];
            mm[7:4] = (mm[3:0] == 4'ha && ss[7:4] == 4'h6 && ss[3:0] == 4'ha) ? mm[7:4] + 1 : mm[7:4];
            hh[3:0] = (mm[7:4] == 4'h6 && mm[3:0] == 4'ha && ss[7:4] == 4'h6 && ss[3:0] == 4'ha) ? hh[3:0] + 1 : hh[3:0];
            hh[7:4] = (hh[3:0] == 4'ha && mm[7:4] == 4'h6 && mm[3:0] == 4'ha && ss[7:4] == 4'h6 && ss[3:0] == 4'ha) ? hh[7:4] + 1 : hh[7:4];
            pm = (hh[7:4] == 4'h1 && hh[3:0] == 4'h2 && mm[7:4] == 4'h6 && mm[3:0] == 4'ha && ss[7:4] == 4'h6 && ss[3:0] == 4'ha) ? ~pm : pm;
            
            ss[3:0] = ss[3:0] == 4'ha ? 4'h0 : ss[3:0];
            ss[7:4] = ss[7:4] == 4'h6 ? 4'h0 : ss[7:4];
            mm[3:0] = mm[3:0] == 4'ha ? 4'h0 : mm[3:0];
            mm[7:4] = mm[7:4] == 4'h6 ? 4'h0 : mm[7:4];
            

            hh[7:0] = (hh[7:0] == 8'h13) ? 8'h01 : (hh[3:0] == 4'ha) ? 8'h10 : hh[7:0];
        end
            
        if(reset) begin
            ss = 0;
        	mm = 0;
        	hh = 8'h12;
        	pm = 0;
        end
    end
            
endmodule
