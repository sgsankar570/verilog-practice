module gated_t_latch_tb;
	reg t,ctrl;
	wire q,qb;
	
	gated_t_latch uut(t,ctrl,q,qb);
	
	initial begin
		t=1'b0;ctrl=1'b1;
		#5 t=1'b1;
		#5 t=1'b0;
		#5 ctrl=1'b1;
		#5 t=1'b1;
	end
	
	initial begin
		$monitor("ctrl %0b | t %0b | q %0b | qb %0b",ctrl,t,q,qb);
		#30 $finish;
	end
endmodule