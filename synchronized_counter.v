module srlatch(Q, Qn, clk, S, R);
   output Q;
   output Qn;
   input  clk;   
   input  S;
   input  R;
   
   wire   S1;
   wire   R1;
   
   and(S1, clk, S);
   and(R1, clk, R);   
   nor(Qn, S1, Q);
   nor(Q, R1, Qn);
endmodule 


module jkffms(Q, Qn, clk, J, K, rstn);

   output Q;
   output Qn;
   input  clk;
   input  J;
   input  K;
   input  rstn;
   
   wire   MQ;  
   wire   MQn; 
   wire   clkn;  
   wire   J1;  
   wire   K1;  
   wire   J2;  
   wire   K2;  

   assign J2 = !rstn ? 0 : J1;
   assign K2 = !rstn ? 1 : K1;
   
   and(J1, J, Qn);
   and(K1, K, Q);   
   not(clkn, clk);   
   srlatch m(MQ, MQn, clk, J2, K2);
   srlatch s(Q, Qn, clkn, MQ, MQn);   
endmodule 

module syncounter(rstn, clk, o); 
  input rstn;         // Active-low reset
  input clk;          // Clock input
  output o;           // MSB of the counter (o is used as the last output)
  wire w1, w2, w3, w4, w5, w6, w7, w8;

  // JK Flip-Flop instances
  // The first JK flip-flop toggles on every clock pulse (acts as a T flip-flop)
  jkffms b1(w1, w2, clk, 1'b1, 1'b1, rstn);  // LSB (first bit)
  
  // The second JK flip-flop toggles when w1 (the output of the first JK FF) is high
  jkffms b2(w3, w4, clk, w1, w1, rstn);      // Second bit
  
  // The third JK flip-flop toggles when both w1 and w3 are high (acts as a ripple counter)
  and (w8, w1, w3);                          // AND gate for clock enable logic
  jkffms b3(w5, w6, clk, w8, w8, rstn);      // Third bit
  
  // The fourth JK flip-flop toggles when all previous bits (w1, w3, w5) are high
  and (w7, w1, w3, w5);                      // AND gate for clock enable logic
  jkffms b4(w7, o, clk, w7, w7, rstn);       // MSB (fourth bit)

endmodule
