module parity_checker_process
  (input  [6:0] SW,
   output [3:0] LED);
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire n10;
  wire n11;
  wire n12;
  wire [1:0] n13;
  wire n14;
  wire n15;
  wire n16;
  wire [2:0] n17;
  wire n18;
  wire n19;
  wire n20;
  wire [3:0] n21;
  wire n22;
  wire n23;
  wire n24;
  wire n25;
  wire n26;
  wire n27;
  wire n28;
  wire n29;
  wire n30;
  wire n31;
  wire n32;
  wire [3:0] n34;
  assign LED = n34; //(module output)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:17:17  */
  assign n6 = SW[3]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:17:27  */
  assign n7 = SW[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:17:21  */
  assign n8 = n6 ^ n7;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:17:37  */
  assign n9 = SW[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:17:31  */
  assign n10 = n8 ^ n9;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:17:47  */
  assign n11 = SW[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:17:41  */
  assign n12 = n10 ^ n11;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:18:25  */
  assign n13 = SW[3:2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:18:43  */
  assign n14 = SW[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:18:53  */
  assign n15 = SW[6]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:18:47  */
  assign n16 = n14 ^ n15;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:18:38  */
  assign n17 = {n13, n16};
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:18:63  */
  assign n18 = SW[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:18:73  */
  assign n19 = SW[4]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:18:67  */
  assign n20 = n18 ^ n19;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:18:58  */
  assign n21 = {n17, n20};
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:19:32  */
  assign n22 = SW[5]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:19:26  */
  assign n23 = n12 ^ n22;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:20:32  */
  assign n24 = n21[3]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:20:50  */
  assign n25 = n21[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:20:36  */
  assign n26 = n24 ^ n25;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:20:68  */
  assign n27 = n21[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:20:54  */
  assign n28 = n26 ^ n27;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:20:86  */
  assign n29 = n21[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:20:72  */
  assign n30 = n28 ^ n29;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:20:90  */
  assign n31 = n30 ^ n23;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker_process.vhd:23:19  */
  assign n32 = ~n31;
  assign n34 = {n23, n32, n31, n12};
endmodule

