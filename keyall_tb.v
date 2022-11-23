module keyall_tb();
wire [1663:0] kall;
reg[191:0] key;
reg reset;
reg clk;
reg enable;
wire finish;
keyall #(192) k1(clk,reset,key,kall,finish);
initial 
begin 
clk=1;
reset=1;
enable=1;
key[191:0]=192'h8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b;
#50;
reset=0;
end

always
begin
#50;
clk=~clk;
end
endmodule