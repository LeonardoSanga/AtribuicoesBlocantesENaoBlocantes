//Testbench 
`timescale 1ns / 1ps

module test;
  
  logic Clock, Reset;
  logic [3:0] b, d; 
  logic [3:0] a1, a2, c1, c2;
  
  //Instanciando modulos 
  circuit UTT (b, d, Clock, Reset, a1, c1);
  circuit2 UTT2 (b, d, Clock, Reset, a2, c2);
  
  //Inversão do clock a cada 50 ns
  always begin
    #50 Clock = !Clock;
  end
  
  initial begin
    
    $dumpdfile("dump.vcd");
    $dumpvars(0);
    $dumpformat(-9, 0, "ns", 3);
    
    Clock = 0;
    
    //Iniciando "b" e "d" em 2
    #1 assign b = 4'b0010; assign d = 4'b0010;
    
	//tabela com tempo e valores decimais 
    #48 $write ("|time: %t| a1 = %d | c1 = %d | a2 = %d | c2 = %d | b = %d| d = %d|\n|", $time, a1, c1, a2, c2, b, d);
    #52 $write ("time: %t| a1 = %d | c1 = %d | a2 = %d | c2 = %d | b = %d| d = %d|\n|", $time, a1, c1, a2, c2, b, d);
    #100 $write ("time: %t| a1 = %d | c1 = %d | a2 = %d | c2 = %d | b = %d| d = %d|\n|", $time, a1, c1, a2, c2, b, d);
    #100 $write ("time: %t| a1 = %d | c1 = %d | a2 = %d | c2 = %d | b = %d| d = %d|\n|", $time, a1, c1, a2, c2, b, d);
    #100 $write ("time: %t| a1 = %d | c1 = %d | a2 = %d | c2 = %d | b = %d| d = %d|\n|", $time, a1, c1, a2, c2, b, d);
    #100 $write ("time: %t| a1 = %d | c1 = %d | a2 = %d | c2 = %d | b = %d| d = %d|\n", $time, a1, c1, a2, c2, b, d);
    $finish;
  end
  
  initial begin
	Reset = 0;
    #25 Reset= 1;
    #100 Reset = 0;
  end
  
endmodule