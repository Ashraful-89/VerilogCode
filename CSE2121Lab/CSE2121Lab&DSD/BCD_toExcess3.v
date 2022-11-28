module BCD_toExcess3(e,b);

	input [3:0] b;
	output [3:0] e;


	assign e[0] = ~b[0];
	assign e[1] = ~(b[1]^b[0]);
	assign e[2] = (b[2] ^ (b[1] | b[0]));
	assign e[3] = (b[3] | (b[2] && (b[1] | b[0])));

endmodule

// or :
module BCD(e,b);
	input [3:0] b;
	output [3:0] e;

	not(e[0],b[0]);
	wire w1,w2,w3;
	xnor(e[1],b[0],b[1]);
	
	or(w1,b[1],b[0]);
	xor(e[2],b[2],w1);

	or(w2,b[0],b[1]);
	and(w3,w2,b[2]);
	or(e[3],b[3],w3);
endmodule


