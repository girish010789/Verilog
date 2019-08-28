module stimulus;

reg [7:0] address;
wire parity;

parity pp (address,parity);

initial
	$monitor($time, " address = %b parity = %d", address, parity);

initial
begin
	address = 8'b00000000;
end

initial 
begin
	address = 8'b00000000;
	#25 address = 8'b00101010;
	#50 address = 8'b10110100;
	#75 address = 8'b00001111;
	#100 address = 8'b10101111;
end
endmodule
