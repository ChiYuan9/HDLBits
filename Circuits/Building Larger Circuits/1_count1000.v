module top_module (
    input clk,
    input reset,
    output [9:0] q);
    always@(posedge clk) begin
        if(reset || q == 10'd999)
            q = 0;
        else begin
            q = q + 1;
        end
    end

endmodule
