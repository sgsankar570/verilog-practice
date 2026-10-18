module mod_10_counter(clk,rst,count);
	input clk,rst;
	output reg [3:0] count;
	
	always @(posedge clk) begin
		if(rst)
			count<=4'd0;
		else if(count==10)
			count<=4'd0;
		else	
			count<=count+1'b1;
	end
endmodule