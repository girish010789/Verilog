// full adder

module full_adder(a,b,cin,sum,cout);
        input a,b,cin;
        output sum,cout;
        assign sum = a ^ b ^ cin;
        assign cout = (a & b) + (b & cin) + (a & cin);
endmodule

//ripple carry adder

`include "full_adder.v"
module ripple_carry_adder (a,b,cin,sum,cout);
        input [3:0] a,b;
        input cin;
        output [3:0] sum, cout;
        wire [3:0] sum, cout;
        full_adder fa0 (a[0],b[0],cin,sum[0],cout[0]);
        full_adder fa1 (a[1],b[1],cout[0],sum[1],cout[1]);
        full_adder fa2 (a[2],b[2],cout[1],sum[2],cout[2]);
        full_adder fa3 (a[3],b[3],cout[2],sum[3],cout[3]);
endmodule

// Testbench
// only for few test cases

module ripple_carry_adder_tb;
        reg [3:0] a,b;
        reg cin;
        wire [3:0] cout,sum;

        ripple_carry_adder rip (a,b,cin,sum,cout);
        initial
        begin
        a = 0;
        b = 0;
        cin = 0;
        #20
        a = 4'b0010 ;b = 4'b0001; cin = 1'b0;
        #20 a = 4'b0011 ;b = 4'b0101; cin = 1'b1;
        #40 a = 4'b0111 ;b = 4'b0111; cin = 1'b1;
        end

        initial
        begin
                $monitor("time =" ,$time,, "a = %b b = %b cin = %b: sum = %b cout = %b", a,b,cin,sum,cout);
        end
endmodule

