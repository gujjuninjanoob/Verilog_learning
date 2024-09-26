module fa (a,b,c,s,c_out);
input a,b,c;
output s,c_out;
wire s1,s2,s3,s4;
wire a_n,b_n,c_n; 
wire c1,c2,c3;

not (a_n,a);
not (b_n,b);
not (c_n,c);

and(s1,a,b,c);
and(s2,a_n,b,c_n);
and(s3,a_n,b_n,c);
and(s4,a,b_n,c_n);
and(c1,a,b);
and(c2,b,c);
and(c3,a,c);

or(s,s1,s2,s3,s4);
or(c_out,c1,c2,c3);

endmodule

module tbfa;
reg a,b,c;
wire s,c_o;

fa w0(a,b,c,s,c_o);
initial begin 
a=0;
b=0;
c=0;
$strobe($time,"a=%0b, b=%0b, c=%0b, s=%0b, c_out=%0b",a,b,c,s,c_o);
#10;
a=0;
b=0;
c=1;
$strobe($time,"a=%0b, b=%0b, c=%0b, s=%0b, c_out=%0b",a,b,c,s,c_o);
#10;
a=0;
b=1;
c=0;
$strobe($time,"a=%0b, b=%0b, c=%0b, s=%0b, c_out=%0b",a,b,c,s,c_o);
#10;
a=0;
b=1;
c=1;
$strobe($time,"a=%0b, b=%0b, c=%0b, s=%0b, c_out=%0b",a,b,c,s,c_o);
#10;
a=1;
b=0;
c=0;
$strobe($time,"a=%0b, b=%0b, c=%0b, s=%0b, c_out=%0b",a,b,c,s,c_o);
#10;
a=1;
b=0;
c=1;
$strobe($time,"a=%0b, b=%0b, c=%0b, s=%0b, c_out=%0b",a,b,c,s,c_o);
#10;
a=1;
b=1;
c=0;
$strobe($time,"a=%0b, b=%0b, c=%0b, s=%0b, c_out=%0b",a,b,c,s,c_o);
#10;
a=1;
b=1;
c=1;
  $strobe($time,"a=%0b, b=%0b, c=%0b, s=%0b, c_out=%0b",a,b,c,s,c_o);
end
endmodule
