//Testbench

module mux_tb;
	reg i0,i1,sel;
	wire out;
	mux2_1 MUX (.i0(i0), .i1(i1), .sel(sel), .out(out));

	initial begin
	//dump waves
	$dumpfile("dump_mux.vcd");
	$dumpvars(1);	
	
        $display("initial values");
	i0 = 0;
	i1 = 0;
	sel = 0;
	display;

	$display("change i0 to 1 and keep sel 0");
	i0 = 1;
	i1 = 0;
	sel = 0;
	display;
	
	$display("keep i1 at 1 and change sel to 1");
	i0 = 0;
	i1 = 1;
	sel = 1;
	display;

        $display("change i1 at 0 and keep sel to 1");
        i0 = 0;
        i1 = 0;
        sel = 1;
        display;

        $display("change both inputs to 1 and keep sel to 1");
        i0 = 1;
        i1 = 1;
        sel = 1;
        display;

        $display("change both inputs to 1 and change sel to 0");
        i0 = 1;
        i1 = 1;
        sel = 0;
        display;
        end

	task display;
    	#1 $display("i0:%0h, i1:%0h, sel:%0h, out:%0h",i0, i1, sel,out);
  	endtask

endmodule
