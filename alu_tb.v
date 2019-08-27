module stimulus;

wire [4:0] out;
reg [3:0] a,b;
reg [2:0] select;

alu alu1 (.a(a),.b(b),.select(select),.out(out));

initial
  $monitor($time, "  select = %b input_1 = %b input_2 = %b output = %b", select,a,b,out);

initial
begin
        select = 3'b000;
	a = 4'b0000;
	b = 4'b0000;
end

//apply stimulus
initial 
begin
	select = 3'b000; 
	a = 4'b0100;
	b = 4'b0010;
#50     select = 3'b001;
	a = 4'b1110;
	b = 4'b0111;
#75	select = 3'b010;
	a = 4'b1011;
	b = 4'b0110;
#100	select = 3'b011;
	a = 4'b1100;
	b = 4'b0110;
#125	select = 3'b100;
	a = 4'b1100;
	b = 4'b0110;
#150	select = 3'b101;
	a = 4'b1011;
	b = 4'b0110;
#175	select = 3'b110;
	a = 4'b1011;
	b = 4'b0110;
#200	select = 3'b111;
	a = 4'b0110;
	b = 4'b1010;
#225 	$finish;

end
endmodule
