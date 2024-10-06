onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+axis_dwidth_converter_0 -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axis_dwidth_converter_0 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {axis_dwidth_converter_0.udo}

run -all

endsim

quit -force
