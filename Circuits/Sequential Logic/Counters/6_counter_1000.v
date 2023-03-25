module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    reg [3:0] c0,c1,c2;
    bcdcount c10 (clk, reset, c_enable[0], c0);
    bcdcount c100(clk, reset, c_enable[1], c1);
    bcdcount c1000(clk, reset, c_enable[2], c2);
    assign c_enable = {c0 == 4'h9 && c1 == 4'h9, c0 == 4'h9, 1'b1};
    assign OneHertz = c2 == 4'h9 && c1 == 4'h9 && c0 == 4'h9;
        

endmodule
