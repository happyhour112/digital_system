#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p verification/ghdl_work
ghdl -a --std=08 --workdir=verification/ghdl_work src/magnitude_comparator.vhd sim/tb_magnitude_comparator.vhd
ghdl -e --std=08 --workdir=verification/ghdl_work tb_magnitude_comparator
ghdl -r --std=08 --workdir=verification/ghdl_work tb_magnitude_comparator --assert-level=error --vcd=verification/waveform.vcd
