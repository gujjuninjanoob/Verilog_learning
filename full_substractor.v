module fs (d,b,x,y,z);
output d,b;
input x,y,z;

assign d= x^y^z;
assign b= (~x&&y) ||(~x&&z) || (y&&z);
endmodule


module tbfs;

    
    reg tx;
    reg ty;
    reg tz;

    
    wire td;
    wire tb;
fs f0(td,tb,tx,ty,tz);

    initial begin
        tx = 0;  ty = 0;  tz = 0;  #10;
        $strobe($time,"td=%0b ,tb=%0b, tx=%0b, ty=%0b, tz=%0b",td,tb,tx,ty,tz);
        tx = 0;  ty = 0;  tz= 1;  #10;
        $strobe($time,"td=%0b ,tb=%0b, tx=%0b, ty=%0b, tz=%0b",td,tb,tx,ty,tz);        
        tx = 0;  ty = 1;  tz = 0;  #10;
        $strobe($time,"td=%0b ,tb=%0b, tx=%0b, ty=%0b, tz=%0b",td,tb,tx,ty,tz);
        tx = 0;  ty = 1;  tz = 1;  #10;             
        $strobe($time,"td=%0b ,tb=%0b, tx=%0b, ty=%0b, tz=%0b",td,tb,tx,ty,tz);
        tx = 1;  ty = 0;  tz = 0;  #10;
        $strobe($time,"td=%0b ,tb=%0b, tx=%0b, ty=%0b, tz=%0b",td,tb,tx,ty,tz);
        tx = 1;  ty = 0;  tz = 1;  #10; 
        $strobe($time,"td=%0b ,tb=%0b, tx=%0b, ty=%0b, tz=%0b",td,tb,tx,ty,tz);
        tx = 1;  ty = 1;  tz = 0;  #10;   
        $strobe($time,"td=%0b ,tb=%0b, tx=%0b, ty=%0b, tz=%0b",td,tb,tx,ty,tz);
        tx = 1;  ty = 1;  tz = 1;  #10; 
        $strobe($time,"td=%0b ,tb=%0b, tx=%0b, ty=%0b, tz=%0b",td,tb,tx,ty,tz);
    end

endmodule
