
module FullAdder(A,B,Cin,Cout,Sum);
input A,B,Cin;
output Cout,Sum;
wire s1,c1,c2;
xor(s1,A,B);
and(c1,A,B);
xor(Sum,s1,Cin);
and(c2,s1,Cin);
or(Cout,c1,c2);
endmodule

