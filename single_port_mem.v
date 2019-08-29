//Single port synchronous read/write memory

module single_port (clk,address,data,data_out,cs,we,oe);

parameter WIDTH = 8;
parameter RAM_DEPTH = 16;

input clk,cs,we,oe;
input [WIDTH-1:0] address;
input [WIDTH-1:0] data;
output [WIDTH-1:0] data_out;

reg [WIDTH-1:0] mem [RAM_DEPTH-1:0];
reg oe_r;
reg [WIDTH-1:0] data_out;

//Tristate buffer control
always @ (*)
begin
if (cs && oe && !we) 
	data_out = data; 
else 
	data_out = 8'b0; 
end

//write operation
always @ (posedge clk)
begin
if (cs && we) begin
	mem[address] = data;
end
end

always @ (posedge clk)
begin
if (cs && oe && !we) begin
	data_out = mem[address];
	oe_r = 1;
end 
else begin
	oe_r = 0;
end
end
endmodule
