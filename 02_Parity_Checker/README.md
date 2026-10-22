# Even parity generator and error checker

## Application and specification
Transmit four data bits with generated even parity. Three switches independently invert received data bit 0, the received parity bit, and received data bit 1. Report the received parity syndrome. A zero syndrome means the parity check passes, not that the data is guaranteed correct.

## Board mapping
- SW3..SW0 = original data
- SW4 = invert received data bit 0
- SW5 = invert received parity
- SW6 = invert received data bit 1
- LED0 = transmitted parity
- LED1 = error syndrome
- LED2 = parity check passes
- LED3 = received parity

Vectors in files and tables read from the highest bit down to bit 0. The board's printed SW0 is the least significant bit. Only declared LED outputs have a defined demonstration role. Ordinary user LEDs are active high.

## Sources
Design top: `parity_checker`. Simulation top: `tb_parity_checker`. Compile all files in `src/` in this order: parity_checker.vhd, parity_checker_process.vhd. All VHDL files must use VHDL-2008.

The testbench compares the primary top with `parity_checker_process` for every binary input. To program the alternative, set it as the design top. Its SW and LED widths match the same XDC.

## Vivado 2025.2 reproducible setup
1. Extract to a short local path, for example C:/FPGA/Week7. Keep the folder structure.
2. Open Vivado 2025.2. In its Tcl Console run `source {C:/FPGA/Week7/02_Parity_Checker/create_project.tcl}`, adapting the actual path. This creates an RTL project for **xc7a100tcsg324-1** without requiring an installed board preset. Existing project folders are protected from overwrite.
3. Manual equivalent: Create Project, RTL Project, choose the exact part, add `src/` files as Design Sources, `sim/tb_parity_checker.vhd` as Simulation Sources and `constraints/nexys_a7_100t.xdc` as Constraints. Set the design top and simulation top separately. In file properties choose VHDL 2008.
4. Run Simulation, Run Behavioral Simulation. Run All, or run at least 1280 ns. Expect `PASS parity_checker: 128 binary combinations` and no failure assertion. The default GUI 1000 ns is insufficient for the door-lock exhaustive test.
5. Inspect SW and LED in the waveform viewer. Use unsigned or hexadecimal radix for multi-bit buses. Tables here are binary MSB to LSB.
6. Open Elaborated Design. Follow each port to internal logic and outputs. This checks hierarchy and inferred RTL structure, not device routing.
7. Run Synthesis. Open Synthesized Design. Inspect schematic, utilization, warnings and I/O ports. Expect combinational logic, LUTs and I/O buffers. There must be no inferred storage. Do not expect one LUT per VHDL line.
8. Run Implementation. Inspect DRC and I/O reports. Verify every top-level port has the specified pin and I/O standard. SW8/SW9, when present, must be LVCMOS18.
9. Generate Bitstream. No clock is used or constrained. These human-operated static demonstrations make no measured nanosecond timing guarantee. A clean timing summary without specified I/O timing does not prove a propagation-time requirement.
10. Hardware Manager, Open Target, Auto Connect. Power the Nexys A7-100T and use its USB PROG/UART port with a data-capable cable. Select the detected xc7a100t device, Program Device, and the new `parity_checker.bit` under `vivado_project/parity_checker.runs/impl_1/`.
11. Set switches from the checkpoints below, allow them to settle, and compare LEDs. The testbench never programs the board. Re-synthesize, implement, regenerate and reprogram after an RTL change.

Optional: source `implement.tcl` after successful behavioral simulation. It checks for unexpected storage primitives and writes synthesis/implementation reports. This script has not been executed in Vivado in the authoring environment.

## Expected board checkpoints
| Input decimal | SW bits | LED bits |
| --- | --- | --- |
| 0 | 0000000 | 0100 |
| 1 | 0000001 | 1101 |
| 16 | 0010000 | 0010 |
| 32 | 0100000 | 1010 |
| 64 | 1000000 | 0010 |
| 48 | 0110000 | 1100 |
| 80 | 1010000 | 0100 |
| 112 | 1110000 | 1010 |

## Automated simulation and expected data
With GHDL installed, run `bash sim/run_ghdl.sh` from this project folder. It compiles VHDL-2008, elaborates the TB, checks all 128 binary inputs and writes `verification/waveform.vcd`. On Windows with GHDL, use the equivalent commands shown in that script from a shell, or use Vivado/xsim. The TB waits 10 ns between vectors to let delta cycles settle. That wait is simulation pacing and is not a physical delay specification.

`verification/expected_outputs.csv` is an independently generated full binary truth table. `verification/simulation.log` records the actual simulator result in this delivered package. Meta-values such as U and X are not covered by binary exhaustive tests. Investigate unknowns during simulation rather than treating them as valid input digits.

## Troubleshooting
- `process(all)` syntax error: set **all** relevant files to VHDL 2008 and refresh compile order.
- Missing entity: add every `src/` file and check design top. Do not add the TB to Design Sources.
- No PASS message: Run All or extend simulation duration. A waveform alone is not a test pass.
- UCIO-1 or NSTD-1: compare exact port names and widths with the supplied XDC. Do not lower DRC severity to hide missing pins.
- Wrong LED: verify MSB/LSB order, active-high user LED selection, newest bitstream and intended top.
- No device: check board power, USB PROG/UART connection, data cable and installed Digilent cable driver. No external wiring is required.
- A brief transient while changing switches can be normal combinational propagation or mechanical bounce. Observe settled results. No debounce or stored state is part of this lesson.

## Backup when hardware or Vivado is unavailable
Open `../offline_logic_lab.html` in a browser for an interactive behavioral model, inspect the supplied expected CSV, and open the actual GHDL VCD in a waveform viewer. The model teaches the logic but does not verify FPGA pin mapping. Board-level verification remains a separate task.

## Concept challenge and answer

Data bits 0 and 1 both invert. Received parity is unchanged. Will LED1 detect this corruption?

Answer: No. Two inversions preserve parity. LED2 means the parity check passes. It does not guarantee unchanged data.
