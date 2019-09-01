//Vending machine which takes nickles and dimes as inputs and gives out candy when you insert 15 cents.

`define A 2'd0  //Initial State
`define B 2'd1  //State with 5 cents
`define C 2'd2  //State with 10 cents
`define D 2'd3  //State with 15 cents
 
module vending_machine (clock,reset,in,out);
input clock,reset;
input [1:0] in;
output out;
reg out;
reg [1:0] state;
reg [1:0] next_state;

always @ (posedge clock)
begin
if (reset)
	state <= `A;
else
	state <= next_state;
end

always @ (*)
begin
case(state)
`A:
	if (in == 2'b10)
	begin
		next_state = `C;
		out <= 1'b0;
	end
	else if (in == 2'b01)
	begin
		next_state = `B;
		out <= 1'b0;
	end
	else
	begin
		next_state = `A;
		out <= 1'b0;
	end

`B:
	if (in == 2'b10)
	begin
		next_state = `D;
		out <= 1'b0;
	end
	else if (in == 2'b01)
	begin
		next_state = `C;
		out <= 1'b0;
	end
	else 
	begin
		next_state = `B;
		out <= 1'b0;
	end

`C:
	if (in == 2'b01 || in == 2'b10)
	begin
		next_state = `D;
		out <= 1'b0;
	end
	else 
	begin
		next_state = `C;
		out <= 1'b0;
	end

`D:
	begin
		next_state = `A;
		out <= 1'b1;
	end

default:
	begin
		next_state = `A;
		out <= 1'b0;
	end
endcase
end 
endmodule
