module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] cache;
    always@(posedge clk)begin
        cache <=in;
        anyedge <= cache ^ in;
    end
endmodule
       
