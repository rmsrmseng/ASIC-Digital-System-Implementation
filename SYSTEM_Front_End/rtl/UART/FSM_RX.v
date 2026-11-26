module FSM_RX # ( parameter DATA_WIDTH = 8 )

(
 input   wire                  CLK,
 input   wire                  RST,
 input   wire                  S_DATA,
 input   wire   [5:0]          Prescale,
 input   wire                  parity_enable,
 input   wire   [3:0]          bit_count,
 input   wire   [5:0]          edge_count,
 input   wire                  par_err,
 input   wire                  stp_err,
 input   wire                  strt_glitch,

 output  reg                   strt_chk_en,
 output  reg                   edge_bit_en,
 output  reg                   deser_en,
 output  reg                   par_chk_en,
 output  reg                   stp_chk_en,
 output  reg                   dat_samp_en,
 output  reg                   data_valid
);


localparam [2:0] IDLE     = 3'b000,
                 start    = 3'b001,
                 data     = 3'b011,
                 parity   = 3'b010,
                 stop     = 3'b110,
                 err_chk  = 3'b111;


reg [2:0] current_state;
reg [2:0] next_state;

wire [5:0] check_edge;
wire [5:0] error_check_edge;

assign check_edge       = Prescale - 6'd1;
assign error_check_edge = Prescale - 6'd2;


//============================================================
// Current State Register
//============================================================

always @(posedge CLK or negedge RST)
begin
    if(!RST)
        current_state <= IDLE;
    else
        current_state <= next_state;
end


//============================================================
// Next State Logic
//============================================================

always @(*)
begin
    case(current_state)

        IDLE:
        begin
            if(!S_DATA)
                next_state = start;
            else
                next_state = IDLE;
        end


        start:
        begin
            if(bit_count == 4'd0 && edge_count == check_edge)
            begin
                if(!strt_glitch)
                    next_state = data;
                else
                    next_state = IDLE;
            end
            else
                next_state = start;
        end


        data:
        begin
            if(bit_count == 4'd8 && edge_count == check_edge)
            begin
                if(parity_enable)
                    next_state = parity;
                else
                    next_state = stop;
            end
            else
                next_state = data;
        end


        parity:
        begin
            if(bit_count == 4'd9 && edge_count == check_edge)
                next_state = stop;
            else
                next_state = parity;
        end


        stop:
        begin
            if(parity_enable)
            begin
                if(bit_count == 4'd10 &&
                   edge_count == error_check_edge)
                    next_state = err_chk;
                else
                    next_state = stop;
            end
            else
            begin
                if(bit_count == 4'd9 &&
                   edge_count == error_check_edge)
                    next_state = err_chk;
                else
                    next_state = stop;
            end
        end


        err_chk:
        begin
            if(!S_DATA)
                next_state = start;
            else
                next_state = IDLE;
        end


        default:
            next_state = IDLE;

    endcase
end


//============================================================
// Output Control Logic
//============================================================

always @(*)
begin

    edge_bit_en = 1'b0;
    dat_samp_en = 1'b0;
    deser_en    = 1'b0;
    par_chk_en  = 1'b0;
    stp_chk_en  = 1'b0;
    strt_chk_en = 1'b0;


    case(current_state)

        //====================================================
        // IDLE
        //====================================================
        IDLE:
        begin
            if(!S_DATA)
            begin
                edge_bit_en = 1'b1;
                deser_en    = 1'b0;
                par_chk_en  = 1'b0;
                stp_chk_en  = 1'b0;
                strt_chk_en = 1'b1;
                dat_samp_en = 1'b1;
            end
            else
            begin
                strt_chk_en = 1'b0;
                edge_bit_en = 1'b0;
                deser_en    = 1'b0;
                par_chk_en  = 1'b0;
                stp_chk_en  = 1'b0;
                dat_samp_en = 1'b0;
            end
        end


        //====================================================
        // START
        //====================================================
        start:
        begin
            strt_chk_en = 1'b1;
            edge_bit_en = 1'b1;
            deser_en    = 1'b0;
            par_chk_en  = 1'b0;
            stp_chk_en  = 1'b0;
            dat_samp_en = 1'b1;
        end


        //====================================================
        // DATA
        //====================================================
        data:
        begin
            edge_bit_en = 1'b1;
            deser_en    = 1'b1;
            par_chk_en  = 1'b0;
            stp_chk_en  = 1'b0;
            dat_samp_en = 1'b1;
        end


        //====================================================
        // PARITY
        //====================================================
        parity:
        begin
            edge_bit_en = 1'b1;
            deser_en    = 1'b0;
            par_chk_en  = 1'b1;
            stp_chk_en  = 1'b0;
            dat_samp_en = 1'b1;
        end


        //====================================================
        // STOP
        //====================================================
        stop:
        begin
            edge_bit_en = 1'b1;
            deser_en    = 1'b0;
            par_chk_en  = 1'b0;
            stp_chk_en  = 1'b1;
            dat_samp_en = 1'b1;
        end


        //====================================================
        // ERROR CHECK
        //====================================================
        err_chk:
        begin
            edge_bit_en = 1'b0;
            deser_en    = 1'b0;
            par_chk_en  = 1'b0;
            stp_chk_en  = 1'b0;
            dat_samp_en = 1'b1;
        end


        //====================================================
        // DEFAULT
        //====================================================
        default:
        begin
            edge_bit_en = 1'b0;
            deser_en    = 1'b0;
            par_chk_en  = 1'b0;
            stp_chk_en  = 1'b0;
            dat_samp_en = 1'b0;
            strt_chk_en = 1'b0;
        end

    endcase
end


//============================================================
// Registered DATA_VALID
//============================================================
//
// DATA_VALID was previously combinationally generated from:
//
//     current_state + par_err + stp_err
//
// This created the Ac_glitch03 reconvergence warning/error.
//
// Now DATA_VALID is registered on the UART_RX clock domain.
//============================================================

always @(posedge CLK or negedge RST)
begin
    if(!RST)
    begin
        data_valid <= 1'b0;
    end
    else
    begin
        data_valid <= 1'b0;

        if(current_state == err_chk)
        begin
            if(!par_err && !stp_err)
                data_valid <= 1'b1;
        end
    end
end


endmodule
