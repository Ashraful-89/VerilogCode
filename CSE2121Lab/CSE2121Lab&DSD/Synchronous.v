module jkff(q, qbar, j, k, clear, clk);

    input j, k, clear, clk;
    output q, qbar;
    
    wire n1_out, n2_out, n3_out, n4_out, n5_out, n6_out, cbar;
    
    nand nand1(n1_out, j, qbar, clk, clear);
    nand nand2(n2_out, k, clk, q);
    
    nand nand3(n3_out, n1_out, n4_out);
    nand nand4(n4_out, n2_out, n3_out, clear);
    
    not n1(cbar, clk);
    
    nand nand5(n5_out, n3_out, cbar);
    nand nand6(n6_out, n4_out, cbar);
    
    nand nand7(q, n5_out, qbar);
    nand nand8(qbar, n6_out, q, clear);
    
endmodule


module Synchronous(q,clk,clear);

	input clear , clk;
	output [1:3] q;
	
	wire j1,k1,j2,k2,j3,k3;
	
	assign j1=q[2]&q[3];
	assign k1=~q[2];
	jkff jk1(q[1],,j1,k1,clear,clk);
      
	assign j2=~(q[1]|q[3]);
	assign k2=q[1];
	jkff jk2(q[2],,j2,k2,clear,clk);


	assign j3=q[2];
	assign k3=~q[1]|q[2];
      jkff jk3(q[3],,j3,k3,clear,clk);
endmodule



	