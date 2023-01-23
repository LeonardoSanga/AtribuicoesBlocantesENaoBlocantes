//Caso 1: Atribuições blocantes 
module circuit (b, d, Clock, Reset, a, c);
  input Clock, Reset;
  input logic [0:3] b, d;
  output reg [0:3] a, c;
  
  always@ (posedge Clock, posedge Reset) begin
    if(Reset) begin
      a = 4'b0001;
      c = 4'b0001;
    end
    else begin
      c = b + d;
      a = b + c;
    end
  end
endmodule

//Caso 2: Atribuições não blocantes 
module circuit2 (b, d, Clock, Reset, a, c);
  input Clock, Reset;
  input logic [0:3] b, d;
  output reg [0:3] a, c;
  
  always@ (posedge Clock, posedge Reset) begin
      if(Reset) begin
      a <= 4'b0001;
      c <= 4'b0001;
    end
    else begin
      c <= b + d;
      a <= b + c;
    end
  end
endmodule