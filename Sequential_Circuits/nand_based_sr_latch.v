module nand_based_sr_latch(s,r,q,qb);
	input s,r;
	output q,qb;
	
	nand g1(q,s,qb);
	nand g2(qb,r,q);
endmodule