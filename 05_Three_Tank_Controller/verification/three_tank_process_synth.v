module three_tank_process
  (input  [2:0] SW,
   output LED);
  wire n3;
  wire [1:0] n6;
  wire n8;
  wire [31:0] n9;
  wire [31:0] n11;
  wire [1:0] n12;
  wire [1:0] n13;
  wire n14;
  wire [31:0] n15;
  wire [31:0] n17;
  wire [1:0] n18;
  wire [1:0] n19;
  wire [31:0] n20;
  wire n22;
  wire n25;
  assign LED = n25; //(module output)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:17:18  */
  assign n3 = SW[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:17:13  */
  assign n6 = n3 ? 2'b01 : 2'b00;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:17:18  */
  assign n8 = SW[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:18:40  */
  assign n9 = {30'b0, n6};  //  uext
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:18:40  */
  assign n11 = n9 + 32'b00000000000000000000000000000001;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:18:17  */
  assign n12 = n11[1:0];  // trunc
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:17:13  */
  assign n13 = n8 ? n12 : n6;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:17:18  */
  assign n14 = SW[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:18:40  */
  assign n15 = {30'b0, n13};  //  uext
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:18:40  */
  assign n17 = n15 + 32'b00000000000000000000000000000001;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:18:17  */
  assign n18 = n17[1:0];  // trunc
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:17:13  */
  assign n19 = n14 ? n18 : n13;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:21:22  */
  assign n20 = {30'b0, n19};  //  uext
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:21:22  */
  assign n22 = $signed(n20) >= $signed(32'b00000000000000000000000000000010);
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/05_Three_Tank_Controller/src/three_tank_process.vhd:21:9  */
  assign n25 = n22 ? 1'b1 : 1'b0;
endmodule

