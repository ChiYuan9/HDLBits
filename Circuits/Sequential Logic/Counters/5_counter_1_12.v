module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    always@(posedge clk) begin
        if(reset | (Q == 4'hc & enable)) 
            Q <= 1;
        else if(enable)
            Q <= Q + 1;
    end
    
    always @(*) begin
        if(reset | (Q == 12 & c_enable))
            c_load <= 1;
        else
            c_load <= 0;
    end
    assign c_enable = enable;
    assign c_d = c_load ? 1 : 0;
    count4 the_counter (clk, c_enable, c_load, c_d /*, ... */ );

endmodule
