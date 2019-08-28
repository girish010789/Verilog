module parity (input [7:0] address,output parity); 
reg parity;

always @ (address)
begin
	parity = parity_calc(address);
end

function parity_calc;
input [7:0] addr;
begin
	parity_calc = ^addr;
end
endfunction

endmodule
