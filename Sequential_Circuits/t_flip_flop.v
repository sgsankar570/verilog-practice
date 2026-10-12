module t_flip_flop(clk,pre,clr,t,q,qb);
	input clk,pre,clr,t;
//	output q,qb;
	
//	wire w1,w2;
	
//	nand g1(w1,clk,t,qb);
//	nand g2(w2,clk,~t,q);
//	nand g3(q,w1,pre);
//	nand g4(qb,w2,clr);

	output reg q;
	output qb;
	
	always @(posedge clk) begin
		if(!pre)
			q<=1'b1;
		else if(!clr)
			q<=1'b0;
		else begin
			case(t)
				0:q<=q;
				1:q<=~q;
			endcase
		end
	end
	assign qb=~q;
endmodule