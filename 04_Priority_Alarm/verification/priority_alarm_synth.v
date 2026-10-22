module priority_alarm
  (input  [2:0] SW,
   output [4:0] LED);
  wire n2;
  wire n3;
  wire n4;
  wire [4:0] n7;
  wire [4:0] n9;
  wire [4:0] n11;
  assign LED = n11; //(module output)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/04_Priority_Alarm/src/priority_alarm.vhd:16:14  */
  assign n2 = SW[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/04_Priority_Alarm/src/priority_alarm.vhd:18:17  */
  assign n3 = SW[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/04_Priority_Alarm/src/priority_alarm.vhd:20:17  */
  assign n4 = SW[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/04_Priority_Alarm/src/priority_alarm.vhd:20:9  */
  assign n7 = n4 ? 5'b01001 : 5'b00000;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/04_Priority_Alarm/src/priority_alarm.vhd:18:9  */
  assign n9 = n3 ? 5'b10010 : n7;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/04_Priority_Alarm/src/priority_alarm.vhd:16:9  */
  assign n11 = n2 ? 5'b11100 : n9;
endmodule

