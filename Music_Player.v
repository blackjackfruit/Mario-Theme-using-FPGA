`timescale 1ns / 1ps

module Music_Player(
	input clk,
	input[3:0] in_wires,
	output speaker
    );
	reg[31:0] counter;
	
	reg note = 0;
	assign speaker = note;
	
	
	always@(posedge clk)
	begin
		
		if(counter[26] == 1'b1)
		begin
			note <= in_wires[0];
		end
		else 
		begin
			note <= in_wires[3];
		end
		counter <= counter + 1;
	end

endmodule
