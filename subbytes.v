module subbytes(input [127:0]in,output [127:0]out);

sbox x1(in[127:120],out[127:120]);

sbox x2(in[119:112],out[119:112]);

sbox x3 (in[111:104],out[111:104]);

sbox x4(in[103:96],out[103:96]);

sbox x5(in[95:88],out[95:88]);

sbox x6(in[87:80],out[87:80]);

sbox x7(in[79:72],out[79:72]);

sbox x8(in[71:64],out[71:64]);

sbox x9(in[63:56],out[63:56]);

sbox x10(in[55:48],out[55:48]);



sbox x11(in[47:40],out[47:40]);

sbox x12(in[39:32],out[39:32]);

sbox x13(in[31:24],out[31:24]);

sbox x14(in[23:16],out[23:16]);

sbox x15(in[15:8],out[15:8]);

sbox x16(in[7:0],out[7:0]);
endmodule
////////////////////////////////////////////
module inverseSubbytes(input [127:0]in,output [127:0]out);
s_box_inv x1(in[127:120],out[127:120]);
 
s_box_inv x2(in[119:112],out[119:112]);

s_box_inv x3 (in[111:104],out[111:104]);

s_box_inv x4(in[103:96],out[103:96]);
 
s_box_inv x5(in[95:88],out[95:88]);

s_box_inv x6(in[87:80],out[87:80]);
 
s_box_inv x7(in[79:72],out[79:72]);

s_box_inv x8(in[71:64],out[71:64]);

s_box_inv x9(in[63:56],out[63:56]);

s_box_inv x10(in[55:48],out[55:48]);

s_box_inv x11(in[47:40],out[47:40]);
 
s_box_inv x12(in[39:32],out[39:32]);
 
s_box_inv x13(in[31:24],out[31:24]);
 
s_box_inv x14(in[23:16],out[23:16]);

s_box_inv x15(in[15:8],out[15:8]);

s_box_inv x16(in[7:0],out[7:0]);
endmodule