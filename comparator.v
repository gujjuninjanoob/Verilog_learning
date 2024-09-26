module comparator(A,B,g,l,e);
input [3:0]A;
input [3:0]B;
output g,l,e;
wire [3:0]w;
xnor(w[0],A[0],B[0]);
xnor(w[1],A[1],B[1]);
xnor(w[2],A[2],B[2]);
xnor(w[3],A[3],B[3]);

assign g=(A[3]&&(~B[3]))||(w[3]&&A[2]&&(~B[2]))||(w[3]&&w[2]&&A[1]&&(~B[1]))||(w[3]&&w[2]&&w[1]&&A[0]&&(~B[0]));
assign e=w[3]&&w[2]&&w[1]&&w[0];
assign l=(B[3]&&(~A[3]))||(w[3]&&B[2]&&(~A[2]))||(w[3]&&w[2]&&B[1]&&(~A[1]))||(w[3]&&w[2]&&w[1]&&B[0]&&(~A[0]));

endmodule

module tcomp;
reg [3:0]tA,tB;
wire tg,tl,te;
comparator c0 (tA,tB,tg,tl,te);
initial begin 
    tA=4'b0000 ;tB=4'b0000;
  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b0001;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl); 
#10;tA=4'b0000 ;tB=4'b0010;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b0011;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b0100;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b0101;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b0110;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b0111;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b1000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b1001;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b1010;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b1011;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b1100;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b1101;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b1110;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b1111;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0000 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0001 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0010 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0011 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0100 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0101 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0110 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b0111 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b1000 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b1001 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b1010 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b1011 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b1100 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b1101 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b1110 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;tA=4'b1111 ;tB=4'b0000;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
#10;  $strobe($time,"A=%0b, B=%0b, Greater=%0b, Equal=%0b, lesser=%0b",tA,tB,tg,te,tl);
end
endmodule
