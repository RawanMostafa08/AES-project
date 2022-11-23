module cipher_tb();
reg[127:0]plaintext;
reg[127:0]key;
//reg[1:0]mode; //01>>128, 10>>192, 11>>>256
reg clk;
reg reset;
reg enable;
wire [127:0]out;
Cipher #(128)uut(plaintext,key,clk,reset,enable,out);
initial begin
$monitor("%h",out);
clk=0;
enable=0;
plaintext=128'h00112233445566778899aabbccddeeff;
key=128'h000102030405060708090a0b0c0d0e0f;
reset=1;
#1200
enable=1;
#1250;
reset=0;
#1500
reset=1;
enable=0;
#1600
enable=1;
#1700
reset=0;
end
always
begin
#50;
clk=~clk;
end

endmodule