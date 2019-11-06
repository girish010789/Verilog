//continuous assignment

module continuous (a,b,c);
input [3:0] a,b;
output [3:0] c;
assign c = a & b;
endmodule

//procedural assignment
//blocking
module procedural_blocking (a,b,c);
input [3:0] a,b;
output [3:0] c;
ref [3:0] c;
always @ (*)
  c = a & b;
endmodule

//non-blocking
module procedural_nonblocking (a,b,c);
input [3:0] a,b;
output [3:0] c;
reg [3:0] c;
always @ (*)
  c <= a & b;
endmodule

All the above code will be synthesized as a combinational logic with output as a wire.
The above procedural statement will be synthesized in to a wire, unless it happens under the control of the clock edge.

//Specifying clock
module procedural_clock (a,b,clk,c);
input [3:0] a,b;
input clk;
output [3:0] c;
reg [3:0] c;
always @ (posedge clk)
  c <= a & b;
endmodule

The above code, under the control of clock will be synthesized as a register.
