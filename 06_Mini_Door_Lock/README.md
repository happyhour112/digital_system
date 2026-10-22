# Four digit combinational door lock subsystem

## Application and specification
The sixteen switches supply four simultaneous BCD digits. Reject any invalid digit. Compare with the fixed constant 2580. The indicator always follows the present switch pattern. No entry sequence, password update, timing, or persistent unlock is implemented.

## Board mapping
- SW15..SW12 = thousands digit
- SW11..SW8 = hundreds digit
- SW7..SW4 = tens digit
- SW3..SW0 = ones digit
- LED0 = correct and BCD valid
- LED1 = incorrect or BCD invalid
- LED2 = any invalid BCD digit

Vectors in files and tables read from the highest bit down to bit 0. The board's printed SW0 is the least significant bit. Only declared LED outputs have a defined demonstration role. Ordinary user LEDs are active high.

## Sources
Design top: `mini_door_lock`. Simulation top: `tb_mini_door_lock`. Compile all files in `src/` in this order: bcd_digit_valid.vhd, mini_door_lock.vhd. All VHDL files must use VHDL-2008.

`x"2580"` represents BCD digits 2, 5, 8, 0. Converting decimal integer 2580 to a 16-bit binary vector gives x"0A14", a different representation. For this fixed legal password, a raw equality comparison alone can never match an invalid BCD input. The explicit validators still teach the input contract, drive the invalid diagnostic, and support future password changes. Vivado may optimize redundant validity gating on the correct-code path.

## Vivado 2025.2 reproducible setup
1. Extract to a short local path, for example C:/FPGA/Week7. Keep the folder structure.
2. Open Vivado 2025.2. In its Tcl Console run `source {C:/FPGA/Week7/06_Mini_Door_Lock/create_project.tcl}`, adapting the actual path. This creates an RTL project for **xc7a100tcsg324-1** without requiring an installed board preset. Existing project folders are protected from overwrite.
3. Manual equivalent: Create Project, RTL Project, choose the exact part, add `src/` files as Design Sources, `sim/tb_mini_door_lock.vhd` as Simulation Sources and `constraints/nexys_a7_100t.xdc` as Constraints. Set the design top and simulation top separately. In file properties choose VHDL 2008.
4. Run Simulation, Run Behavioral Simulation. Run All, or run at least 655360 ns. Expect `PASS mini_door_lock: 65536 binary combinations` and no failure assertion. The default GUI 1000 ns is insufficient for the door-lock exhaustive test.
5. Inspect SW and LED in the waveform viewer. Use unsigned or hexadecimal radix for multi-bit buses. Tables here are binary MSB to LSB.
6. Open Elaborated Design. Follow each port to internal logic and outputs. This checks hierarchy and inferred RTL structure, not device routing.
7. Run Synthesis. Open Synthesized Design. Inspect schematic, utilization, warnings and I/O ports. Expect combinational logic, LUTs and I/O buffers. There must be no inferred storage. Do not expect one LUT per VHDL line.
8. Run Implementation. Inspect DRC and I/O reports. Verify every top-level port has the specified pin and I/O standard. SW8/SW9, when present, must be LVCMOS18.
9. Generate Bitstream. No clock is used or constrained. These human-operated static demonstrations make no measured nanosecond timing guarantee. A clean timing summary without specified I/O timing does not prove a propagation-time requirement.
10. Hardware Manager, Open Target, Auto Connect. Power the Nexys A7-100T and use its USB PROG/UART port with a data-capable cable. Select the detected xc7a100t device, Program Device, and the new `mini_door_lock.bit` under `vivado_project/mini_door_lock.runs/impl_1/`.
11. Set switches from the checkpoints below, allow them to settle, and compare LEDs. The testbench never programs the board. Re-synthesize, implement, regenerate and reprogram after an RTL change.

Optional: source `implement.tcl` after successful behavioral simulation. It checks for unexpected storage primitives and writes synthesis/implementation reports. This script has not been executed in Vivado in the authoring environment.

## Expected board checkpoints
| Input decimal | SW bits | LED bits |
| --- | --- | --- |
| 9600 | 0010010110000000 | 001 |
| 9601 | 0010010110000001 | 010 |
| 42368 | 1010010110000000 | 110 |
| 9616 | 0010010110010000 | 010 |
| 65535 | 1111111111111111 | 110 |

## Automated simulation and expected data
With GHDL installed, run `bash sim/run_ghdl.sh` from this project folder. It compiles VHDL-2008, elaborates the TB, checks all 65536 binary inputs and writes `verification/waveform.vcd`. On Windows with GHDL, use the equivalent commands shown in that script from a shell, or use Vivado/xsim. The TB waits 10 ns between vectors to let delta cycles settle. That wait is simulation pacing and is not a physical delay specification.

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

The fixed password is 2580. Predict outputs for 2581 and A580. Can an invalid BCD input equal fixed legal 2580?

Answer: 2581 gives LED2..LED0 = 010. A580 gives LED2..LED0 = 110. No. Exact equality to this legal constant implies valid digits.
