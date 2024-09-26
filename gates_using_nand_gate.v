//gates using nand universal gate
module ugate(y1,y2,y3,a,b);
output y1,y2,y3;
input a,b;

//andgate 
wire c;
nand(c,a,b);
nand(y1,c,c);

//orgate
wire a1,b1;
nand(a1,a,a);
nand(b1,b,b);
nand(y2,a,b);

//notgate
nand(y3,a,a);

endmodule 


module tb;
reg a,b;
wire y1,y2,y3;
  ugate u_g (.a(a),.b(b),.y1(y1),.y2(y2), .y3(y3));
initial 
begin
a=1'b0; b=1'b0;
  $display($time,"a=%b, b=%b, y1=%b, y2=%b, y3=%b \n" , a,b,y1,y2,y3);
#10 a=1'b0; b=1'b1;
  $display($time,"a=%b, b=%b, y1=%b, y2=%b, y3=%b \n" , a,b,y1,y2,y3);
#10 a=1'b1; b=1'b0;
  $display($time,"a=%b, b=%b, y1=%b, y2=%b, y3=%b \n" , a,b,y1,y2,y3);
#10 a=1'b1; b=1'b1;

$display($time,"a=%b, b=%b, y1=%b, y2=%b, y3=%b \n" , a,b,y1,y2,y3);
  $dumpfile("dump.vcd");
  $dumpvars(0,tb);
  #10;
end
endmodule
