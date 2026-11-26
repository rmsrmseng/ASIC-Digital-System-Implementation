
module SYS_TOP # ( parameter DATA_WIDTH = 8 ,  RF_ADDR = 4)

(  
     
 
 input   wire                          RST_N,
 input   wire                          UART_CLK,
 input   wire                          REF_CLK,
 input   wire                          UART_RX_IN,
 output  wire                          UART_TX_O,
 output  wire                          parity_error,
 output  wire                          framing_error
);


wire                                   Sync_UART_RST,
                                       Sync_REF_RST;
									   
wire					               UART_TX_CLK;
wire					               UART_RX_CLK;


wire      [DATA_WIDTH-1:0]             Operand_A,
                                       Operand_B,
									   UART_Config,
									   Divider_Ratio;
									   
wire      [DATA_WIDTH-1:0]             Divider_Ratio_RX;
									   
wire      [DATA_WIDTH-1:0]             UART_RX_OUT;
wire         						   UART_RX_Vaild_OUT;
wire      [DATA_WIDTH-1:0]			   UART_RX_Sync;
wire                                   UART_RX_Vaild_Sync;

wire      [DATA_WIDTH-1:0]             UART_TX_IN;
wire        						   UART_TX_Vaild;
wire      [DATA_WIDTH-1:0]             UART_TX_Sync;
wire        						   UART_TX_Vaild_Sync;

wire                                   UART_TX_Busy;	
wire                                   UART_TX_Busy_Pulse;	
									   
wire                                   WrEn;
wire                                   RdEn;
wire      [RF_ADDR-1:0]                Address;
wire      [DATA_WIDTH-1:0]             WrData;
wire      [DATA_WIDTH-1:0]             RdData;
wire                                   RdData_Vaild;									   

wire                                   CLK_Gateing_EN;
wire                                   ALU_EN;
wire      [3:0]                        ALU_FUN; 
wire      [DATA_WIDTH*2-1:0]           ALU_OUT;
wire                                   ALU_OUT_Vaild; 
									   
wire                                   ALU_CLK ;								   

wire                                   FIFO_FULL ;
	
wire                                   CLK_Divider_EN ;
								   
///********************************************************///
//////////////////// Reset synchronizers /////////////////////
///********************************************************///
RST_Synchronizer # (.NUM_STAGES(2)) U1_RST_Synchronizer(
.clk(REF_CLK),
.rst(RST_N),
.SYNC_RST( Sync_REF_RST)
);

RST_Synchronizer # (.NUM_STAGES(2)) U2_RST_Synchronizer(
.clk( UART_CLK),
.rst(RST_N),
.SYNC_RST(Sync_UART_RST)
);

///********************************************************///
////////////////////// Data Synchronizer /////////////////////
///********************************************************///
Data_Synchronizer # (.NUM_STAGES(2) , .BUS_WIDTH(8)) U0_Data_Synchronizer(
.clk(REF_CLK),
.rst(Sync_REF_RST),
.unsync_bus( UART_RX_OUT),
.bus_enable(UART_RX_Vaild_OUT),
.sync_bus( UART_RX_Sync),
.enable_pluse( UART_RX_Vaild_Sync)
);


///********************************************************///
///////////////////////// Async FIFO /////////////////////////
///********************************************************///
ASYNC_FIFO  #(.DATA_WIDTH(DATA_WIDTH) , .P_SIZE(4)  , .F_DEPTH(8)) U0_ASYNC_FIFO(
.W_CLK(REF_CLK),
.W_RST(Sync_REF_RST),
.W_INC(UART_TX_Vaild),
.R_CLK(UART_TX_CLK),
.R_RST(Sync_UART_RST),
.R_INC( UART_TX_Busy_Pulse),
.WR_DATA(UART_TX_IN),
.RD_DATA( UART_TX_Sync),
.FULL(FIFO_FULL),
.EMPTY(UART_TX_Vaild_Sync)
);


///********************************************************///
//////////////////////// Pulse Generator /////////////////////
///********************************************************///
PULSE_GEN   U0_PULSE_GEN (
.clk(  UART_TX_CLK),
.rst(Sync_UART_RST),
.lvl_sig(UART_TX_Busy),
.pulse_sig(UART_TX_Busy_Pulse)
);

