module parity_checker
  (input  [6:0] SW,
   output [3:0] LED);
  wire tx_parity;
  wire rx_parity;
  wire syndrome;
  wire [3:0] rx_data;
  wire n1;
  wire n2;
  wire n3;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire [1:0] n8;
  wire n9;
  wire n10;
  wire n11;
  wire [2:0] n12;
  wire n13;
  wire n14;
  wire n15;
  wire [3:0] n16;
  wire n17;
  wire n18;
  wire n19;
  wire n20;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n25;
  wire n26;
  wire n27;
  wire [3:0] n28;
  assign LED = n28; //(module output)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:10:12  */
  assign tx_parity = n7; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:10:23  */
  assign rx_parity = n18; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:10:34  */
  assign syndrome = n26; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:11:12  */
  assign rx_data = n16; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:13:20  */
  assign n1 = SW[3]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:13:30  */
  assign n2 = SW[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:13:24  */
  assign n3 = n1 ^ n2;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:13:40  */
  assign n4 = SW[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:13:34  */
  assign n5 = n3 ^ n4;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:13:50  */
  assign n6 = SW[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:13:44  */
  assign n7 = n5 ^ n6;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:14:18  */
  assign n8 = SW[3:2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:14:36  */
  assign n9 = SW[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:14:46  */
  assign n10 = SW[6]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:14:40  */
  assign n11 = n9 ^ n10;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:14:31  */
  assign n12 = {n8, n11};
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:14:56  */
  assign n13 = SW[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:14:66  */
  assign n14 = SW[4]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:14:60  */
  assign n15 = n13 ^ n14;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:14:51  */
  assign n16 = {n12, n15};
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:15:34  */
  assign n17 = SW[5]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:15:28  */
  assign n18 = tx_parity ^ n17;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:16:24  */
  assign n19 = rx_data[3]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:16:39  */
  assign n20 = rx_data[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:16:28  */
  assign n21 = n19 ^ n20;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:16:54  */
  assign n22 = rx_data[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:16:43  */
  assign n23 = n21 ^ n22;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:16:69  */
  assign n24 = rx_data[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:16:58  */
  assign n25 = n23 ^ n24;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:16:73  */
  assign n26 = n25 ^ rx_parity;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/02_Parity_Checker/src/parity_checker.vhd:19:15  */
  assign n27 = ~syndrome;
  assign n28 = {rx_parity, n27, syndrome, tx_parity};
endmodule

