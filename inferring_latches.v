//Incomplete conditional statements will result in inferring of latch by synthesis tool. Below are some of the examples.

module combo(a,b,c,select);
input [3:0] a,b;
input [1:0] select;
output [3:0]c;
reg [3:0]c;
always @ (*)
begin
if (select == 2'b00)
  c = a & b;
else if (select == 2'b01)
  c = a | b;
else if (select == 2'b10)
  c = a ^ b;
end
endmodule

//Since this example does not have an else case, synthesis tool will infer a latch for the else condition since value needs to 
be retained.

module combo(a,b,select,c);
input [3:0] a,b;
input [1:0] select;
output [3:0]c;
reg [3:0]c;
always @ (*)
case (select)
  2'b00: c = a & b;
  2'b01: c = a | b;
  2'b10: c = a ^ b;
endcase
endmodule

// The module above will infer a LATCH. 
//You can use the full-case directive to let the synthesis tool know that the other conditions doesn't exist and that case 
condition is complete.

module combo(a,b,select,c);
input [3:0] a,b;
input [1:0] select;
output [3:0]c;
reg [3:0]c;
always @ (*)
case (select) .  //synthesis full_case
  2'b00: c = a & b;
  2'b01: c = a | b;
  2'b10: c = a ^ b;
endcase
endmodule

// The above code does NOT infer a LATCH. We can also use the parallel_case directive to specify the priority order in which 
the case branch is selected. In this directive, the information that all the case items are mutually exclusive needs to be passed
on to the synthesis tool.

module combo(a,b,select,c);
input [3:0] a,b;
input [1:0] select;
output [3:0]c;
reg [3:0]c;
always @ (*)
case (select) .  //synthesis parallel_case
  2'b00: c = a & b;
  2'b01: c = a | b;
  2'b10: c = a ^ b;
endcase
endmodule

//If the variable is used before it is assigned, latches are inferred. In the example below, temp variable is used before assigned. 

module Reg (clock,currentstate,nextstate);
input clock;
input [3:0] currentstate;
output [3:0] nextstate;
reg [3:0] nextstate;
reg [3:0] temp;
always @ (*)
begin
        if (clock)
        begin
                nextstate = temp;
                temp = currentstate;
        end
end
endmodule

