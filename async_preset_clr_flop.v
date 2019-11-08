//async preset clear updown counter.
module asyncpresetclr(clock,preset,updown,clear,presetdata,counter);
parameter BITS = 2;
input clock, preset ,clear, updown;
input [BITS-1:0] presetdata;
output [BITS-1:0] counter;
reg [BITS-1:0] counter;

always @ (posedge clock or posedge preset or posedge clear)
if (preset)
  counter <= presetdata;
else if (clear)
  counter <= 0;
else 
begin
if (updown)
  counter <= counter + 1;
else
  counter <= counter - 1;
end
endmodule

//This will get synthesized as register with preset/clear pins and combinational logic to control both sync and async portions.
