module bcd_validator
  (input  [3:0] SW,
   output [2:0] LED);
  wire invalid_code;
  wire n1;
  wire n2;
  wire n3;
  wire n4;
  wire n5;
  wire n6;
  wire n9;
  wire n10;
  wire [2:0] n12;
  assign LED = n12; //(module output)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/01_BCD_Validator/src/bcd_validator.vhd:10:12  */
  assign invalid_code = n5; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/01_BCD_Validator/src/bcd_validator.vhd:13:23  */
  assign n1 = SW[3]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/01_BCD_Validator/src/bcd_validator.vhd:13:34  */
  assign n2 = SW[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/01_BCD_Validator/src/bcd_validator.vhd:13:43  */
  assign n3 = SW[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/01_BCD_Validator/src/bcd_validator.vhd:13:38  */
  assign n4 = n2 | n3;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/01_BCD_Validator/src/bcd_validator.vhd:13:27  */
  assign n5 = n1 & n4;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/01_BCD_Validator/src/bcd_validator.vhd:14:15  */
  assign n6 = ~invalid_code;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/01_BCD_Validator/src/bcd_validator.vhd:16:27  */
  assign n9 = SW == 4'b0000;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/01_BCD_Validator/src/bcd_validator.vhd:16:19  */
  assign n10 = n9 ? 1'b1 : 1'b0;
  assign n12 = {n10, invalid_code, n6};
endmodule

