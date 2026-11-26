`timescale 1ns/1ps


module SYS_TOP_TB;

parameter DATA_WIDTH = 8;
parameter RF_ADDR    = 4;

//======================================================
// DUT SIGNALS
//======================================================

reg                         RST_N;
reg                         UART_CLK;
reg                         REF_CLK;
reg                         UART_RX_IN;

wire                        UART_TX_O;
wire                        parity_error;
wire                        framing_error;


//======================================================
// DUT
//======================================================

SYS_TOP #(
    .DATA_WIDTH(DATA_WIDTH),
    .RF_ADDR(RF_ADDR)
) DUT (
    .RST_N          (RST_N),
    .UART_CLK       (UART_CLK),
    .REF_CLK        (REF_CLK),
    .UART_RX_IN     (UART_RX_IN),
    .UART_TX_O      (UART_TX_O),
    .parity_error   (parity_error),
    .framing_error  (framing_error)
);


//======================================================
// CLOCKS
//======================================================

// REF_CLK = 50 MHz
// Period = 20 ns

initial begin
    REF_CLK = 1'b0;

    forever
        #10 REF_CLK = ~REF_CLK;
end


// UART_CLK = 3.6864 MHz
// Period ~= 271.267 ns

initial begin
    UART_CLK = 1'b0;

    forever
        #135.6335 UART_CLK = ~UART_CLK;
end


//======================================================
// UART PARAMETERS
//======================================================

// REG2 = 8'b10000001
//
// [7:2] = 100000 = 32 -> Prescale
// [1]   = 0        -> Even parity
// [0]   = 1        -> Parity enable

localparam integer PRESCALE = 32;

// 3.6864 MHz / 32 = 115.2 kHz
//
// Bit time ~= 8680.56 ns

localparam integer BIT_TIME = 8681;


//======================================================
// TEST VARIABLES
//======================================================

integer error_count;

integer i;
integer j;

reg [7:0] RX_BYTE;

reg [7:0] TX_BYTE;

reg [7:0] TX_HIGH_BYTE;
reg [7:0] TX_LOW_BYTE;

reg [15:0] TX_WORD;

//======================================================
// WAVEFORM / TEST RESULT BUSES
//======================================================

reg [7:0]  TB_RX_BYTE;
reg [7:0]  TB_TX_HIGH;
reg [7:0]  TB_TX_LOW;
reg [15:0] TB_TX_WORD;
reg [7:0]  TB_EXPECTED_BYTE;
reg [15:0] TB_EXPECTED_WORD;
reg [3:0]  TB_ALU_FUN;
reg [3:0]  TB_RF_ADDR;
reg [7:0]  TB_RF_DATA;


//======================================================
// UART SEND BYTE
//======================================================

task UART_SEND_BYTE;

    input [7:0] DATA;

    integer k;

    begin

        $display("[%0t] UART SEND BYTE = 0x%02h",
                 $time,
                 DATA);

        //==================================================
        // START BIT
        //==================================================

        UART_RX_IN = 1'b0;

        #(BIT_TIME);


        //==================================================
        // DATA BITS
        //==================================================

        for(k = 0; k < 8; k = k + 1)
        begin

            UART_RX_IN = DATA[k];

            #(BIT_TIME);

        end


        //==================================================
        // PARITY BIT
        //==================================================

        UART_RX_IN = ^DATA;

        #(BIT_TIME);


        //==================================================
        // STOP BIT
        //==================================================

        UART_RX_IN = 1'b1;

        #(BIT_TIME);


        UART_RX_IN = 1'b1;

    end

endtask



//======================================================
// UART RECEIVE BYTE
//======================================================

task UART_RECEIVE_BYTE;

    output [7:0] DATA;

    integer k;
    integer timeout_counter;

    reg [7:0] temp_data;
    reg       start_detected;

    begin

        temp_data      = 8'b0;
        start_detected = 1'b0;

        //================================================
        // WAIT FOR START BIT
        //
        // The TX response may take more than 3 BIT_TIME
        // after the command is received.
        //
        // Therefore use a larger timeout.
        //================================================

        timeout_counter = 0;

        while((UART_TX_O !== 1'b0) &&
              (timeout_counter < (BIT_TIME * 200)))
        begin

            #100;

            timeout_counter = timeout_counter + 100;

        end


        //================================================
        // CHECK START
        //================================================

        if(UART_TX_O === 1'b0)
        begin

            start_detected = 1'b1;

            $display("[%0t] UART START DETECTED",
                     $time);

        end


        //================================================
        // TIMEOUT
        //================================================

        if(!start_detected)
        begin

            DATA = 8'hXX;

            $display("[%0t] UART RECEIVE TIMEOUT !!!",
                     $time);
        end


        //================================================
        // RECEIVE FRAME
        //================================================

        else
        begin

            //================================================
            // Move to middle of START bit
            //================================================

            #(BIT_TIME/2);


            //================================================
            // Move to middle of FIRST DATA BIT
            //
            // Start edge
            // + 0.5 BIT_TIME -> middle of START
            // + 1.0 BIT_TIME -> middle of DATA[0]
            //================================================

            #(BIT_TIME);


            //================================================
            // RECEIVE 8 DATA BITS
            //================================================

            for(k = 0; k < 8; k = k + 1)
            begin

                temp_data[k] = UART_TX_O;

                #(BIT_TIME);

            end


            //================================================
            // PARITY BIT
            //
            // We don't need it for the ALU data check,
            // so just move over it.
            //================================================

            #(BIT_TIME);


            //================================================
            // STOP BIT
            //
            // We don't need to sample it here.
            //================================================

            #(BIT_TIME);


            //================================================
            // RETURN RECEIVED DATA
            //================================================

            DATA = temp_data;
            TB_RX_BYTE = temp_data;


            $display("[%0t] UART RECEIVED BYTE = 0x%02h",
                     $time,
                     DATA);

        end

    end

endtask



//======================================================
// RF WRITE
//======================================================

task RF_WRITE;

    input [3:0] ADDRESS;
    input [7:0] DATA;

    begin

        TB_RF_ADDR = ADDRESS;
        TB_RF_DATA = DATA;

        $display("");
        $display("==============================================");
        $display("              RF WRITE TEST");
        $display("==============================================");

        $display("Address = 0x%01h",
                 ADDRESS);

        $display("Data    = 0x%02h",
                 DATA);


        // FRAME 0 : COMMAND
        UART_SEND_BYTE(8'hAA);
        // FRAME 2 : ADDRESS
        UART_SEND_BYTE({4'b0, ADDRESS});
     // FRAME 1 : DATA
        UART_SEND_BYTE(DATA);


       


        // Give SYS_CTRL time to process
        #(BIT_TIME * 5);


        //================================================
        // CHECK REGISTER FILE
        //================================================

        if(DUT.U0_RegFile.regArr[ADDRESS] == DATA)
        begin

            $display("RF WRITE PASS : RF[%01h] = %02h",
                     ADDRESS,
                     DUT.U0_RegFile.regArr[ADDRESS]);

        end

        else
        begin

            $display("RF WRITE FAIL : RF[%01h] = %02h , Expected = %02h",
                     ADDRESS,
                     DUT.U0_RegFile.regArr[ADDRESS],
                     DATA);

            error_count = error_count + 1;

        end

    end

endtask



//======================================================
// RF READ
//======================================================

task RF_READ;

    input [3:0] ADDRESS;
    input [7:0] EXPECTED;

    begin

        TB_RF_ADDR = ADDRESS;
        TB_EXPECTED_BYTE = EXPECTED;

        $display("");
        $display("==============================================");
        $display("               RF READ TEST");
        $display("==============================================");

        $display("Address  = 0x%01h",
                 ADDRESS);

        $display("Expected = 0x%02h",
                 EXPECTED);


        // FRAME 0 : READ COMMAND
        UART_SEND_BYTE(8'hBB);


        // FRAME 1 : ADDRESS
        UART_SEND_BYTE({4'b0, ADDRESS});


        //================================================
        // RECEIVE TX RESPONSE
        // IMPORTANT:
        // No extra BIT_TIME * 5 delay here.
        // UART_RECEIVE_BYTE waits for START.
        //================================================

        UART_RECEIVE_BYTE(TX_BYTE);


        //================================================
        // CHECK
        //================================================

        if(TX_BYTE === EXPECTED)
        begin

            $display("RF READ PASS : Received = %02h",
                     TX_BYTE);

        end

        else if(TX_BYTE === 8'hXX)
        begin

            $display("RF READ FAIL : NO UART RESPONSE");

            error_count = error_count + 1;

        end

        else
        begin

            $display("RF READ FAIL : Received = %02h , Expected = %02h",
                     TX_BYTE,
                     EXPECTED);

            error_count = error_count + 1;

        end

    end

endtask



//======================================================
// ALU WITH OPERANDS
//======================================================

task ALU_WITH_OPERANDS;

    input [7:0]  A;
    input [7:0]  B;
    input [3:0]  ALU_FUN;
    input [15:0] EXPECTED;

    begin

        TB_ALU_FUN = ALU_FUN;
        TB_EXPECTED_WORD = EXPECTED;

        $display("");
        $display("==============================================");
        $display("          ALU WITH OPERANDS TEST");
        $display("==============================================");

        $display("A        = 0x%02h",
                 A);

        $display("B        = 0x%02h",
                 B);

        $display("ALU_FUN  = 0x%01h",
                 ALU_FUN);

        $display("Expected = 0x%04h",
                 EXPECTED);


        //================================================
        // FRAME 0
        //================================================

        UART_SEND_BYTE(8'hCC);


        //================================================
        // FRAME 1 : OPERAND A
        //================================================

        UART_SEND_BYTE(A);


        //================================================
        // FRAME 2 : OPERAND B
        //================================================

        UART_SEND_BYTE(B);


        //================================================
        // FRAME 3 : ALU FUNCTION
        //================================================

        UART_SEND_BYTE({4'b0, ALU_FUN});


        //================================================
        // RECEIVE HIGH BYTE
        //
        // IMPORTANT:
        // No BIT_TIME * 5 delay here.
        // UART_RECEIVE_BYTE waits for START.
        //================================================

        UART_RECEIVE_BYTE(TX_HIGH_BYTE);


        //================================================
        // RECEIVE LOW BYTE
        //================================================

        UART_RECEIVE_BYTE(TX_LOW_BYTE);


        //================================================
        // COMBINE
        //================================================

        TX_WORD = {TX_HIGH_BYTE, TX_LOW_BYTE};
            TB_TX_HIGH = TX_HIGH_BYTE;
            TB_TX_LOW  = TX_LOW_BYTE;
            TB_TX_WORD = TX_WORD;


        //================================================
        // CHECK
        //================================================

        if(TX_WORD === EXPECTED)
        begin

            $display("ALU WITH OPERANDS PASS : ALU_OUT = %04h",
                     TX_WORD);

        end

        else if((TX_HIGH_BYTE === 8'hXX) ||
                (TX_LOW_BYTE  === 8'hXX))
        begin

            $display("ALU WITH OPERANDS FAIL : NO UART RESPONSE");

            error_count = error_count + 1;

        end

        else
        begin

            $display("ALU WITH OPERANDS FAIL");

            $display("Expected = %04h",
                     EXPECTED);

            $display("Received = %04h",
                     TX_WORD);

            error_count = error_count + 1;

        end

    end

endtask



//======================================================
// ALU WITHOUT OPERANDS
//======================================================

task ALU_WITHOUT_OPERANDS;

    input [3:0]  ALU_FUN;
    input [15:0] EXPECTED;

    begin

        TB_ALU_FUN = ALU_FUN;
        TB_EXPECTED_WORD = EXPECTED;

        $display("");
        $display("==============================================");
        $display("        ALU WITHOUT OPERANDS TEST");
        $display("==============================================");

        $display("RF[0]    = 0x%02h",
                 DUT.U0_RegFile.regArr[0]);

        $display("RF[1]    = 0x%02h",
                 DUT.U0_RegFile.regArr[1]);

        $display("ALU_FUN  = 0x%01h",
                 ALU_FUN);

        $display("Expected = 0x%04h",
                 EXPECTED);


        // FRAME 0 : COMMAND
        UART_SEND_BYTE(8'hDD);


        // FRAME 1 : ALU FUNCTION
        UART_SEND_BYTE({4'b0, ALU_FUN});


        //================================================
        // RECEIVE HIGH BYTE
        //================================================

        UART_RECEIVE_BYTE(TX_HIGH_BYTE);


        //================================================
        // RECEIVE LOW BYTE
        //================================================

        UART_RECEIVE_BYTE(TX_LOW_BYTE);


        //================================================
        // COMBINE
        //================================================

        TX_WORD = {TX_HIGH_BYTE, TX_LOW_BYTE};
            TB_TX_HIGH = TX_HIGH_BYTE;
            TB_TX_LOW  = TX_LOW_BYTE;
            TB_TX_WORD = TX_WORD;


        //================================================
        // CHECK
        //================================================

        if(TX_WORD === EXPECTED)
        begin

            $display("ALU WITHOUT OPERANDS PASS : ALU_OUT = %04h",
                     TX_WORD);

        end

        else if((TX_HIGH_BYTE === 8'hXX) ||
                (TX_LOW_BYTE  === 8'hXX))
        begin

            $display("ALU WITHOUT OPERANDS FAIL : NO UART RESPONSE");

            error_count = error_count + 1;

        end

        else
        begin

            $display("ALU WITHOUT OPERANDS FAIL");

            $display("Expected = %04h",
                     EXPECTED);

            $display("Received = %04h",
                     TX_WORD);

            error_count = error_count + 1;

        end

    end

endtask



//======================================================
// MAIN TEST
//======================================================

initial
begin

    error_count = 0;

    // Initialize testbench-owned signals/buses.
    RX_BYTE          = 8'h00;
    TX_BYTE          = 8'h00;
    TX_HIGH_BYTE     = 8'h00;
    TX_LOW_BYTE      = 8'h00;
    TX_WORD          = 16'h0000;

    TB_RX_BYTE       = 8'h00;
    TB_TX_HIGH       = 8'h00;
    TB_TX_LOW        = 8'h00;
    TB_TX_WORD       = 16'h0000;
    TB_EXPECTED_BYTE = 8'h00;
    TB_EXPECTED_WORD = 16'h0000;
    TB_ALU_FUN       = 4'h0;
    TB_RF_ADDR       = 4'h0;
    TB_RF_DATA       = 8'h00;

    UART_RX_IN  = 1'b1;

    RST_N = 1'b0;


    //==================================================
    // RESET
    //==================================================

    #1000;

    RST_N = 1'b1;

    #(BIT_TIME * 10);


    //==================================================
    // TEST 1 : RF WRITE
    //==================================================

    RF_WRITE(
        4'h4,
        8'h25
    );


    //==================================================
    // TEST 2 : RF READ
    //==================================================

    RF_READ(
        4'h4,
        8'h25
    );


    //==================================================
    // TEST 3 : ALU WITH OPERANDS
    //==================================================

    ALU_WITH_OPERANDS(
        8'h10,
        8'h20,
        4'h0,
        16'h0030
    );


    //==================================================
    // PREPARE RF[0]
    //==================================================

   RF_WRITE(
        4'h0,
        8'h10
    );


    //==================================================
    // PREPARE RF[1]
    //==================================================

    RF_WRITE(
        4'h1,
        8'h20
    );


    //==================================================
    // TEST 4 : ALU WITHOUT OPERANDS
    //==================================================

    ALU_WITHOUT_OPERANDS(
        4'h0,
        16'h0030
    );

    //==================================================
    // TEST 5 : RF WRITE - SECOND CASE
    //==================================================
    // IMPORTANT: Do NOT use RF[2] here. RF[2] contains the UART
    // configuration (prescale/parity), so changing it would alter
    // the UART timing and invalidate the TB BIT_TIME.

    RF_WRITE(
        4'h4,
        8'hA5
    );


    //==================================================
    // TEST 6 : RF READ - SECOND CASE
    //==================================================

    RF_READ(
        4'h4,
        8'hA5
    );


    //==================================================
    // TEST 7 : ALU WITH OPERANDS - SECOND CASE
    //==================================================
    // ALU_FUN=0 is the ADD operation already established
    // by the original testbench: 0x10 + 0x20 = 0x0030.
    // Therefore: 0x55 + 0x0F = 0x0064.

    ALU_WITH_OPERANDS(
        8'h55,
        8'h0F,
        4'h0,
        16'h0064
    );


    //==================================================
    // TEST 8 : ALU WITHOUT OPERANDS - SECOND CASE
    //==================================================
    // Keep ADD here because the supplied testbench only
    // establishes ALU_FUN=0 from the source provided.

    ALU_WITHOUT_OPERANDS(
        4'h0,
      16'h0064
    );


    //==================================================
    // FINAL RESULT
    //==================================================

    $display("");
    $display("");
    $display("##################################################");
    $display("#                                                #");
    $display("#             SYS_TOP TESTBENCH                 #");
    $display("#                                                #");
    $display("##################################################");
    $display("");

    if(error_count == 0)
    begin

        $display("**********************************************");
        $display("*                                            *");
        $display("*           ALL TESTS PASSED                *");
        $display("*                                            *");
        $display("**********************************************");

    end

    else
    begin

        $display("**********************************************");
        $display("*                                            *");
        $display("*           TEST FAILED                     *");
        $display("*                                            *");
        $display("*   ERROR COUNT = %0d                      *",
                 error_count);

        $display("**********************************************");

    end

    $display("");

    $stop;

end


endmodule