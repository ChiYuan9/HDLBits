module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        if(j & k)
            next_state = state==ON ? OFF : ON;
        else if(j)
            next_state = ON;
        else if(k)
            next_state = OFF;
        else
            next_state = state;
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state = OFF;
        else
            state = next_state;
    end

    assign out = state == ON ? 1 : 0; 
    // Output logic
    // assign out = (state == ...);

endmodule
