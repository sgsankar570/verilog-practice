module gated_jk_latch_tb;
	reg j,k,ctrl;
	wire q,qb;
	
	gated_jk_latch uut(j,k,ctrl,q,qb);
	
	initial begin
		j=1'b1;k=1'b0;ctrl=1'b0;
		#5 ctrl=1'b1;
		#5 j=1'b0;k=1'b1;
		#5 j=1'b1;k=1'b0;
		#5 j=1'b0;k=1'b0;
		#5 j=1'b1;k=1'b1;
		#5 ctrl=1'b0;
		#5 j=1'b1;k=1'b1;
		#5 j=1'b0;k=1'b1;
		#5 ctrl=1'b1;
	end
	
	initial begin
		$monitor("ctrl %0b | j %0b | k %0b | q %0b | qb %0b",ctrl,j,k,q,qb);
		#60 $finish;
	end
endmodule