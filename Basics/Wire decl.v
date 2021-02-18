`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	wire and1;
    wire and2;// Declare a wire named "not_in"
	wire or1;
    assign and1=a&b;
    assign and2=c&d;
    assign or1 = and1 | and2;
    assign out = or1;  // Assign a value to out (create a NOT gate).
    assign out_n = ~or1;   // Assign a value to not_in (create another NOT gate).
endmodule
