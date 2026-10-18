module down_counter_tb;
	reg clk,rst;
	wire [3:0] count;
	
	down_counter uut(clk,rst,count);
	
	always begin
		#5 clk=1'b0;
		#5 clk=1'b1;
	end
	
	task reset;
		begin	
			@(negedge clk);
			rst=1'b1;
			@(negedge clk);
			rst=1'b0;
		end
	endtask
	
	initial begin
		reset;
		#70;
		reset;
		#190;
	end
	
	initial begin
		$monitor("rst %0b| count %0d",rst,count);
		#290 $finish;
	end
endmodule