module binary_sub_2scom_tb();
	reg [3:0] a,b;
	reg bin;
	
	wire [3:0] diff;
	wire bout;
	
	binary_sub_2scom uut(a,b,bin,diff,bout);


initial begin
		a=4'b000;b=4'b000;bin=1'b1;
		#5 a=4'd9;b=4'd5;bin=1'b1;
		#5 a=4'd10;b=4'd5;bin=1'b1;
		#5 a=4'd3;b=4'd7;bin=1'b1;
		#5 a=4'd12;b=4'd7;bin=1'b1;
		#5 a=4'd2;b=3'd4;bin=1'b1;
		#5 a=4'd10;b=3'd4;bin=1'b1;
	end
	
	initial begin
		$monitor("a %0d|b %0d|bin %0d|diff %0d|bout %0d",a,b,bin,diff,bout);
		#50 $finish;
	end
	
endmodule