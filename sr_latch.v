module srlatch(s, r, q, qb);
  input s, r;
  output q, qb;
  reg q, qb;

  always @ (s or r) begin
    case ({s, r})
      2'b00: begin
        // Hold state (q retains its previous value)
        // No need to do anything here
      end
      2'b01: begin
        q <= 0;  // Reset state
        qb <= 1;
      end
      2'b10: begin
        q <= 1;  // Set state
        qb <= 0;
      end
      2'b11: begin
        q <= 1'bx; // Invalid state
        qb <= 1'bx;
      end
    endcase
  end
endmodule

module tbsr;
reg s,r,qb;
wire q;

srlatch sr (s,r,qb,q);
initial begin
s=0;r=0;
  $strobe($time,"s=%0b, r=%0b, qb=%0b, q=%0b",s,r,qb,q);
#10;s=0;r=1;
  $strobe($time,"s=%0b, r=%0b, qb=%0b, q=%0b",s,r,qb,q);
#10;s=1;r=0;
  $strobe($time,"s=%0b, r=%0b, qb=%0b, q=%0b",s,r,qb,q);
#10;s=1;r=1;
  $strobe($time,"s=%0b, r=%0b, qb=%0b, q=%0b",s,r,qb,q);

end 
endmodule
