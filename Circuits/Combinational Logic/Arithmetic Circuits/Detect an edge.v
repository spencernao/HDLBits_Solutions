module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    wire[7:0] cache;

    always @(posedge clk)begin
        cache <= in;
        pedge<=~cache& in;
    end

endmodule
