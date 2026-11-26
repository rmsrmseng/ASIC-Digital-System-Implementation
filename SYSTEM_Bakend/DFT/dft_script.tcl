
################################################################################
#                         SYS_TOP - DFT FLOW
#                         Design Compiler O-2018.06-SP1
################################################################################

########################### Define Top Module ###############################

set top_module SYS_TOP

set DATA_WIDTH     8
set RF_ADDR        4
set NUM_OF_CHAINS  3
set MAX_CHAIN_LEN  100

######################## Working Directories ################################

file mkdir work
file mkdir netlists
file mkdir sdf
file mkdir sdc
file mkdir reports

define_design_lib work -path ./work

######################## Formality Setup ####################################

set_svf ${top_module}.svf

######################## Library Setup ######################################

set lib_path /home/ICer/tsmc_fb_cl013g_sc/aci/sc-m/synopsys
lappend search_path $lib_path

set SSLIB scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db
set TTLIB scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db
set FFLIB scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db

set target_library [list $SSLIB $TTLIB $FFLIB]
set link_library   [list * $SSLIB $TTLIB $FFLIB]

######################## Read RTL ###########################################

if {![file exists system.lst]} {
    error "ERROR: system.lst was not found in the current directory."
}

set fh [open system.lst r]
set rtl_content [read $fh]
close $fh

set rtl_files [split [string trim $rtl_content] "\n"]

foreach rtl_file $rtl_files {
    set rtl_file [string trim $rtl_file]

    if {$rtl_file eq ""} {
        continue
    }

    if {![file exists $rtl_file]} {
        error "ERROR: RTL file not found: $rtl_file"
    }

    puts "Analyzing: $rtl_file"
    analyze -format verilog $rtl_file
}

######################## Elaborate ###########################################

elaborate $top_module \
    -parameters "DATA_WIDTH=$DATA_WIDTH,RF_ADDR=$RF_ADDR,NUM_OF_CHAINS=$NUM_OF_CHAINS"

current_design $top_module
link

######################## Check Design ########################################

redirect -tee -file reports/check_design.rpt {
    check_design
}

######################## Timing Constraints ##################################

if {![file exists ./cons.tcl]} {
    error "ERROR: cons.tcl was not found."
}

source -echo ./cons.tcl

redirect -tee -file reports/clocks_before_dft.rpt {
    report_clock -attributes
}

######################## Scan Configuration ##################################

set_scan_configuration \
    -clock_mixing no_mix \
    -style multiplexed_flip_flop \
    -replace true \
    -chain_count $NUM_OF_CHAINS \
    -max_length $MAX_CHAIN_LEN

######################## Initial Synthesis ###################################

compile

redirect -tee -file reports/check_design_post_compile.rpt {
    check_design
}

######################## Formality Setup Off #################################

set_svf -off

######################## DFT Signal Setup ####################################

set test_default_period       100
set test_default_delay        0
set test_default_bidir_delay  0
set test_default_strobe       20
set test_default_strobe_width 0

# Functional master clocks
set_dft_signal \
    -port [get_ports REF_CLK] \
    -type MasterClock \
    -view existing_dft

set_dft_signal \
    -port [get_ports UART_CLK] \
    -type MasterClock \
    -view existing_dft

# Scan clock
set_dft_signal \
    -port [get_ports scan_clk] \
    -type ScanClock \
    -view existing_dft \
    -timing {30 60}

# Active-low reset ports
set_dft_signal \
    -port [get_ports scan_rst] \
    -type Reset \
    -view existing_dft \
    -active_state 0

set_dft_signal \
    -port [get_ports RST_N] \
    -type Reset \
    -view existing_dft \
    -active_state 0

# Test mode in both views
set_dft_signal \
    -port [get_ports test_mode] \
    -type TestMode \
    -view existing_dft \
    -active_state 1

set_dft_signal \
    -port [get_ports test_mode] \
    -type TestMode \
    -view spec \
    -active_state 1

# Scan enable
set_dft_signal \
    -port [get_ports SE] \
    -type ScanEnable \
    -view spec \
    -active_state 1 \
    -usage scan

# Scan input
set_dft_signal \
    -port [get_ports SI] \
    -type ScanDataIn \
    -view spec

# Scan output: RTL name is So
set_dft_signal \
    -port [get_ports So] \
    -type ScanDataOut \
    -view spec

######################## Create Test Protocol ################################

redirect -tee -file reports/create_test_protocol.rpt {
    create_test_protocol
}

######################## Pre-DFT DRC #########################################

redirect -tee -file reports/pre_dft_drc.rpt {
    dft_drc -verbose
}

######################## Preview Scan Chains #################################

redirect -tee -file reports/preview_dft.rpt {
    preview_dft -show scan_summary
}

set fh [open reports/preview_dft.rpt r]
set preview_text [read $fh]
close $fh

if {[regexp -nocase {Number of chains:[[:space:]]*0} $preview_text]} {
    error "STOP: preview_dft reports ZERO scan chains. Check DFT and clock reports."
}

######################## Insert DFT ##########################################

insert_dft

######################## Incremental Scan Compile ############################

compile -scan -incremental

######################## Post-DFT DRC ########################################

redirect -tee -file reports/post_dft_drc.rpt {
    dft_drc -verbose
}

redirect -tee -file reports/dft_drc_coverage.rpt {
    dft_drc -coverage_estimate
}

######################## Write Output Files ##################################

write_file -format ddc -hierarchy \
    -output netlists/${top_module}.ddc

write_file -format verilog -hierarchy \
    -output netlists/${top_module}.v

write_sdf sdf/${top_module}.sdf
write_sdc -nosplit sdc/${top_module}.sdc

######################## Reports ##############################################

redirect -tee -file reports/area.rpt {
    report_area -hierarchy
}

redirect -tee -file reports/power.rpt {
    report_power -hierarchy
}

redirect -tee -file reports/hold.rpt {
    report_timing -delay_type min -max_paths 20
}

redirect -tee -file reports/setup.rpt {
    report_timing -delay_type max -max_paths 20
}

redirect -tee -file reports/clocks_post_dft.rpt {
    report_clock -attributes
}

redirect -tee -file reports/constraints.rpt {
    report_constraint -all_violators -nosplit
}

######################## Scan Chain Summary ##################################

set num_flops [sizeof_collection [all_registers -edge_triggered]]

puts "================================================"
puts "Top module             : $top_module"
puts "Edge-triggered flops   : $num_flops"
puts "Requested scan chains  : $NUM_OF_CHAINS"
puts "Maximum chain length   : $MAX_CHAIN_LEN"
puts "DFT SCRIPT COMPLETED"
puts "================================================"

