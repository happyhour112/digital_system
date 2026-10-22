#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p verification/ghdl_work
ghdl -a --std=08 --workdir=verification/ghdl_work src/bcd_digit_valid.vhd src/mini_door_lock.vhd sim/tb_mini_door_lock.vhd
ghdl -e --std=08 --workdir=verification/ghdl_work tb_mini_door_lock
ghdl -r --std=08 --workdir=verification/ghdl_work tb_mini_door_lock --assert-level=error --vcd=verification/waveform.vcd
