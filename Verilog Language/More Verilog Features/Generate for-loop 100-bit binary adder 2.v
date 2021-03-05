module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    full_adder full_adder(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .cout(cout[0]),
        .sum(sum[0])
      		);
	generate
  		genvar i;
        for (i=1; i<100; i=i+1) begin : fdd
    		full_adder full_adder(
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i-1]),
                .cout(cout[i]),
                .sum(sum[i])
      		);
  		end	
	endgenerate
endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );
    
    assign {cout,sum} = a+b+cin;
    
endmodule
