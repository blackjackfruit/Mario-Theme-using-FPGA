`timescale 1ns / 1ps

module Music_Player(
	input clk,
	input[3:0] in_wires,
	output speaker
    );
	reg[31:0] counter;
	reg[1:0] player = 0;
	reg note = 0;
	assign speaker = note;
	
	
	always@(posedge clk)
	begin
		
		if(counter[26] == 1'b1)
		begin
				player = player + 1;
		end
		counter <= counter + 1;
	end
	
	always@(player)
	begin
		if(player < 2)
			note <= in_wires[0];
		else
			note <= in_wires[1];
	end

endmodule
