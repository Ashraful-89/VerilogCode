module BinaryToGray(G3,G2,G1,G0,B3,B2,B1,B0);
input B3,B2,B1,B0;
output G3,G2,G1,G0;
assign G3 = B3;

xor(G2,B3,B2);
xor(G1,B2,B1);
xor(G0,B1,B0);
endmodule;