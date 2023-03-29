module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    wire [16:-1] q_tmp [16:-1];
    always@(posedge clk) begin
        if(load)
            q = data;
        else begin
            for(int i = 0; i <= 15; i++) begin
                q_tmp[i] = {q[16 * i], q[16 * i +: 16], q[16 * i + 15]};
            end
            q_tmp[16] = {q_tmp[0][0], q_tmp[0][15:0], q_tmp[0][15]};
            q_tmp[-1] = {q_tmp[15][0], q_tmp[15][15:0], q_tmp[15][15]};
            for(int i = 0; i <= 15; i++) begin
                for(int j = 0; j <= 15; j++)begin
                    int tmp = 0;
                    tmp = q_tmp[i-1][j-1] + q_tmp[i-1][j] + q_tmp[i-1][j+1] + q_tmp[i][j-1] + q_tmp[i][j+1] + q_tmp[i+1][j-1] + q_tmp[i+1][j] + q_tmp[i+1][j+1];
                    if(tmp <= 1 || tmp > 4)
                        q[i*16 + j] = 0;
                    else if(tmp == 2)
                        q[i*16 + j] = q[i*16 + j];
                    else
                        q[i*16 + j] = 1;
                end
            end
        end
    end
            
endmodule
