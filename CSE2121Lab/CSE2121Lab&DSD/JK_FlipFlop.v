module jk_ff(q,q_bar,j,k,clear,clk);

	input j,k,clear,clk;
	output q,q_bar;

	wire a,b,c,d,e,f,clk_bar;
	
	not nt(clk_bar,clk);

	nand n1(a,j,clk,clear,q_bar);
	nand n2(b,k,clk,q);

	nand n3(c,a,d);
	nand n4(d,b,clear,c);

	nand n5(e,c,clk_bar);
	nand n6(f,d,clk_bar);

	nand n7(q,e,q_bar);
	nand n8(q_bar,f,q,clear);

endmodule
	