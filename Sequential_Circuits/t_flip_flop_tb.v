module t_flip_flop_tb;
	reg clk,pre,clr,t;
	wire q,qb;
	
	t_flip_flop uut(clk,pre,clr,t,q,qb);
	
	always begin
		#5 clk=1'b0;
		#5 clk=1'b1;
	end
	
	task preset_clear;
		input x,y;
		begin	
			@(negedge clk);
			pre=x;
			clr=y;
		end
	endtask
	
	task stimulus;
		input x;
		begin
			@(negedge clk);
			t=x;
		end
	endtask
	
	initial begin
		pre=1'b1;clr=1'b1;t=1'b0;
		preset_clear(1'b0,1'b1);
		preset_clear(1'b1,1'b1);
		stimulus(1'b0);
		stimulus(1'b1);
		preset_clear(1'b1,1'b0);
		stimulus(1'b0);
		preset_clear(1'b1,1'b1);
		stimulus(1'b0);
		stimulus(1'b1);
	end

	initial begin
		$monitor("pre %0b| clr %0b| t %0b| q %0b| qb %0b",pre,clr,t,q,qb);
		#120 $finish;
	end
endmodule