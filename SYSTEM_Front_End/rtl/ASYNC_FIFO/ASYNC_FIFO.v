module ASYNC_FIFO #(
  parameter DATA_WIDTH = 8,
  parameter A_SIZE = 3,
  parameter P_SIZE = 4,
  parameter F_DEPTH = 8
)
(
   input                    W_CLK,
   input                    W_RST,
   input                    W_INC,

   input                    R_CLK,
   input                    R_RST,
   input                    R_INC,

   input   [DATA_WIDTH-1:0] WR_DATA,
   output  [DATA_WIDTH-1:0] RD_DATA,

   output                   FULL,
   output                   EMPTY
);

wire [A_SIZE-1:0] r_addr, w_addr;
wire [P_SIZE-1:0] w2r_ptr, r2w_ptr;
wire [P_SIZE-1:0] gray_w_ptr, gray_rd_ptr;


FIFO_MEM_CNTRL #(.F_DEPTH(F_DEPTH), .A_SIZE(3), .D_SIZE(8), .P_SIZE(4)) u_FIFO_MEM_CNTRL (
    .w_clk(W_CLK),
    .w_rstn(W_RST),
    .w_inc(W_INC),
    .w_full(FULL),
    .w_addr(w_addr),
    .r_addr(r_addr),
    .w_data(WR_DATA),
    .r_data(RD_DATA)
);


DF_Sync #(.DATA_SIZE(4)) u_w2r_sync
(
    .sync_clk(R_CLK),
    .sync_rstn(R_RST),
    .unsync_ip(gray_w_ptr),
    .sync_op(w2r_ptr)
);


FIFO_WR u_FIFO_WR (
    .w_clk(W_CLK),
    .w_rstn(W_RST),
    .w_inc(W_INC),
    .sync_rd_ptr(r2w_ptr),
    .w_addr(w_addr),
    .gray_w_ptr(gray_w_ptr),
    .full(FULL)
);


FIFO_RD u_FIFO_RD (
    .r_clk(R_CLK),
    .r_rstn(R_RST),
    .r_inc(R_INC),
    .sync_wr_ptr(w2r_ptr),
    .rd_addr(r_addr),
    .gray_rd_ptr(gray_rd_ptr),
    .empty(EMPTY)
);


DF_Sync #(.DATA_SIZE(4)) u_r2w_sync
(
    .sync_clk(W_CLK),
    .sync_rstn(W_RST),
    .unsync_ip(gray_rd_ptr),
    .sync_op(r2w_ptr)
);


endmodule
