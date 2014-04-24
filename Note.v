`timescale 1ns / 1ps
module Note
#(parameter N = 1)
(
	input clk, 
	output out
);

parameter clk_divider = 50000000/N/2;

reg[14:0] counter;
reg speaker_reg;

assign out = speaker_reg;

always@(posedge clk)
begin
	if(counter == 0)
		counter <= clk_divider - 1;
	else
		counter <= counter - 1;
		
end

always@(posedge clk)
begin
	
	if(counter == 0)
		speaker_reg <= ~speaker_reg;
end
endmodule
