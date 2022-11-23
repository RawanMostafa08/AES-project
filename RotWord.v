module RotWord(A,B);
input[31:0]A;
output[31:0]B;

assign B[31:8]=A[23:0];
assign B[7:0]=A[31:24];
endmodule


module Rcon#(parameter size=128)(i,rcon);
input[3:0] i;
output reg[31:0]rcon;

always @(i)
	if(size==128)
	begin
    case (i)
      4'b0001: rcon=32'h01000000; 
		4'b0010: rcon=32'h02000000; 
	   4'b0011: rcon=32'h04000000; 
		4'b0100: rcon=32'h08000000; 
		4'b0101: rcon=32'h10000000; 
		4'b0110: rcon=32'h20000000;
		4'b0111: rcon=32'h40000000;  
		4'b1000: rcon=32'h80000000; 
		4'b1001: rcon=32'h1b000000; 
	   4'b1010: rcon=32'h36000000; 
		
	 endcase 
	end
	else if(size==192)
	begin
    case (i)
      4'b0001: rcon=32'h01000000; 
		4'b0010: rcon=32'h02000000; 
	   4'b0011: rcon=32'h02000000; 
		4'b0100: rcon=32'h04000000; 
		4'b0101: rcon=32'h08000000; 
		4'b0110: rcon=32'h08000000;
		4'b0111: rcon=32'h10000000;  
		4'b1000: rcon=32'h20000000; 
		4'b1001: rcon=32'h20000000; 
	   4'b1010: rcon=32'h40000000; 
	   4'b1011: rcon=32'h80000000;  
		4'b1100: rcon=32'h80000000;
	 endcase 
	end
	else if(size==256)
	begin
	  case (i)
      4'b0001: rcon=32'h01000000; 
		4'b0010: rcon=32'h01000000; 
	   4'b0011: rcon=32'h02000000; 
		4'b0100: rcon=32'h02000000; 
		4'b0101: rcon=32'h04000000; 
		4'b0110: rcon=32'h04000000;
		4'b0111: rcon=32'h08000000;  
		4'b1000: rcon=32'h08000000; 
		4'b1001: rcon=32'h10000000; 
	   4'b1010: rcon=32'h10000000; 
		4'b1011: rcon=32'h20000000;  
		4'b1100: rcon=32'h20000000; 
		4'b1101: rcon=32'h40000000; 
	   4'b1110: rcon=32'h40000000; 
	 endcase 
	end
endmodule
