module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    reg[2:0]in;
    always@(posedge KEY[0]) begin
        in[2] <= KEY[1]? SW[2]:LEDR[1]^LEDR[2];
    	in[1] <= KEY[1]? SW[1]:LEDR[0];
    	in[0] <= KEY[1]? SW[0]:LEDR[2];
    end   
    assign LEDR ={in[2],in[1],in[0]};
endmodule