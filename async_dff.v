//Verilog code

module async_dff (input clk, input reset, input d, output q, output qb); 
  reg        q;
  assign qb = ~q;
  always @(posedge clk or posedge reset)
  begin
    if (reset) 
      q <= 1'b0;
    else 
      q <= d;
  end
endmodule


// Testbench
module async_dff_tb;
  reg clk,reset,d;
  wire q,qb;
  // Instantiate design under test
  async_dff DFF(.clk(clk), .reset(reset),
          .d(d), .q(q), .qb(qb));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);

    $display("Reset-state");
    clk = 0;
    reset = 1;
    d = 1'bx;
    display;

    $display("Release-reset");
    d = 1;
    reset = 0;
    display;
    
    $display("Toggle-clk");
    clk = 1;
    display;
  end

  task display;
    #1 $display("d:%0h, q:%0h, qb:%0h",d, q, qb);
  endtask

endmodule
