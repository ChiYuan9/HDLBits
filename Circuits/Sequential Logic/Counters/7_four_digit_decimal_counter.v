module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    always@(posedge clk) begin
        q[3:0] = q[3:0] + 1;
        if(ena[1] == 1)
            q[7:4] = q[7:4] +1;
        if(ena[2] == 1)
            q[11:8] = q[11:8] +1;
        if(ena[3] == 1)
            q[15:12] = q[15:12] +1;
        
        if(q[3:0] == 4'ha)
            q[3:0] = 0;
        if(q[7:4] == 4'ha)
            q[7:4] = 0;
        if(q[11:8] == 4'ha)
            q[11:8] = 0;
        if(q[15:12] == 4'ha)
            q[15:12] = 0;
        
        if(reset)
            q = 0;
    end
    assign ena[3] = q[11:8] == 4'h9 && q[7:4] == 4'h9 && q[3:0] == 4'h9;
    assign ena[2] = q[7:4] == 4'h9 && q[3:0] == 4'h9;
    assign ena[1] = q[3:0] == 4'h9;
endmodule
