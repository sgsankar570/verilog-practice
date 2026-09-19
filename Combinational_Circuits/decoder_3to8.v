module decoder_3to8(in,en,out);
	input [2:0] in;
	input en;
	output reg [7:0] out;
	
/*	assign out[7]=en&in[2]&in[1]&in[0];
	assign out[6]=en&in[2]&in[1]&(~in[0]);
	assign out[5]=en&in[2]&(~in[1])&in[0];
	assign out[4]=en&in[2]&(~in[1])&(~in[0]);
	assign out[3]=en&(~in[2])&in[1]&in[0];
	assign out[2]=en&(~in[2])&in[1]&(~in[0]);
	assign out[1]=en&(~in[2])&(~in[1])&in[0];
	assign out[0]=en&(~in[2])&(~in[1])&(~in[0]);
*/

	always @(*) begin
		if(!en) out=8'd0;
		else begin
			case(in)
				3'b000:out=8'd1;
				3'b001:out=8'd2;
				3'b010:out=8'd4;
				3'b011:out=8'd8;
				3'b100:out=8'd16;
				3'b101:out=8'd32;
				3'b110:out=8'd64;
				3'b111:out=8'd128;
				default:out=8'd0;
			endcase
		end
	end

	
endmodule