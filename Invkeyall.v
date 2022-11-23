module Invkeyall# (parameter size=128)(input clk,input[size-1:0] key,output reg [128*(size/32 +7)-1:0] kall,output reg finish );

localparam nr= size/32 +6;
localparam maxsize=128*(nr+1)-1;
reg flag;
reg[1:0] mode;
reg[1:0]count;
reg[3:0] Nr;

wire[255:0] keyround;
reg [255:0] keytemp;
wire[127:0] kout;

keyexpansion#(size) uut(clk,keytemp,Nr-1,keyround,flag,count-1,kout);

initial
begin
Nr=1;
flag=0;
mode=1;
count=1;
finish=0;
end

always@(posedge clk)
begin//a

if(kall[127:0]==key[size-1-:128])begin//0
finish=1;
end//0

else if(Nr<=nr)begin//1 

if(Nr==1)begin//2
keytemp[255-:size]=key[size-1:0];
end//2

else begin//3
keytemp[255-:size]=keyround[255-:size];
end//3

Nr=Nr+1;

if((Nr-1)%2==0)begin//4
flag=1;
end//4

else begin//5
flag=0;
end//5

if(count!=3)begin//6
count=count+1;
end//6

else begin//7
count=1;
end//7

kall[(128*(1)-1):(128*(1-1))]=kout[127:0];//kall[(maxsize-(128*Nr)+1)-:128 ]
end//1

else if(Nr>nr)begin//8
kall[maxsize-:128]=kout[127:0];
kall[127:0]=key[size-1-:128];
end//8

end//4


endmodule