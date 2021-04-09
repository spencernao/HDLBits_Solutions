module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
	
    reg [3:0] cout;
    fa fa(x[0],y[0],1'b0,cout[0],sum[0]);
    
    generate
        genvar i;
        for (i=1;i<4;i=i+1)begin: fa1
            fa fa(x[i],y[i],cout[i-1],cout[i],sum[i]);
        end
    endgenerate
    assign sum[4]=cout[3];
endmodule

module fa( 
    input a, b, cin,
    output cout, sum );
    
    assign {cout,sum} = a+b+cin;
    
endmodule
