module CombineKey# (parameter size=128)(input [size-1:0] keyin,output[128*(size/32 +7)-1:0] keyout);

localparam nr= size/32 +6;
localparam maxsize=128*(nr+1)-1;
wire flag[nr:0];
wire count[nr:0];
wire[3:0] Nr[nr:0];
wire[255:0] keyround[nr:0];
wire[255:0] keytemp[nr+1:0];
wire[127:0] kout[nr+1:0];

assign count[0]=1;
assign flag[0]=0;
assign keytemp[0][255-:size]=keyin[size-1:0];


genvar i;
generate 

for (i=0; i<1; i=i+1)
begin : b1
assign Nr[i]=i+1;
keyexpansion uut(128'h2b7e151628aed2a6abf7158809cf4f3c,1,keyround[0],0,0,kout[0]);

//if(i%2==0)begin
//assign flag[i+1]=1;
//end
//else begin
//assign flag[i]=0;
//end
//
//if(i<=3)begin
//assign count[i+1]=i;
//end
//else begin
//assign count[i]=1;
//end

assign keytemp[i+1]=keyround[0];
assign keyout[127:0]=kout[0];
end
endgenerate



endmodule
