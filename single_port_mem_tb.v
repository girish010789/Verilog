module stimulus;

parameter WIDTH = 8;
parameter RAM_DEPTH = 16;

reg clk,we,oe,cs;
reg [WIDTH-1:0] data,address;
reg [WIDTH-1:0] mem [RAM_DEPTH-1:0];
wire [WIDTH-1:0] data_out;

single_port sp (.clk(clk),.address(address),.data(data),.data_out(data_out),.cs(cs),.we(we),.oe(oe));

initial
	$monitor ($time, "clk = %d we = %d cs = %d oe = %d address = %b data = %b data_out = %b", clk,we,cs,oe,address,data,data_out);

initial
begin
clk = 0;
we = 0;
cs = 0;
oe = 0;
address = 8'b00000000;
data = 8'b00000000;
end

initial 
#5 clk = ~clk;

initial
begin
#10 we = 1; 
cs = 1; 
oe = 0;
address = 8'b00000000;
data = 8'b01011010;

#20 we = 1; 
cs = 1; 
oe = 0;
address = 8'b00000001;
data = 8'b01001011;

#30 we = 0; 
cs = 1; 
oe = 1;
address = 8'b00000000;
 
#40 we = 0; 
cs = 1; 
oe = 1;
address = 8'b00000001;

end
endmodule
