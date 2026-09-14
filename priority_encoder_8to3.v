module priority_encoder_8to3(in,out);
	input [7:0] in;
	output reg [2:0] out;
	
/*	always @(*) begin
		if(in[7]==1) out=3'd7;
		else if(in[6]==1) out=3'd6;
		else if(in[5]==1) out=3'd5;
		else if(in[4]==1) out=3'd4;
		else if(in[3]==1) out=3'd3;
		else if(in[2]==1) out=3'd2;
		else if(in[1]==1) out=3'd1;
		else if(in[0]==1) out=3'd0;
		else out=3'bx;
	end
*/

/*	always @(*) begin
		casez(in)
			8'b1???_????:out=3'd7;
			8'b01??_????:out=3'd6;
			8'b001?_????:out=3'd5;
			8'b0001_????:out=3'd4;
			8'b0000_1???:out=3'd3;
			8'b0000_01??:out=3'd2;
			8'b0000_001?:out=3'd1;
			8'b0000_0001:out=3'd0;
			default:out=3'bx;
		endcase
	end
*/

/*	always @(*) begin
		casex(in)
			8'b1xxx_xxxx:out=3'd7;
			8'b01xx_xxxx:out=3'd6;
			8'b001x_xxxx:out=3'd5;
			8'b0001_xxxx:out=3'd4;
			8'b0000_1xxx:out=3'd3;
			8'b0000_01xx:out=3'd2;
			8'b0000_001x:out=3'd1;
			8'b0000_0001:out=3'd0;
			default:out=3'bx;
		endcase
	end
*/

	always @(*) begin
		case(1'b1)
			in[7]:out=3'd7;
			in[6]:out=3'd6;
			in[5]:out=3'd5;
			in[4]:out=3'd4;
			in[3]:out=3'd3;
			in[2]:out=3'd2;
			in[1]:out=3'd1;
			in[0]:out=3'd0;
			default:out=3'bx;
		endcase
	end
endmodule