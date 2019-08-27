module stimulus;
wire [1:0] MAIN_SIG,CNTRY_SIG;
reg CAR_ON_CNTRY_RD;
reg CLOCK, CLEAR;

traffic_light_controller traffic (MAIN_SIG,CNTRY_SIG,CAR_ON_CNTRY_RD,CLOCK,CLEAR);

//setup monitor
initial
$monitor($time, " Main_Sig = %b Country_Rd = %b Car_on_cntry = %b", MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD);

//clock
initial 
begin
	CLOCK = `FALSE;
	forever #5 CLOCK = ~CLOCK;
end

//Control signals
initial
begin
	CLEAR = `TRUE;
	repeat (5) @(negedge CLOCK);
	CLEAR = `FALSE;
end

//apply stimulus
initial 
begin
	CAR_ON_CNTRY_RD = `FALSE;
	
	#200 CAR_ON_CNTRY_RD = `TRUE; 
	#100 CAR_ON_CNTRY_RD = `FALSE; 
	
	#200 CAR_ON_CNTRY_RD = `TRUE; 
	#100 CAR_ON_CNTRY_RD = `FALSE; 
 
	#200 CAR_ON_CNTRY_RD = `TRUE; 
	#100 CAR_ON_CNTRY_RD = `FALSE; 

	#1000 $finish;
end
endmodule 
