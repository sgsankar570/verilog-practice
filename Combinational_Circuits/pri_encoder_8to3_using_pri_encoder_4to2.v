module pri_encoder_4to2(in,ein,eout,out,status);
	input [3:0] in;
	input ein;
	output [1:0] out;
	output eout,status;
	
	assign out[1]=in[3]|in[2];
	assign out[0]=in[3]|(~in[2]&in[1]);
	assign eout=~in[3]& ~in[2]& ~in[1]& ~in[0];
	assign status=in[3]| in[2]| in[1]| in[0];
endmodule

module pri_encoder_8to3(in,ein,eout,out,status);
	input [7:0] in;
	input ein;
	output [2:0] out;
	output eout,status;
	
	wire [1:0] out1,out0;
	wire w1,w4,w5,w8;
	
	pri_encoder_4to2 e1(in[7:4],ein,w1,out1,w4);
	pri_encoder_4to2 e2(in[3:0],w1,w5,out0,w8);
	
	assign out[2]=w4;
	assign out[1]=out1[1]|out0[1];
	assign out[0]=out1[0]|out0[0];
	assign status=w4|w8;
	assign eout=w5;
	
endmodule