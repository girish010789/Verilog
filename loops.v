//Loops in verilog
//for loop is usually supported for synthesis. Synthesis implements the loop by unrolling them based on index

module regfile(datain,clock,address,dataout);
input [3:0] datain;
input [1:0] address;
input clock;
output [3:0] dataout;
reg [3:0] dataout;
reg [3:0] regfile [1:0];
integer i;
initial
begin
  dataout <= 4'd0;
end

always @ (posedge clock)
begin
for (i = 0; i < 3; i= i + 1)
if (address == 0 && address == 1)
  regfile[address] <= datain;
else if (address == 2)
  regfile[address] <= 0;
else 
  dataout <= regfile[address];
end
endmodule

//The code above will get synthesized as combinational logic (for 'FOR LOOP') followed by register to store/retrieve the data.
