module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
	
    reg [3:0] ones, tens, hundreds, thousands;
    assign ena = {(hundreds==4'd9)&(tens==4'd9)&(ones==4'd9),(tens==4'd9)&(ones==4'd9),ones==4'd9};
    assign q ={thousands,hundreds,tens,ones};
    decade_counter c1(clk,reset,1'b1,ones);
    decade_counter c2(clk,reset,ena[1],tens);
    decade_counter c3(clk,reset,ena[2],hundreds);
    decade_counter c4(clk,reset,ena[3],thousands);
    
endmodule

module decade_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    input ena,
    output [3:0] q);

    always@(posedge clk)
        if(reset)
        	q<=0;
    	else if (ena)
            q <= (q==4'd9)?0:q+1;
    	else
            q <=q;
endmodule
