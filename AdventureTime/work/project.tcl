set projDir "C:/Projects/AdventureTime/AdventureTime/work/planAhead"
set projName "lol"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Projects/AdventureTime/AdventureTime/work/verilog/mojo_top_0.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/reset_conditioner_1.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/bin_to_dec_2.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/bin_to_dec_2.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/pn_gen_4.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/multi_seven_seg_5.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/multi_seven_seg_5.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/counter_7.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/sevenseg_8.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/main_9.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/edge_detector_10.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/edge_detector_10.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/counter_12.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/sevenseg_8.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/decoder_14.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/counter_12.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/sevenseg_8.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/decoder_14.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/adder_18.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/compare_19.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/multiply_20.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/shifter_21.v" "C:/Projects/AdventureTime/AdventureTime/work/verilog/boolean_22.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Projects/AdventureTime/AdventureTime/constraint/user.ucf" "C:/Projects/AdventureTime/AdventureTime/constraint/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
