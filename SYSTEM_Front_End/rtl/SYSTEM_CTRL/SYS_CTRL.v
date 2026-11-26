
module SYS_CTRL #(
    parameter DATA_WIDTH = 8
)(
    //==========================================================
    // Inputs
    //==========================================================

    input                         CLK,
    input                         RST,

    // Register File
    input  [DATA_WIDTH-1:0]       RF_RdData,
    input                         RF_RdData_VLD,

    // ALU
    input  [2*DATA_WIDTH-1:0]     ALU_OUT,
    input                         ALU_OUT_VLD,

    // FIFO
    input                         FIFO_FULL,

    // UART RX
    input  [DATA_WIDTH-1:0]       UART_RX_DATA,
    input                         UART_RX_VLD,


    //==========================================================
    // Outputs
    //==========================================================

    // Register File
    output reg                    RF_WrEn,
    output reg                    RF_RdEn,
    output reg [3:0]              RF_Address,
    output reg [DATA_WIDTH-1:0]   RF_WrData,

    // ALU
    output reg                    ALU_EN,
    output reg [3:0]              ALU_FUN,

    // Clock Gating
    output reg                    CLKG_EN,

    // Clock Divider
    output reg                    CLKDIV_EN,

    // UART TX
    output reg [DATA_WIDTH-1:0]   UART_TX_DATA,
    output reg                    UART_TX_VLD
);


    //==========================================================
    // Commands
    //==========================================================

    localparam [DATA_WIDTH-1:0] RF_WR_CMD   = 8'hAA;
    localparam [DATA_WIDTH-1:0] RF_RD_CMD   = 8'hBB;
    localparam [DATA_WIDTH-1:0] ALU_OP_CMD  = 8'hCC;
    localparam [DATA_WIDTH-1:0] ALU_NOP_CMD = 8'hDD;


    //==========================================================
    // RF Addresses
    //==========================================================

    localparam [3:0] ALU_A_ADDR = 4'h0;
    localparam [3:0] ALU_B_ADDR = 4'h1;


    //==========================================================
    // FSM States
    //==========================================================

    localparam [3:0]

        IDLE             = 4'd0,

        // RF WRITE
        RF_WRITE         = 4'd1,
        RF_WRITE_ADDR    = 4'd2,

        // RF READ
        RF_READ_ADDR     = 4'd3,
        RF_READ_REQ      = 4'd4,
        RF_READ_WAIT     = 4'd5,

        // ALU
        ALU_WITH_OPERAND = 4'd6,
        ALU_NO_OPERAND   = 4'd7,
        ALU_EXEC         = 4'd8,
        ALU_WAIT         = 4'd9,

        // TX
        TX_RESULT        = 4'd10;


    //==========================================================
    // FSM
    //==========================================================

    reg [3:0] state;
    reg [3:0] next_state;


    //==========================================================
    // Data / Control Registers
    //==========================================================

    reg [1:0] frame_count;
    reg [1:0] next_frame_count;

    reg [1:0] tx_frame_count;
    reg [1:0] next_tx_frame_count;

    reg [1:0] tx_frames;
    reg [1:0] next_tx_frames;

    reg [3:0] rf_addr_reg;
    reg [3:0] next_rf_addr_reg;

    reg [3:0] alu_fun_reg;
    reg [3:0] next_alu_fun_reg;

    reg [2*DATA_WIDTH-1:0] result_reg;
    reg [2*DATA_WIDTH-1:0] next_result_reg;


    //==========================================================
    // FSM NEXT STATE
    // COMBINATIONAL ONLY
    //==========================================================

    always @(*) begin

        next_state = state;

        case (state)

            //==================================================
            // IDLE
            //==================================================

            IDLE: begin

                if (UART_RX_VLD) begin

                    case (UART_RX_DATA)

                        RF_WR_CMD:
                            next_state = RF_WRITE;

                        RF_RD_CMD:
                            next_state = RF_READ_ADDR;

                        ALU_OP_CMD:
                            next_state = ALU_WITH_OPERAND;

                        ALU_NOP_CMD:
                            next_state = ALU_NO_OPERAND;

                        default:
                            next_state = IDLE;

                    endcase

                end

            end


            //==================================================
            // RF WRITE
            //==================================================

            RF_WRITE: begin

                if (UART_RX_VLD)
                    next_state = RF_WRITE_ADDR;

            end


            //==================================================
            // RF WRITE DATA
            //==================================================

            RF_WRITE_ADDR: begin

                if (UART_RX_VLD)
                    next_state = IDLE;

            end


            //==================================================
            // RF READ ADDRESS
            //==================================================

            RF_READ_ADDR: begin

                if (UART_RX_VLD)
                    next_state = RF_READ_REQ;

            end


            //==================================================
            // RF READ REQUEST
            //==================================================

            RF_READ_REQ: begin

                next_state = RF_READ_WAIT;

            end


            //==================================================
            // RF READ WAIT
            //==================================================

            RF_READ_WAIT: begin

                if (RF_RdData_VLD)
                    next_state = TX_RESULT;

            end


            //==================================================
            // ALU WITH OPERANDS
            //==================================================

            ALU_WITH_OPERAND: begin

                if (UART_RX_VLD) begin

                    case (frame_count)

                        2'd0:
                            next_state = ALU_WITH_OPERAND;

                        2'd1:
                            next_state = ALU_WITH_OPERAND;

                        2'd2:
                            next_state = ALU_EXEC;

                        default:
                            next_state = IDLE;

                    endcase

                end

            end


            //==================================================
            // ALU WITHOUT OPERANDS
            //==================================================

            ALU_NO_OPERAND: begin

                if (UART_RX_VLD)
                    next_state = ALU_EXEC;

            end


            //==================================================
            // ALU EXECUTE
            //==================================================

            ALU_EXEC: begin

                next_state = ALU_WAIT;

            end


            //==================================================
            // ALU WAIT
            //==================================================

            ALU_WAIT: begin

                if (ALU_OUT_VLD)
                    next_state = TX_RESULT;

            end


            //==================================================
            // TX RESULT
            //==================================================

            TX_RESULT: begin

                if (!FIFO_FULL) begin

                    if (tx_frames == 2'd1) begin

                        next_state = IDLE;

                    end

                    else if (tx_frames == 2'd2) begin

                        if (tx_frame_count == 2'd0)
                            next_state = TX_RESULT;
                        else
                            next_state = IDLE;

                    end

                end

            end


            //==================================================
            // DEFAULT
            //==================================================

            default: begin

                next_state = IDLE;

            end

        endcase

    end


    //==========================================================
    // DATA / CONTROL NEXT-STATE LOGIC
    //
    // IMPORTANT:
    // This is combinational.
    // No data/control register is updated here.
    //==========================================================

    always @(*) begin

        //======================================================
        // HOLD CURRENT VALUES BY DEFAULT
        //======================================================

        next_frame_count    = frame_count;
        next_tx_frame_count = tx_frame_count;
        next_tx_frames      = tx_frames;

        next_rf_addr_reg    = rf_addr_reg;
        next_alu_fun_reg    = alu_fun_reg;
        next_result_reg     = result_reg;


        //======================================================
        // STATE-DEPENDENT REGISTER NEXT VALUES
        //======================================================

        case (state)

            //==================================================
            // IDLE
            //==================================================

            IDLE: begin

                next_frame_count    = 2'd0;
                next_tx_frame_count = 2'd0;
                next_tx_frames      = 2'd0;

            end


            //==================================================
            // RF WRITE
            //==================================================

            RF_WRITE: begin

                if (UART_RX_VLD)
                    next_rf_addr_reg = UART_RX_DATA[3:0];

            end


            //==================================================
            // RF WRITE DATA
            //==================================================

            RF_WRITE_ADDR: begin

                // RF_WrData uses UART_RX_DATA directly.
                // No register is required.

            end


            //==================================================
            // RF READ ADDRESS
            //==================================================

            RF_READ_ADDR: begin

                if (UART_RX_VLD)
                    next_rf_addr_reg = UART_RX_DATA[3:0];

            end


            //==================================================
            // RF READ REQUEST
            //==================================================

            RF_READ_REQ: begin

                // No register update.

            end


            //==================================================
            // RF READ WAIT
            //==================================================

            RF_READ_WAIT: begin

                if (RF_RdData_VLD) begin

                    next_result_reg =
                        {{DATA_WIDTH{1'b0}}, RF_RdData};

                    next_tx_frames      = 2'd1;
                    next_tx_frame_count = 2'd0;

                end

            end


            //==================================================
            // ALU WITH OPERANDS
            //
            // Frame 0 -> A written to RF[0]
            // Frame 1 -> B written to RF[1]
            // Frame 2 -> ALU function
            //==================================================

            ALU_WITH_OPERAND: begin

                if (UART_RX_VLD) begin

                    case (frame_count)

                        2'd0: begin

                            next_frame_count = 2'd1;

                        end


                        2'd1: begin

                            next_frame_count = 2'd2;

                        end


                        2'd2: begin

                            next_alu_fun_reg =
                                UART_RX_DATA[3:0];

                            next_frame_count = 2'd0;

                        end


                        default: begin

                            next_frame_count = 2'd0;

                        end

                    endcase

                end

            end


            //==================================================
            // ALU WITHOUT OPERANDS
            //==================================================

            ALU_NO_OPERAND: begin

                if (UART_RX_VLD) begin

                    next_alu_fun_reg =
                        UART_RX_DATA[3:0];

                    next_frame_count = 2'd0;

                end

            end


            //==================================================
            // ALU EXECUTE
            //==================================================

            ALU_EXEC: begin

                // No register update.

            end


            //==================================================
            // ALU WAIT
            //==================================================

            ALU_WAIT: begin

                if (ALU_OUT_VLD) begin

                    next_result_reg = ALU_OUT;

                    next_tx_frames      = 2'd2;
                    next_tx_frame_count = 2'd0;

                end

            end


            //==================================================
            // TX RESULT
            //==================================================

            TX_RESULT: begin

                if (!FIFO_FULL) begin

                    //==========================================
                    // RF READ
                    //==========================================

                    if (tx_frames == 2'd1) begin

                        next_tx_frames      = 2'd0;
                        next_tx_frame_count = 2'd0;

                    end


                    //==========================================
                    // ALU RESULT
                    //==========================================

                    else if (tx_frames == 2'd2) begin

                        if (tx_frame_count == 2'd0) begin

                            next_tx_frame_count = 2'd1;

                        end

                        else begin

                            next_tx_frame_count = 2'd0;
                            next_tx_frames      = 2'd0;

                        end

                    end

                end

            end


            //==================================================
            // DEFAULT
            //==================================================

            default: begin

                next_frame_count    = 2'd0;
                next_tx_frame_count = 2'd0;
                next_tx_frames      = 2'd0;

            end

        endcase

    end


    //==========================================================
    // FSM STATE REGISTER
    //
    // SEQUENTIAL ONLY
    //==========================================================

    always @(posedge CLK or negedge RST) begin

        if (!RST)
            state <= IDLE;

        else
            state <= next_state;

    end


    //==========================================================
    // DATA / CONTROL REGISTERS
    //
    // SEQUENTIAL ONLY
    // NO case(state) HERE
    //==========================================================

    always @(posedge CLK or negedge RST) begin

        if (!RST) begin

            frame_count    <= 2'd0;

            tx_frame_count <= 2'd0;
            tx_frames      <= 2'd0;

            rf_addr_reg    <= 4'd0;

            alu_fun_reg    <= 4'd0;

            result_reg     <= {(2*DATA_WIDTH){1'b0}};

        end

        else begin

            frame_count    <= next_frame_count;

            tx_frame_count <= next_tx_frame_count;
            tx_frames      <= next_tx_frames;

            rf_addr_reg    <= next_rf_addr_reg;

            alu_fun_reg    <= next_alu_fun_reg;

            result_reg     <= next_result_reg;

        end

    end


    //==========================================================
    // OUTPUT COMBINATIONAL LOGIC
    //==========================================================

    always @(*) begin

        //======================================================
        // DEFAULTS
        //======================================================

        RF_WrEn      = 1'b0;
        RF_RdEn      = 1'b0;
        RF_Address   = 4'd0;
        RF_WrData    = {DATA_WIDTH{1'b0}};

        ALU_EN       = 1'b0;
        ALU_FUN      = 4'd0;

        CLKG_EN      = 1'b0;

        // UART clock divider remains enabled
        CLKDIV_EN    = 1'b1;

        UART_TX_DATA = {DATA_WIDTH{1'b0}};
        UART_TX_VLD  = 1'b0;


        //======================================================
        // OUTPUT DECODING
        //======================================================

        case (state)

            //==================================================
            // IDLE
            //==================================================

            IDLE: begin
            end


            //==================================================
            // RF WRITE
            //==================================================

            RF_WRITE: begin
            end


            //==================================================
            // RF WRITE DATA
            //==================================================

            RF_WRITE_ADDR: begin

                if (UART_RX_VLD) begin

                    RF_WrEn    = 1'b1;
                    RF_Address = rf_addr_reg;
                    RF_WrData  = UART_RX_DATA;

                end

            end


            //==================================================
            // RF READ ADDRESS
            //==================================================

            RF_READ_ADDR: begin
            end


            //==================================================
            // RF READ REQUEST
            //==================================================

            RF_READ_REQ: begin

                RF_RdEn    = 1'b1;
                RF_Address = rf_addr_reg;

            end


            //==================================================
            // RF READ WAIT
            //==================================================

            RF_READ_WAIT: begin
            end


            //==================================================
            // ALU WITH OPERANDS
            //==================================================

            ALU_WITH_OPERAND: begin

                if (UART_RX_VLD) begin

                    case (frame_count)

                        2'd0: begin

                            RF_WrEn    = 1'b1;
                            RF_Address = ALU_A_ADDR;
                            RF_WrData  = UART_RX_DATA;

                        end

                        2'd1: begin

                            RF_WrEn    = 1'b1;
                            RF_Address = ALU_B_ADDR;
                            RF_WrData  = UART_RX_DATA;

                        end

                        default: begin
                        end

                    endcase

                end

            end


            //==================================================
            // ALU WITHOUT OPERANDS
            //==================================================

            ALU_NO_OPERAND: begin
            end


            //==================================================
            // ALU EXECUTE
            //==================================================

            ALU_EXEC: begin

                CLKG_EN = 1'b1;
                ALU_EN  = 1'b1;
                ALU_FUN = alu_fun_reg;

            end


            //==================================================
            // ALU WAIT
            //==================================================

            ALU_WAIT: begin

                CLKG_EN = 1'b1;
                ALU_EN  = 1'b0;
                ALU_FUN = alu_fun_reg;

            end


            //==================================================
            // TX RESULT
            //==================================================

            TX_RESULT: begin

                if (!FIFO_FULL) begin

                    //==========================================
                    // RF READ
                    //==========================================

                    if (tx_frames == 2'd1) begin

                        UART_TX_DATA =
                            result_reg[DATA_WIDTH-1:0];

                        UART_TX_VLD = 1'b1;

                    end


                    //==========================================
                    // ALU RESULT
                    // HIGH BYTE FIRST
                    // LOW BYTE SECOND
                    //==========================================

                    else if (tx_frames == 2'd2) begin

                        if (tx_frame_count == 2'd0) begin

                            UART_TX_DATA =
                                result_reg[2*DATA_WIDTH-1:DATA_WIDTH];

                            UART_TX_VLD = 1'b1;

                        end

                        else begin

                            UART_TX_DATA =
                                result_reg[DATA_WIDTH-1:0];

                            UART_TX_VLD = 1'b1;

                        end

                    end

                end

            end


            //==================================================
            // DEFAULT
            //==================================================

            default: begin
            end

        endcase

    end

endmodule

