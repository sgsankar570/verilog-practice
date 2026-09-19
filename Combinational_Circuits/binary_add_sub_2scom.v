module binary_add_sub_2scom(a,b,cin,mode,out,cout);
	input [3:0] a,b;
	input cin,mode;
	output [3:0] out;
	output cout;
	
	wire [3:0] w,p,q,r;
	wire [2:0] c;
	
	assign w[0]=b[0]^mode,
		w[1]=b[1]^mode,
		w[2]=b[2]^mode,
		w[3]=b[3]^mode;
		
	assign cin=mode;
	
	ripple_carry_adder uut1(a,w,mode,p,c[0]);
	
	assign c[1]=~c[0];
	assign c[2]=mode&c[1];
	
	assign q[0]=p[0]^c[2],
		q[1]=p[1]^c[2],
		q[2]=p[2]^c[2],
		q[3]=p[3]^c[2];
		
	assign r=4'b0;
	
	ripple_carry_adder uut2(q,r,c[2],out,cout);
	
endmodule
	