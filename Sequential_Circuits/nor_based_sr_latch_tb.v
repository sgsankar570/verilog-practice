module nor_base_sr_latch_tb;
	reg s,r;
	wire q,qb;
	
	nor_based_sr_latch uut(s,r,q,qb);
	
	initial begin
		s=1'b0;r=1'b0;
		#5 s=1'b1;r=1'b0;
		#5 s=1'b0;r=1'b1;
		#5 s=1'b1;r=1'b1;
		#5 s=1'b0;r=1'b1;
		#5 s=1'b1;r=1'b1;
	end
	
	initial begin	
		$monitor("s %0b | r %0b | q %0b | qb %0b",s,r,q,qb);
		#50 $finish;
	end
endmodule