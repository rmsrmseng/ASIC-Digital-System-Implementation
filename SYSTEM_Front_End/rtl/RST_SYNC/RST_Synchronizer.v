module RST_Synchronizer # ( parameter NUM_STAGES = 2 ) 
	 (
	input clk,
	input rst,
	output SYNC_RST
	 );

reg [NUM_STAGES-1:0] rst_reg;


    always @(posedge clk or negedge rst)
    begin

        if (~rst)
        begin
             rst_reg <= 1'b0;
        end

        else
        begin
             rst_reg <= {
               rst_reg[NUM_STAGES-2:0],
                1'b1
            };
        end

    end


    
    assign    SYNC_RST = rst_reg[NUM_STAGES-1];
    

endmodule 
