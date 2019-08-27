`define TRUE 1'b1
`define FALSE 1'b0
`define RED 2'd0
`define YELLOW 2'd1
`define GREEN 2'd2

//state definition    HWY     CNTRY
`define S0   3'd0   //GREEN   RED
`define S1   3'd1  //YELLOW   RED
`define S2   3'd2  //RED      RED
`define S3   3'd3  //RED      GREEN
`define S4   3'd4  //RED      YELLOW

//Delays
`define Y2RDELAY 3
`define R2GDELAY 2

module traffic_light_controller (hwy,cntry,X,clock,clear);

input clock,clear,X;
output [1:0] hwy,cntry;
reg [1:0] hwy,cntry;
reg [2:0] state;
reg [2:0] next_state;

//STATE S0
initial 
begin
	state = `S0;
	next_state = `S0;
	hwy = `GREEN;
	cntry = `RED;
end

always @ (posedge clock)
	state = next_state;

always @ (state)
begin

case(state)
`S0: begin
	hwy = `GREEN;
	cntry = `RED;
     end
`S1: begin
	hwy = `YELLOW;
	cntry = `RED;
     end
`S2: begin
	hwy = `RED;
	cntry = `RED;
     end
`S3: begin
	hwy = `RED;
	cntry = `GREEN;
     end
`S4: begin
	hwy = `RED;
	cntry = `YELLOW;
     end
endcase
end

//state machine
always @ (state or X or clear)
begin
  if (clear)
	next_state = `S0;
  else
   case(state)
  `S0: if(X)
	next_state = `S1;
      else
	next_state = `S0;

  `S1: begin
	repeat(`Y2RDELAY);
	next_state = `S2;
       end
  `S2: begin
	repeat(`R2GDELAY);
	next_state = `S3;
       end
  `S3: if(X)
	next_state = `S3;
       else
	next_state = `S4;
  `S4: begin
     	repeat(`Y2RDELAY);
	next_state = `S0;
       end
   default:next_state = `S0;
   endcase
end
endmodule
