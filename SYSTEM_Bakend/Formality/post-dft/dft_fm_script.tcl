################################################################################
# POST-DFT FORMALITY - SYS_TOP
# Formality L-2016.03-SP1
################################################################################

set top_module SYS_TOP
set impl_top SYS_TOP_DATA_WIDTH8_RF_ADDR4_NUM_OF_CHAINS3
set synopsys_auto_setup true

######################## Define Paths #############################

set RTL_DIR "/home/ICer/Projects/System/rtl"
set NETLIST "/home/ICer/Projects/System/DFT/netlists/SYS_TOP.v"
set SVF_FILE "/home/ICer/Projects/System/DFT/SYS_TOP.svf"

set LIB_DIR "/home/ICer/tsmc_fb_cl013g_sc/aci/sc-m/synopsys"

set SSLIB "${LIB_DIR}/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "${LIB_DIR}/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "${LIB_DIR}/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################## Check Files ##############################

foreach f [list $NETLIST $SVF_FILE $SSLIB $TTLIB $FFLIB] {
    if {![file exists $f]} {
        error "Required file not found: $f"
    }
}

######################## RTL File List ############################

set rtl_files [list]

lappend rtl_files "${RTL_DIR}/alu.v"
lappend rtl_files "${RTL_DIR}/ASYNC_FIFO.v"
lappend rtl_files "${RTL_DIR}/CLKDIV_MUX.v"
lappend rtl_files "${RTL_DIR}/CLK_GATE.v"
lappend rtl_files "${RTL_DIR}/Clock_Divider.v"
lappend rtl_files "${RTL_DIR}/Data_sampling.v"
lappend rtl_files "${RTL_DIR}/Data_Synchronizer.v"
lappend rtl_files "${RTL_DIR}/Deserializer.v"
lappend rtl_files "${RTL_DIR}/DF_Sync.v"
lappend rtl_files "${RTL_DIR}/Edge_Bit_Counter.v"
lappend rtl_files "${RTL_DIR}/FIFO_MEM_CNTRL.v"
lappend rtl_files "${RTL_DIR}/FIFO_RD.v"
lappend rtl_files "${RTL_DIR}/FIFO_WR.v"
lappend rtl_files "${RTL_DIR}/FSM_RX.v"
lappend rtl_files "${RTL_DIR}/FSM_TX.v"
lappend rtl_files "${RTL_DIR}/MUX.v"
lappend rtl_files "${RTL_DIR}/Parity_Calc.v"
lappend rtl_files "${RTL_DIR}/Parity_Check.v"
lappend rtl_files "${RTL_DIR}/PULSE_GEN.v"
lappend rtl_files "${RTL_DIR}/RegFile.v"
lappend rtl_files "${RTL_DIR}/RST_Synchronizer.v"
lappend rtl_files "${RTL_DIR}/Serializer.v"
lappend rtl_files "${RTL_DIR}/Start_Check.v"
lappend rtl_files "${RTL_DIR}/Stop_Check.v"
lappend rtl_files "${RTL_DIR}/SYS_CTRL.v"
lappend rtl_files "${RTL_DIR}/SYS_TOP_dft.v"
lappend rtl_files "${RTL_DIR}/UART.v"
lappend rtl_files "${RTL_DIR}/UART_RX.v"
lappend rtl_files "${RTL_DIR}/UART_TX.v"
lappend rtl_files "${RTL_DIR}/mux_rst.v"
lappend rtl_files "${RTL_DIR}/mux_ref.v"
lappend rtl_files "${RTL_DIR}/mux_uart.v"
lappend rtl_files "${RTL_DIR}/mux_div.v"
lappend rtl_files "${RTL_DIR}/or_clk_gate.v"

foreach f $rtl_files {
    if {![file exists $f]} {
        error "RTL file not found: $f"
    }
}

puts "RTL file count: [llength $rtl_files]"
puts "RTL files checked successfully."

puts "RTL files checked."
puts "Reference top: $top_module"
puts "Implementation top: $impl_top"
puts "Netlist: $NETLIST"

######################## SVF ######################################
# SVF must be read before the designs.

set_svf $SVF_FILE

######################## Reference Design #########################

read_verilog -container REF -libname WORK $rtl_files
read_db -container REF [list $SSLIB $TTLIB $FFLIB]

set_reference_design $top_module
set_top $top_module

######################## Implementation Design ###################

read_verilog -container IMPL -libname WORK $NETLIST
read_db -container IMPL [list $SSLIB $TTLIB $FFLIB]

set_implementation_design $impl_top
set_top $impl_top

######################## Functional Mode ##########################
# Constrain scan control inputs to functional mode.

# Functional mode: disable scan operation
set_constant REF:/WORK/SYS_TOP/test_mode 0
set_constant IMPL:/WORK/SYS_TOP_DATA_WIDTH8_RF_ADDR4_NUM_OF_CHAINS3/test_mode 0

set_constant REF:/WORK/SYS_TOP/SE 0
set_constant IMPL:/WORK/SYS_TOP_DATA_WIDTH8_RF_ADDR4_NUM_OF_CHAINS3/SE 0

######################## Scan Ports ###############################
# Keep scan-only ports out of the functional comparison.

set_dont_verify_points -type port Ref:/WORK/*/SI
set_dont_verify_points -type port Imp:/WORK/*/SI

set_dont_verify_points -type port Ref:/WORK/*/So
set_dont_verify_points -type port Imp:/WORK/*/So

######################## Matching #################################

match

######################## Verification #############################

set successful [verify]

if {!$successful} {
    diagnose
    analyze_points -failing
}

######################## Reports ##################################

file mkdir reports

report_passing_points > reports/passing_points.rpt
report_failing_points > reports/failing_points.rpt
report_aborted_points > reports/aborted_points.rpt
report_unverified_points > reports/unverified_points.rpt

######################## Final Status #############################

if {$successful} {
    puts "POST-DFT FORMALITY: VERIFY PASSED"
} else {
    puts "POST-DFT FORMALITY: VERIFY FAILED"
}

exit
