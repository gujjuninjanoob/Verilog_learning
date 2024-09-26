
module ugate_using_nor(y1, y2, y3, y4, y5, y6, a, b);
  output y1, y2, y3, y4, y5, y6;
  input a, b;

  // Wires for intermediate connections
  wire not_a, not_b, or_ab, nor_ab;
  wire nor1, nor2, nor3, nor4;
  wire xor_a, xor_b, xor_ab;

  // NOT gate using NOR (NOT a = a NOR a)
  nor (not_a, a, a); // y3 = NOT a
  nor (not_b, b, b); // for further use

  // AND gate using NOR
  nor (nor1, a, b);   // a NOR b
  nor (y1, nor1, nor1); // y1 = AND(a, b) = NOT(a NOR b)

  // OR gate using NOR
  nor (nor2, a, a);   // NOT a
  nor (nor3, b, b);   // NOT b
  nor (y2, nor2, nor3); // y2 = OR(a, b)

  // NAND gate 
  nor (y4, y1, y1);     

  // XOR gate using NOR
  // XOR = (A NOR (A NOR B)) NOR (B NOR (A NOR B))
  nor (nor1, a, b);       // nor1 = A NOR B
  nor (xor_a, a, nor1);   // xor_a = A NOR (A NOR B)
  nor (xor_b, b, nor1);   // xor_b = B NOR (A NOR B)
  nor (y5, xor_a, xor_b); // y5 = XOR(a, b)

  // XNOR gate using NOR (Inverted XOR)
  nor (y6, y5, y5); // y6 = NOT(XOR(a, b)) = XNOR(a, b)

  // NOT gate (y3)
  nor (y3, a, a);   // y3 = NOT a
endmodule


module tb;
reg a,b;
wire y1,y2,y3,y4,y5,y6;
  ugate_using_nor u_g (.a(a),.b(b),.y1(y1),.y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6));
initial 
begin
  #1;
a=1'b0; b=1'b0;
  $strobe($time," a=%b, b=%b, y1=%b, y2=%b, y3=%b, y4=%b, y5=%b, y6=%b \n" , a,b,y1,y2,y3,y4,y5,y6);
#10 a=1'b0; b=1'b1;
  $strobe($time,"a=%b, b=%b, y1=%b, y2=%b, y3=%b, y4=%b, y5=%b, y6=%b  \n" , a,b,y1,y2,y3,y4,y5,y6);
#10 a=1'b1; b=1'b0;
  $strobe($time,"a=%b, b=%b, y1=%b, y2=%b, y3=%b, y4=%b, y5=%b, y6=%b  \n" , a,b,y1,y2,y3,y4,y5,y6);
#10 a=1'b1; b=1'b1;
  $strobe($time,"a=%b, b=%b, y1=%b, y2=%b, y3=%b, y4=%b, y5=%b, y6=%b \n" , a,b,y1,y2,y3,y4,y5,y6);
 
  #10;
end
endmodule
