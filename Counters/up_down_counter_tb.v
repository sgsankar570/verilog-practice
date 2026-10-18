module up_down_counter_tb;
	reg clk,rst,up_down;
	wire [3:0] count;
	
	up_down_counter uut(clk,rst,up_down,count);
	
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
	
	task control;
		input x;
		begin
			@(negedge clk);
			up_down=x;
		end
	endtask
	
	initial begin	
		control(1'b1);
		reset;
		#80;
		control(1'b0);
		#80;
		reset;
		#60;
		control(1'b1);
		#50;
		control(1'b0);
		#90;
	end
	
	initial begin
		$monitor("up_down %0b| rst %0b| count %0d",up_down,rst,count);
		#400 $finish;
	end
endmodule