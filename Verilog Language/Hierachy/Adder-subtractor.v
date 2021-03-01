module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire [31:0]b_in,sub_in;
	wire cout1,cout2;
    wire [15:0]sum1,sum2;
    
    assign sub_in = {32{sub}};
    assign b_in = b ^ sub_in;
    add16 ins1(a[15:0],b_in[15:0],sub,sum1,cout1);
    add16 ins2(a[31:16],b_in[31:16],cout1,sum2,cout2);
    assign sum = {sum2,sum1};
endmodule
