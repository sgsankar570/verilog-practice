module binary_sub_2scom(a,b,bin,diff,bout);
	input [3:0] a,b;
	input bin;
	output [3:0] diff;
	output bout;
	
	wire [3:0] w,p,q,r;
	wire [1:0] c;
	
	assign w[0]=~b[0],
		w[1]=~b[1],
		w[2]=~b[2],
		w[3]=~b[3];
		
	ripple_carry_adder ad1(a,w,bin,p,c[0]);
	
	assign c[1]=~c[0];
	
	assign q[0]=p[0]^c[1],
		q[1]=p[1]^c[1],
		q[2]=p[2]^c[1],
		q[3]=p[3]^c[1];
		
	
	ripple_carry_adder ad2(q,4'b0,c[1],diff,bout);
	
endmodule