module wrapper_tb();

reg clk;
reg reset;
reg enable;
wire check1;
wire check2;
wire check3;
Wrapper w(clk,reset,enable,check1,check2,check3);

always
begin
#50;
clk=~clk;
end

initial begin

clk=1;
reset=1;
enable=1;
#200
reset=0;
#7000
reset=1;
#3050
reset=0;
end

endmodule
