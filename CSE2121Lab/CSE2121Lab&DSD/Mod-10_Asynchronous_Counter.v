module jk_ff(q,q_bar,j,k,clk,clear);
	input j,k,clk,clear;
	output q,q_bar;
	wire a,b,c,d,e,f,clk_bar;

	nand n1(a,j,clk,clear,q_bar);
	nand n2(b,k,clk,clear,q);
	nand n3(c,a,d);
	nand n4(d,b,c,clear);

	not(clk_bar,clk);

	nand n5(e,c,clk_bar);
	nand n6(f,d,clear,clk_bar);
	nand n7(q,e,q_bar);
	nand n8(q_bar,f,clear,q);

endmodule

module mod_10(q,clear,clk);
	
	input clear,clk;
	output [3:0] q;
	wire a;
	nand(a,q[1],q[3]);
	
	jk_ff jk1(q[0],,1,1,clk,(clear&a));
	jk_ff jk2(q[1],,1,1,q[0],(clear&a));

	jk_ff jk3(q[2],,1,1,q[1],(clear&a));
	jk_ff jk4(q[3],,1,1,q[2],(clear&a));

endmodule


// another Practice

module Mod(q,clear,clk);
	input clear,clk;
	output [3:0] q;
	
	JK_FF jk0(q[0],,1,1,clear,clk);
	JK_FF jk1(q[1],,1,1,clear,q[0]);
	JK_FF jk2(q[2],,1,1,clear,q[1]);
	JK_FF jk3(q[3],,1,1,clear,q[2]);

endmodule
	
	

module JK_FF(q,q_bar,j,k,clear,clk);
	input j,k,clear,clk;
	output q,q_bar;
	
	wire a,b,c,d,e,f,clk_bar;
	nand n1(a,j,clear,clk,q_bar);
	nand n2(b,k,clk,q);
	
	nand n3(c,a,d);
	nand n4(d,b,clear,c);
	
	not(clk_bar,clk);

	nand n5(e,c,clk_bar);
	nand n6(f,d,clk_bar);

	nand n7(q,e,q_bar);
	nand n8(q_bar,f,clear,q);

endmodule

	
