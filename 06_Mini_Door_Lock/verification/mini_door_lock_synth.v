module bcd_digit_valid
  (input  [3:0] digit,
   output valid);
  wire n27;
  wire n28;
  wire n29;
  wire n30;
  wire n31;
  wire n32;
  assign valid = n32; //(module output)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/bcd_digit_valid.vhd:10:24  */
  assign n27 = digit[3]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/bcd_digit_valid.vhd:10:38  */
  assign n28 = digit[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/bcd_digit_valid.vhd:10:50  */
  assign n29 = digit[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/bcd_digit_valid.vhd:10:42  */
  assign n30 = n28 | n29;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/bcd_digit_valid.vhd:10:28  */
  assign n31 = n27 & n30;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/bcd_digit_valid.vhd:10:14  */
  assign n32 = ~n31;
endmodule

module mini_door_lock
  (input  [15:0] SW,
   output [2:0] LED);
  wire [3:0] valid_digit;
  wire all_valid;
  wire match_code;
  wire correct_code;
  wire \digit_3.valid ;
  wire [3:0] n1;
  wire \digit_2.valid ;
  wire [3:0] n3;
  wire \digit_1.valid ;
  wire [3:0] n5;
  wire \digit_0.valid ;
  wire [3:0] n7;
  wire n9;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n18;
  wire n19;
  wire n21;
  wire n22;
  wire n23;
  wire [3:0] n24;
  wire [2:0] n25;
  assign LED = n25; //(module output)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:12:12  */
  assign valid_digit = n24; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:13:12  */
  assign all_valid = n15; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:13:23  */
  assign match_code = n19; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:13:35  */
  assign correct_code = n21; // (signal)
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:16:5  */
  bcd_digit_valid digit_3 (
    .digit(n1),
    .valid(\digit_3.valid ));
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:17:29  */
  assign n1 = SW[15:12]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:18:5  */
  bcd_digit_valid digit_2 (
    .digit(n3),
    .valid(\digit_2.valid ));
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:19:29  */
  assign n3 = SW[11:8]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:20:5  */
  bcd_digit_valid digit_1 (
    .digit(n5),
    .valid(\digit_1.valid ));
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:21:29  */
  assign n5 = SW[7:4]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:22:5  */
  bcd_digit_valid digit_0 (
    .digit(n7),
    .valid(\digit_0.valid ));
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:23:29  */
  assign n7 = SW[3:0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:24:29  */
  assign n9 = valid_digit[3]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:24:48  */
  assign n10 = valid_digit[2]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:24:33  */
  assign n11 = n9 & n10;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:24:67  */
  assign n12 = valid_digit[1]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:24:52  */
  assign n13 = n11 & n12;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:24:86  */
  assign n14 = valid_digit[0]; // extract
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:24:71  */
  assign n15 = n13 & n14;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:25:31  */
  assign n18 = SW == 16'b0010010110000000;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:25:23  */
  assign n19 = n18 ? 1'b1 : 1'b0;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:26:31  */
  assign n21 = all_valid & match_code;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:28:15  */
  assign n22 = ~correct_code;
  /* /workspace/scratch/aefc120a01c6/output/Week7_FPGA_Projects/06_Mini_Door_Lock/src/mini_door_lock.vhd:29:15  */
  assign n23 = ~all_valid;
  assign n24 = {\digit_3.valid , \digit_2.valid , \digit_1.valid , \digit_0.valid };
  assign n25 = {n23, n22, correct_code};
endmodule

