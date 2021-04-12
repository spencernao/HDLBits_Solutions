module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
	
    
      always@(posedge clk)begin
        if(load)begin
            q <= data;
        end
        else begin
            q <= {1'b0, q[511:1]} ^ {q[510:0], 1'b0};
        end
      end
    //reg	[513:0]	q_com;
    //integer i;
    //
    //always@(posedge clk)begin
    //    if(load)begin
    //        q_com <= {1'b0, data, 1'b0};
    //    end
    //    else begin
    //        for(i = 0; i <= 511; i = i + 1)begin
    //            q_com[i + 1] <= q_com[i] ^ q_com[i + 2];
    //        end
    //    end
    //end
    //
    //assign q = q_com[512:1];
endmodule
