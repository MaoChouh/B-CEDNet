# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Tue Dec 20 10:36:18 2016
# Designs open: 2
#   V1: /home/tensor_v1/project/B-CEDNet/test/testbench_PE_DC/output/testbench_PE_DC_waveform.vpd
#   V2: /home/tensor_v1/project/B-CEDNet/test/testbench_PE_EC/output/testbench_PE_EC_waveform.vpd
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: V2:testbench_PE_EC.U1.binzr_inst
#   Wave.1: 9 signals
#   Group count = 8
#   Group Group1 signal count = 3
#   Group Group2 signal count = 1
#   Group genblk1[0].genblk1[0].conv_kernel_inst signal count = 1
#   Group genblk1[1].genblk1[1].conv_kernel_inst signal count = 11
#   Group genblk1[0].genblk1[1].conv_kernel_inst signal count = 11
#   Group genblk1[0].genblk1[0].conv_kernel_inst_1 signal count = 11
#   Group Group3 signal count = 9
# End_DVE_Session_Save_Info

# DVE version: H-2013.06_Full64
# DVE build date: May 30 2013 23:00:12


#<Session mode="Full" path="/home/tensor_v1/project/B-CEDNet/test/testbench_PE_DC/output/DVEfiles//crash_12.20:10.36/dve_session12.20:10.36.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.2

if {![gui_exist_window -window TopLevel.2]} {
    set TopLevel.2 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.2 TopLevel.2
}
gui_show_window -window ${TopLevel.2} -show_state normal -rect {{72 89} {1918 1075}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_hide_toolbar -toolbar {Simulator}
gui_hide_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.2}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 535} {child_wave_right 1306} {child_wave_colname 265} {child_wave_colvalue 265} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) none
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) none
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) none
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) none
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.2}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {/home/tensor_v1/project/B-CEDNet/test/testbench_PE_DC/output/testbench_PE_DC_waveform.vpd}] } {
	gui_open_db -design V1 -file /home/tensor_v1/project/B-CEDNet/test/testbench_PE_DC/output/testbench_PE_DC_waveform.vpd -nosource
}
if { ![gui_is_db_opened -db {/home/tensor_v1/project/B-CEDNet/test/testbench_PE_EC/output/testbench_PE_EC_waveform.vpd}] } {
	gui_open_db -design V2 -file /home/tensor_v1/project/B-CEDNet/test/testbench_PE_EC/output/testbench_PE_EC_waveform.vpd -nosource
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


set _session_group_2 Group1
gui_sg_create "$_session_group_2"
set Group1 "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { V1:testbench_PE_DC.data_in V1:testbench_PE_DC.U1.binrz_ref V1:testbench_PE_DC.U1.conv_out }
gui_set_radix -radix {decimal} -signals {V1:testbench_PE_DC.U1.binrz_ref}
gui_set_radix -radix {twosComplement} -signals {V1:testbench_PE_DC.U1.binrz_ref}
gui_set_radix -radix {decimal} -signals {V1:testbench_PE_DC.U1.conv_out}
gui_set_radix -radix {unsigned} -signals {V1:testbench_PE_DC.U1.conv_out}

set _session_group_3 Group2
gui_sg_create "$_session_group_3"
set Group2 "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { V1:testbench_PE_DC.U1.binrz_ref }
gui_set_radix -radix {decimal} -signals {V1:testbench_PE_DC.U1.binrz_ref}
gui_set_radix -radix {twosComplement} -signals {V1:testbench_PE_DC.U1.binrz_ref}

set _session_group_4 {genblk1[0].genblk1[0].conv_kernel_inst}
gui_sg_create "$_session_group_4"
set {genblk1[0].genblk1[0].conv_kernel_inst} "$_session_group_4"

gui_sg_addsignal -group "$_session_group_4" { }

set _session_group_5 $_session_group_4|
append _session_group_5 {genblk1[1].genblk1[0].conv_kernel_inst}
gui_sg_create "$_session_group_5"
set {genblk1[0].genblk1[0].conv_kernel_inst|genblk1[1].genblk1[0].conv_kernel_inst} "$_session_group_5"

gui_sg_addsignal -group "$_session_group_5" { {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.idx} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.fmap_xor} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.weight} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.fmap_in} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.in_en} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.D} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.FH} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.FW} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.conv_out} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.IN_WIDTH} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.OUT_WIDTH} }
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.idx}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.idx}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.D}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.D}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.FH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.FH}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.FW}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.FW}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.conv_out}}
gui_set_radix -radix {unsigned} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.conv_out}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.IN_WIDTH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.IN_WIDTH}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.OUT_WIDTH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.OUT_WIDTH}}

set _session_group_6 {genblk1[1].genblk1[1].conv_kernel_inst}
gui_sg_create "$_session_group_6"
set {genblk1[1].genblk1[1].conv_kernel_inst} "$_session_group_6"

gui_sg_addsignal -group "$_session_group_6" { {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.idx} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.fmap_xor} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.weight} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.fmap_in} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.in_en} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.D} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.FH} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.FW} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.conv_out} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.IN_WIDTH} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.OUT_WIDTH} }
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.idx}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.idx}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.D}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.D}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.FH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.FH}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.FW}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.FW}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.conv_out}}
gui_set_radix -radix {unsigned} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.conv_out}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.IN_WIDTH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.IN_WIDTH}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.OUT_WIDTH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.OUT_WIDTH}}

