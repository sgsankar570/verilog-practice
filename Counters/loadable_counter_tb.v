module loadable_counter_tb;
	reg clk,rst,load,up_down;
	reg [3:0] data;
	wire [3:0] count;
	
	loadable_counter uut(clk,rst,load,up_down,data,count);
	
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
	
	task loading;
		input [3:0] y;
		begin
			@(negedge clk);
				load=1'b1;
				data=y;
			@(negedge clk);
				load=1'b0;
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
		reset;
		control(1'b1);
		#50;
		loading(4'd9);
		#80;
		control(1'b0);
		#50;
		loading(4'd7);
		#70;
		control(1'b1);
		#50;
		reset;
		#50;
		loading(4'd8);
		#40;
		control(1'b0);
		#50;
		$finish;
	end
endmodule
	
		