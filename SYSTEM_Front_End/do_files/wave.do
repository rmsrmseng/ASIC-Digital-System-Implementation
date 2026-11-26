onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /SYS_TOP_TB/RST_N
add wave -noupdate /SYS_TOP_TB/UART_CLK
add wave -noupdate /SYS_TOP_TB/REF_CLK
add wave -noupdate /SYS_TOP_TB/UART_RX_IN
add wave -noupdate /SYS_TOP_TB/UART_TX_O
add wave -noupdate /SYS_TOP_TB/DUT/U0_UART/RX_OUT_P
add wave -noupdate /SYS_TOP_TB/DUT/U0_UART/RX_OUT_V
add wave -noupdate /SYS_TOP_TB/TB_EXPECTED_BYTE
add wave -noupdate /SYS_TOP_TB/parity_error
add wave -noupdate /SYS_TOP_TB/framing_error
add wave -noupdate /SYS_TOP_TB/error_count
add wave -noupdate /SYS_TOP_TB/RX_BYTE
add wave -noupdate /SYS_TOP_TB/TX_BYTE
add wave -noupdate /SYS_TOP_TB/TX_HIGH_BYTE
add wave -noupdate /SYS_TOP_TB/TX_LOW_BYTE
add wave -noupdate /SYS_TOP_TB/TX_WORD
add wave -noupdate /SYS_TOP_TB/TB_RX_BYTE
add wave -noupdate /SYS_TOP_TB/TB_TX_HIGH
add wave -noupdate /SYS_TOP_TB/TB_TX_LOW
add wave -noupdate /SYS_TOP_TB/TB_TX_WORD
add wave -noupdate /SYS_TOP_TB/TB_EXPECTED_WORD
add wave -noupdate /SYS_TOP_TB/TB_ALU_FUN
add wave -noupdate /SYS_TOP_TB/TB_RF_ADDR
add wave -noupdate /SYS_TOP_TB/TB_RF_DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2616169968 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {4294967296 ps}
