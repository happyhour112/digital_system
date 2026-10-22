module three_tank_active_low
  (input  [2:0] SW,
   output LED);
  wire [2:0] low_level;
  wire [2:0] n1;
  wire n2;
  wire n3;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire n10;
  wire n11;
  wire n12;
  assign LED = n12; //(module output)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:10:12  */
  assign low_level = n1; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:13:18  */
  assign n1 = ~SW;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:14:25  */
  assign n2 = low_level[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:14:42  */
  assign n3 = low_level[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:14:29  */
  assign n4 = n2 & n3;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:15:25  */
  assign n5 = low_level[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:15:42  */
  assign n6 = low_level[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:15:29  */
  assign n7 = n5 & n6;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:14:47  */
  assign n8 = n4 | n7;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:16:25  */
  assign n9 = low_level[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:16:42  */
  assign n10 = low_level[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:16:29  */
  assign n11 = n9 & n10;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_active_low.vhd:15:47  */
  assign n12 = n8 | n11;
endmodule

