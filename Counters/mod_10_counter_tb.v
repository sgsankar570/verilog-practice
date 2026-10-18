module mod_10_counter_tb();
	reg clk,rst;
	wire [3:0] count;
	
	mod_10_counter uut(clk,rst,count);
	
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
		#120;
		reset;
		#150;
		$finish;
	end
endmodule