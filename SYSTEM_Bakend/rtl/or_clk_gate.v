module or_clk_gate  (

 input   wire                  IN_0,
 input   wire                  IN_1,
 
 output  wire                  OUT 

 );

 
assign OUT = IN_1 || IN_0 ;
 
 
endmodule
