module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    parameter shift = 0, shift_not = 1;
    reg state, next_state;
    reg [2:0] data_store;
    always@(*) begin
        next_state = {data_store[2:0], data} == 4'b1101 ? shift : shift_not;
    end
    
    always@(posedge clk) begin
        data_store = {data_store[1:0], data};
        if(reset)begin
            state = shift_not;
            data_store = 0;
        end
        else if(state == shift)
            state = shift;
        else
            state = next_state;
    end
    assign start_shifting = state == shift;
                

endmodule
