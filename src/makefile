compile:
	vlib work;
	vlog -sv top.sv

simulate:
	vsim tb -l top.log -c -do "log -r /*; run -all;quit" -wlf waveform.wlf

all:
	make compile && make simulate
