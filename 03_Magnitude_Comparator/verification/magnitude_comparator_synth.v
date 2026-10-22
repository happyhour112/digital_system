module magnitude_comparator
  (input  [7:0] SW,
   output [2:0] LED);
  wire [3:0] a_value;
  wire [3:0] b_value;
  wire [3:0] n1;
  wire [3:0] n2;
  wire n4;
  wire n5;
  wire n8;
  wire n9;
  wire n12;
  wire n13;
  wire [2:0] n15;
  assign LED = n15; //(module output)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/03_Magnitude_Comparator/src/magnitude_comparator.vhd:11:12  */
  assign a_value = n1; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/03_Magnitude_Comparator/src/magnitude_comparator.vhd:11:21  */
  assign b_value = n2; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/03_Magnitude_Comparator/src/magnitude_comparator.vhd:13:27  */
  assign n1 = SW[3:0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/03_Magnitude_Comparator/src/magnitude_comparator.vhd:14:27  */
  assign n2 = SW[7:4]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/03_Magnitude_Comparator/src/magnitude_comparator.vhd:15:32  */
  assign n4 = a_value == b_value;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/03_Magnitude_Comparator/src/magnitude_comparator.vhd:15:19  */
  assign n5 = n4 ? 1'b1 : 1'b0;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/03_Magnitude_Comparator/src/magnitude_comparator.vhd:16:32  */
  assign n8 = $unsigned(a_value) > $unsigned(b_value);
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/03_Magnitude_Comparator/src/magnitude_comparator.vhd:16:19  */
  assign n9 = n8 ? 1'b1 : 1'b0;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/03_Magnitude_Comparator/src/magnitude_comparator.vhd:17:32  */
  assign n12 = $unsigned(a_value) < $unsigned(b_value);
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/03_Magnitude_Comparator/src/magnitude_comparator.vhd:17:19  */
  assign n13 = n12 ? 1'b1 : 1'b0;
  assign n15 = {n13, n9, n5};
endmodule

