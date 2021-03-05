module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] cout_wire;
    bcd_fadd  bcd_fadd(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(cout_wire[0]),
        .sum(sum[3:0])
      		);
	generate
  		genvar i;
        for (i=1; i<100; i=i+1) begin : fdd
    		bcd_fadd bcd_fadd(
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(cout_wire[i-1]),
                .cout(cout_wire[i]),
                .sum(sum[4*i+3:4*i])
      		);
  		end	
	endgenerate
    assign cout = cout_wire[99];
endmodule