set _session_group_7 {genblk1[0].genblk1[1].conv_kernel_inst}
gui_sg_create "$_session_group_7"
set {genblk1[0].genblk1[1].conv_kernel_inst} "$_session_group_7"

gui_sg_addsignal -group "$_session_group_7" { {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.idx} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.fmap_xor} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.weight} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.fmap_in} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.in_en} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.D} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.FH} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.FW} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.conv_out} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.IN_WIDTH} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.OUT_WIDTH} }
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.idx}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.idx}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.D}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.D}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.FH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.FH}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.FW}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.FW}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.conv_out}}
gui_set_radix -radix {unsigned} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.conv_out}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.IN_WIDTH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.IN_WIDTH}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.OUT_WIDTH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.OUT_WIDTH}}

set _session_group_8 {genblk1[0].genblk1[0].conv_kernel_inst_1}
gui_sg_create "$_session_group_8"
set {genblk1[0].genblk1[0].conv_kernel_inst_1} "$_session_group_8"

gui_sg_addsignal -group "$_session_group_8" { {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.idx} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.fmap_xor} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.weight} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.fmap_in} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.in_en} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.D} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.FH} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.FW} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.conv_out} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.IN_WIDTH} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.OUT_WIDTH} }
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.idx}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.idx}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.D}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.D}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.FH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.FH}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.FW}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.FW}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.conv_out}}
gui_set_radix -radix {unsigned} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.conv_out}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.IN_WIDTH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.IN_WIDTH}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.OUT_WIDTH}}
gui_set_radix -radix {twosComplement} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.OUT_WIDTH}}

set _session_group_9 Group3
gui_sg_create "$_session_group_9"
set Group3 "$_session_group_9"

gui_sg_addsignal -group "$_session_group_9" { {V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.conv_out} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.conv_out} {V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.conv_out} {V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.conv_out} V2:testbench_PE_EC.U1.binrz_ref V2:testbench_PE_EC.U1.p_res {V2:testbench_PE_EC.U1.binzr_inst.data_tmp[0]} {V2:testbench_PE_EC.U1.binzr_inst.data_tmp[1]} V2:testbench_PE_EC.U1.binzr_inst.data_tmp1 }
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.conv_out}}
gui_set_radix -radix {unsigned} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[0].conv_kernel_inst.conv_out}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.conv_out}}
gui_set_radix -radix {unsigned} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[0].conv_kernel_inst.conv_out}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.conv_out}}
gui_set_radix -radix {unsigned} -signals {{V2:testbench_PE_EC.U1.genblk1[0].genblk1[1].conv_kernel_inst.conv_out}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.conv_out}}
gui_set_radix -radix {unsigned} -signals {{V2:testbench_PE_EC.U1.genblk1[1].genblk1[1].conv_kernel_inst.conv_out}}
gui_set_radix -radix {decimal} -signals {V2:testbench_PE_EC.U1.binrz_ref}
gui_set_radix -radix {unsigned} -signals {V2:testbench_PE_EC.U1.binrz_ref}
gui_set_radix -radix {decimal} -signals {V2:testbench_PE_EC.U1.p_res}
gui_set_radix -radix {unsigned} -signals {V2:testbench_PE_EC.U1.p_res}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.binzr_inst.data_tmp[0]}}
gui_set_radix -radix {unsigned} -signals {{V2:testbench_PE_EC.U1.binzr_inst.data_tmp[0]}}
gui_set_radix -radix {decimal} -signals {{V2:testbench_PE_EC.U1.binzr_inst.data_tmp[1]}}
gui_set_radix -radix {unsigned} -signals {{V2:testbench_PE_EC.U1.binzr_inst.data_tmp[1]}}
gui_set_radix -radix {decimal} -signals {V2:testbench_PE_EC.U1.binzr_inst.data_tmp1}
gui_set_radix -radix {unsigned} -signals {V2:testbench_PE_EC.U1.binzr_inst.data_tmp1}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 23795



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
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {UnnamedProcess 1} {Function 1} {Block 1} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {PowSwitch 0} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design V2
catch {gui_list_expand -id ${Hier.1} V2:testbench_PE_EC}
catch {gui_list_expand -id ${Hier.1} V2:testbench_PE_EC.U1}
catch {gui_list_select -id ${Hier.1} {V2:testbench_PE_EC.U1.binzr_inst}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {V2:testbench_PE_EC.U1.binzr_inst}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active V2:testbench_PE_EC.U1.binzr_inst /home/tensor_v1/project/B-CEDNet/matlab/verification/../../src/soft_ip/building_blocks/COMPARATOR.v
gui_src_value_annotate -id ${Source.1} -switch true
gui_set_env TOGGLE::VALUEANNOTATE 1
gui_src_set_reusable -id ${Source.1}

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 40000
gui_list_add_group -id ${Wave.1} -after {New Group} {Group3}
gui_list_select -id ${Wave.1} {V2:testbench_PE_EC.U1.binzr_inst.data_tmp1 }
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
gui_list_set_insertion_bar  -id ${Wave.1} -group Group3  -position in

gui_marker_move -id ${Wave.1} {C1} 23795
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

