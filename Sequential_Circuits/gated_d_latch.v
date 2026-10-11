module gated_d_latch(d,ctrl,q,qb);
	input d,ctrl;
//	output q,qb;
	
//	wire w1,w2;
	
//	nand g1(w1,d,crtl);
//	nand g2(w2,d,ctrl);
//	nand g3(q,w1,qb);
//	nand g4(qb,w2,q);

	output reg q;
	output qb;
	
	always @(*) begin
		if(ctrl!=1)
			q<=1'bx;
		else
			q<=d;
	end
	assign qb=~q;
endmodule