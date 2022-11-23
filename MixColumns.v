

module MixColumns
(
input  [127:0] state,
output wire [127:0] NewState
);
/*
reg [31:0] c1;
reg [31:0] c2;
reg [31:0] c3;
reg [31:0] c4;
reg [31:0] o1;
reg [31:0] o2;
reg [31:0] o3;
reg [31:0] o4;
////////////////////////////////
//c1[31:24]=state[127:120]x2

o1[31:24]={state[127:120],0};
if(state[127]==1)
o1[31:24]=o1[31:24]^00011011;
else 
o1[31:24]=o1[31:24];
////////////////////////////////
//c1[23:16]=state[119:112]x3

o1[23:16]={state[119:112],0};
if(state[119]==1)
begin
o1[23:16]=o1[23:16]^00011011;
o1[23:16]=o1[23:16]^state[119:112];
end
else 
o1[23:16]=o1[23:16]^state[119:112];
//////////////////////////////////////
//c1[15:8]=state[111:104]x1
o1[15:8]=state[111:104];

//////////////////////////////////////
//c1[7:0]=state[103:96]x1
o1[7:0]=state[103:96];


NewState[127:120]=o1[31:24]^o1[23:16]^o1[15:8]^o1[7:0];

////////////////////////////////
//c2[31:24]=state[95:88]x1
o2[31:24]=state[95:88];

////////////////////////////////
//c2[23:16]=state[87:80]x2

o2[23:16]={state[87:80],0};
if(state[87]==1)
o2[23:16]=o2[23:16]^00011011;
else 
o2[23:16]=o2[23:16];
////////////////////////////////
//c2[15:8]=state[79:72]x3

o2[15:8]={state[79:72],0};
if(state[79]==1)
begin
o2[15:8]=o2[15:8]^00011011;
o2[15:8]=o2[15:8]^state[79:72];
end
else 
o2[15:8]=o2[15:8]^state[79:72];

//////////////////////////////////////
//c2[7:0]=state[71:64]x1
o2[7:0]=state[71:64];

NewState[119:112]=o2[31:24]^o2[23:16]^o2[15:8]^o2[7:0]*/

reg a=4'b0001;
reg b=4'b0010;
reg c=4'b0011;

wire [127:0] out1;
wire [127:0] out2;
wire [127:0] out3;
wire [127:0] out4;

