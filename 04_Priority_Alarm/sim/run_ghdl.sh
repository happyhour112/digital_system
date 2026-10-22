#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p verification/ghdl_work
ghdl -a --std=08 --workdir=verification/ghdl_work src/priority_alarm.vhd sim/tb_priority_alarm.vhd
ghdl -e --std=08 --workdir=verification/ghdl_work tb_priority_alarm
ghdl -r --std=08 --workdir=verification/ghdl_work tb_priority_alarm --assert-level=error --vcd=verification/waveform.vcd
