module serial_adder_tb();
	reg clk,rst,load;
	reg [3:0] a,b;
	wire [3:0] sum;
	wire cout;
	
	serial_adder uut(clk,rst,a,b,load,sum,cout);
	
	always begin
		#5 clk=1'b0;
		#5 clk=1'b1;
	end
	
	task reset; begin
		@(negedge clk) rst=1'b1;
		@(negedge clk) rst=1'b0;
	end
	endtask
	
	task loading;
		input x;
		input [3:0] data_a,data_b;
		begin
			load=x;
			a=data_a;
			b=data_b;
		end
	endtask
	
	initial begin
		reset;
		loading(1'b0,4'd00,4'd0);
		@(negedge clk);
		loading(1'b1,4'd10,4'd5);
		@(negedge clk);
		loading(1'b0,4'd10,4'd5);
		#40;
		@(negedge clk);
		loading(1'b1,4'd7,4'd6);
		@(negedge clk);
		loading(1'b0,4'd7,4'd6);
	end
		
	initial begin
		$monitor("a %0d|b %0d|load %0d|sum %0d|cout %0d",a,b,load,sum,cout);
		#130 $finish;
	end
	
endmodule
	
	
	
	
	
	
	
	
	