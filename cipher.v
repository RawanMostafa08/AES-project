module Cipher# (parameter size=128)
(
input [127:0]plaintext,
input[size-1:0]key,
input clk,
input reset,
input enable,
output reg [127:0]out
);

localparam nr=size/32 +6;

wire finish;
wire [127:0] block2;
wire [127:0] block3;
wire [127:0] block4;
wire [127:0]tempout;
wire [128*(size/(32)+7)-1:0] keys;

reg set;
reg  [127:0]tempblock;

integer i; 

keyall #(size) k(clk,enable,reset,key,keys,finish);

subbytes    c1(tempblock,block2);
ShiftRows   c2(block2,block3);
MixColumns  c3(block3, block4);
AddRoundKey c5(block4,keys[128*(nr+1)-128*(i)-1-:128] ,tempout);


always@(posedge clk)
begin//a

if(reset==1)
begin//0
i=0;
set=0;
end//0

else if(enable)
begin //1

if(finish ==1)
begin //2

if(i<=nr)
begin //3

if(i==0)
begin//4
tempblock=plaintext^key[size-1-:128];
end//4

if(i>0&&i<=nr)
begin//5
tempblock=tempout;
end//5

i=i+1;
end//3

if(i==nr+1&&set!=1)
begin//6
out=block3^keys[127:0];
set=1;
end//6


end//2

end//1


end//a

endmodule
