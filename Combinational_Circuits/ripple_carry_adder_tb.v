module ripple_carry_adder_tb();
	reg [3:0] a,b;
	reg cin;
	wire [3:0] sum;
	wire cout;
	
	ripple_carry_adder uut(a,b,cin,sum,cout);
	
	initial begin
		a=3'b000;b=3'b000;cin=1'b0;
		#5 a=3'd3;b=3'd5;cin=1'b0;
		#5 a=3'd3;b=3'd5;cin=1'b1;
		#5 a=3'd3;b=3'd7;cin=1'b0;
		#5 a=3'd3;b=3'd7;cin=1'b1;
		#5 a=3'd2;b=3'd4;cin=1'b0;
		#5 a=3'd2;b=3'd4;cin=1'b1;
	end
	
	initial begin
		$monitor("a %0d|b %0d|cin %0d|sum %0d|cout %0d",a,b,cin,sum,cout);
		#50 $finish;
	end
endmodule