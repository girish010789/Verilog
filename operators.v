//Logical operators
//All the operators will be mapped as primitive logic gates (combinational logic) during synthesis.

module fulladder(a,b,cin,cout,sum,carry);
parameter bitsize = 4;
input [bitsize-1:0] a, b;
input cin;
output [bitsize:0] sum;
output cout, carry;

assign sum = a ^ b ^ cin;
assign cout = (a&b) | (a&cin) | (b&cin);
endmodule

//unsigned addition

module unsignedadder(a,b,c);
input [2:0] a,b;
output [3:0] c;
assign c = a + b;
endmodule

// relational operator
module greaterthan(a,b,z);
input [3:0] a,b;
output z;
assign z = a[1:0] > b[3:2];
endmodule

//shift operator
module shiftright(a,z);
input [3:0] a;
output [5:0] z;
assign z = a << 2;
endmodule

Some examples of relational operator. All the above code will get synthesized as combinational logic (gate level primitives) .
