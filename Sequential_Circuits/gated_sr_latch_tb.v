module gated_sr_latch_tb;
	reg s,r,ctrl;
	wire q,qb;
	
	gated_sr_latch uut(s,r,ctrl,q,qb);
	
	initial begin
		s=1'b0;r=1'b1;ctrl=1'b0;
		#5 ctrl=1'b1;
		#5 s=1'b0;r=1'b0;
		#5 s=1'b1;r=1'b0;
		#5 s=1'b1;r=1'b1;
		#5 s=1'b0;r=1'b1;
		#5 s=1'b1;r=1'b0;ctrl=1'b0;
		#5 s=1'b0;r=1'b0;
		#5 s=1'b1;r=1'b1;
		#5 ctrl=1'b1;s=1'b1;r=1'b0;
	end
	
	initial begin
		$monitor("crtl %0b | s %0b | r %0b | q %0b |qb %0b",ctrl,s,r,q,qb);
		#70 $finish;
	end
endmodule