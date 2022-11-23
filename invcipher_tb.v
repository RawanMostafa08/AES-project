module invcipher_tb();
reg[127:0]plaintext;
reg[255:0]key;
//reg[1:0]mode; //01>>128, 10>>192, 11>>>256
reg clk;
reg reset;
reg enable;
wire [127:0]out;
InvCipher #(256)uut(plaintext,key,clk,reset,enable,out);
initial begin
$monitor("%h",out);
clk=0;
enable=1;
plaintext=128'h8ea2b7ca516745bfeafc49904b496089;
key=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
reset=1;
#100;
reset=0;
end
always
begin
#50;
clk=~clk;
end

endmodule

