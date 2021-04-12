module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    reg[3:0]intermediate;
    DFF D1(clk,resetn,in,intermediate[0]);
    generate
        genvar i;
        for(i=1;i<4;i++)begin:DFF
            DFF DFF(clk,resetn,intermediate[i-1],intermediate[i]);
        end
    endgenerate
    assign out = intermediate[3];

endmodule
            
module DFF (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out); 
    
    always@(clk)
        if(~resetn)
            out<=1'b0;
    	else
            out <=in;
endmodule


module top_module (
	input clk,
	input resetn,
	input in,
	output out
);

	reg [3:0] sr;
	
	// Create a shift register named sr. It shifts in "in".
	always @(posedge clk) begin
		if (~resetn)		// Synchronous active-low reset
			sr <= 0;
		else 
			sr <= {sr[2:0], in};
	end
	
	assign out = sr[3];		// Output the final bit (sr[3])

endmodule
