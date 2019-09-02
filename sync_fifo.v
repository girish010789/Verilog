//SYNC-FIFO WITH ONE READ/WRITE PER CLOCK CYCLE

`define WIDTH 32
`define DEPTH 64
`define COUNTER 6 

module fifo (clock,reset,write,read,data_in,data_out,full,empty);

input clock,reset,write,read;
input [`WIDTH-1:0] data_in;
output full,empty;
output [`WIDTH-1:0] data_out;
reg [`WIDTH-1:0] data_out;
reg [`WIDTH-1:0] fifo [0:`DEPTH-1];
reg [`COUNTER-1:0] rd_ptr;
reg [`COUNTER-1:0] wr_ptr;

assign empty = ((wr_ptr - rd_ptr) == 6'b000000) ? 1'b1:1'b0;
assign full = ((wr_ptr - rd_ptr) == 6'b111111) ? 1'b1:1'b0;

always @ (posedge clock or posedge reset)
begin

// WHEN RESET
	if (reset)
	begin
		rd_ptr <= 6'b000000 ;
		wr_ptr <= 6'b000000 ;
		data_out <= 32'd0;
	end
end

always @ (posedge clock or posedge reset)
begin
//WHEN WRITING TO FIFO
	if (write == 1'b1 && full == 1'b0 && read == 1'b0)
	begin
		fifo [wr_ptr] <= data_in;
		wr_ptr <= wr_ptr + 1;
	end

//WHEN READING FROM FIFO
	if (read == 1'b1 && empty == 1'b0 && write == 1'b0)
	begin
		data_out <= fifo [rd_ptr];
		rd_ptr <= rd_ptr + 1;
	end
end
endmodule
