module full_adder_tb();
	reg a,b,cin;
	wire sum,cout;
	
	full_adder uut(a,b,cin,sum,cout);
	
	initial begin
		{a,b,cin}=3'b000;
		#5 {a,b,cin}=3'b001;
		#5 {a,b,cin}=3'b010;
		#5 {a,b,cin}=3'b011;
		#5 {a,b,cin}=3'b100;
		#5 {a,b,cin}=3'b101;
		#5 {a,b,cin}=3'b110;
		#5 {a,b,cin}=3'b111;
		#5 {a,b,cin}=3'b000;
		#5 {a,b,cin}=3'b001;
	end
	initial begin
		$monitor("a %0b|b %0b|cin %0b|sum %0b|cout %0b",a,b,cin,sum,cout);
		#100 $finish;
	end
	
endmodule