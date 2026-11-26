
module SYS_TOP # ( parameter DATA_WIDTH = 8 ,  RF_ADDR = 4 , NUM_OF_CHAINS=3 )

(  
 input   wire                          scan_clk,
 input   wire                          scan_rst,
 input   wire                          test_mode,
 input   wire                          SE ,
 input   wire   [NUM_OF_CHAINS-1:0]    SI ,
 output  wire   [NUM_OF_CHAINS-1:0]    So,  
 
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
wire         				UART_RX_Vaild_OUT;
wire      [DATA_WIDTH-1:0]		 UART_RX_Sync;
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

//////////////////////////////////////////for dft/////////////////////////////////////

wire clk_uart_mux;
wire clk_ref_mux;
wire rst_mux;
wire rst_uart_mux;
wire rst_ref_mux;
wire clk_gate_enable_or;
wire clk_div1_mux;
wire clk_div2_mux;


mux_rst  U0_mux_rst  (
.IN_0(RST_N),
.IN_1(scan_rst),
 .SEL(test_mode),
 .OUT(rst_mux) 
);

mux_rst  U1_mux_rst  (
.IN_0(Sync_UART_RST),
.IN_1(scan_rst),
 .SEL(test_mode),
 .OUT(rst_uart_mux) 
);

mux_rst  U2_mux_rst  (
.IN_0(Sync_REF_RST),
.IN_1(scan_rst),
 .SEL(test_mode),
 .OUT(rst_ref_mux) 
);



mux_uart  U0_mux_uart  (
.IN_0(UART_CLK),
.IN_1(scan_clk),
 .SEL(test_mode),
 .OUT(clk_uart_mux) 
);

mux_ref  U0_mux_ref  (
.IN_0(REF_CLK),
.IN_1(scan_clk),
 .SEL(test_mode),
 .OUT(clk_ref_mux) 
);

mux_div  U0_mux_div  (
.IN_0(UART_TX_CLK),
.IN_1(scan_clk),
 .SEL(test_mode),
 .OUT(clk_div1_mux) 
);

mux_div  U1_mux_div  (
.IN_0(UART_RX_CLK),
.IN_1(scan_clk),
 .SEL(test_mode),
 .OUT(clk_div2_mux) 
);

or_clk_gate  U0_or_clk_gate (
.IN_0(CLK_Gateing_EN),
.IN_1(test_mode),
 .OUT(clk_gate_enable_or) 
);

///********************************************************///
//////////////////// Reset synchronizers /////////////////////
///********************************************************///
RST_Synchronizer # (.NUM_STAGES(2)) U1_RST_Synchronizer(
.clk(clk_ref_mux),
.rst(rst_mux),
.SYNC_RST( Sync_REF_RST)
);

RST_Synchronizer # (.NUM_STAGES(2)) U2_RST_Synchronizer(
.clk( clk_uart_mux),
.rst(rst_mux),
.SYNC_RST(Sync_UART_RST)
);

///********************************************************///
////////////////////// Data Synchronizer /////////////////////
///********************************************************///
Data_Synchronizer # (.NUM_STAGES(2) , .BUS_WIDTH(8)) U0_Data_Synchronizer(
.clk(clk_ref_mux),
.rst(rst_ref_mux),
.unsync_bus( UART_RX_OUT),
.bus_enable(UART_RX_Vaild_OUT),
.sync_bus( UART_RX_Sync),
.enable_pluse( UART_RX_Vaild_Sync)
);


///********************************************************///
///////////////////////// Async FIFO /////////////////////////
///********************************************************///
ASYNC_FIFO  #(.DATA_WIDTH(DATA_WIDTH) , .P_SIZE(4)  , .F_DEPTH(8)) U0_ASYNC_FIFO(
.W_CLK(clk_ref_mux),
.W_RST(rst_ref_mux),
.W_INC(UART_TX_Vaild),
.R_CLK(clk_div1_mux),
.R_RST(rst_uart_mux),
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
.clk(  clk_div1_mux),
.rst(rst_uart_mux),
.lvl_sig(UART_TX_Busy),
.pulse_sig(UART_TX_Busy_Pulse)
);

///********************************************************///
//////////// Clock Divider for UART_TX Clock /////////////////
///********************************************************///
 Clock_Divider UO_Clock_Divider(
.i_ref_clk(clk_uart_mux),
.i_rst_n(rst_uart_mux),
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
.i_ref_clk(clk_uart_mux),
.i_rst_n(rst_uart_mux),
.i_clk_en(   CLK_Divider_EN),
.i_div_ratio(Divider_Ratio_RX),
.o_div_clk( UART_RX_CLK)
);

///********************************************************///
/////////////////////////// UART /////////////////////////////
///********************************************************///

UART  U0_UART (
.RST(rst_uart_mux),
.TX_CLK(clk_div1_mux),
.RX_CLK(clk_div2_mux),
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
.CLK(clk_ref_mux),
.RST(rst_ref_mux),
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
.clk(clk_ref_mux),
.rst(rst_ref_mux),
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
.rst(rst_ref_mux),
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
.CLK_EN(clk_gate_enable_or),
.CLK(clk_ref_mux),
.GATED_CLK(ALU_CLK)
);



endmodule
 
