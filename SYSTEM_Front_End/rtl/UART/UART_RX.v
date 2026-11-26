module UART_RX # (parameter DATA_WIDTH = 8)

(
    input  wire                    clk,
    input  wire                    rst,
    input  wire                    rx_in,
    input  wire                    par_en,
    input  wire                    par_typ,
    input  wire [5:0]              prescale,
    output wire [DATA_WIDTH-1:0]   p_data,
    output wire                    data_vaild,
    output wire                    parity_error,
    output wire                    framing_error
);


wire [3:0] bit_count;
wire [5:0] edge_count;

wire edge_bit_en;
wire deser_en;
wire par_chk_en;
wire stp_chk_en;
wire strt_chk_en;
wire strt_glitch;
wire sampled_bit;
wire dat_samp_en;


FSM_RX # (.DATA_WIDTH(8)) U0_FSM_RX (
    .CLK(clk),
    .RST(rst),
    .S_DATA(rx_in),
    .Prescale(prescale),
    .bit_count(bit_count),
    .parity_enable(par_en),
    .edge_count(edge_count),
    .strt_glitch(strt_glitch),
    .par_err(parity_error),
    .stp_err(framing_error),
    .strt_chk_en(strt_chk_en),
    .edge_bit_en(edge_bit_en),
    .deser_en(deser_en),
    .par_chk_en(par_chk_en),
    .stp_chk_en(stp_chk_en),
    .dat_samp_en(dat_samp_en),
    .data_valid(data_vaild)
);


Edge_Bit_Counter U0_Edge_Bit_Counter (
    .CLK(clk),
    .RST(rst),
    .Prescale(prescale),
    .Enable(edge_bit_en),
    .bit_count(bit_count),
    .edge_count(edge_count)
);


Data_sampling U0_Data_sampling (
    .CLK(clk),
    .RST(rst),
    .S_DATA(rx_in),
    .Prescale(prescale),
    .Enable(dat_samp_en),
    .edge_count(edge_count),
    .sampled_bit(sampled_bit)
);


Deserializer # (.DATA_WIDTH(8)) U0_Deserializer (
    .CLK(clk),
    .RST(rst),
    .Prescale(prescale),
    .sampled_bit(sampled_bit),
    .Enable(deser_en),
    .edge_count(edge_count),
    .P_DATA(p_data)
);


Start_Check U0_Start_Check (
    .CLK(clk),
    .RST(rst),
    .sampled_bit(sampled_bit),
    .Enable(strt_chk_en),
    .strt_glitch(strt_glitch)
);


Parity_Check # (.DATA_WIDTH(8)) U0_Parity_Check (
    .CLK(clk),
    .RST(rst),
    .parity_type(par_typ),
    .sampled_bit(sampled_bit),
    .Enable(par_chk_en),
    .P_DATA(p_data),
    .par_err(parity_error)
);


Stop_Check U0_Stop_Check (
    .CLK(clk),
    .RST(rst),
    .sampled_bit(sampled_bit),
    .Enable(stp_chk_en),
    .stp_err(framing_error)
);


endmodule