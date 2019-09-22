module register_file (clock,reset,re, we, cs, read_reg1, read_reg2, read_data1, read_data2, write_register, write_data);
parameter WIDTH = 64;
parameter DEPTH = 16;
parameter SELECT = 4;

input clock, reset;
input re,we,cs;
input [SELECT-1:0] write_register, read_reg1, read_reg2;
input [WIDTH-1:0] write_data;
output [WIDTH-1:0] read_data1,read_data2;
reg [WIDTH-1:0] read_data1,read_data2;
reg [WIDTH-1:0] regfile [DEPTH-1:0];


always @ (*)
begin
//READ OPERATION
if (cs == 1'b1 && we == 1'b0 && re == 1'b1)
begin
        read_data1 <= regfile[read_reg1];
        read_data2 <= regfile[read_reg2];
end

//WRITE OPERATION
if (cs  == 1'b1 && we == 1'b1 && re == 1'b0)
begin
        regfile[write_register] <= write_data;
end
end
endmodule
