#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p verification/ghdl_work
ghdl -a --std=08 --workdir=verification/ghdl_work src/parity_checker.vhd src/parity_checker_process.vhd sim/tb_parity_checker.vhd
ghdl -e --std=08 --workdir=verification/ghdl_work tb_parity_checker
ghdl -r --std=08 --workdir=verification/ghdl_work tb_parity_checker --assert-level=error --vcd=verification/waveform.vcd
