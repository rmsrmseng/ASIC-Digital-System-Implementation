module Data_Synchronizer # ( 
     parameter NUM_STAGES = 2,
     parameter BUS_WIDTH = 8 
     )
(
    input  [BUS_WIDTH-1:0]   unsync_bus,
    input                    bus_enable,
    input                    clk,
    input                    rst,
    output  reg  [BUS_WIDTH-1:0]   sync_bus,
    output  reg                    enable_pluse
);

    reg [NUM_STAGES-1:0] bus_enable_reg;
    
    reg pulse_gen, 
        bus_enable_syn,
        bus_enable_syn_daley;

////////////////////////////////////// MUX SYNC_BUS  ////////////////////////////////////

    always @(posedge clk or negedge rst)
    begin

        if (~rst)
        begin
            sync_bus <= 'b0;
        end

        else
        begin
            case (pulse_gen)

                0: sync_bus <= sync_bus;

                1: sync_bus <= unsync_bus;

            endcase
        end

    end
///////////////////////////////////////////////////////////////////




////////////////////////////////////// MUILITI FLIP FLOP ////////////////////////////////////

    always @(posedge clk or negedge rst)
    begin

        if (~rst)
        begin
            bus_enable_reg <= 'b0;
        end

        else
        begin
            bus_enable_reg <= {
                bus_enable_reg[NUM_STAGES-2:0],
                bus_enable
            };
        end

    end


    always @(*)
    begin
        bus_enable_syn = bus_enable_reg[NUM_STAGES-1];
    end

///////////////////////////////////////////////////////////////////





////////////////////////////////////// PLUSE GEN ////////////////////////////////////

    always @(posedge clk or negedge rst)
    begin

        if (~rst)
        begin
            bus_enable_syn_daley <= 'b0;
        end

        else
        begin
            bus_enable_syn_daley <= bus_enable_syn;
        end

    end
  
  always @(*)
    begin
        pulse_gen = bus_enable_syn && (~bus_enable_syn_daley);
    end

///////////////////////////////////////////////////////////////////





////////////////////////////////////// ENABLE PLUSE ////////////////////////////////////
    always @(posedge clk or negedge rst)
    begin

        if (~rst)
        begin
            enable_pluse <= 'b0;
        end

        else
        begin
            enable_pluse <= pulse_gen;
        end

    end
  ///////////////////////////////////////////////////////////////////


endmodule

