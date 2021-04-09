module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
	
     always@(posedge clk)
         q <= reset? 0: slowena? (q==4'b1001)? 0:q+1:q;
endmodule
