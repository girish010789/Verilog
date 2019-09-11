module stimulus;
parameter IN=3;
parameter OUT=8;
reg [IN-1:0] in;
reg enable;
wire [OUT-1:0] out;

decoder_3_8 dec (in,out,enable);

initial
$monitor($time, " in = %b out = %d enable = %b ", in, out,enable);

initial
begin
	in = 3'b000;	
	enable = 1'b0;
end

initial
begin
	#10  enable = 1'b1; in = 3'b001;  
	#10  in = 3'b101;  
	#10  in = 3'b111;  
	#10  in = 3'b011;  
	#10  in = 3'b100;  
	#10  enable = 1'b0;  
	#70 $finish;
end
endmodule
