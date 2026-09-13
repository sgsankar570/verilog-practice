module dff(clk,rst,din,q);
	input clk,rst,din;
	output reg q;
	//output qb;
	
	always @(posedge clk, posedge rst) begin
		if(rst)
			q<=1'b0;
		else
			q<=din;
	end
	
	//assign qb=~q;
endmodule

module piso(clk,rst,load,data_in,data_out);
	input clk,rst,load;
	input [3:0] data_in;
	output data_out;
	
	reg [3:0] shift_reg;
	
	always @(posedge clk, posedge rst) begin
		if(rst)
			shift_reg<=4'b0;
		else if(load)
			shift_reg<=data_in;
		else
			shift_reg<={1'b0,shift_reg[3:1]};
	end
	
	assign data_out=shift_reg[0];
	
endmodule

module sipo(clk,rst,data_in,data_out);
	input clk,rst,data_in;
	output [3:0] data_out;
	reg [3:0] shift_reg;
	
	always @(posedge clk, posedge rst) begin
		if(rst)
			shift_reg<=4'b0;
		else 
			shift_reg<={data_in,shift_reg[3:1]};
	end
	
	assign data_out=shift_reg;
endmodule

module full_adder(a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;
	
	assign sum=a^b^cin;
	assign cout=(a&b)|(b&cin)|(cin&a);
endmodule


module serial_adder(clk,rst,a,b,load,sum,cout);
	input clk,rst,load;
	input [3:0] a,b;
	output [3:0] sum;
	output cout;
	
	wire piso_a,piso_b,cin_f,sum_f,cout_f;
	
	piso r1(clk,rst,load,a,piso_a);
	piso r2(clk,rst,load,b,piso_b);
	
	full_adder a1(piso_a,piso_b,cin_f,sum_f,cout_f);
	
	sipo r3(clk,rst,sum_f,sum);
	
	dff f1(clk,rst,cout_f,cin_f);
	
	assign cout=cout_f;
	
endmodule