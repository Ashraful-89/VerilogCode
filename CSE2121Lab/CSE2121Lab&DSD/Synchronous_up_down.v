
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


module Synchronous_up_down(q,clk,clear,mode);

	input clear , clk, mode;
	output [1:3] q;
	
	wire j1,k1;
      assign j1=(((~mode)&(~q[2])&(~q[3]))|(mode&q[2]&q[3]));
	jkff jk1(q[1],,j1,j1,clear,clk);
      
	assign k1=~(mode^q[3]);	
	jkff jk2(q[2],,k1,k1,clear,clk);
      jkff jk3(q[3],,1,1,clear,clk);
endmodule



	