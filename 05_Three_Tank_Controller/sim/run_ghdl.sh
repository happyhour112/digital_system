#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p verification/ghdl_work
ghdl -a --std=08 --workdir=verification/ghdl_work src/three_tank_controller.vhd src/three_tank_process.vhd src/three_tank_active_low.vhd sim/tb_three_tank_controller.vhd
ghdl -e --std=08 --workdir=verification/ghdl_work tb_three_tank_controller
ghdl -r --std=08 --workdir=verification/ghdl_work tb_three_tank_controller --assert-level=error --vcd=verification/waveform.vcd
