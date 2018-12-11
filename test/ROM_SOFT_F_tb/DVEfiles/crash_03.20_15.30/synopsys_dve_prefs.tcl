# DVE version H-2013.06_Full64
# Preferences written on Sun Jan 22 14:35:48 2017
gui_set_var -name {read_pref_file} -value {true}
gui_set_pref_value -category {Data} -key {showValueAnnotation} -value {true}
gui_set_pref_value -category {Driver} -key {show_intermediate_drivers} -value {true}
gui_set_pref_value -category {Globals} -key {cbug_fifo_dump_enable_proc} -value {false}
gui_create_pref_key -category {Globals} -key {load_detail_for_funcov} -value_type {bool} -value {false}
gui_create_pref_key -category {Hier} -key {showPowerSwitch} -value_type {bool} -value {false}
gui_set_pref_value -category {Source} -key {value_annotate} -value {true}

gui_create_pref_category -category {dlg_settings}
gui_create_pref_key -category {dlg_settings} -key {tableWithImmediatePopup} -value_type {bool} -value {true}
gui_set_var -name {read_pref_file} -value {false}
