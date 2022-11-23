module keyexpansion_tb();
reg[255:0] key;
reg[3:0] Nr;
reg clk;
reg flag;
reg[1:0] count;
wire[255:0] keyround;
wire[127:0] keyout;
keyexpansion#(128) k(clk,key,Nr,keyround,flag,count,keyout);

always
begin
#50;
clk=~clk;
end

initial begin
flag=0;
clk=1;
Nr=1;
count=1;
key[255:(256-128)]=128'h2b7e151628aed2a6abf7158809cf4f3c;

while(Nr<11)
begin 
#100
if(Nr%2==1)begin
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
Nr=Nr+1;
key[255:0]=keyround[255:0];
end

//#50;
//mode=2;
//Nr=1;
//key[191:0]=192'h8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b;
//while(Nr<9)
//begin 
//#100
//Nr=Nr+1;
//key[255:0]=keyround[255:0];
//$monitor("%h",keyround);
//end
//
//#50;
//mode=1;
//Nr=1;
//key[127:0]=128'h2b7e151628aed2a6abf7158809cf4f3c;
//while(Nr<11)
//begin 
//#100
//Nr=Nr+1;
//key[255:0]=keyround[255:0];
//$monitor("%h",keyround);
//end
//
//#50;
//mode=3;
//Nr=1;
//key[255:0]=256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;
//while(Nr<8)
//begin 
//#100
//Nr=Nr+1;
//key[255:0]=keyround[255:0];
//$monitor("%h",keyround);
//end

end
endmodule
//key[127:0]=128'h2b7e151628aed2a6abf7158809cf4f3c;
//key[191:0]=192'h8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b;
//key[255:0]=256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;