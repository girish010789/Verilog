module stimulus;
parameter WIDTH = 64;
parameter DEPTH = 16;
parameter SELECT = 4;

reg clock, reset;
reg re,we,cs;
reg [SELECT-1:0] write_register, read_reg1, read_reg2;
reg [WIDTH-1:0] write_data;
wire [WIDTH-1:0] read_data1,read_data2;

register_file rf1 (clock,reset,re, we, cs, read_reg1, read_reg2, read_data1, read_data2, write_register, write_data);

initial
        $monitor($time, " clock = %b re = %b we = %b cs = %b read_reg1 = %d read_reg2 = %d write_register = %d write_data = %d read_data1 = %d read_data2 = %d ", clock,re,we,cs,read_reg1,read_reg2,write_register,write_data,read_data1,read_data2);

initial
        #5 clock = ~clock;

initial
begin
        clock = 0; cs = 0 ; re = 0 ; we = 0 ; write_register = 4'd0 ; write_data = 64'd0;
end

initial
begin
        #10  we = 1; cs = 1; re = 0 ; write_register = 4'd0; write_data = 64'd23;
        #10  we = 1; cs = 1; re = 0 ; write_register = 4'd1; write_data = 64'd30;
        #10  we = 1; cs = 1; re = 0 ; write_register = 4'd2; write_data = 64'd37;
        #10  we = 1; cs = 1; re = 0 ; write_register = 4'd3; write_data = 64'd44;
        #10  we = 1; cs = 1; re = 0 ; write_register = 4'd4; write_data = 64'd21;
        #10  we = 1; cs = 1; re = 0 ; write_register = 4'd5; write_data = 64'd56;
        #10  we = 0; cs = 1; re = 1;  write_register = 4'dx; write_data = 64'dx;
        #10  we = 0; cs = 1; re = 1;  read_reg1 = 4'd0; read_reg2 = 4'd2;
        #10  we = 0; cs = 1; re = 1;  read_reg1 = 4'd1; read_reg2 = 4'd3;
        #10  we = 0; cs = 1; re = 1;  read_reg1 = 4'd4; read_reg2 = 4'd5;
        #10  cs = 0;
        #120 $finish;
end
endmodule
