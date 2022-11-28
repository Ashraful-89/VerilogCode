module Adder_sub(s,cout,a,b,mode);
	input [3:0] a,b;
	input mode;
	output [3:0] s;
	output cout;

	wire c1,c2,c3;
	
	Full_adder fa1(s[0],c1,a[0],(b[0]^mode),mode);
	Full_adder fa2(s[1],c2,a[1],(b[1]^mode),c1);
	Full_adder fa3(s[2],c3,a[2],(b[2]^mode),c2);
	Full_adder fa4(s[3],cout,a[3],(b[3]^mode),c3);

endmodule


module Full_adder(sum,cout,a,b,cin);
		input a,b,cin;
		output sum,cout;
		
		wire s1,c1,c2;
		Half_adder ha1(s1,c1,a,b);
		Half_adder ha2(sum,c2,s1,cin);
		or(cout,c1,c2);
endmodule


module Half_adder(s,c,a,b);
	input a,b;
	output s,c;
	xor(s,a,b);
	and(c,a,b);
endmodule

	
	
	
