module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1,cout2,cout3;
    wire [15:0] sum1,sum2,sum3;
    
    add16 ins1(a[15:0],b[15:0],1'b0,sum1,cout1);
    add16 ins2(a[31:16],b[31:16],1'b0,sum2,cout2);
    add16 ins3(a[31:16],b[31:16],1'b1,sum3,cout3);
    always@(*) begin
        if (cout1)
        	sum <= {sum3,sum1};
    	else
            sum <= {sum2,sum1};
    end
endmodule
