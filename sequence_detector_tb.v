module stimulus;

reg clock,reset,in;
wire out;
sequence_detector seq (clock,reset,in,out);

initial
	$monitor ($time, " clock = %d reset = %d in = %b out = %b", clock,reset,in,out);

initial
begin
reset = 0 ; clock = 0; in = 0;
#10	in = 1;
#10	in = 0;
#10	in = 1;
#10	in = 0;
#10	in = 1;
#10	in = 1;
#10	in = 0;
#10	in = 1;
#10	in = 1;
#10	in = 0;
#10	in = 1;
#10	in = 1;
#10	in = 0;
#10	in = 1;
end
always
#5 clock = ~clock;
initial
#150 $finish;

endmodule	
