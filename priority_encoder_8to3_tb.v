module priority_encoder_8to3_tb();
	reg [7:0] in;
	wire [2:0] out;
	
	priority_encoder_8to3 uut(in,out);
	
	initial begin
		in=8'b0000_0000;
		#5 in=8'b0001_0010;
		#5 in=8'b0100_0100;
		#5 in=8'b0100_0001;
		#5 in=8'b1100_0000;
		#5 in=8'b1000_1000;
		#5 in=8'b0001_0001;
		#5 in=8'b0000_1110;
		#5 in=8'b0000_0011;
		#5 in=8'b0000_0000;
		#5 in=8'b0000_0010;
		#5 in=8'b1111_0000;
		
	end
	
	initial begin
		$monitor("in %0b |out %0b",in,out);
		#70 $finish;
	end
	
endmodule