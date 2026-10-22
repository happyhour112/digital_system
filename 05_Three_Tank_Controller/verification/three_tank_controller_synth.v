module three_tank_controller
  (input  [2:0] SW,
   output LED);
  wire n1;
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
  assign LED = n11; //(module output)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_controller.vhd:13:18  */
  assign n1 = SW[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_controller.vhd:13:28  */
  assign n2 = SW[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_controller.vhd:13:22  */
  assign n3 = n1 & n2;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_controller.vhd:13:39  */
  assign n4 = SW[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_controller.vhd:13:49  */
  assign n5 = SW[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_controller.vhd:13:43  */
  assign n6 = n4 & n5;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_controller.vhd:13:33  */
  assign n7 = n3 | n6;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_controller.vhd:13:60  */
  assign n8 = SW[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_controller.vhd:13:70  */
  assign n9 = SW[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_controller.vhd:13:64  */
  assign n10 = n8 & n9;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_controller.vhd:13:54  */
  assign n11 = n7 | n10;
endmodule

