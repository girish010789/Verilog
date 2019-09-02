module stimulus;

reg clock,reset,write,read;
reg [`WIDTH-1:0] data_in;
reg [`WIDTH-1:0] fifo [0:`DEPTH-1];
wire full,empty;
wire [`WIDTH-1:0] data_out;
reg [`COUNTER-1:0] rd_ptr;
reg [`COUNTER-1:0] wr_ptr;

fifo ff (clock,reset,write,read,data_in,data_out,full,empty);

initial
	$monitor ($time, " clock = %d reset = %d write = %d read = %d full = %d empty = %d data_in = %d data_out = %d", clock,reset,write,read,full,empty,data_in,data_out);

initial
begin 
    reset = 1 ; clock = 0; data_in = 32'd0; read = 0; write = 0;
end

initial
begin
#10 reset = 0; write = 1;  data_in = 32'b01010110101011111100000011010101; read = 0;
#10 write = 1;  data_in = 32'b01010110101011111101011100100101; read = 0;
#10 write = 1;  data_in = 32'b11110100101011111101011100100101; read = 0;
#10 write = 1;  data_in = 32'b11110100101011111101011101011101; read = 0;
#10 write = 0 ; read = 1; data_in = 32'b00000000000000000000000000000000; 
#10 read = 1; write = 0;
#10 read = 1; write = 0 ;
#10 read = 1; write = 0 ;
#10 reset = 1; write = 0 ;
end

always 
#5 clock = ~clock;
initial 
#100 $finish;
endmodule
