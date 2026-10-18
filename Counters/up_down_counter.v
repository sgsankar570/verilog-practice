module up_down_counter(clk,rst,up_down,count);
	input clk,rst,up_down;
	output reg [3:0] count;
	
	always @(posedge clk) begin
		if(up_down) begin
			if(rst)
				count<=4'd0;
			else
				count<=count+1'b1;
		end
		
		else begin	
			if(rst)
				count<=4'd15;
			else	
				count<=count-1'b1;
		end
	end
endmodule