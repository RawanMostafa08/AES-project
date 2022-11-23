module Wrapper(input clk ,input reset , input enable , output reg check1,output reg check2,output reg check3 );
reg [127:0] plaintext[2:0];

reg [127:0] key1;
reg [191:0] key2;
reg [255:0] key3;

wire[127:0] out1;
wire[127:0] out2;
wire[127:0] out3;

wire[127:0] out4;
wire[127:0] out5;
wire[127:0] out6;

reg [127:0] tempout1;
reg [127:0] tempout2;
reg [127:0] tempout3;

Cipher#(128)c128(plaintext[0],key1,clk,reset,enable,out1);
InvCipher#(128)ci128(tempout1,key1,clk,reset,enable,out2);


Cipher#(192)c192(plaintext[1],key2,clk,reset,enable,out3);
InvCipher#(192) ci192(tempout2,key2,clk,reset,enable,out4);


Cipher#(256)c256(plaintext[2],key3,clk,reset,enable,out5);
InvCipher#(256) ci256(tempout3,key3,clk,reset,enable,out6);

integer i;
always@(posedge clk)
begin
if(reset==1)
begin
plaintext[0]=128'h00112233445566778899aabbccddeeff;
plaintext[1]=128'h00112233445566778899aabbccddeeff;
plaintext[2]=128'h00112233445566778899aabbccddeeff;

key1=128'h000102030405060708090a0b0c0d0e0f;
key2=192'h000102030405060708090a0b0c0d0e0f1011121314151617;
key3=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
check1=0;
check2=0;
check3=0;
 i=0;
end
else if(enable)
begin
 if(out2==plaintext[0])// check for mode 1
 begin 
 check1=1;
 end
 if(out4==plaintext[1])// check for mode 2
 begin 
 check2=1;
 end
  if(i==30)    // i for mode 3
 begin 
 tempout2=out3;
 tempout3=out5;
 tempout1=out1;
 end
 if(out6==plaintext[2])// check for mode 3
 begin 
 check3=1;
 end



 i=i+1;
end 
end


endmodule

