module combkey_tb();


reg[127:0]keyin;
wire[1407:0]keyout;
CombineKey#(128) c(keyin,keyout);

initial begin
keyin=128'h2b7e151628aed2a6abf7158809cf4f3c;
end
endmodule
