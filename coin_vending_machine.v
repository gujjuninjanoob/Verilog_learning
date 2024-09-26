module chocov(clk, rst, coin, vend, state);
  input clk;             // Clock signal
  input rst;             // Reset signal
  input wire [1:0] coin; // Coin input (2-bit)
  output reg vend;       // Vend signal (1-bit, high when vending)
  output reg [2:0] state; // State output (3-bit for FSM)

  // State encoding
  parameter [2:0] IDLE = 3'b000;
  parameter [2:0] S1 = 3'b001;
  parameter [2:0] S2 = 3'b010;
  parameter [2:0] S3 = 3'b011;
  parameter [2:0] S4 = 3'b100;
  parameter [2:0] S5 = 3'b101;
  
  // Coin values
  parameter [1:0] FIFTEEN = 2'b00;
  parameter [1:0] TEN = 2'b01;
  parameter [1:0] FIVE = 2'b10;

  reg [2:0] n_state; // Next state register

  // Combinational logic: Next state logic
  always @(*) begin
    n_state = state;  // Default next state is the current state
    vend = 1'b0;      // Default: no vending
    
    case (state)
      IDLE: begin
        case (coin)
          FIFTEEN: n_state = S1;
          default: n_state = IDLE;
        endcase
      end
      
      S1: begin
        case (coin)
          FIVE: n_state = S2;
          TEN: n_state = S3;
          default: n_state = S1;
        endcase
      end
      
      S2: begin
        case (coin)
          FIVE: n_state = S4;
          TEN: n_state = S5;
          default: n_state = S2;
        endcase
      end
      
      S3: begin
        case (coin)
          FIVE: n_state = S5;
          TEN: n_state = S5;
          default: n_state = S3;
        endcase
      end
      
      S4: begin
        case (coin)
          FIVE: n_state = S5;
          TEN: n_state = S5;
          default: n_state = S4;
        endcase
      end
      
      S5: begin
        n_state = IDLE; // Vend the item and go back to IDLE
        vend = 1'b1;    // Signal vending
      end
      
      default: n_state = IDLE;
    endcase
  end

  // Sequential logic: State transition and reset handling
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= IDLE;  // Reset state to IDLE
    end else begin
      state <= n_state;  // Update state to the next state
    end
  end
endmodule

module tb_chocov;
reg tclk,trst;
reg [2:0]tcoin;
wire tvend;
wire [2:0]tstate;
parameter [2:0] IDLE =3'b000;
parameter [2:0] S1 =3'b001;
parameter [2:0] S2 =3'b010;
parameter [2:0] S3 =3'b011;
parameter [2:0] S4 =3'b100;
parameter [2:0] S5 =3'b101;
parameter [1:0] FIFTEEN=2'b00;
parameter [1:0] TEN=2'b01;
parameter [1:0] FIVE=2'b10; 

chocov x0(tclk,trst,tcoin,tvend,tstate);

initial begin 

$display("Time\tcoin\tdrink\treset\tclock\tstate\tchange");
  $monitor($time,"tclk=%b,trst=%b,tcoin=%s,tvend=%b,tstate=%p\n",tclk,trst,tcoin,tvend,tstate);

tclk=0;
trst=1; 
#2 trst=0;
tcoin=FIFTEEN; 
//#2 trst=1; tcoin=2'b00;
#2 trst=0;
tcoin=TEN;

//#2 trst=1; tcoin=2'b00;
#2 trst=0;
tcoin=FIVE;
//#2 trst=1; tcoin=2'b00;
#2 trst=0;

tcoin=FIVE;
#2 tcoin=FIVE;
#2 tcoin=FIVE;

//#2 trst=1; tcoin=2'b00;
#2 trst=0;

tcoin=FIVE;
#2 tcoin=TEN;

//#2 trst=1; tcoin=2'b00;
#2 trst=0;
tcoin=TEN;
#2 tcoin=FIVE;

//#2 trst=1; tcoin=2'b00;
#2 trst=0;
tcoin=TEN;
#2 tcoin=TEN;

//#2 trst=1; tcoin=2'b00;
#2 trst=0;
tcoin=FIVE;
#2 tcoin=FIVE;
#2 tcoin=TEN;

#2 trst=0;

#2 $finish;
end

always #1 tclk=~tclk;
initial begin
if (trst)
tcoin=2'b00;
end
endmodule
