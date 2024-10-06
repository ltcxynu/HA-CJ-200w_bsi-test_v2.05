onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axis_dwidth_converter_0_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {axis_dwidth_converter_0.udo}

run -all

quit -force
