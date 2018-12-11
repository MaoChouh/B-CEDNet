# Begin_DVE_Session_Save_Info
# DVE reload session
# Saved on Mon Mar 20 16:24:40 2017
# Designs open: 1
#   V1: /home/tensor_v1/project/B-CEDNet/test/ROM_SOFT_F_tb/output/ROM_SOFT_F_tb_waveform.vpd
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: ROM_SOFT_F_tb.U
#   Wave.1: 14 signals
#   Group count = 1
#   Group Group1 signal count = 14
# End_DVE_Session_Save_Info

# DVE version: H-2013.06_Full64
# DVE build date: May 30 2013 23:00:12


#<Session mode="Reload" path="/home/tensor_v1/project/B-CEDNet/test/ROM_SOFT_F_tb/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Reload
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all
gui_clear_window -type Wave
gui_clear_window -type List

# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

set TopLevel.1 TopLevel.1

# Docked window settings
set HSPane.1 HSPane.1
set Hier.1 Hier.1
set DLPane.1 DLPane.1
set Data.1 Data.1
set Console.1 Console.1
set DriverLoad.1 DriverLoad.1
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 Source.1
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings


# Create and position top-level window: TopLevel.2

set TopLevel.2 TopLevel.2

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 Wave.1
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 539} {child_wave_right 1315} {child_wave_colname 267} {child_wave_colvalue 268} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


#</WindowLayout>

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {/home/tensor_v1/project/B-CEDNet/test/ROM_SOFT_F_tb/output/ROM_SOFT_F_tb_waveform.vpd}] } {
	gui_open_db -design V1 -file /home/tensor_v1/project/B-CEDNet/test/ROM_SOFT_F_tb/output/ROM_SOFT_F_tb_waveform.vpd -nosource
}
gui_set_precision 1ps
gui_set_time_units 1ps
#</Database>

# DVE Global setting session: 


# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups


set _session_group_6 Group1
gui_sg_create "$_session_group_6"
set Group1 "$_session_group_6"

gui_sg_addsignal -group "$_session_group_6" { ROM_SOFT_F_tb.U.clk ROM_SOFT_F_tb.U.clk_r ROM_SOFT_F_tb.U.r_en_dl ROM_SOFT_F_tb.U.r_en ROM_SOFT_F_tb.U.rst ROM_SOFT_F_tb.U.addr_in ROM_SOFT_F_tb.U.data_out ROM_SOFT_F_tb.U.buffer_sw ROM_SOFT_F_tb.U.true_addr ROM_SOFT_F_tb.U.sub_addr ROM_SOFT_F_tb.U.sub_addr_dl ROM_SOFT_F_tb.U.core_data ROM_SOFT_F_tb.U.data_out_1 ROM_SOFT_F_tb.U.data_out_2 }
gui_set_radix -radix {decimal} -signals {V1:ROM_SOFT_F_tb.U.addr_in}
gui_set_radix -radix {unsigned} -signals {V1:ROM_SOFT_F_tb.U.addr_in}
gui_set_radix -radix {decimal} -signals {V1:ROM_SOFT_F_tb.U.true_addr}
gui_set_radix -radix {unsigned} -signals {V1:ROM_SOFT_F_tb.U.true_addr}
gui_set_radix -radix {decimal} -signals {V1:ROM_SOFT_F_tb.U.sub_addr}
gui_set_radix -radix {unsigned} -signals {V1:ROM_SOFT_F_tb.U.sub_addr}
gui_set_radix -radix {decimal} -signals {V1:ROM_SOFT_F_tb.U.sub_addr_dl}
gui_set_radix -radix {unsigned} -signals {V1:ROM_SOFT_F_tb.U.sub_addr_dl}
gui_set_radix -radix {hex} -signals {V1:ROM_SOFT_F_tb.U.core_data}
gui_set_radix -radix {unsigned} -signals {V1:ROM_SOFT_F_tb.U.core_data}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 4030000



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {UnnamedProcess 1} {Function 1} {Block 1} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {PowSwitch 0} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*} -force
gui_change_design -id ${Hier.1} -design V1
catch {gui_list_expand -id ${Hier.1} ROM_SOFT_F_tb}
catch {gui_list_expand -id ${Hier.1} ROM_SOFT_F_tb.U}
catch {gui_list_select -id ${Hier.1} {ROM_SOFT_F_tb.U.genblk6.U}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {ROM_SOFT_F_tb.U.genblk6.U}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active ROM_SOFT_F_tb.U /home/tensor_v1/project/B-CEDNet/matlab/verification/../../src/soft_ip/building_blocks/ROM_SOFT_F.sv
gui_src_value_annotate -id ${Source.1} -switch true
gui_set_env TOGGLE::VALUEANNOTATE 1
gui_view_scroll -id ${Source.1} -vertical -set 1632
gui_src_set_reusable -id ${Source.1}

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_wv_zoom_timerange -id ${Wave.1} 3856955 4203068
gui_list_add_group -id ${Wave.1} -after {New Group} {Group1}
gui_list_select -id ${Wave.1} {ROM_SOFT_F_tb.U.data_out }
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group Group1  -item {ROM_SOFT_F_tb.U.sub_addr_dl[3:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 4030000
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false

# DriverLoad 'DriverLoad.1'
gui_get_drivers -session -id ${DriverLoad.1} -signal {ROM_SOFT_F_tb.U.data_out_1[2][383:0]} -time 1300000 -starttime 3910000
gui_get_drivers -session -id ${DriverLoad.1} -signal {ROM_SOFT_F_tb.U.data_out_1[11:0][383:0]} -time 3910000 -starttime 3910000
gui_get_drivers -session -id ${DriverLoad.1} -signal {ROM_SOFT_F_tb.U.data_out_1[11:0][383:0]} -time 4020000 -starttime 4030000
gui_get_drivers -session -id ${DriverLoad.1} -signal {ROM_SOFT_F_tb.U.data_out_1[11:0][383:0]} -time 4030000 -starttime 4030000
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${HSPane.1}
}
#</Session>

