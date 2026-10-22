#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p verification/ghdl_work
ghdl -a --std=08 --workdir=verification/ghdl_work src/bcd_validator.vhd sim/tb_bcd_validator.vhd
ghdl -e --std=08 --workdir=verification/ghdl_work tb_bcd_validator
ghdl -r --std=08 --workdir=verification/ghdl_work tb_bcd_validator --assert-level=error --vcd=verification/waveform.vcd
