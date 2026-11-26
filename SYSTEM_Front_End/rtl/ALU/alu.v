module alu #( parameter OPER_WIDTH = 8,
                        OUT_WIDTH = OPER_WIDTH*2
)
(
  input wire [OPER_WIDTH-1:0] a, 
  input wire [OPER_WIDTH-1:0] b,
  input wire                  EN,
  input wire [3:0]            ALU_FUN,
  input wire                  clk,
  input wire                  rst,  
  output reg [OUT_WIDTH-1:0] ALU_OUT,
  output reg                  OUT_VaLID  
);
  
//internal_signals  
  reg [OUT_WIDTH-1:0]ALU_OUT_Comb;
  reg                 OUT_VaLID_Comb;
  
  
always @(posedge clk or negedge rst)
 begin
  if(!rst)
   begin
   ALU_OUT   <= 'b0 ;
    OUT_VaLID <= 1'b0 ;	
   end
  else 
   begin  
   ALU_OUT   <=ALU_OUT_Comb ;
    OUT_VaLID <= OUT_VaLID_Comb ;
   end	
 end  
  
always @(*)
 begin
   OUT_VaLID_Comb = 1'b0 ;
  ALU_OUT_Comb   = 'b0 ;
   if(EN)
    begin   
	 OUT_VaLID_Comb = 1'b1 ;
     case ( ALU_FUN) 
     4'b0000: begin
              ALU_OUT_Comb = a+b;
              end
     4'b0001: begin
              ALU_OUT_Comb = a-b;
              end
     4'b0010: begin
              ALU_OUT_Comb = a*b;
              end
     4'b0011: begin
              ALU_OUT_Comb = a/b;
              end
     4'b0100: begin
              ALU_OUT_Comb = a & b;
              end
     4'b0101: begin
              ALU_OUT_Comb = a | b;
              end
     4'b0110: begin
              ALU_OUT_Comb = ~ (a & b);
              end
     4'b0111: begin
              ALU_OUT_Comb = ~ (a | b);
              end     
     4'b1000: begin
              ALU_OUT_Comb =  (a ^ b);
              end
     4'b1001: begin
              ALU_OUT_Comb = ~ (a ^ b);
              end           
     4'b1010: begin
              if (a==b)
                ALU_OUT_Comb = 'b1;
              else
                ALU_OUT_Comb = 'b0;
              end
     4'b1011: begin
               if (a>b)
                ALU_OUT_Comb = 'b10;
               else
                ALU_OUT_Comb = 'b0;
              end 
     4'b1100: begin
               if (a<b)
                ALU_OUT_Comb = 'b11;
               else
                ALU_OUT_Comb = 'b0;
              end     
     4'b1101: begin
              ALU_OUT_Comb = a>>1;
              end
     4'b1110: begin 
              ALU_OUT_Comb = a<<1;
              end
    default: begin
              ALU_OUT_Comb = 'b0;
             end
    endcase
   end
  else
   begin
	 OUT_VaLID_Comb = 1'b0 ;
   end   
 end  
  
  

endmodule