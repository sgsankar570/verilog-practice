module nor_based_sr_latch(s,r,q,qb);
	input s,r;
	output q,qb;
	
	nor g1(qb,s,q);
	nor g2(q,r,qb);
endmodule