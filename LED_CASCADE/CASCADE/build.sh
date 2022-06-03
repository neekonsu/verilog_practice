#!/usr/bin/zsh

exec yosys -p 'synth_ice40 -json $1.json' $1.v
#source /opt/oss-cad-suite/environment
exec nextpnr-ice40 --hx8k --package cb132 --json $1.json --asc $1.asc --pcf ../alchitry_cu.pcf
exec icepack $1.asc $1.bin
exec iceprog $1.bin
