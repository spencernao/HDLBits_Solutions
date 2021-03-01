module top_module ( input clk, input d, output q );
    wire q1,q2,q3;
    my_dff ins1(clk,d,q1);
    my_dff ins2(clk,q1,q2);
    my_dff ins3(clk,q2,q3);
    assign q = q3;
endmodule
