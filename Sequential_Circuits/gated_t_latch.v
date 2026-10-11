module gated_t_latch(t,ctrl,q,qb);
	input t,ctrl;
//	output q,qb;
	
//	wire w0,w1,w2;
	
//	nand (w0,t);
//	nand g1(w1,t,ctrl,qb);
//	nand g2(w2,w0,ctrl,q);
//	nand g3(q,w1,qb);
//	nand g4(qb,w2,q);

	output reg q;
	output qb;
	
	always @(*) begin
		if(ctrl!=0)
			q<=1'bx;
		else begin	
			case(t)
				0:q<=q;
				1:q<=~q;
			endcase
		end
	end
	assign qb=~q;
endmodule