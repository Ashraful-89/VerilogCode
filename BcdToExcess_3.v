module BcdToExcess_3(E,B);
input [3:0] B;
output [3:0] E;

assign E[0] = ~B[0];
assign E[2] = ~(B[1] ^ B[0]);
assign E[2] = B[2] ^ ( B[1] | B[0]);
assign E[3] = B[3] | B[2] & (B[0] | B[1]);

enmodule;
 
