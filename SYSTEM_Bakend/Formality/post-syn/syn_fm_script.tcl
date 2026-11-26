
######################## Define Top Module ########################

set top_module SYS_TOP
set synopsys_auto_setup true

######################## Define Paths #############################

set RTL_DIR "../../rtl"
set NETLIST "../../Synthesis/netlists/SYS_TOP.v"
set SVF_FILE "../../Synthesis/SYS_TOP.svf"

set TTLIB "/home/ICer/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"

######################## Check Files ##############################

if {![file exists $NETLIST]} {
    error "Implementation netlist not found: $NETLIST"
}

set rtl_files [glob -nocomplain ../../rtl/*/*.v]

if {[llength $rtl_files] == 0} {
    set rtl_files [glob -nocomplain ../../rtl/*.v]
}

if {[llength $rtl_files] == 0} {
    error "No RTL files found. Check RTL_DIR path."
}



puts "RTL files found: $rtl_files"
puts "Implementation netlist: $NETLIST"

######################## Technology Library #######################

read_db -technology_library $TTLIB

######################## Reference Container ######################

read_verilog -container r -libname WORK -05 $rtl_files
set_top r:/WORK/$top_module

######################## Implementation Container #################

read_verilog -container i -libname WORK -05 $NETLIST
set_top i:/WORK/$top_module

######################## SVF ######################################

# The current Formality version is older than the DC version.
# The previous run reported FM-339 for the SVF.
# First test equivalence without loading that SVF.

######################## Matching #################################

match

######################## Verification #############################

set successful [verify]

if {!$successful} {
    diagnose
    analyze_points -failing
}

######################## Reports ##################################

report_passing_points > reports/passing_points.rpt
report_failing_points > reports/failing_points.rpt
report_aborted_points > reports/aborted_points.rpt
report_unverified_points > reports/unverified_points.rpt
exit