///********************************************************///
//////////// Clock Divider for UART_TX Clock /////////////////
///********************************************************///
 Clock_Divider UO_Clock_Divider(
.i_ref_clk(UART_CLK),
.i_rst_n(Sync_UART_RST),
.i_clk_en(   CLK_Divider_EN),
.i_div_ratio(Divider_Ratio),
.o_div_clk( UART_TX_CLK)
);

///********************************************************///
/////////////////////// Custom Mux Clock /////////////////////
///********************************************************///
CLKDIV_MUX U0_CLKDIV_MUX (
.IN(UART_Config[7:2]),
.OUT(Divider_Ratio_RX)
);

///********************************************************///
//////////// Clock Divider for UART_RX Clock /////////////////
///********************************************************///
 Clock_Divider U1_Clock_Divider(
.i_ref_clk(UART_CLK),
.i_rst_n(Sync_UART_RST),
.i_clk_en(   CLK_Divider_EN),
.i_div_ratio(Divider_Ratio_RX),
.o_div_clk( UART_RX_CLK)
);

///********************************************************///
/////////////////////////// UART /////////////////////////////
///********************************************************///

UART  U0_UART (
.RST(Sync_UART_RST),
.TX_CLK(UART_TX_CLK),
.RX_CLK(UART_RX_CLK),
.parity_enable(UART_Config[0]),
.parity_type(UART_Config[1]),
.Prescale(UART_Config[7:2]),
.RX_IN_S(UART_RX_IN),
.RX_OUT_P(UART_RX_OUT),                      
.RX_OUT_V(  UART_RX_Vaild_OUT),                      
.TX_IN_P( UART_TX_Sync), 
.TX_IN_V(!UART_TX_Vaild_Sync), 
.TX_OUT_S(UART_TX_O),
.TX_OUT_V(UART_TX_Busy),
.parity_error(parity_error),
.framing_error(framing_error)                  
);

///********************************************************///
//////////////////// System Controller ///////////////////////
///********************************************************///
SYS_CTRL U0_SYS_CTRL (
.CLK(REF_CLK),
.RST(Sync_REF_RST),
.RF_RdData(RdData),
.RF_RdData_VLD( RdData_Vaild),
.RF_WrEn(WrEn),
.RF_RdEn(RdEn),
.RF_Address(Address),
.RF_WrData(WrData),
.ALU_EN(ALU_EN),
.ALU_FUN(ALU_FUN), 
.ALU_OUT(ALU_OUT),
.ALU_OUT_VLD( ALU_OUT_Vaild),  
.CLKG_EN(CLK_Gateing_EN), 
.CLKDIV_EN( CLK_Divider_EN ),   
.FIFO_FULL(FIFO_FULL),
.UART_RX_DATA(UART_RX_Sync), 
.UART_RX_VLD(UART_RX_Vaild_Sync),
.UART_TX_DATA(UART_TX_IN), 
.UART_TX_VLD(UART_TX_Vaild)
);


///********************************************************///
/////////////////////// Register File ////////////////////////
///********************************************************///
RegFile   U0_RegFile(
.clk(REF_CLK),
.rst(Sync_REF_RST),
.RdEn(RdEn),
.WrEn(WrEn),
.RdData(RdData),
.WrData(WrData),
.Address(Address),
.RdData_VLD(RdData_Vaild),
.REG0(Operand_A),
.REG1(Operand_B),
.REG2(UART_Config),
.REG3(  Divider_Ratio)
);

///********************************************************///
//////////////////////////// ALU /////////////////////////////
///********************************************************///
 
alu  U0_alu(
.clk(ALU_CLK),
.rst(Sync_REF_RST),
.ALU_FUN(ALU_FUN),
.ALU_OUT(ALU_OUT),
.a(Operand_A),
.b(Operand_B),
.EN(ALU_EN),
.OUT_VaLID(ALU_OUT_Vaild)
);

///********************************************************///
///////////////////////// Clock Gating ///////////////////////
///********************************************************///
CLK_GATE U0_CLK_GATE (
.CLK_EN( CLK_Gateing_EN),
.CLK(REF_CLK),
.GATED_CLK(ALU_CLK)
);



endmodule
 
