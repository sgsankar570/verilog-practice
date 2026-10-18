module counter(clk,rst,load,up_down,data,count);
	input clk,rst,load,up_down;
	input [3:0] data;
	output reg [3:0] count;
	
	always @(posedge clk) begin
		if(rst)
			count<=4'd0;
		else if(load)
			count<=data;
		else begin
			if(up_down) begin
				if(count>=4'd12)
					count<=4'd2;
				else
					count<=count+1'b1;
			end
			
			else	begin
				if(count<=2)
					count<=4'd12;
				else
					count<=count-1'b1;
			end
		end
	end
endmodule
				