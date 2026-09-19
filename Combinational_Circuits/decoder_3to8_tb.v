module decoder_3to8_tb();
	reg [2:0] in;
	reg en;
	wire [7:0] out;
	
	decoder_3to8 uut(in,en,out);
	
	initial begin
		en=1'b0; in=3'd7;
		#5 en=1'b1; in=3'd5;
		#5 in=3'd6;
		#5 in=3'd0;
		#5 in=3'd2;
		#5 en=1'b0; in=3'd5;
		#5 en=1'b1; in=3'd4;
		#5 en=3'd3;
	end
	
	initial begin
		$monitor("en %0b| in %0d | out %0b",en,in,out);
		#50 $finish;
	end
	
endmodule	