module d_flip_flop(clk,pre,clr,d,q,qb);
	input clk,pre,clr,d;
//	output q,qb;
	
//	wire w1,w2;
	
//	nand(w1,d,clk);
//	nand(w2,d,clk);
//	nand(q,w1,pre);
//	nand(qb,w2,clr);

	output reg q;
	output qb;
	
	always @(posedge clk) begin
		if(!pre)
			q<=1'b1;
		else if(!clr)
			q<=1'b0;
		else	
			q<=d;
	end
	assign qb<=~q;
endmodule