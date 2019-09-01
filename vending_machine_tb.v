module stimulus;

reg clock,reset;
reg [1:0] in;
wire out;

vending_machine vend (clock,reset,in,out);

initial
	$monitor ($time, " clock = %d reset = %d in = %b out = %b ", clock,reset,in,out);

initial
begin
	reset = 0; clock = 0; in = 2'b00;
#10   in = 2'b00;
#10   in = 2'b01;
#10   in = 2'b01;
#10   in = 2'b01;

#10   in = 2'b00;
#10   in = 2'b01;
#10   in = 2'b10;

#10   in = 2'b00;
#10   in = 2'b01;
#10   in = 2'b01;
#10   in = 2'b10;

#10   in = 2'b00;
#10   in = 2'b10;
#10   in = 2'b10;

#10   in = 2'b00;
#10   in = 2'b10;
#10   in = 2'b01;
end

always
#5 clock = ~clock;
initial
#200 $finish;

endmodule
