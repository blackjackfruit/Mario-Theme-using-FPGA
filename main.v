module main(
	input clk, 
	output speaker
	// used for ambulance
	// output reg speaker
);

wire[3:0] note_wires;
wire[1:0] select;

Note #(220) n_a3  (.clk(clk), .out(note_wires[0]));
Note #(31) n_a4 (.clk(clk), .out(note_wires[1]));
Note #(1) n_b3 (.clk(clk), .out(note_wires[2]));
//Note_Bb4 n_bb4(.clk(clk), .out(note_wires[3]));

Pause n_pause(.clk(clk), .out(note_wires[3]));

//assign speaker = note_wires[0];

//assign note_wires[0] = 0;
//assign note_wires[1] = 1;

/*
Player_Mux p_mux(
	.select(select),
	.in_wires(note_wires),
	.out(speaker)
);

/*
reg[31:0] counter;
always@(posedge clk)
begin
	if(counter[26] == 1'b1)
	begin
		select <= 1'b11;
	end
	else
		select <= 1'b00;

end
*/


Music_Player m_player(
	.clk(clk),
	.in_wires(note_wires),
	.speaker(speaker)
);

/*
parameter clkdivider = 25000000/440/2;

reg [23:0] tone;
always @(posedge clk) tone <= tone+1;

reg [14:0] counter;
always @(posedge clk) if(counter==0) counter <= (tone[23] ? clkdivider-1 : clkdivider/2-1); else counter <= counter-1;
always @(posedge clk) if(counter==0) speaker <= ~speaker;
*/

endmodule