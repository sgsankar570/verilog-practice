module pri_encoder_8to3_tb();
	reg [7:0] in;
	reg ein;
	wire [2:0] out;
	wire eout,status;
	
	pri_encoder_8to3 uut(in,ein,eout,out,status);
	
	initial begin
		ein=1'b1;
		in=8'b0;
		#5 in=8'b0101_0000;
		#5 in=8'b1000_1001;
		#5 in=8'b0010_0110;
		#5 in=8'b0000_1001;
		#5 in=8'b1110_0010;
	end
	
	initial begin
		$monitor("in %0b| out %0d",in,out);
		#50 $finish;
	end
endmodule