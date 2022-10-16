onerror {quit -f}
vlib work
vlog -work work Digital_Clock.vo
vlog -work work Digital_Clock.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.TOP_vlg_vec_tst
vcd file -direction Digital_Clock.msim.vcd
vcd add -internal TOP_vlg_vec_tst/*
vcd add -internal TOP_vlg_vec_tst/i1/*
add wave /*
run -all
