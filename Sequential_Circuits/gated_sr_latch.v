module gated_sr_latch(s,r,ctrl,q,qb);
	input s,r,ctrl;
//	output q,qb;
	
//	wire w1,w2;
	
//	nand g1(w1,s,ctrl);
//	nand g2(w2,r,ctrl);
//	nand g3(q,w1,qb);
//	nand g4(qb,w2,q);

	output reg q;
	output qb;
	
	always @(*) begin
		if(ctrl!=1)
			q<=1'bx;
		else begin
			case({s,r})
				2'b00:q<=q;
				2'b01:q<=1'b0;
				2'b10:q<=1'b1;
				2'b11:q<=1'bx;
			endcase
		end
	end
	assign qb=~q;
endmodule