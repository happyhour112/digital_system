# Run in Vivado 2025.2 Tcl Console: source <absolute-path>/create_project.tcl
set root_dir [file dirname [file normalize [info script]]]
if {[file exists [file join $root_dir vivado_project]]} {
    error "vivado_project already exists. Open its .xpr or choose a fresh extracted copy."
}
create_project magnitude_comparator [file join $root_dir vivado_project] -part xc7a100tcsg324-1
set_property target_language VHDL [current_project]
read_vhdl -vhdl2008 [file join $root_dir src magnitude_comparator.vhd]
read_xdc [file join $root_dir constraints nexys_a7_100t.xdc]
add_files -fileset sim_1 [file join $root_dir sim tb_magnitude_comparator.vhd]
set_property file_type {VHDL 2008} [get_files *.vhd]
set_property top magnitude_comparator [get_filesets sources_1]
set_property top tb_magnitude_comparator [get_filesets sim_1]
set_property xsim.simulate.runtime {2560ns} [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
puts "Project ready. Run behavioral simulation before synthesis."
