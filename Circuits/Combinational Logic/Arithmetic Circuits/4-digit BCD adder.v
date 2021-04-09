module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
	
    wire [3:0]cout_wire;
    bcd_fadd bcd_fadd(a[3:0],b[3:0],cin,cout_wire[0],sum[3:0]);
    generate
        genvar i;
        for (i = 1;i<4;i++) begin : bcd_fadd1
            bcd_fadd bcd_fadd(a[4*i+3:4*i],b[4*i+3:4*i],cout_wire[i-1],cout_wire[i],sum[4*i+3:4*i]);
        end
        endgenerate
    assign cout = cout_wire[3];
endmodule
