module top_module( 
    input [254:0] in,
    output [7:0] out );

    reg[7:0] j;
    always@(in) begin
    	j = 8'b0000_0000; 
        for(int i = 0; i< 255;i++) begin
            if (in[i]==1'b1) begin
                j=j+1;
        	end else begin
                j=j+1'b0;
            end
        end    
    end
    assign out = j;
            
endmodule
