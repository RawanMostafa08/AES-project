module ShiftRows(A,B);

input  [127:0]A;
output [127:0]B;

assign B[127:120]=A[127:120];//15-->15
assign B[95:88]=A[95:88];//14-->14
assign B[63:56]=A[63:56];//13-->13
assign B[31:24]=A[31:24];//12-->12 

assign B[119:112]=A[87:80];//11-->10
assign B[87:80]=A[55:48];//10-->9
assign B[55:48]=A[23:16];//9-->8
assign B[23:16]=A[119:112];//8-->11

assign B[111:104]=A[47:40];//7-->5
assign B[79:72]=A[15:8];//6-->4
assign B[47:40]=A[111:104];//5-->7
assign B[15:8]=A[79:72];//4-->6

assign B[103:96]=A[7:0];//3-->0
assign B[71:64]=A[103:96];//2-->3
assign B[39:32]=A[71:64];//1-->2
assign B[7:0]=A[39:32];//0-->1

endmodule

module AddRoundKey
(
input [127:0] State,
input [127:0] Key,
output wire [127:0] NewState
);
assign NewState[127:0]=State[127:0]^Key[127:0];
endmodule