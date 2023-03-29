module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    wire [512:-1] q_tmp;
    always@(posedge clk) begin
        if(load)
            q = data;
        else begin
            q_tmp = {1'b0, q, 1'b0};
            for(int i = 0; i <= 511; i++) begin
                q[i] = (q_tmp[i] ^ q_tmp[i - 1]) || (~q_tmp[i+1] && q_tmp[i] && q_tmp[i-1]);
            end
        end
    end
endmodule
