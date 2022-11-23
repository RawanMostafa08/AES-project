module Invkeyall_tb();
wire [1407:0] kall;
reg[127:0] key;
reg clk;
wire finish;
Ikeyall #(128) k1(clk,key,kall,finish);
initial 
begin 
clk=1;
key=128'h2b7e151628aed2a6abf7158809cf4f3c;
end

always
begin
#50;
clk=~clk;
end
endmodule