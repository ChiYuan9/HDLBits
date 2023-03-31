module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    always@(posedge clk) begin
        if(a&b)
            state = 1;
        else if(a | b)
            state = state;
        else
            state = 0;
    end
    assign q = state ? a^~b : a^b;
endmodule
