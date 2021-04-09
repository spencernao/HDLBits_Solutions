module top_module (
    input clk,
    input reset,
    output [3:0] q);

    always@(posedge clk)
        q <= reset? 4'b0001: (q==4'ha)?4'h1:q+1;
endmodule
