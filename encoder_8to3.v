module encoder_8to3(in,out);
	input [7:0] in;
	
//	output [2:0] out;
	
//	assign out[0]=in[1]|in[3]|in[5]|in[7];
//	assign out[1]=in[2]|in[3]|in[6]|in[7];
//	assign out[2]=in[4]|in[5]|in[6]|in[7];

	output reg [2:0] out;
	
	always @(*) begin
		if(in=8'b1000_0000)
			out=3'd7;
		else if(in=8'b0100_0000)
			out=3'd6;
		else if(in=8'b0010_0000)
			out=3'd5;
		else if(in=8'b0001_0000)
			out=3'd4;
		else if(in=8'b0000_1000)
			out=3'd3;
		else if(in=8'b0000_0100)
			out=3'd2;
		else if(in=8'b0000_0010)
			out=3'd1;
		else
			out=3'd0;
	end
	
endmodule