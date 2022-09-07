module fullAdderUsinfHalf (Sum,Cout,a,b,cin);
input a , b, cin;
output Sum,Cout;
wire s1,c1,c2;
halfAdder h1(s1,c1,a,b);
halfAdder h2(Sum,c2,s1,cin);
or(Cout , c1,c2);
endmodule


module halfAdder (Sum,Cout,a,b);
input a,b;
output Sum,Cout;
xor(Sum,a,b);
and(Cout,a,b);
endmodule
