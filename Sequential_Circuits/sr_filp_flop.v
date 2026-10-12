module sr_filp_flop(clk,rst,s,r,q,qb);
	input clk,rst,s,r;
	output reg q;
	output qb;
	
	always @(posedge clk) begin
		if(rst)
			q<=1'b0;
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