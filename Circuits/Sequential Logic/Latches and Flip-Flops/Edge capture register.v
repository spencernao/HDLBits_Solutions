module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] cache_in,cache_out;
    always@(posedge clk)begin
        cache_in <= in;
        out<=reset?0: ~in&cache_in|out;
    end
endmodule
