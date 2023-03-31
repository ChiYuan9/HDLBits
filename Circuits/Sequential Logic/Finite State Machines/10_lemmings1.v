module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    // parameter LEFT=0, RIGHT=1, ...
    parameter Left = 0, Right = 1;
    reg state, next_state;

    always @(*) begin
        // State transition logic
        if(bump_left)
            next_state = Right;
        if(bump_right)
            next_state = Left;
        if(bump_left && bump_right)
            next_state = ~state;
        if(~bump_left && ~bump_right)
            next_state = state;
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state = Left;
        else begin
            state = next_state;
        end
    end
    // Output logic
    assign walk_left = (state == Left);
    assign walk_right = (state == Right);

endmodule
