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
ExecStep $xv_path/bin/xelab -wto e5c66348b01e40fd955917c5168188e5 -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot testbench_PE_DC_behav xil_defaultlib.testbench_PE_DC xil_defaultlib.glbl -log elaborate.log
