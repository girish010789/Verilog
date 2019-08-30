
module ripple_carry_adder_tb;
	reg [3:0] a,b;
	reg cin;
	wire [3:0] cout,sum;

	ripple_carry_adder rip (a,b,cin,sum,cout);
	initial 
	begin
	a = 0;
	b = 0;
	cin = 0;
	#20
	a = 4'b0010 ;b = 4'b0001; cin = 1'b0;
	#20 a = 4'b0011 ;b = 4'b0101; cin = 1'b1;
	#40 a = 4'b0111 ;b = 4'b0111; cin = 1'b1;
	end

	initial
	begin
		$monitor("time =" ,$time,, "a = %b b = %b cin = %b: sum = %b cout = %b", a,b,cin,sum,cout);
	end
endmodule

