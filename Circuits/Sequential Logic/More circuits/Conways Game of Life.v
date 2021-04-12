module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
	
    reg [2:0] sum;
    integer i,j,k;
    always@(posedge clk)
        if(load)
            q<=data;
    	else
            for(i=0;i<16;i++)begin
                for(j=0;j<16;j++)begin
                    k= 16*i+j;
                    if (i == 0) begin
                        if(j==0) begin
                            sum = q[1]+q[16]+q[17]+q[240]+q[241]+q[255]+q[15]+q[31];
                        end else if(j==15) begin
                            sum = q[14]+q[30]+q[31]+q[16]+q[0]+q[240]+q[255]+q[254];
                        end else begin
                            sum = q[k-1]+q[k+15]+q[k+16]+q[k+17]+q[k+1]+q[239+j]+q[240+j]+q[241+j];
                        end
                    end else if(i==15) begin
                        if(j==0) begin
                            sum = q[255]+q[15]+q[0]+q[1]+q[241]+q[225]+q[224]+q[239];
                        end else if(j==15) begin
                            sum = q[254]+q[14]+q[15]+q[0]+q[240]+q[224]+q[239]+q[238];
                        end else begin
                            sum = q[k-1]+q[j-1]+q[j]+q[j+1]+q[k+1]+q[223+j]+q[224+j]+q[225+j];
                        end
                    end else begin
                        if(j==0) begin
                            sum = q[k-1]+q[k+15]+q[k+31]+q[k+16]+q[k+17]+q[k+1]+q[k-15]+q[k-16];
                        end else if(j==15) begin
                            sum = q[k-17]+q[k-1]+q[k+15]+q[k+16]+q[k+1]+q[k-15]+q[k-31]+q[k-16];
                        end else begin
                            sum = q[k-17]+q[k-1]+q[k+15]+q[k+16]+q[k+17]+q[k+1]+q[k-15]+q[k-16];
                        end
                    end
                    case(sum) 
                        3'd2: q[k]<=q[k];
                        3'd3: q[k]<=1'b1;
                        default: q[k]<=1'b0;
                    endcase
                end
            end
endmodule


module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    wire [2:0] nghbr_num [255:0];
    int idx_i_d,idx_i_u,idx_j_r,idx_j_l,i,j;

    //count num of neighbours
    always@(*) begin
        for(i = 0 ; i < 16 ; i = i + 1) begin
            for(j = 0 ; j < 16 ; j = j + 1) begin
                idx_i_u = (i == 0) ? i-1+16 :i-1; //up idx
                idx_i_d = (i == 15)? i+1-16 :i+1; //down idx
                idx_j_l = (j == 0) ? j-1+16 :j-1; //left idx
                idx_j_r = (j == 15)? j+1-16 :j+1; //right idx
                nghbr_num[i*16+j] = q[idx_i_u*16+idx_j_l] + q[idx_i_u*16+j  ] + q[idx_i_u*16+idx_j_r]
                                  + q[i      *16+idx_j_l]                     + q[i      *16+idx_j_r]
                                  + q[idx_i_d*16+idx_j_l] + q[idx_i_d*16+j  ] + q[idx_i_d*16+idx_j_r];
            end
        end
    end

    always@(posedge clk)
        if(load)
            q<=data;
    	else
            for(i = 0 ; i < 16 ; i = i + 1) begin
                for(j = 0 ; j < 16 ; j = j + 1) begin
                    case(nghbr_num[i*16+j])
                        3'd2: q[16*i+j]<=q[16*i+j];
                        3'd3: q[16*i+j]<=1'b1;
                        default: q[16*i+j]<=1'b0;
                    endcase
                end
            end
endmodule