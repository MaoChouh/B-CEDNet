onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib data_in_ROM_opt

do {wave.do}

view wave
view structure
view signals

do {data_in_ROM.udo}

run -all

quit -force
