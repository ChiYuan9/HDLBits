module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [7:0] Q;
    always@(posedge clk) begin
        if(enable)
            Q = {Q[6:0], S};
    end
    assign Z = A&B&C ? Q[7] :
        A&B&~C ? Q[6] :
        A&~B&C ? Q[5] :
        A&~B&~C ? Q[4] :
        ~A&B&C ? Q[3] :
        ~A&B&~C ? Q[2] :
        ~A&~B&C ? Q[1] : Q[0];
endmodule
