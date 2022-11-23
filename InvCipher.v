module InvCipher# (parameter size=128)
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

InvShiftRows    c2(tempblock,block2);
inverseSubbytes c1(block2,block3);
AddRoundKey     c5(block3,keys[128*(nr+1)-128*(i)-1-:128] ,block4);
InvMixColumns   c3(block4, tempout);


always@(posedge clk)
begin//a

if(reset==1)
begin//0
i=nr;
set=0;
end//0

else if(enable)//8
begin //1

if(finish ==1)
begin //2

if(i>=0)
begin //3

if(i==nr)
begin//4
tempblock=plaintext^keys[127:0];
end//4

if(i>=1&&i<nr)
begin//5
tempblock=tempout;
end//5

i=i-1;
end//3

if(i<0&&set!=1)
begin//6
out=block3^keys[128*(nr+1)-1-:128];
set=1;
end//6


end//2

end//1

end//8
endmodule
