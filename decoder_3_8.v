module decoder_3_8 (in,out,enable);
parameter IN = 3; 
parameter OUT = 8; 

input [IN-1 :0] in;
input enable;
output [OUT-1:0] out;
reg [OUT-1:0] out;

always @ (*)
begin
	out = 0;
	if (enable) 
	begin
		case (in)
			3'b000: out = 8'd0; 
			3'b001: out = 8'd1; 
			3'b010: out = 8'd2; 
			3'b011: out = 8'd3; 
			3'b100: out = 8'd4; 
			3'b101: out = 8'd5; 
			3'b110: out = 8'd6; 
			3'b111: out = 8'd7;
		endcase
	end
end
endmodule 
