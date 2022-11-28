module Full_Substractor(D,Borrow,a,b,bin);

	input a,b,bin;
	output D,Borrow;
	
	wire d,e,f;
	xor(d,a,b);
	and(e,~a,b);
	
	xor(D,d,bin);
	and(f,~d,bin);
	or(Borrow,e,f);

endmodule