multiply e1 (state[127:120],4'b0010,out1[127:120]);
multiply e2 (state[119:112],4'b0011,out1[119:112]);
multiply e3 (state[111:104],4'b0001,out1[111:104]);
multiply e4 (state[103:96], 4'b0001,out1[103:96]);
assign NewState[127:120]=out1[127:120]^out1[119:112]^out1[111:104]^out1[103:96];  //e11

multiply e5 (state[127:120],4'b0001,out1[95:88]);
multiply e6 (state[119:112],4'b0010,out1[87:80] );
multiply e7 (state[111:104],4'b0011,out1[79:72] );
multiply e8 (state[103:96], 4'b0001,out1[71:64]);
assign NewState[119:112]=out1[95:88]^out1[87:80]^out1[79:72]^out1[71:64];  //e21

multiply e9 (state[127:120], 4'b0001,out1[63:56]);
multiply e10 (state[119:112],4'b0001,out1[55:48]);
multiply e11 (state[111:104],4'b0010,out1[47:40]);
multiply e12 (state[103:96], 4'b0011,out1[39:32]);
assign NewState[111:104]=out1[63:56]^out1[55:48]^out1[47:40]^out1[39:32];  //e31

multiply e13 (state[127:120],4'b0011,out1[31:24]);
multiply e14 (state[119:112],4'b0001,out1[23:16]);
multiply e15 (state[111:104],4'b0001,out1[15:8]);
multiply e16 (state[103:96], 4'b0010,out1[7:0]);
assign NewState[103:96]=out1[31:24]^out1[23:16]^out1[15:8]^out1[7:0];  //e41
///////////////////////////////////////////////////////////////////////
multiply e17 (state[95:88],4'b0010,out2[127:120]);
multiply e18 (state[87:80],4'b0011,out2[119:112]);
multiply e19 (state[79:72],4'b0001,out2[111:104]);
multiply e20 (state[71:64],4'b0001,out2[103:96]);///////
assign NewState[95:88]=out2[127:120]^out2[119:112]^out2[111:104]^out2[103:96];  //e12

multiply e21 (state[95:88],4'b0001,out2[95:88]);
multiply e22 (state[87:80],4'b0010,out2[87:80] );
multiply e23 (state[79:72],4'b0011,out2[79:72] );
multiply e24 (state[71:64],4'b0001,out2[71:64] );//////
assign NewState[87:80]=out2[95:88]^out2[87:80]^out2[79:72]^out2[71:64];  //e22

multiply e25 (state[95:88],4'b0001,out2[63:56]);
multiply e26 (state[87:80],4'b0001,out2[55:48]);
multiply e27 (state[79:72],4'b0010,out2[47:40]);
multiply e28 (state[71:64],4'b0011,out2[39:32]);///////
assign NewState[79:72]=out2[63:56]^out2[55:48]^out2[47:40]^out2[39:32];  //e32

multiply e29 (state[95:88],4'b0011,out2[31:24]);
multiply e30 (state[87:80],4'b0001,out2[23:16]);
multiply e31 (state[79:72],4'b0001,out2[15:8]);
multiply e32 (state[71:64],4'b0010,out2[7:0]);////////
assign NewState[71:64]=out2[31:24]^out2[23:16]^out2[15:8]^out2[7:0];  //e42
///////////////////////////////////////////////////////////////////////////
multiply e33 (state[63:56],4'b0010,out3[127:120]);
multiply e34 (state[55:48],4'b0011,out3[119:112]);
multiply e35 (state[47:40],4'b0001,out3[111:104]);
multiply e36 (state[39:32],4'b0001,out3[103:96]);
assign NewState[63:56]=out3[127:120]^out3[119:112]^out3[111:104]^out3[103:96];  //e13

multiply e37 (state[63:56],4'b0001,out3[95:88]);
multiply e38 (state[55:48],4'b0010,out3[87:80] );
multiply e39 (state[47:40],4'b0011,out3[79:72] );
multiply e40 (state[39:32],4'b0001,out3[71:64] );
assign NewState[55:48]=out3[95:88]^out3[87:80]^out3[79:72]^out3[71:64];  //e23

multiply e41 (state[63:56],4'b0001,out3[63:56]);
multiply e42 (state[55:48],4'b0001,out3[55:48]);
multiply e43 (state[47:40],4'b0010,out3[47:40]);
multiply e44 (state[39:32],4'b0011,out3[39:32]);
assign NewState[47:40]=out3[63:56]^out3[55:48]^out3[47:40]^out3[39:32];  //e33

multiply e45 (state[63:56],4'b0011,out3[31:24]);
multiply e46 (state[55:48],4'b0001,out3[23:16]);
multiply e47 (state[47:40],4'b0001,out3[15:8] );
multiply e48 (state[39:32],4'b0010,out3[7:0]  );
assign NewState[39:32]=out3[31:24]^out3[23:16]^out3[15:8]^out3[7:0];  //e43
/////////////////////////////////////////////////////////////////////////
multiply e49 (state[31:24],4'b0010,out4[127:120]);
multiply e50 (state[23:16],4'b0011,out4[119:112]);
multiply e51 (state[15:8] ,4'b0001,out4[111:104]);
multiply e52 (state[7:0]  ,4'b0001,out4[103:96]);
assign NewState[31:24]=out4[127:120]^out4[119:112]^out4[111:104]^out4[103:96];  //e14

multiply e53 (state[31:24],4'b0001,out4[95:88]);
multiply e54 (state[23:16],4'b0010,out4[87:80] );
multiply e55 (state[15:8] ,4'b0011,out4[79:72] ); 
multiply e56 (state[7:0]  ,4'b0001,out4[71:64] );
assign NewState[23:16]=out4[95:88]^out4[87:80]^out4[79:72]^out4[71:64];  //e24

multiply e57 (state[31:24],4'b0001,out4[63:56]);
multiply e58 (state[23:16],4'b0001,out4[55:48]);
multiply e59 (state[15:8] ,4'b0010,out4[47:40]);
multiply e60 (state[7:0]  ,4'b0011,out4[39:32]);
assign NewState[15:8]=out4[63:56]^out4[55:48]^out4[47:40]^out4[39:32];  //e34

multiply e61 (state[31:24],4'b0011,out4[31:24]);
multiply e62 (state[23:16],4'b0001,out4[23:16]);
multiply e63 (state[15:8] ,4'b0001,out4[15:8]);
multiply e64 (state[7:0]  ,4'b0010,out4[7:0]);
assign NewState[7:0]=out4[31:24]^out4[23:16]^out4[15:8]^out4[7:0];  //e44*/
/////////////////////////////////////////////////////////////////////////



endmodule
module multiply
(input [7:0] in,
input [3:0]x,
output reg [7:0] out
);

always@(in,x)
begin
if (x==4'b0010)
begin
out[7:0]={in[6:0],1'b0};
if(in[7]==1'b1)
out=out^8'b00011011;
else 
out=out;
end
else if (x==4'b0011)
begin
out[7:0]={in[6:0],1'b0};
if(in[7]==1'b1)
begin
out=out^8'b00011011;
out=out^in;
end
else 
out=out^in;
end
else if (x==4'b0001)
out=in;
end
endmodule