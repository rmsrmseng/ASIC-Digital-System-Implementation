
################################################################################
#                         CONSTRAINTS FILE
#                              SYS_TOP
################################################################################

################################################################################
# Section 0 : DC Variables
################################################################################

# Prevent multiple-port net issues and buffer constants where appropriate
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs


################################################################################
# Section 1 : Clock Definitions
################################################################################

# REF_CLK = 50 MHz, Period = 20 ns
create_clock -name REF_CLK \
             -period 20.0 \
             [get_ports REF_CLK]

# UART_CLK = 3.6864 MHz, Period ~= 271.27 ns
create_clock -name UART_CLK \
             -period 271.27 \
             [get_ports UART_CLK]


################################################################################
# Section 2 : Generated Clocks
################################################################################

# ALU clock: gated version of REF_CLK
create_generated_clock -name ALU_CLK \
                       -source [get_ports REF_CLK] \
                       -divide_by 1 \
                       [get_pins U0_CLK_GATE/GATED_CLK]

# RX clock: assumed divide ratio = 1
create_generated_clock -name RX_CLK \
                       -source [get_ports UART_CLK] \
                       -divide_by 1 \
                       [get_pins U1_Clock_Divider/o_div_clk]

# TX clock: assumed divide ratio = 32
create_generated_clock -name TX_CLK \
                       -source [get_ports UART_CLK] \
                       -divide_by 32 \
                       [get_pins UO_Clock_Divider/o_div_clk]


################################################################################
# Section 3 : Clock Uncertainty
################################################################################

set_clock_uncertainty -setup 0.2 [all_clocks]
set_clock_uncertainty -hold  0.1 [all_clocks]


################################################################################
# Section 4 : Clock Transition
################################################################################

set_clock_transition 0.05 [get_clocks REF_CLK]
set_clock_transition 0.05 [get_clocks UART_CLK]


################################################################################
# Section 5 : Clock Network Protection
################################################################################

set_dont_touch_network [get_clocks REF_CLK]
set_dont_touch_network [get_clocks UART_CLK]
set_dont_touch_network [get_clocks ALU_CLK]
set_dont_touch_network [get_clocks RX_CLK]
set_dont_touch_network [get_clocks TX_CLK]


################################################################################
# Section 6 : Clock Relationships
################################################################################

# REF_CLK domain and UART_CLK domain are asynchronous
set_clock_groups -asynchronous \
    -group [get_clocks {REF_CLK ALU_CLK}] \
    -group [get_clocks {UART_CLK RX_CLK TX_CLK}]


################################################################################
# Section 7 : Input Delays
################################################################################

# UART_RX_IN is an asynchronous external input.
# These delays are reference assumptions for this timing model.
set_input_delay -max 4.0 \
                -clock REF_CLK \
                [get_ports UART_RX_IN]

set_input_delay -min 0.0 \
                -clock REF_CLK \
                [get_ports UART_RX_IN]


################################################################################
# Section 8 : Output Delays
################################################################################

# Apply output delay to external output ports only
set_output_delay -max 4.0 \
                 -clock REF_CLK \
                 [get_ports {UART_TX_O parity_error framing_error}]

set_output_delay -min 0.0 \
                 -clock REF_CLK \
                 [get_ports {UART_TX_O parity_error framing_error}]


################################################################################
# Section 9 : Input Driving / Transition
################################################################################

# Use input transition instead of selecting an arbitrary library buffer.
# This avoids UID-993 errors from an invalid driving-cell selection.
set_input_transition 0.05 [get_ports UART_RX_IN]


################################################################################
# Section 10 : Output Load
################################################################################

set_load 0.1 [get_ports {UART_TX_O parity_error framing_error}]


################################################################################
# Section 11 : Operating Conditions
################################################################################

# Worst-case maximum-delay analysis: SS
# Best-case minimum-delay analysis: FF
set_operating_conditions \
    -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c \
    -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c \
    -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c \
    -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c


################################################################################
# End of cons.tcl
################################################################################

