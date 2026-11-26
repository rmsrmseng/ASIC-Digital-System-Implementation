########################### Define Top Module ############################

set top_module SYS_TOP

##################### Define Working Library Directory ######################

define_design_lib work -path ./work

############################ Formality Setup File ###########################

set_svf $top_module.svf

################## Design Compiler Library Files ############################

puts "###########################################"
puts "#      Setting Design Libraries           #"
puts "###########################################"

set LIB_PATH "/home/ICer/tsmc_fb_cl013g_sc/aci/sc-m/synopsys"

set_app_var search_path [concat $search_path $LIB_PATH]

set SSLIB "$LIB_PATH/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "$LIB_PATH/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "$LIB_PATH/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

set_app_var target_library [list $SSLIB $TTLIB $FFLIB]
set_app_var link_library [list "*" $SSLIB $TTLIB $FFLIB]

######################## Reading RTL Files ##################################

######################## Reading RTL Files ############################

puts "###########################################"
puts "#             Analyzing RTL Files         #"
puts "###########################################"

set fh [open system.lst r]
set rtl [read $fh]
close $fh

set designs [split $rtl "\n"]

foreach file $designs {
    set file [string trim $file]
    if {$file ne ""} {
        analyze -format verilog $file
    }
}

###################### Elaborating Top-Level Design ###################

puts "###############################################"
puts "######## Elaborating Top-Level Design #########"
puts "###############################################"

elaborate $top_module
current_design $top_module

#################### Linking Design Parts #############################

link
check_design

#################### Checking Design Consistency ############################

puts "###############################################"
puts "######## Checking Design Consistency #########"
puts "###############################################"

check_design

#################### Define Design Constraints ##############################

puts "###############################################"
puts "######## Design Constraints ###################"
puts "###############################################"

source ./cons.tcl

###################### Mapping and Optimization #############################

puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile

#############################################################################

# Write Out Files

#############################################################################

write_file -format ddc -hierarchy -output netlists/$top_module.ddc
write_file -format verilog -hierarchy -output netlists/$top_module.v

write_sdf sdf/$top_module.sdf
write_sdc -nosplit sdc/$top_module.sdc

####################### Reporting ###########################################

report_area -hierarchy > reports/area.rpt
report_power -hierarchy > reports/power.rpt
report_timing -delay_type min > reports/hold.rpt
report_timing -delay_type max > reports/setup.rpt
report_clock -attributes > reports/clocks.rpt
report_constraint -all_violators -nosplit > reports/constraints.rpt

################# Starting Graphical User Interface #########################

# gui_start

# exit

