// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );
    always @(*) begin
        casex (in[7:0])				// casez | casex, in casez z cannot mix up with x
        	8'b???????1: pos = 0; 	// ? == z
        	8'bxxxxxx1x: pos = 1;	// x == z
        	8'bzzzzz1zz: pos = 2;
        	8'bzzzz1zzz: pos = 3;
            8'bzzz1zzzz: pos = 4;
            8'bzz1zzzzz: pos = 5;
            8'bz1zzzzzz: pos = 6;
            8'b1zzzzzzz: pos = 7;
        default: pos = 0;
    endcase
end

endmodule
