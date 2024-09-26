// Code your design here
module ugate(y1,y2,y3,y4,y5,y6,a,b);
output y1,y2,y3,y4,y5,y6;
input a,b;

//andgate simple gate
wire c;
nand(c,a,b);
nand(y1,c,c);

//orgate again simple gate
wire a1,b1; 
nand(a1,a,a);
nand(b1,b,b);
nand(y2,a,b);

//notgate again simple gate
nand(y3,a,a);

  wire not_a, not_b, or_ab;
//NOR gate little bit complex
  // Invert inputs using NAND
  nand (not_a, a, a);  // not_a = a NAND a = NOT a
  nand (not_b, b, b);  // not_b = b NAND b = NOT b

  // OR gate using NAND (NAND of inverted inputs)
  nand (or_ab, not_a, not_b); // or_ab = (not_a NAND not_b) = a OR b

  // NOR gate = NOT(OR)
  nand (y4, or_ab, or_ab); // y = or_ab NAND or_ab = NOT or_ab = NOR a, b
 
  //XOR gate more complex
  wire nand_ab, nand_a, nand_b;

  // NAND gates for XOR implementation
  nand (nand_ab, a, b);        // nand_ab = a NAND b
  nand (nand_a, a, nand_ab);   // nand_a = a NAND (a NAND b)
  nand (nand_b, b, nand_ab);   // nand_b = b NAND (a NAND b)
  nand (y5, nand_a, nand_b);    // y = (a NAND (a NAND b)) NAND (b NAND (a NAND b))
  
  //XNOR Gate 
  wire  xor_ab;

  // NAND gates for XOR implementation
  nand (nand_ab, a, b);        // nand_ab = a NAND b
  nand (xor_ab, nand_a, nand_b); // xor_ab = XOR(a, b)
  // Final NAND gate for XNOR (inverting XOR result)
  nand (y6, xor_ab, xor_ab);    // y = NOT(XOR(a, b)) = XNOR(a, b)
endmodule 


module tb;
reg a,b;
wire y1,y2,y3,y4,y5,y6;
  ugate u_g (.a(a),.b(b),.y1(y1),.y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6));
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
