module jk_flip_flop(clk,pre,clr,j,k,q,qb);
	input clk,pre,clr,j,k;
//	output q,qb;
	
//	wire w1,w2;
	
//	nand g0(w1,clk,j,qb);
//	nand g1(w2,clk,k,q);
//	nand g2(q,w1,pre,qb);
//	nand g3(qb,w2,clr,q);
	
	output reg q;
	output qb;
	
	always @(posedge clk) begin
		if(!pre)
			q<=1'b1;
		else if(!clr)
			q<=1'b0;
		else begin	
			case({j,k})
				2'b00:q<=q;
				2'b01:q<=1'b0;
				2'b10:q<=1'b1;
				2'b11:q<=~q;
			endcase
		end
	end
	assign qb=~q;
endmodule