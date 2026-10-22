# Source AFTER create_project.tcl and reviewing behavioral simulation.
launch_runs synth_1 -jobs 2
wait_on_run synth_1
if {[get_property PROGRESS [get_runs synth_1]] ne "100%"} { error "Synthesis failed" }
open_run synth_1
set storage [get_cells -hier -filter {PRIMITIVE_TYPE =~ FLOP_LATCH.*}]
if {[llength $storage] != 0} { error "Unexpected sequential cell(s): $storage" }
report_utilization -file [file join $root_dir synthesis_utilization.rpt]
close_design
launch_runs impl_1 -to_step write_bitstream -jobs 2
wait_on_run impl_1
if {[get_property PROGRESS [get_runs impl_1]] ne "100%"} { error "Implementation or bitstream generation failed" }
open_run impl_1
report_drc -file [file join $root_dir implementation_drc.rpt]
report_io -file [file join $root_dir implementation_io.rpt]
report_timing_summary -file [file join $root_dir implementation_timing.rpt]
puts "No clock is used. Unconstrained switch-to-LED timing is not a sign-off timing claim."
