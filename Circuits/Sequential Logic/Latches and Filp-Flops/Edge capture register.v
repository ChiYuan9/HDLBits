module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] middle;
    always@(posedge clk) begin
        middle <= in;
        if(reset) begin
            out <= 0;
        end
        else begin
            out <= out | (middle & ~in);
        end
    end
endmodule
