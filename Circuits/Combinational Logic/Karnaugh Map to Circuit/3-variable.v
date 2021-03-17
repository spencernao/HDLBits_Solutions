module top_module(
    input a,
    input b,
    input c,
    output out  ); 
    assign out = (a|b|c)? 1: 0;
    
    assign out = (a | b | c);
endmodule
