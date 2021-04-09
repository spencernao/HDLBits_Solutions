module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    reg [7:0] secs, mins, hours;
    reg [1:0] start;
    assign start= {(ss==8'h59)&(mm==8'h59),(ss==8'h59)};
    
    decade_counter sec(clk,reset,ena,1'b0,ss);
    decade_counter min(clk,reset,start[0],1'b0,mm);
    decade_counter hour(clk,reset,start[1],1'b1,hh);
    
    always@(posedge clk)
        if(reset)
            pm<=0;
        else 
        	pm <=pm^(ss==8'h59)&(mm==8'h59)&(hh==8'h11);
    
endmodule

module decade_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    input start,
    input is_hour,
    output [7:0] times);

    always@(posedge clk)
        if(reset)
        	times<= is_hour?8'h12:8'h0;
        else if (start&is_hour)
            times <= (times==8'h12)?8'h1:(times==8'h9)?8'h10:times+1'd1;
    	else if (start)
            case (times)
      			8'h9: times = 8'h10; 
                8'h19:times = 8'h20;
                8'h29:times = 8'h30;
                8'h39:times = 8'h40;
                8'h49:times = 8'h50;
                8'h59:times = 8'h0;
      			default: times = times+1'd1;
    		endcase
    	else
            times <=times;
    
endmodule

