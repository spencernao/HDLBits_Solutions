module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF DFF3(KEY[0],KEY[3],SW[3],KEY[1],KEY[2],LEDR[3]);
	generate
        genvar i;
        for(i=0;i<3;i++)begin:MUXDFF
            MUXDFF DFFS(KEY[0],LEDR[i+1],SW[i],KEY[1],KEY[2],LEDR[i]);
        end
    endgenerate
    
endmodule

module MUXDFF (   
    input clk,
    input w, R, E, L,
    output Q
);
    always@(posedge clk)
        Q <= L? R : E? w : Q;

endmodule
