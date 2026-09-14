module encoder_8to3_tb();
	reg [7:0] in;
	wire [2:0] out;
	
	encoder_8to3 uut(in,out);
	
	initial begin
		in=8'b0000_0000;
		#5 in=8'b0001_0000;
		#5 in=8'b0000_0100;
		#5 in=8'b0100_0000;
		#5 in=8'b1000_0000;
		#5 in=8'b0000_1000;
		#5 in=8'b0000_0001;
		#5 in=8'b0001_0000;
	end
	
	initial begin
		$monitor("in %0b |out %0b",in,out);
		#50 $finish;
	end
	
endmodule