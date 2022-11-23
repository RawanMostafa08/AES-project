module keyexpansion# (parameter size=128)(input clk, input[255:0] key, input[3:0] Nr,output[255:0] keyround,input flag,input[1:0] count,output [127:0] keyout);

localparam nr= size/32 +6;
wire [31:0]temp;
wire [31:0]temp1;
wire [31:0]temp2;
wire [31:0]temp3;
wire [31:0]temp4;
wire [31:0]rconOut; 
reg  [127:0]keymem[0:nr-1];
reg  [127:0]temprnd;

RotWord R(key[(255-size+32):(255-size+1)],temp);
sbox  s0(temp[31:24],temp1[31:24]);
sbox  s1(temp[23:16],temp1[23:16]);
sbox  s2(temp[15:8],temp1[15:8]);
sbox  s3(temp[7:0],temp1[7:0]);

Rcon#(size) Rc(Nr,rconOut);

sbox k0(key[31:24],temp2[31:24]);
sbox k1(key[23:16],temp2[23:16]);
sbox k2(key[15:8],temp2[15:8]);
sbox k3(key[7:0],temp2[7:0]);

RotWord R1(keyround[159:128],temp3);
sbox  s00(temp3[31:24],temp4[31:24]);
sbox  s11(temp3[23:16],temp4[23:16]);
sbox  s22(temp3[15:8],temp4[15:8]);
sbox  s33(temp3[7:0],temp4[7:0]);

assign keyround[255:224]=
(size==128)? temp1^key[255:224]^rconOut[31:0]:
(size==192)? key[127:96]:
(size==256)? key[127:96]:32'bx;

assign keyround[223:192]=
(size==128)? keyround[255:224]^key[223:192]:
(size==192)? key[95:64]:
(size==256)? key[95:64]:32'bx;

assign keyround[191:160]=
(size==128)? keyround[223:192]^key[191:160]:
(size==256)? key[63:32]:
(size==192&&count==1)? temp1^key[255:224]^rconOut[31:0]:key[(255-size+32):(255-size+1)]^key[255:224];

assign keyround[159:128]=
(size==128)? keyround[191:160]^key[159:128]:
(size==192)? keyround[191:160]^key[223:192]:
(size==256)? key[31:0]:32'bx;//count==1||count==2||count==3

assign keyround[127:96]=
(size==192&&count!=2)? keyround[159:128]^key[191:160]:
(size==192&&count==2)? temp4[31:0]^key[191:160]^rconOut[31:0]: 
(size==256&&flag!=1)? temp1^key[255:224]^rconOut[31:0]:temp2^key[255:224];
//
assign keyround[95:64]=
(size==192)? keyround[127:96]^key[159:128]:
(size==256)? keyround[127:96]^key[223:192]:32'bx;//count==1||count==2||count==3

assign keyround[63:32]=
(size==256)? keyround[95:64]^key[191:160]:32'bx;

assign keyround[31:0]=
(size==256)? keyround[63:32]^key[159:128]:32'bx;

always@*
begin
keymem[Nr-1]=keyround[255:128];
temprnd=keymem[Nr-1];
end


assign keyout[127:0]=temprnd;

endmodule

//assign keyround[255:224]=
//(mode==3&&Nr!=7)?temp1[31:0]^rconOut[31:0]^key[255:224]:32'bx;
//
//assign keyround[223:192]=
//(mode==3&&Nr!=7)?keyround[255:224]^key[223:192]:32'bx;
//
//assign keyround[191:160]=
//(mode==1)? 32'bx:
//(mode==2&&Nr!=8)? temp1[31:0]^rconOut[31:0]^key[191:160]:
//(mode==2&&Nr==8)?32'bx:
//(mode==3&&Nr!=7)?keyround[223:192]^key[191:160]:32'bx;
//
//assign keyround[159:128]=
//(mode==1)? 32'bx:
//(mode==2&&Nr!=8)? keyround[191:160]^key[159:128]:
//(mode==2&&Nr==8)?32'bx:
//(mode==3&&Nr!=7)? keyround[191:160]^key[159:128] :32'bx; //keyround xxx
//
//assign keyround[127:96]=
//(mode==1)? temp1[31:0]^rconOut[31:0]^key[127:96]:
//(mode==2&&Nr!=8)?keyround[159:128]^key[127:96]:
//(mode==2&&Nr==8)? temp1[31:0]^rconOut[31:0]^key[191:160]:
//(mode==3&&Nr!=7)?temp2[31:0]^key[127:96]:temp1[31:0]^rconOut[31:0]^key[255:224];
//
//
//assign keyround[95:64]=
//(mode==1)? keyround[127:96]^key[95:64]:
//(mode==2&&Nr!=8)? keyround[127:96]^key[95:64]: 
//(mode==2&&Nr==8)?temp1[31:0]^rconOut[31:0]^key[191:160]^key[159:128]:
//(mode==3&&Nr!=7)?keyround[127:96]^key[95:64]: temp1[31:0]^rconOut[31:0]^key[255:224]^key[223:192];
//
//assign keyround[63:32]=
//(mode==1)? keyround[95:64]^key[63:32]:
//(mode==2&&Nr!=8)? keyround[95:64]^key[63:32]:
//(mode==2&&Nr==8)? temp1[31:0]^rconOut[31:0]^key[191:160]^key[159:128]^key[127:96]:
//(mode==3&&Nr!=7)? keyround[95:64]^key[63:32]:temp1[31:0]^rconOut[31:0]^key[255:224]^key[223:192]^key[191:160];
//
//assign keyround[31:0]=
//(mode==1)? keyround[63:32]^key[31:0]:
//(mode==2&&Nr!=8)? keyround[63:32]^key[31:0]: 
//(mode==2&&Nr==8)?temp1[31:0]^rconOut[31:0]^key[191:160]^key[159:128]^key[127:96]^key[95:64]:
//(mode==3&&Nr!=7)?keyround[63:32]^key[31:0]: temp1[31:0]^rconOut[31:0]^key[255:224]^key[223:192]^key[191:160]^key[159:128];

