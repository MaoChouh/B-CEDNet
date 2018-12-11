#!/bin/sh -f
xv_path="/opt/Xilinx/Vivado/2014.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim testbench_PE_DC_behav -key {Behavioral:sim_1:Functional:testbench_PE_DC} -tclbatch testbench_PE_DC.tcl -log simulate.log
