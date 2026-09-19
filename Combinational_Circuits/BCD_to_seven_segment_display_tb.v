module BCD_seven_segment_display_tb();
	reg A,B,C,D;
	wire a,b,c,d,e,f,g;
	
	BCD_seven_segment_display uut(A,B,C,D,a,b,c,d,e,f,g);
	
	initial begin
		{A,B,C,D}=4'd0;
		#5 {A,B,C,D}=4'd2;
		#5 {A,B,C,D}=4'd5;
		#5 {A,B,C,D}=4'd4;
		#5 {A,B,C,D}=4'd9;
		#5 {A,B,C,D}=4'd0;
		#5 {A,B,C,D}=4'd7;
		#5 {A,B,C,D}=4'd3;
		#5 {A,B,C,D}=4'd1;
	end
	
	initial begin
		$monitor("A B C D %0b %0b %0b %0b | a b c d e f g %0b %0b %0b %0b %0b %0b %0b",A,B,C,D,a,b,c,d,e,f,g);
		#50 $finish;
	end
endmodule