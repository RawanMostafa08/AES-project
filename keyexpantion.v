module keyexpantion(input[127:0] key,output[127:0] keyround,input mode, input[3:0] Nr);
wire [31:0]w0;
wire [31:0]w1;
wire [31:0]w2;
wire [31:0]w3;
wire  [31:0] temp;
wire  [31:0] temp1;
wire [31:0] rconOut;
assign w0[31:0]=key[127:96];
assign w1[31:0]=key[95:64];
assign w2[31:0]=key[63:32];
assign w3[31:0]=key[31:0];

RotWord R(w3,temp);
sbox  s(temp[31:24],temp1[31:24]);
sbox  s1(temp[23:16],temp1[23:16]);
sbox  s2(temp[15:8],temp1[15:8]);
sbox  s3(temp[7:0],temp1[7:0]);

Rcon Rc(Nr,rconOut);

assign keyround[127:96]=temp1[31:0]^rconOut[31:0]^w0[31:0];

assign keyround[95:64]=temp1[31:0]^rconOut[31:0]^w0[31:0]^w1[31:0];

assign keyround[63:32]=temp1[31:0]^rconOut[31:0]^w0[31:0]^w1[31:0]^w2[31:0];

assign keyround[31:0]=temp1[31:0]^rconOut[31:0]^w0[31:0]^w1[31:0]^w2[31:0]^w3[31:0];



endmodule