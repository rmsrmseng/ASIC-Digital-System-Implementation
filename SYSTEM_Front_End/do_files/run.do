vlib work

vlog ../rtl/*/*.*v

vsim -voptargs=+acc work.SYS_TOP_TB

add wave SYS_TOP_TB/RST_N
add wave SYS_TOP_TB/UART_CLK
add wave SYS_TOP_TB/REF_CLK
add wave SYS_TOP_TB/UART_RX_IN
add wave SYS_TOP_TB/UART_TX_O

add wave SYS_TOP_TB/DUT/U0_UART/RX_OUT_P
add wave SYS_TOP_TB/DUT/U0_UART/RX_OUT_V

add wave SYS_TOP_TB/parity_error
add wave SYS_TOP_TB/framing_error
add wave SYS_TOP_TB/error_count

add wave SYS_TOP_TB/RX_BYTE
add wave SYS_TOP_TB/TX_BYTE
add wave SYS_TOP_TB/TX_HIGH_BYTE
add wave SYS_TOP_TB/TX_LOW_BYTE
add wave SYS_TOP_TB/TX_WORD

add wave SYS_TOP_TB/TB_RX_BYTE
add wave SYS_TOP_TB/TB_TX_HIGH
add wave SYS_TOP_TB/TB_TX_LOW
add wave SYS_TOP_TB/TB_TX_WORD
add wave SYS_TOP_TB/TB_EXPECTED_BYTE
add wave SYS_TOP_TB/TB_EXPECTED_WORD
add wave SYS_TOP_TB/TB_ALU_FUN
add wave SYS_TOP_TB/TB_RF_ADDR
add wave SYS_TOP_TB/TB_RF_DATA

run -all