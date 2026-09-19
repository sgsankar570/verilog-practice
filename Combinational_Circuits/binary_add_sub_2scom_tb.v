module binary_add_sub_2scom_tb();
	reg [3:0] a,b;
	reg cin,mode;
	wire [3:0] out;
	wire cout;
	
	binary_add_sub_2scom uut(a,b,cin,mode,out,cout);
	
	initial begin
		a=4'b0000;b=4'b0000;cin=1'b0;mode=1'b0;
		#5 a=4'd10;b=4'd5;cin=1'b1;mode=1'b0;
		#5 a=4'd10;b=4'd5;cin=1'b0;mode=1'b1;
		#5 a=4'd7;b=4'd5;cin=1'b01;mode=1'b0;
		#5 a=4'd7;b=4'd5;cin=1'b0;mode=1'b0;
		#5 a=4'd15;b=4'd5;cin=1'b0;mode=1'b1;
		#5 a=4'd5;b=4'd15;cin=1'b0;mode=1'b1;
		#5 a=4'd6;b=4'd5;cin=1'b0;mode=1'b1;
		#5 a=4'd1;b=4'd5;cin=1'b0;mode=1'b1;
	end
	
	initial begin
		$monitor("a %0d|b %0d|mode %0d|out %0d|cout %0d",a,b,mode,out,cout);
		#70 $finish;
	end
endmodule