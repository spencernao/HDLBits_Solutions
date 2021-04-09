module top_module (
    input clk,
    input d,
    output q
);
    reg cache1,cache2;
    always@(posedge clk) begin
        cache1 <= d;
    end
    always@(negedge clk) begin
        cache2 <= d;
    end
    assign q = clk? cache1:cache2;
endmodule
