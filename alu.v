`define NOP 3'b000
`define ADD 3'b001
`define SUB 3'b010
`define DIV 3'b011
`define REM 3'b100
`define SHIFT_LEFT 3'b101
`define SHIFT_RIGHT 3'b110
`define MAG_COMP 3'b111

module alu (a,b,select,out);
input [3:0] a,b;
input [2:0] select;
output [4:0] out;
reg [4:0] out;

always @ (*)
begin
case(select)
	`NOP:  out = {1'b0,a}; 
	`ADD:  out = a + b;
	`SUB:  out = a - b;
	`DIV:  out = a / b;
	`REM:  out = a % b;
	`SHIFT_LEFT:  out = a << 1;
	`SHIFT_RIGHT:  out = a >> 1;
	`MAG_COMP:  out = (a > b);
endcase
end
endmodule
