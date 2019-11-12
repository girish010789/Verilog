//Verilog code for function. Usually function/task written inside the main program will get synthesized as combinational logic,
albeit if they are inside the clocked always statement. In which case, they will get synthesized as flip-flop. 

module func(datain, dataout);
input [0:5] datain;
output dataout;

function [0:2] countones;
input [0:5] a;
integer k;
begin
  countones = 0;
for (k=0;k<5;k++)
if (a[k])
  countones = countones + 1;
end
endfunction

assign dataout = countones(datain) > 2;
endmodule

//task
module fulladder(a,b,cin,sum,cout);
parameter BITWIDTH = 3;
input [0:BITWIDTH-1] a,b;
input cin;
output [0:BITWIDTH-1] sum;
reg [0:BITWIDTH-1] sum;
output cout;
reg [0:BITWIDTH] temp_cout;

task adder_1bit;
input A,B,CIN;
output SUM,COUT;
begin
  SUM = A ^ B ^ CIN;
  COUT = A & B & CIN;
end
endtask

integer j;
always @ (a or b or cin)
begin
  temp_cout[0] = cin;
  for (j=0;j<BITWIDTH;j=j+1)
    adder_1bit(a[j],b[j],temp_cout[j],sum[j],temp_cout[j+1]);
end
assign cout = temp_cout[3];
endmodule

