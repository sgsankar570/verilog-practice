module gated_d_latch_tb;
	reg d,ctrl;
	wire q,qb;
	
	gated_d_latch uut(d,ctrl,q,qb);
	
	initial begin
		d=1'b0;ctrl=1'b0;
		#5 d=1'b1;ctrl=1'b1;
		#5 d=1'b0;
		#5 d=1'b1;
		#5 ctrl=1'b0;
		#5 d=1'b1;
		#5 ctrl=1'b1;
		#5 d=1'b0;
		#5 d=1'b0;
	end

	initial begin
		$monitor("ctrl %0b | d %0b | q %0b | qb %0b",ctrl,d,q,qb);
		#60 $finish;
	end
endmodule
		