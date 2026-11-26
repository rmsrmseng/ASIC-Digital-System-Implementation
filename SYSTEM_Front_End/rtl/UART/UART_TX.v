
module UART_TX # (parameter DATA_WIDTH = 8)
(
    input  wire [DATA_WIDTH-1:0] p_data,
    input  wire                  data_vaild,
    input  wire                  par_en,
    input  wire                  par_typ,
    input  wire                  clk,
    input  wire                  rst,
    output wire                  tx_out,
    output wire                  busy
);

wire       seriz_en,
           seriz_done,
           ser_data,
           parity;

wire [1:0] mux_sel;

FSM_TX U0_FSM_TX (
    .CLK(clk),
    .RST(rst),
    .Data_Valid(data_vaild),
    .parity_enable(par_en),
    .ser_done(seriz_done),
    .Ser_enable(seriz_en),
    .mux_sel(mux_sel),
    .busy(busy)
);

Serializer # (.WIDTH(DATA_WIDTH)) U0_Serializer (
    .CLK(clk),
    .RST(rst),
    .DATA(p_data),
    .Busy(busy),
    .Enable(seriz_en),
    .Data_Valid(data_vaild),
    .ser_out(ser_data),
    .ser_done(seriz_done)
);

MUX U0_MUX (
    .CLK(clk),
    .RST(rst),
    .IN_0(1'b0),
    .IN_1(ser_data),
    .IN_2(parity),
    .IN_3(1'b1),
    .SEL(mux_sel),
    .OUT(tx_out)
);

Parity_Calc # (.WIDTH(DATA_WIDTH)) U0_Parity_Calc (
    .CLK(clk),
    .RST(rst),
    .parity_enable(par_en),
    .parity_type(par_typ),
    .DATA(p_data),
    .Busy(busy),
    .Data_Valid(data_vaild),
    .parity(parity)
);

endmodule


 