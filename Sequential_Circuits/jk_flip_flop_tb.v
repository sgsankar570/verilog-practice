module jk_flip_flop_tb;
	reg clk,pre,clr,j,k;
	wire q,qb;
	
	jk_flip_flop uut(clk,pre,clr,j,k,q,qb);
	
	always begin
		#5 clk=1'b0;
		#5 clk=1'b1;
	end
	
	task preset_clear;
		input x,y;
		begin	
			@(negedge clk);
			pre=x;clr=y;
		end
	endtask
	
	task stimulus;
		input x,y;
		begin
			#8;
			j=x;k=y;
		end
	endtask
	
	initial begin
		j=1'b0;k=1'b0;
		preset_clear(1'b0,1'b1);
		stimulus(1'b1,1'b0);
		preset_clear(1'b1,1'b1);
		stimulus(1'b0,1'b1);
		stimulus(1'b0,1'b0);
		stimulus(1'b1,1'b1);
		preset_clear(1'b1,1'b0);
		stimulus(1'b0,1'b1);
		stimulus(1'b0,1'b0);
		stimulus(1'b1,1'b1);
	end
	
	initial begin
		$monitor("time %0t| pre %0b| clr %0b| j %0b| k %0b| q %0b| qb %0b",$time,pre,clr,j,k,q,qb);
		#100 $finish;
	end
endmodule
		