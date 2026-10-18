module enable_counter_tb;
	reg clk,rst,en;
	wire [3:0] up_count;
	wire [3:0] down_count;
	
	enable_counter uut(clk,rst,en,up_count,down_count);
	
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
	
	task enable;
		input x;
		begin	
			@(negedge clk);
			en=x;
		end
	endtask
	
	initial begin
		reset;
		enable(1'b1);
		#90;
		enable(1'b0);
		#20;
		enable(1'b1);
		#50;
		reset;
		#60;
		enable(1'b0);
		#20;
		enable(1'b1);
		#90;
	end
	
	initial begin
		$monitor("rst %0b| en %0b| up_count %0d| down_count %0d",rst,en,up_count,down_count);
		#350 $finish;
	end
	
endmodule