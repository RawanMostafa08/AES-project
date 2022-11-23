module keyall# (parameter size=128)(input clk,input enable,input reset,input[size-1:0] key,output reg [128*(size/32 +7)-1:0] kall,output reg finish );

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


always@(posedge clk)
begin

if(reset==1)
begin
Nr=1;
flag=0;
mode=1;
count=1;
finish=0;
kall='h0;
end
else if(enable) begin
if(kall[maxsize-:128]==key[size-1-:128])begin
finish=1;
end
if(Nr<=nr)
begin 

if(Nr==1)begin
keytemp[255-:size]=key[size-1:0];
end
else begin
keytemp[255-:size]=keyround[255-:size];
end
Nr=Nr+1;
if((Nr-1)%2==0)begin
flag=1;
end
else begin
flag=0;
end
if(count!=3)begin
count=count+1;
end
else begin
count=1;
end
kall[(maxsize-128*(Nr-2))-:128]=kout[127:0];//kall[(maxsize-(128*Nr)+1)-:128 ]
end
if(Nr>nr)begin
kall[127:0]=kout[127:0];
kall[maxsize-:128]=key[size-1-:128];

end
end
end
//assign kall[size*(size/32 +7)-1 -:128]=128'h2b7e151628aed2a6abf7158809cf4f3c;

endmodule