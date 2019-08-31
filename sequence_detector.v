// verilog code to detect sequence 101101

`define CLK2Q 5   //CLK -> Q DELAY FOR FLIP FLOP
`define A  3'd0  //initial state
`define B  3'd1  //state 1
`define C  3'd2  //state 10
`define D  3'd3  //state 101
`define E  3'd4  //state 1011
`define F  3'd5  //state 10110

module sequence_detector (clock,reset,in,out);
input clock,reset,in;
reg [2:0] present_state;
reg [2:0] next_state;
output reg out;

always @ (posedge clock)
begin 
if (reset)
	present_state <= #`CLK2Q `A;
else
	present_state <= #`CLK2Q next_state;
end
always @ (present_state or in or reset)
begin
case(present_state)
`A: 
	if (in == 1'b1)
	begin
		next_state = `B; 
		out = 1'b0;
	end
	else
	begin
		next_state = `A;
		out = 1'b0;
	end
`B: 
	if (in == 1'b1)
	begin
		next_state = `B;
		out = 1'b0;
	end
	else
	begin
		next_state = `C;
		out = 1'b0;
	end
`C: 
	if (in == 1'b1)
	begin
		next_state = `D;
		out = 1'b0;
	end
	else
	begin
		next_state = `A;
		out = 1'b0;
	end

`D: 
	if (in == 1'b1)
	begin
		next_state = `E;
		out = 1'b0;
	end
	else
	begin
		next_state = `C;
		out = 1'b0;
	end
`E: 
	if (in == 1'b1)
	begin 
		next_state = `B;
		out = 1'b0;
	end
	else
	begin
		next_state = `F;
		out = 1'b0;
	end
`F: 
	if (in == 1'b1)
	begin
		next_state = `B;
		out = 1'b1;
	end
	else
	begin
		next_state = `A;
		out = 1'b1;
	end

default:
	begin
	next_state = `A;
	out = 1'b0;
	end
endcase
end
endmodule
