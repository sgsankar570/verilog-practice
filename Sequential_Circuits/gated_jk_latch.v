module gated_jk_latch(j,k,ctrl,q,qb);
	input j,k,ctrl;
//	output q,qb;
	
//	wire w1,w2;
	
//	nand g1(w1,j,ctrl,qb);
//	nand g2(w2,k,ctrl,q);
//	nand g3(q,w1,qb);
//	nand g4(qb,w2,q);

	output reg q;
	output qb;
	
	always @(*) begin
		if(ctrl!=1)
			q<=1'bx;
		else begin
			case({j,k})
				2'b00:q<=q;
				2'b01:q<=0;
				2'b10:q<=1;
				2'b11:q<=~q;
			endcase
		end
	end
	assign qb=~q;
endmodule