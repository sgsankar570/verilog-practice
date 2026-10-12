module sr_flip_flop_tb;
	reg clk,rst,s,r;
	wire q,qb;
	
	sr_filp_flop uut(clk,rst,s,r,q,qb);
	
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
	
	task stimulus;
		input x,y;
		begin	
			s=x;r=y;
		end
	endtask
	
	initial begin	
		s=1'b0;r=1'b0;
		reset;
		stimulus(1'b0,1'b1);
		#5 stimulus(1'b0,1'b0);
		#5 stimulus(1'b1,1'b1);
		#5 stimulus(1'b1,1'b0);
		reset;
		#5 stimulus(1'b0,1'b1);
		#5 stimulus(1'b1,1'b0);
	end
	
	initial begin	
		$monitor("rst %0b| s %0b| r %0b| q %0b| qb %0b",rst,s,r,q,qb);
		#50 $finish;
	end
endmodule