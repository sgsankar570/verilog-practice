module full_adder(a,b,cin,sum,cout);
	input a,b,cin;
	output reg sum,cout;

	always @(*) begin
		{cout,sum}=a+b+cin;
	end
endmodule

module ripple_carry_adder(a,b,cin,sum,cout);
	input [3:0] a,b;
	input cin;
	
	output [3:0] sum;
	output cout;
	
	wire [3:1] c;
	
	full_adder ad1(a[0],b[0],cin,sum[0],c[1]);
	full_adder ad2(a[1],b[1],c[1],sum[1],c[2]);
	full_adder ad3(a[2],b[2],c[2],sum[2],c[3]);
	full_adder ad4(a[3],b[3],c[3],sum[3],cout);
	
endmodule