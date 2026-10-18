module enable_counter(clk,rst,en,up_count,down_count);
	input clk,rst,en;
	output reg [3:0] up_count;
	output reg [3:0] down_count;
	
	always @(posedge clk) begin
		if(rst)
			up_count<=4'd0;
		else begin	
			if(en)
				up_count<=up_count+1'b1;
				
			else
				up_count<=up_count;
		end
	end
	
	always @(posedge clk) begin
		if(rst)
			down_count<=4'd15;
		else begin
			if(en)
				down_count<=down_count-1'b1;
			else
				down_count<=down_count;
		end
	end
endmodule