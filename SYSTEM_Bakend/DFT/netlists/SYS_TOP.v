/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Mon Oct 12 02:27:14 2026
/////////////////////////////////////////////////////////////


module mux_rst_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux_rst_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux_rst_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux_uart ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux_ref ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux_div_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux_div_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module or_clk_gate ( IN_0, IN_1, OUT );
  input IN_0, IN_1;
  output OUT;


  OR2X2M U1 ( .A(IN_0), .B(IN_1), .Y(OUT) );
endmodule


module RST_Synchronizer_NUM_STAGES2_test_0 ( clk, rst, SYNC_RST, test_si, 
        test_se );
  input clk, rst, test_si, test_se;
  output SYNC_RST;
  wire   \rst_reg[0] ;

  SDFFRQX2M \rst_reg_reg[1]  ( .D(\rst_reg[0] ), .SI(\rst_reg[0] ), .SE(
        test_se), .CK(clk), .RN(rst), .Q(SYNC_RST) );
  SDFFRQX2M \rst_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(\rst_reg[0] ) );
endmodule


module RST_Synchronizer_NUM_STAGES2_test_1 ( clk, rst, SYNC_RST, test_si, 
        test_se );
  input clk, rst, test_si, test_se;
  output SYNC_RST;
  wire   \rst_reg[0] ;

  SDFFRQX2M \rst_reg_reg[1]  ( .D(\rst_reg[0] ), .SI(\rst_reg[0] ), .SE(
        test_se), .CK(clk), .RN(rst), .Q(SYNC_RST) );
  SDFFRQX2M \rst_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(\rst_reg[0] ) );
endmodule


module Data_Synchronizer_NUM_STAGES2_BUS_WIDTH8_test_1 ( unsync_bus, 
        bus_enable, clk, rst, sync_bus, enable_pluse, test_si, test_se );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, clk, rst, test_si, test_se;
  output enable_pluse;
  wire   bus_enable_syn_daley, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] bus_enable_reg;

  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(bus_enable_syn_daley), .B(bus_enable_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
  SDFFRQX2M bus_enable_syn_daley_reg ( .D(bus_enable_reg[1]), .SI(
        bus_enable_reg[1]), .SE(test_se), .CK(clk), .RN(rst), .Q(
        bus_enable_syn_daley) );
  SDFFRQX2M \bus_enable_reg_reg[1]  ( .D(bus_enable_reg[0]), .SI(
        bus_enable_reg[0]), .SE(test_se), .CK(clk), .RN(rst), .Q(
        bus_enable_reg[1]) );
  SDFFRQX2M \sync_bus_reg[7]  ( .D(n9), .SI(sync_bus[6]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[7]) );
  SDFFRQX2M \sync_bus_reg[3]  ( .D(n5), .SI(sync_bus[2]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[3]) );
  SDFFRQX2M \sync_bus_reg[0]  ( .D(n8), .SI(enable_pluse), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[0]) );
  SDFFRQX2M \sync_bus_reg[6]  ( .D(n2), .SI(sync_bus[5]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[6]) );
  SDFFRQX2M \sync_bus_reg[5]  ( .D(n3), .SI(sync_bus[4]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[5]) );
  SDFFRQX2M \sync_bus_reg[2]  ( .D(n6), .SI(sync_bus[1]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[2]) );
  SDFFRQX2M \sync_bus_reg[4]  ( .D(n4), .SI(sync_bus[3]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[4]) );
  SDFFRQX2M \sync_bus_reg[1]  ( .D(n7), .SI(sync_bus[0]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(sync_bus[1]) );
  SDFFRQX2M enable_pluse_reg ( .D(n10), .SI(bus_enable_syn_daley), .SE(test_se), .CK(clk), .RN(rst), .Q(enable_pluse) );
  SDFFRQX2M \bus_enable_reg_reg[0]  ( .D(bus_enable), .SI(test_si), .SE(
        test_se), .CK(clk), .RN(rst), .Q(bus_enable_reg[0]) );
endmodule


module FIFO_MEM_CNTRL_A_SIZE3_D_SIZE8_F_DEPTH8_P_SIZE4_test_1 ( w_clk, w_rstn, 
        w_full, w_inc, w_addr, r_addr, w_data, r_data, test_si, test_so, 
        test_se );
  input [2:0] w_addr;
  input [2:0] r_addr;
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, w_rstn, w_full, w_inc, test_si, test_se;
  output test_so;
  wire   N9, N10, N11, \FIFO_MEM[7][7] , \FIFO_MEM[7][6] , \FIFO_MEM[7][5] ,
         \FIFO_MEM[7][4] , \FIFO_MEM[7][3] , \FIFO_MEM[7][2] ,
         \FIFO_MEM[7][1] , \FIFO_MEM[7][0] , \FIFO_MEM[6][7] ,
         \FIFO_MEM[6][6] , \FIFO_MEM[6][5] , \FIFO_MEM[6][4] ,
         \FIFO_MEM[6][3] , \FIFO_MEM[6][2] , \FIFO_MEM[6][1] ,
         \FIFO_MEM[6][0] , \FIFO_MEM[5][7] , \FIFO_MEM[5][6] ,
         \FIFO_MEM[5][5] , \FIFO_MEM[5][4] , \FIFO_MEM[5][3] ,
         \FIFO_MEM[5][2] , \FIFO_MEM[5][1] , \FIFO_MEM[5][0] ,
         \FIFO_MEM[4][7] , \FIFO_MEM[4][6] , \FIFO_MEM[4][5] ,
         \FIFO_MEM[4][4] , \FIFO_MEM[4][3] , \FIFO_MEM[4][2] ,
         \FIFO_MEM[4][1] , \FIFO_MEM[4][0] , \FIFO_MEM[3][7] ,
         \FIFO_MEM[3][6] , \FIFO_MEM[3][5] , \FIFO_MEM[3][4] ,
         \FIFO_MEM[3][3] , \FIFO_MEM[3][2] , \FIFO_MEM[3][1] ,
         \FIFO_MEM[3][0] , \FIFO_MEM[2][7] , \FIFO_MEM[2][6] ,
         \FIFO_MEM[2][5] , \FIFO_MEM[2][4] , \FIFO_MEM[2][3] ,
         \FIFO_MEM[2][2] , \FIFO_MEM[2][1] , \FIFO_MEM[2][0] ,
         \FIFO_MEM[1][7] , \FIFO_MEM[1][6] , \FIFO_MEM[1][5] ,
         \FIFO_MEM[1][4] , \FIFO_MEM[1][3] , \FIFO_MEM[1][2] ,
         \FIFO_MEM[1][1] , \FIFO_MEM[1][0] , \FIFO_MEM[0][7] ,
         \FIFO_MEM[0][6] , \FIFO_MEM[0][5] , \FIFO_MEM[0][4] ,
         \FIFO_MEM[0][3] , \FIFO_MEM[0][2] , \FIFO_MEM[0][1] ,
         \FIFO_MEM[0][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n140, n141, n142,
         n143, n144;
  assign N9 = r_addr[0];
  assign N10 = r_addr[1];
  assign N11 = r_addr[2];
  assign test_so = \FIFO_MEM[7][7] ;

  BUFX2M U2 ( .A(n13), .Y(n127) );
  BUFX2M U3 ( .A(n14), .Y(n126) );
  BUFX2M U4 ( .A(n20), .Y(n123) );
  BUFX2M U5 ( .A(n21), .Y(n122) );
  BUFX2M U6 ( .A(n115), .Y(n117) );
  BUFX2M U7 ( .A(n115), .Y(n118) );
  BUFX2M U8 ( .A(n115), .Y(n119) );
  BUFX2M U9 ( .A(n116), .Y(n120) );
  BUFX2M U10 ( .A(n116), .Y(n121) );
  NOR2BX2M U11 ( .AN(w_inc), .B(w_full), .Y(n16) );
  BUFX2M U12 ( .A(w_rstn), .Y(n115) );
  BUFX2M U13 ( .A(w_rstn), .Y(n116) );
  NAND3X2M U14 ( .A(n136), .B(n137), .C(n12), .Y(n11) );
  NAND3X2M U15 ( .A(n136), .B(n137), .C(n18), .Y(n17) );
  NOR2X2M U16 ( .A(n112), .B(n113), .Y(n108) );
  NOR2BX2M U17 ( .AN(n16), .B(w_addr[2]), .Y(n12) );
  OAI2BB2X1M U18 ( .B0(n11), .B1(n128), .A0N(\FIFO_MEM[0][0] ), .A1N(n11), .Y(
        n22) );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n129), .A0N(\FIFO_MEM[0][1] ), .A1N(n11), .Y(
        n23) );
  OAI2BB2X1M U20 ( .B0(n11), .B1(n130), .A0N(\FIFO_MEM[0][2] ), .A1N(n11), .Y(
        n24) );
  OAI2BB2X1M U21 ( .B0(n11), .B1(n131), .A0N(\FIFO_MEM[0][3] ), .A1N(n11), .Y(
        n25) );
  OAI2BB2X1M U22 ( .B0(n11), .B1(n132), .A0N(\FIFO_MEM[0][4] ), .A1N(n11), .Y(
        n26) );
  OAI2BB2X1M U23 ( .B0(n11), .B1(n133), .A0N(\FIFO_MEM[0][5] ), .A1N(n11), .Y(
        n27) );
  OAI2BB2X1M U24 ( .B0(n11), .B1(n134), .A0N(\FIFO_MEM[0][6] ), .A1N(n11), .Y(
        n28) );
  OAI2BB2X1M U25 ( .B0(n11), .B1(n135), .A0N(\FIFO_MEM[0][7] ), .A1N(n11), .Y(
        n29) );
  NOR2X2M U26 ( .A(n113), .B(N11), .Y(n106) );
  NOR2X2M U27 ( .A(N10), .B(N11), .Y(n105) );
  INVX2M U28 ( .A(w_data[0]), .Y(n128) );
  INVX2M U29 ( .A(w_data[1]), .Y(n129) );
  INVX2M U30 ( .A(w_data[2]), .Y(n130) );
  INVX2M U31 ( .A(w_data[3]), .Y(n131) );
  INVX2M U32 ( .A(w_data[4]), .Y(n132) );
  INVX2M U33 ( .A(w_data[5]), .Y(n133) );
  INVX2M U34 ( .A(w_data[6]), .Y(n134) );
  INVX2M U35 ( .A(w_data[7]), .Y(n135) );
  OAI2BB2X1M U36 ( .B0(n128), .B1(n17), .A0N(\FIFO_MEM[4][0] ), .A1N(n17), .Y(
        n54) );
  OAI2BB2X1M U37 ( .B0(n129), .B1(n17), .A0N(\FIFO_MEM[4][1] ), .A1N(n17), .Y(
        n55) );
  OAI2BB2X1M U38 ( .B0(n130), .B1(n17), .A0N(\FIFO_MEM[4][2] ), .A1N(n17), .Y(
        n56) );
  OAI2BB2X1M U39 ( .B0(n131), .B1(n17), .A0N(\FIFO_MEM[4][3] ), .A1N(n17), .Y(
        n57) );
  OAI2BB2X1M U40 ( .B0(n132), .B1(n17), .A0N(\FIFO_MEM[4][4] ), .A1N(n17), .Y(
        n58) );
  OAI2BB2X1M U41 ( .B0(n133), .B1(n17), .A0N(\FIFO_MEM[4][5] ), .A1N(n17), .Y(
        n59) );
  OAI2BB2X1M U42 ( .B0(n134), .B1(n17), .A0N(\FIFO_MEM[4][6] ), .A1N(n17), .Y(
        n60) );
  OAI2BB2X1M U43 ( .B0(n135), .B1(n17), .A0N(\FIFO_MEM[4][7] ), .A1N(n17), .Y(
        n61) );
  BUFX2M U44 ( .A(n15), .Y(n125) );
  NAND3X2M U45 ( .A(w_addr[0]), .B(n12), .C(w_addr[1]), .Y(n15) );
  BUFX2M U46 ( .A(n19), .Y(n124) );
  NAND3X2M U47 ( .A(w_addr[0]), .B(n137), .C(n18), .Y(n19) );
  OAI2BB2X1M U48 ( .B0(n128), .B1(n127), .A0N(\FIFO_MEM[1][0] ), .A1N(n127), 
        .Y(n30) );
  OAI2BB2X1M U49 ( .B0(n129), .B1(n127), .A0N(\FIFO_MEM[1][1] ), .A1N(n127), 
        .Y(n31) );
  OAI2BB2X1M U50 ( .B0(n130), .B1(n127), .A0N(\FIFO_MEM[1][2] ), .A1N(n127), 
        .Y(n32) );
  OAI2BB2X1M U51 ( .B0(n131), .B1(n127), .A0N(\FIFO_MEM[1][3] ), .A1N(n127), 
        .Y(n33) );
  OAI2BB2X1M U52 ( .B0(n132), .B1(n127), .A0N(\FIFO_MEM[1][4] ), .A1N(n127), 
        .Y(n34) );
  OAI2BB2X1M U53 ( .B0(n133), .B1(n127), .A0N(\FIFO_MEM[1][5] ), .A1N(n127), 
        .Y(n35) );
  OAI2BB2X1M U54 ( .B0(n134), .B1(n127), .A0N(\FIFO_MEM[1][6] ), .A1N(n127), 
        .Y(n36) );
  OAI2BB2X1M U55 ( .B0(n135), .B1(n127), .A0N(\FIFO_MEM[1][7] ), .A1N(n127), 
        .Y(n37) );
  OAI2BB2X1M U56 ( .B0(n128), .B1(n126), .A0N(\FIFO_MEM[2][0] ), .A1N(n126), 
        .Y(n38) );
  OAI2BB2X1M U57 ( .B0(n129), .B1(n126), .A0N(\FIFO_MEM[2][1] ), .A1N(n126), 
        .Y(n39) );
  OAI2BB2X1M U58 ( .B0(n130), .B1(n126), .A0N(\FIFO_MEM[2][2] ), .A1N(n126), 
        .Y(n40) );
  OAI2BB2X1M U59 ( .B0(n131), .B1(n126), .A0N(\FIFO_MEM[2][3] ), .A1N(n126), 
        .Y(n41) );
  OAI2BB2X1M U60 ( .B0(n132), .B1(n126), .A0N(\FIFO_MEM[2][4] ), .A1N(n126), 
        .Y(n42) );
  OAI2BB2X1M U61 ( .B0(n133), .B1(n126), .A0N(\FIFO_MEM[2][5] ), .A1N(n126), 
        .Y(n43) );
  OAI2BB2X1M U62 ( .B0(n134), .B1(n126), .A0N(\FIFO_MEM[2][6] ), .A1N(n126), 
        .Y(n44) );
  OAI2BB2X1M U63 ( .B0(n135), .B1(n126), .A0N(\FIFO_MEM[2][7] ), .A1N(n126), 
        .Y(n45) );
  OAI2BB2X1M U64 ( .B0(n128), .B1(n125), .A0N(\FIFO_MEM[3][0] ), .A1N(n125), 
        .Y(n46) );
  OAI2BB2X1M U65 ( .B0(n129), .B1(n125), .A0N(\FIFO_MEM[3][1] ), .A1N(n125), 
        .Y(n47) );
  OAI2BB2X1M U66 ( .B0(n130), .B1(n125), .A0N(\FIFO_MEM[3][2] ), .A1N(n125), 
        .Y(n48) );
  OAI2BB2X1M U67 ( .B0(n131), .B1(n125), .A0N(\FIFO_MEM[3][3] ), .A1N(n125), 
        .Y(n49) );
  OAI2BB2X1M U68 ( .B0(n132), .B1(n125), .A0N(\FIFO_MEM[3][4] ), .A1N(n125), 
        .Y(n50) );
  OAI2BB2X1M U69 ( .B0(n133), .B1(n125), .A0N(\FIFO_MEM[3][5] ), .A1N(n125), 
        .Y(n51) );
  OAI2BB2X1M U70 ( .B0(n134), .B1(n125), .A0N(\FIFO_MEM[3][6] ), .A1N(n125), 
        .Y(n52) );
  OAI2BB2X1M U71 ( .B0(n135), .B1(n125), .A0N(\FIFO_MEM[3][7] ), .A1N(n125), 
        .Y(n53) );
  OAI2BB2X1M U72 ( .B0(n128), .B1(n124), .A0N(\FIFO_MEM[5][0] ), .A1N(n124), 
        .Y(n62) );
  OAI2BB2X1M U73 ( .B0(n129), .B1(n124), .A0N(\FIFO_MEM[5][1] ), .A1N(n124), 
        .Y(n63) );
  OAI2BB2X1M U74 ( .B0(n130), .B1(n124), .A0N(\FIFO_MEM[5][2] ), .A1N(n124), 
        .Y(n64) );
  OAI2BB2X1M U75 ( .B0(n131), .B1(n124), .A0N(\FIFO_MEM[5][3] ), .A1N(n124), 
        .Y(n65) );
  OAI2BB2X1M U76 ( .B0(n132), .B1(n124), .A0N(\FIFO_MEM[5][4] ), .A1N(n124), 
        .Y(n66) );
  OAI2BB2X1M U77 ( .B0(n133), .B1(n124), .A0N(\FIFO_MEM[5][5] ), .A1N(n124), 
        .Y(n67) );
  OAI2BB2X1M U78 ( .B0(n134), .B1(n124), .A0N(\FIFO_MEM[5][6] ), .A1N(n124), 
        .Y(n68) );
  OAI2BB2X1M U79 ( .B0(n135), .B1(n124), .A0N(\FIFO_MEM[5][7] ), .A1N(n124), 
        .Y(n69) );
  OAI2BB2X1M U80 ( .B0(n128), .B1(n123), .A0N(\FIFO_MEM[6][0] ), .A1N(n123), 
        .Y(n70) );
  OAI2BB2X1M U81 ( .B0(n129), .B1(n123), .A0N(\FIFO_MEM[6][1] ), .A1N(n123), 
        .Y(n71) );
  OAI2BB2X1M U82 ( .B0(n130), .B1(n123), .A0N(\FIFO_MEM[6][2] ), .A1N(n123), 
        .Y(n72) );
  OAI2BB2X1M U83 ( .B0(n131), .B1(n123), .A0N(\FIFO_MEM[6][3] ), .A1N(n123), 
        .Y(n73) );
  OAI2BB2X1M U84 ( .B0(n132), .B1(n123), .A0N(\FIFO_MEM[6][4] ), .A1N(n123), 
        .Y(n74) );
  OAI2BB2X1M U85 ( .B0(n133), .B1(n123), .A0N(\FIFO_MEM[6][5] ), .A1N(n123), 
        .Y(n75) );
  OAI2BB2X1M U86 ( .B0(n134), .B1(n123), .A0N(\FIFO_MEM[6][6] ), .A1N(n123), 
        .Y(n76) );
  OAI2BB2X1M U87 ( .B0(n135), .B1(n123), .A0N(\FIFO_MEM[6][7] ), .A1N(n123), 
        .Y(n77) );
  OAI2BB2X1M U88 ( .B0(n128), .B1(n122), .A0N(\FIFO_MEM[7][0] ), .A1N(n122), 
        .Y(n78) );
  OAI2BB2X1M U89 ( .B0(n129), .B1(n122), .A0N(\FIFO_MEM[7][1] ), .A1N(n122), 
        .Y(n79) );
  OAI2BB2X1M U90 ( .B0(n130), .B1(n122), .A0N(\FIFO_MEM[7][2] ), .A1N(n122), 
        .Y(n80) );
  OAI2BB2X1M U91 ( .B0(n131), .B1(n122), .A0N(\FIFO_MEM[7][3] ), .A1N(n122), 
        .Y(n81) );
  OAI2BB2X1M U92 ( .B0(n132), .B1(n122), .A0N(\FIFO_MEM[7][4] ), .A1N(n122), 
        .Y(n82) );
  OAI2BB2X1M U93 ( .B0(n133), .B1(n122), .A0N(\FIFO_MEM[7][5] ), .A1N(n122), 
        .Y(n83) );
  OAI2BB2X1M U94 ( .B0(n134), .B1(n122), .A0N(\FIFO_MEM[7][6] ), .A1N(n122), 
        .Y(n84) );
  OAI2BB2X1M U95 ( .B0(n135), .B1(n122), .A0N(\FIFO_MEM[7][7] ), .A1N(n122), 
        .Y(n85) );
  NAND3X2M U96 ( .A(w_addr[1]), .B(n136), .C(n18), .Y(n20) );
  NAND3X2M U97 ( .A(w_addr[1]), .B(w_addr[0]), .C(n18), .Y(n21) );
  AND2X2M U98 ( .A(w_addr[2]), .B(n16), .Y(n18) );
  NAND3X2M U99 ( .A(n12), .B(n137), .C(w_addr[0]), .Y(n13) );
  NAND3X2M U100 ( .A(n12), .B(n136), .C(w_addr[1]), .Y(n14) );
  INVX2M U101 ( .A(N10), .Y(n113) );
  NOR2X2M U102 ( .A(n112), .B(N10), .Y(n109) );
  INVX2M U103 ( .A(w_addr[0]), .Y(n136) );
  INVX2M U104 ( .A(w_addr[1]), .Y(n137) );
  INVX2M U105 ( .A(N11), .Y(n112) );
  INVX2M U106 ( .A(N9), .Y(n114) );
  AO22X1M U107 ( .A0(\FIFO_MEM[3][0] ), .A1(n106), .B0(\FIFO_MEM[1][0] ), .B1(
        n105), .Y(n1) );
  AOI221XLM U108 ( .A0(\FIFO_MEM[5][0] ), .A1(n109), .B0(\FIFO_MEM[7][0] ), 
        .B1(n108), .C0(n1), .Y(n4) );
  AO22X1M U109 ( .A0(\FIFO_MEM[2][0] ), .A1(n106), .B0(\FIFO_MEM[0][0] ), .B1(
        n105), .Y(n2) );
  AOI221XLM U110 ( .A0(\FIFO_MEM[4][0] ), .A1(n109), .B0(\FIFO_MEM[6][0] ), 
        .B1(n108), .C0(n2), .Y(n3) );
  OAI22X1M U111 ( .A0(n114), .A1(n4), .B0(N9), .B1(n3), .Y(r_data[0]) );
  AO22X1M U112 ( .A0(\FIFO_MEM[3][1] ), .A1(n106), .B0(\FIFO_MEM[1][1] ), .B1(
        n105), .Y(n5) );
  AOI221XLM U113 ( .A0(\FIFO_MEM[5][1] ), .A1(n109), .B0(\FIFO_MEM[7][1] ), 
        .B1(n108), .C0(n5), .Y(n8) );
  AO22X1M U114 ( .A0(\FIFO_MEM[2][1] ), .A1(n106), .B0(\FIFO_MEM[0][1] ), .B1(
        n105), .Y(n6) );
  AOI221XLM U115 ( .A0(\FIFO_MEM[4][1] ), .A1(n109), .B0(\FIFO_MEM[6][1] ), 
        .B1(n108), .C0(n6), .Y(n7) );
  OAI22X1M U116 ( .A0(n114), .A1(n8), .B0(N9), .B1(n7), .Y(r_data[1]) );
  AO22X1M U117 ( .A0(\FIFO_MEM[3][2] ), .A1(n106), .B0(\FIFO_MEM[1][2] ), .B1(
        n105), .Y(n9) );
  AOI221XLM U118 ( .A0(\FIFO_MEM[5][2] ), .A1(n109), .B0(\FIFO_MEM[7][2] ), 
        .B1(n108), .C0(n9), .Y(n87) );
  AO22X1M U119 ( .A0(\FIFO_MEM[2][2] ), .A1(n106), .B0(\FIFO_MEM[0][2] ), .B1(
        n105), .Y(n10) );
  AOI221XLM U120 ( .A0(\FIFO_MEM[4][2] ), .A1(n109), .B0(\FIFO_MEM[6][2] ), 
        .B1(n108), .C0(n10), .Y(n86) );
  OAI22X1M U121 ( .A0(n114), .A1(n87), .B0(N9), .B1(n86), .Y(r_data[2]) );
  AO22X1M U122 ( .A0(\FIFO_MEM[3][3] ), .A1(n106), .B0(\FIFO_MEM[1][3] ), .B1(
        n105), .Y(n88) );
  AOI221XLM U123 ( .A0(\FIFO_MEM[5][3] ), .A1(n109), .B0(\FIFO_MEM[7][3] ), 
        .B1(n108), .C0(n88), .Y(n91) );
  AO22X1M U124 ( .A0(\FIFO_MEM[2][3] ), .A1(n106), .B0(\FIFO_MEM[0][3] ), .B1(
        n105), .Y(n89) );
  AOI221XLM U125 ( .A0(\FIFO_MEM[4][3] ), .A1(n109), .B0(\FIFO_MEM[6][3] ), 
        .B1(n108), .C0(n89), .Y(n90) );
  OAI22X1M U126 ( .A0(n114), .A1(n91), .B0(N9), .B1(n90), .Y(r_data[3]) );
  AO22X1M U127 ( .A0(\FIFO_MEM[3][4] ), .A1(n106), .B0(\FIFO_MEM[1][4] ), .B1(
        n105), .Y(n92) );
  AOI221XLM U128 ( .A0(\FIFO_MEM[5][4] ), .A1(n109), .B0(\FIFO_MEM[7][4] ), 
        .B1(n108), .C0(n92), .Y(n95) );
  AO22X1M U129 ( .A0(\FIFO_MEM[2][4] ), .A1(n106), .B0(\FIFO_MEM[0][4] ), .B1(
        n105), .Y(n93) );
  AOI221XLM U130 ( .A0(\FIFO_MEM[4][4] ), .A1(n109), .B0(\FIFO_MEM[6][4] ), 
        .B1(n108), .C0(n93), .Y(n94) );
  OAI22X1M U131 ( .A0(n114), .A1(n95), .B0(N9), .B1(n94), .Y(r_data[4]) );
  AO22X1M U132 ( .A0(\FIFO_MEM[3][5] ), .A1(n106), .B0(\FIFO_MEM[1][5] ), .B1(
        n105), .Y(n96) );
  AOI221XLM U133 ( .A0(\FIFO_MEM[5][5] ), .A1(n109), .B0(\FIFO_MEM[7][5] ), 
        .B1(n108), .C0(n96), .Y(n99) );
  AO22X1M U134 ( .A0(\FIFO_MEM[2][5] ), .A1(n106), .B0(\FIFO_MEM[0][5] ), .B1(
        n105), .Y(n97) );
  AOI221XLM U135 ( .A0(\FIFO_MEM[4][5] ), .A1(n109), .B0(\FIFO_MEM[6][5] ), 
        .B1(n108), .C0(n97), .Y(n98) );
  OAI22X1M U136 ( .A0(n114), .A1(n99), .B0(N9), .B1(n98), .Y(r_data[5]) );
  AO22X1M U137 ( .A0(\FIFO_MEM[3][6] ), .A1(n106), .B0(\FIFO_MEM[1][6] ), .B1(
        n105), .Y(n100) );
  AOI221XLM U138 ( .A0(\FIFO_MEM[5][6] ), .A1(n109), .B0(\FIFO_MEM[7][6] ), 
        .B1(n108), .C0(n100), .Y(n103) );
  AO22X1M U139 ( .A0(\FIFO_MEM[2][6] ), .A1(n106), .B0(\FIFO_MEM[0][6] ), .B1(
        n105), .Y(n101) );
  AOI221XLM U140 ( .A0(\FIFO_MEM[4][6] ), .A1(n109), .B0(\FIFO_MEM[6][6] ), 
        .B1(n108), .C0(n101), .Y(n102) );
  OAI22X1M U141 ( .A0(n114), .A1(n103), .B0(N9), .B1(n102), .Y(r_data[6]) );
  AO22X1M U142 ( .A0(\FIFO_MEM[3][7] ), .A1(n106), .B0(\FIFO_MEM[1][7] ), .B1(
        n105), .Y(n104) );
  AOI221XLM U143 ( .A0(\FIFO_MEM[5][7] ), .A1(n109), .B0(\FIFO_MEM[7][7] ), 
        .B1(n108), .C0(n104), .Y(n111) );
  AO22X1M U144 ( .A0(\FIFO_MEM[2][7] ), .A1(n106), .B0(\FIFO_MEM[0][7] ), .B1(
        n105), .Y(n107) );
  AOI221XLM U145 ( .A0(\FIFO_MEM[4][7] ), .A1(n109), .B0(\FIFO_MEM[6][7] ), 
        .B1(n108), .C0(n107), .Y(n110) );
  OAI22X1M U146 ( .A0(n111), .A1(n114), .B0(N9), .B1(n110), .Y(r_data[7]) );
  SDFFRQX2M \FIFO_MEM_reg[1][7]  ( .D(n37), .SI(\FIFO_MEM[1][6] ), .SE(n144), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[1][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][6]  ( .D(n36), .SI(\FIFO_MEM[1][5] ), .SE(n143), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[1][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][5]  ( .D(n35), .SI(\FIFO_MEM[1][4] ), .SE(n142), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[1][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][4]  ( .D(n34), .SI(\FIFO_MEM[1][3] ), .SE(n141), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[1][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][3]  ( .D(n33), .SI(\FIFO_MEM[1][2] ), .SE(n144), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[1][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][2]  ( .D(n32), .SI(\FIFO_MEM[1][1] ), .SE(n143), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[1][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][1]  ( .D(n31), .SI(\FIFO_MEM[1][0] ), .SE(n142), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[1][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][0]  ( .D(n30), .SI(\FIFO_MEM[0][7] ), .SE(n141), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[1][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][7]  ( .D(n29), .SI(\FIFO_MEM[0][6] ), .SE(n144), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[0][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][6]  ( .D(n28), .SI(\FIFO_MEM[0][5] ), .SE(n143), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[0][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][5]  ( .D(n27), .SI(\FIFO_MEM[0][4] ), .SE(n142), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[0][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][4]  ( .D(n26), .SI(\FIFO_MEM[0][3] ), .SE(n141), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[0][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][3]  ( .D(n25), .SI(\FIFO_MEM[0][2] ), .SE(n144), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[0][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][2]  ( .D(n24), .SI(\FIFO_MEM[0][1] ), .SE(n143), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[0][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][1]  ( .D(n23), .SI(\FIFO_MEM[0][0] ), .SE(n142), 
        .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[0][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][0]  ( .D(n22), .SI(test_si), .SE(n141), .CK(w_clk), .RN(n117), .Q(\FIFO_MEM[0][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][7]  ( .D(n69), .SI(\FIFO_MEM[5][6] ), .SE(n144), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[5][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][6]  ( .D(n68), .SI(\FIFO_MEM[5][5] ), .SE(n143), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[5][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][5]  ( .D(n67), .SI(\FIFO_MEM[5][4] ), .SE(n142), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[5][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][4]  ( .D(n66), .SI(\FIFO_MEM[5][3] ), .SE(n141), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[5][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][3]  ( .D(n65), .SI(\FIFO_MEM[5][2] ), .SE(n144), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[5][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][2]  ( .D(n64), .SI(\FIFO_MEM[5][1] ), .SE(n143), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[5][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][1]  ( .D(n63), .SI(\FIFO_MEM[5][0] ), .SE(n142), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[5][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][0]  ( .D(n62), .SI(\FIFO_MEM[4][7] ), .SE(n141), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[5][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][7]  ( .D(n61), .SI(\FIFO_MEM[4][6] ), .SE(n144), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[4][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][6]  ( .D(n60), .SI(\FIFO_MEM[4][5] ), .SE(n143), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[4][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][5]  ( .D(n59), .SI(\FIFO_MEM[4][4] ), .SE(n142), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[4][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][4]  ( .D(n58), .SI(\FIFO_MEM[4][3] ), .SE(n141), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[4][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][3]  ( .D(n57), .SI(\FIFO_MEM[4][2] ), .SE(n144), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[4][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][2]  ( .D(n56), .SI(\FIFO_MEM[4][1] ), .SE(n143), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[4][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][1]  ( .D(n55), .SI(\FIFO_MEM[4][0] ), .SE(n142), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[4][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][0]  ( .D(n54), .SI(\FIFO_MEM[3][7] ), .SE(n141), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[4][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][7]  ( .D(n85), .SI(\FIFO_MEM[7][6] ), .SE(n144), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[7][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][6]  ( .D(n84), .SI(\FIFO_MEM[7][5] ), .SE(n143), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[7][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][5]  ( .D(n83), .SI(\FIFO_MEM[7][4] ), .SE(n142), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[7][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][4]  ( .D(n82), .SI(\FIFO_MEM[7][3] ), .SE(n141), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[7][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][3]  ( .D(n81), .SI(\FIFO_MEM[7][2] ), .SE(n144), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[7][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][2]  ( .D(n80), .SI(\FIFO_MEM[7][1] ), .SE(n143), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[7][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][1]  ( .D(n79), .SI(\FIFO_MEM[7][0] ), .SE(n142), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[7][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][0]  ( .D(n78), .SI(\FIFO_MEM[6][7] ), .SE(n141), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[7][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][7]  ( .D(n77), .SI(\FIFO_MEM[6][6] ), .SE(n144), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[6][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][6]  ( .D(n76), .SI(\FIFO_MEM[6][5] ), .SE(n143), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[6][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][5]  ( .D(n75), .SI(\FIFO_MEM[6][4] ), .SE(n142), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[6][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][4]  ( .D(n74), .SI(\FIFO_MEM[6][3] ), .SE(n141), 
        .CK(w_clk), .RN(n121), .Q(\FIFO_MEM[6][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][3]  ( .D(n73), .SI(\FIFO_MEM[6][2] ), .SE(n144), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[6][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][2]  ( .D(n72), .SI(\FIFO_MEM[6][1] ), .SE(n143), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[6][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][1]  ( .D(n71), .SI(\FIFO_MEM[6][0] ), .SE(n142), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[6][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][0]  ( .D(n70), .SI(\FIFO_MEM[5][7] ), .SE(n141), 
        .CK(w_clk), .RN(n120), .Q(\FIFO_MEM[6][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][7]  ( .D(n53), .SI(\FIFO_MEM[3][6] ), .SE(n144), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[3][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][6]  ( .D(n52), .SI(\FIFO_MEM[3][5] ), .SE(n143), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[3][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][5]  ( .D(n51), .SI(\FIFO_MEM[3][4] ), .SE(n142), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[3][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][4]  ( .D(n50), .SI(\FIFO_MEM[3][3] ), .SE(n141), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[3][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][3]  ( .D(n49), .SI(\FIFO_MEM[3][2] ), .SE(n144), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[3][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][2]  ( .D(n48), .SI(\FIFO_MEM[3][1] ), .SE(n143), 
        .CK(w_clk), .RN(n119), .Q(\FIFO_MEM[3][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][1]  ( .D(n47), .SI(\FIFO_MEM[3][0] ), .SE(n142), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[3][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][0]  ( .D(n46), .SI(\FIFO_MEM[2][7] ), .SE(n141), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[3][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][7]  ( .D(n45), .SI(\FIFO_MEM[2][6] ), .SE(n144), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[2][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][6]  ( .D(n44), .SI(\FIFO_MEM[2][5] ), .SE(n143), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[2][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][5]  ( .D(n43), .SI(\FIFO_MEM[2][4] ), .SE(n142), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[2][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][4]  ( .D(n42), .SI(\FIFO_MEM[2][3] ), .SE(n141), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[2][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][3]  ( .D(n41), .SI(\FIFO_MEM[2][2] ), .SE(n144), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[2][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][2]  ( .D(n40), .SI(\FIFO_MEM[2][1] ), .SE(n143), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[2][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][1]  ( .D(n39), .SI(\FIFO_MEM[2][0] ), .SE(n142), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[2][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][0]  ( .D(n38), .SI(\FIFO_MEM[1][7] ), .SE(n141), 
        .CK(w_clk), .RN(n118), .Q(\FIFO_MEM[2][0] ) );
  INVXLM U147 ( .A(test_se), .Y(n140) );
  INVXLM U148 ( .A(n140), .Y(n141) );
  INVXLM U149 ( .A(n140), .Y(n142) );
  INVXLM U150 ( .A(n140), .Y(n143) );
  INVXLM U151 ( .A(n140), .Y(n144) );
endmodule


module DF_Sync_DATA_SIZE4_test_1 ( sync_clk, sync_rstn, unsync_ip, sync_op, 
        test_si2, test_si1, test_se );
  input [3:0] unsync_ip;
  output [3:0] sync_op;
  input sync_clk, sync_rstn, test_si2, test_si1, test_se;

  wire   [3:0] meta_flop;

  SDFFRQX2M \sync_op_reg[3]  ( .D(meta_flop[3]), .SI(sync_op[2]), .SE(test_se), 
        .CK(sync_clk), .RN(sync_rstn), .Q(sync_op[3]) );
  SDFFRQX2M \sync_op_reg[2]  ( .D(meta_flop[2]), .SI(test_si2), .SE(test_se), 
        .CK(sync_clk), .RN(sync_rstn), .Q(sync_op[2]) );
  SDFFRQX2M \sync_op_reg[1]  ( .D(meta_flop[1]), .SI(sync_op[0]), .SE(test_se), 
        .CK(sync_clk), .RN(sync_rstn), .Q(sync_op[1]) );
  SDFFRQX2M \sync_op_reg[0]  ( .D(meta_flop[0]), .SI(meta_flop[3]), .SE(
        test_se), .CK(sync_clk), .RN(sync_rstn), .Q(sync_op[0]) );
  SDFFRQX2M \meta_flop_reg[3]  ( .D(unsync_ip[3]), .SI(meta_flop[2]), .SE(
        test_se), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[3]) );
  SDFFRQX2M \meta_flop_reg[2]  ( .D(unsync_ip[2]), .SI(meta_flop[1]), .SE(
        test_se), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[2]) );
  SDFFRQX2M \meta_flop_reg[1]  ( .D(unsync_ip[1]), .SI(meta_flop[0]), .SE(
        test_se), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[1]) );
  SDFFRQX2M \meta_flop_reg[0]  ( .D(unsync_ip[0]), .SI(test_si1), .SE(test_se), 
        .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[0]) );
endmodule


module FIFO_WR_test_1 ( w_clk, w_rstn, w_inc, sync_rd_ptr, w_addr, gray_w_ptr, 
        full, test_si, test_so, test_se );
  input [3:0] sync_rd_ptr;
  output [2:0] w_addr;
  output [3:0] gray_w_ptr;
  input w_clk, w_rstn, w_inc, test_si, test_se;
  output full, test_so;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [3:0] comb_gray_w_ptr;
  assign test_so = comb_gray_w_ptr[3];

  INVX2M U3 ( .A(n6), .Y(full) );
  NAND2X2M U4 ( .A(w_inc), .B(n6), .Y(n5) );
  XNOR2X2M U5 ( .A(comb_gray_w_ptr[1]), .B(sync_rd_ptr[1]), .Y(n7) );
  NAND4X2M U6 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  CLKXOR2X2M U7 ( .A(sync_rd_ptr[3]), .B(comb_gray_w_ptr[3]), .Y(n10) );
  XNOR2X2M U8 ( .A(comb_gray_w_ptr[0]), .B(sync_rd_ptr[0]), .Y(n8) );
  CLKXOR2X2M U9 ( .A(sync_rd_ptr[2]), .B(comb_gray_w_ptr[2]), .Y(n9) );
  CLKXOR2X2M U10 ( .A(comb_gray_w_ptr[3]), .B(w_addr[2]), .Y(
        comb_gray_w_ptr[2]) );
  CLKXOR2X2M U11 ( .A(w_addr[1]), .B(w_addr[2]), .Y(comb_gray_w_ptr[1]) );
  XNOR2X2M U12 ( .A(n1), .B(w_addr[1]), .Y(comb_gray_w_ptr[0]) );
  NOR2X2M U13 ( .A(n5), .B(n1), .Y(n4) );
  XNOR2X2M U14 ( .A(w_addr[2]), .B(n3), .Y(n12) );
  XNOR2X2M U15 ( .A(comb_gray_w_ptr[3]), .B(n2), .Y(n11) );
  NAND2BX2M U16 ( .AN(n3), .B(w_addr[2]), .Y(n2) );
  NAND2X2M U17 ( .A(n4), .B(w_addr[1]), .Y(n3) );
  CLKXOR2X2M U18 ( .A(w_addr[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n5), .Y(n14) );
  SDFFRQX2M \w_ptr_reg[3]  ( .D(n11), .SI(w_addr[2]), .SE(test_se), .CK(w_clk), 
        .RN(w_rstn), .Q(comb_gray_w_ptr[3]) );
  SDFFRQX2M \w_ptr_reg[2]  ( .D(n12), .SI(w_addr[1]), .SE(test_se), .CK(w_clk), 
        .RN(w_rstn), .Q(w_addr[2]) );
  SDFFRQX2M \gray_w_ptr_reg[3]  ( .D(comb_gray_w_ptr[3]), .SI(gray_w_ptr[2]), 
        .SE(test_se), .CK(w_clk), .RN(w_rstn), .Q(gray_w_ptr[3]) );
  SDFFRQX2M \gray_w_ptr_reg[2]  ( .D(comb_gray_w_ptr[2]), .SI(gray_w_ptr[1]), 
        .SE(test_se), .CK(w_clk), .RN(w_rstn), .Q(gray_w_ptr[2]) );
  SDFFRQX2M \gray_w_ptr_reg[1]  ( .D(comb_gray_w_ptr[1]), .SI(gray_w_ptr[0]), 
        .SE(test_se), .CK(w_clk), .RN(w_rstn), .Q(gray_w_ptr[1]) );
  SDFFRQX2M \gray_w_ptr_reg[0]  ( .D(comb_gray_w_ptr[0]), .SI(test_si), .SE(
        test_se), .CK(w_clk), .RN(w_rstn), .Q(gray_w_ptr[0]) );
  SDFFRX1M \w_ptr_reg[0]  ( .D(n14), .SI(gray_w_ptr[3]), .SE(test_se), .CK(
        w_clk), .RN(w_rstn), .Q(w_addr[0]), .QN(n1) );
  SDFFRQX2M \w_ptr_reg[1]  ( .D(n13), .SI(w_addr[0]), .SE(test_se), .CK(w_clk), 
        .RN(w_rstn), .Q(w_addr[1]) );
endmodule


module FIFO_RD_test_1 ( r_clk, r_rstn, r_inc, sync_wr_ptr, rd_addr, empty, 
        gray_rd_ptr, test_si, test_so, test_se );
  input [3:0] sync_wr_ptr;
  output [2:0] rd_addr;
  output [3:0] gray_rd_ptr;
  input r_clk, r_rstn, r_inc, test_si, test_se;
  output empty, test_so;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [3:0] comb_gray_rd_ptr;
  assign test_so = comb_gray_rd_ptr[3];

  INVX2M U3 ( .A(n6), .Y(empty) );
  XNOR2X2M U4 ( .A(comb_gray_rd_ptr[2]), .B(sync_wr_ptr[2]), .Y(n10) );
  XNOR2X2M U5 ( .A(n1), .B(rd_addr[1]), .Y(comb_gray_rd_ptr[0]) );
  NOR2X2M U6 ( .A(n5), .B(n1), .Y(n4) );
  XNOR2X2M U7 ( .A(comb_gray_rd_ptr[3]), .B(n2), .Y(n11) );
  NAND2BX2M U8 ( .AN(n3), .B(rd_addr[2]), .Y(n2) );
  NAND4X2M U9 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  XNOR2X2M U10 ( .A(comb_gray_rd_ptr[3]), .B(sync_wr_ptr[3]), .Y(n9) );
  XNOR2X2M U11 ( .A(comb_gray_rd_ptr[0]), .B(sync_wr_ptr[0]), .Y(n8) );
  XNOR2X2M U12 ( .A(comb_gray_rd_ptr[1]), .B(sync_wr_ptr[1]), .Y(n7) );
  NAND2X2M U13 ( .A(n4), .B(rd_addr[1]), .Y(n3) );
  NAND2X2M U14 ( .A(r_inc), .B(n6), .Y(n5) );
  CLKXOR2X2M U15 ( .A(rd_addr[1]), .B(rd_addr[2]), .Y(comb_gray_rd_ptr[1]) );
  CLKXOR2X2M U16 ( .A(comb_gray_rd_ptr[3]), .B(rd_addr[2]), .Y(
        comb_gray_rd_ptr[2]) );
  XNOR2X2M U17 ( .A(rd_addr[2]), .B(n3), .Y(n12) );
  CLKXOR2X2M U18 ( .A(rd_addr[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n5), .Y(n14) );
  SDFFRQX2M \rd_ptr_reg[3]  ( .D(n11), .SI(rd_addr[2]), .SE(test_se), .CK(
        r_clk), .RN(r_rstn), .Q(comb_gray_rd_ptr[3]) );
  SDFFRX1M \rd_ptr_reg[0]  ( .D(n14), .SI(gray_rd_ptr[3]), .SE(test_se), .CK(
        r_clk), .RN(r_rstn), .Q(rd_addr[0]), .QN(n1) );
  SDFFRQX2M \rd_ptr_reg[2]  ( .D(n12), .SI(rd_addr[1]), .SE(test_se), .CK(
        r_clk), .RN(r_rstn), .Q(rd_addr[2]) );
  SDFFRQX2M \rd_ptr_reg[1]  ( .D(n13), .SI(rd_addr[0]), .SE(test_se), .CK(
        r_clk), .RN(r_rstn), .Q(rd_addr[1]) );
  SDFFRQX2M \gray_rd_ptr_reg[3]  ( .D(comb_gray_rd_ptr[3]), .SI(gray_rd_ptr[2]), .SE(test_se), .CK(r_clk), .RN(r_rstn), .Q(gray_rd_ptr[3]) );
  SDFFRQX2M \gray_rd_ptr_reg[2]  ( .D(comb_gray_rd_ptr[2]), .SI(gray_rd_ptr[1]), .SE(test_se), .CK(r_clk), .RN(r_rstn), .Q(gray_rd_ptr[2]) );
  SDFFRQX2M \gray_rd_ptr_reg[1]  ( .D(comb_gray_rd_ptr[1]), .SI(gray_rd_ptr[0]), .SE(test_se), .CK(r_clk), .RN(r_rstn), .Q(gray_rd_ptr[1]) );
  SDFFRQX2M \gray_rd_ptr_reg[0]  ( .D(comb_gray_rd_ptr[0]), .SI(test_si), .SE(
        test_se), .CK(r_clk), .RN(r_rstn), .Q(gray_rd_ptr[0]) );
endmodule


module DF_Sync_DATA_SIZE4_test_0 ( sync_clk, sync_rstn, unsync_ip, sync_op, 
        test_si, test_se );
  input [3:0] unsync_ip;
  output [3:0] sync_op;
  input sync_clk, sync_rstn, test_si, test_se;

  wire   [3:0] meta_flop;

  SDFFRQX2M \sync_op_reg[1]  ( .D(meta_flop[1]), .SI(sync_op[0]), .SE(test_se), 
        .CK(sync_clk), .RN(sync_rstn), .Q(sync_op[1]) );
  SDFFRQX2M \sync_op_reg[0]  ( .D(meta_flop[0]), .SI(meta_flop[3]), .SE(
        test_se), .CK(sync_clk), .RN(sync_rstn), .Q(sync_op[0]) );
  SDFFRQX2M \sync_op_reg[3]  ( .D(meta_flop[3]), .SI(sync_op[2]), .SE(test_se), 
        .CK(sync_clk), .RN(sync_rstn), .Q(sync_op[3]) );
  SDFFRQX2M \sync_op_reg[2]  ( .D(meta_flop[2]), .SI(sync_op[1]), .SE(test_se), 
        .CK(sync_clk), .RN(sync_rstn), .Q(sync_op[2]) );
  SDFFRQX2M \meta_flop_reg[3]  ( .D(unsync_ip[3]), .SI(meta_flop[2]), .SE(
        test_se), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[3]) );
  SDFFRQX2M \meta_flop_reg[2]  ( .D(unsync_ip[2]), .SI(meta_flop[1]), .SE(
        test_se), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[2]) );
  SDFFRQX2M \meta_flop_reg[1]  ( .D(unsync_ip[1]), .SI(meta_flop[0]), .SE(
        test_se), .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[1]) );
  SDFFRQX2M \meta_flop_reg[0]  ( .D(unsync_ip[0]), .SI(test_si), .SE(test_se), 
        .CK(sync_clk), .RN(sync_rstn), .Q(meta_flop[0]) );
endmodule


module ASYNC_FIFO_DATA_WIDTH8_P_SIZE4_F_DEPTH8_test_1 ( W_CLK, W_RST, W_INC, 
        R_CLK, R_RST, R_INC, WR_DATA, RD_DATA, FULL, EMPTY, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC, test_si2, test_si1, test_se;
  output FULL, EMPTY, test_so2, test_so1;
  wire   n1, n2, n4, n5, n6;
  wire   [2:0] w_addr;
  wire   [2:0] r_addr;
  wire   [3:0] gray_w_ptr;
  wire   [3:0] w2r_ptr;
  wire   [3:0] r2w_ptr;
  wire   [3:0] gray_rd_ptr;
  assign test_so2 = w2r_ptr[3];
  assign test_so1 = w2r_ptr[1];

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(W_RST), .Y(n2) );
  FIFO_MEM_CNTRL_A_SIZE3_D_SIZE8_F_DEPTH8_P_SIZE4_test_1 u_FIFO_MEM_CNTRL ( 
        .w_clk(W_CLK), .w_rstn(n1), .w_full(FULL), .w_inc(W_INC), .w_addr(
        w_addr), .r_addr(r_addr), .w_data(WR_DATA), .r_data(RD_DATA), 
        .test_si(test_si1), .test_so(n6), .test_se(test_se) );
  DF_Sync_DATA_SIZE4_test_1 u_w2r_sync ( .sync_clk(R_CLK), .sync_rstn(R_RST), 
        .unsync_ip(gray_w_ptr), .sync_op(w2r_ptr), .test_si2(test_si2), 
        .test_si1(r2w_ptr[3]), .test_se(test_se) );
  FIFO_WR_test_1 u_FIFO_WR ( .w_clk(W_CLK), .w_rstn(n1), .w_inc(W_INC), 
        .sync_rd_ptr(r2w_ptr), .w_addr(w_addr), .gray_w_ptr(gray_w_ptr), 
        .full(FULL), .test_si(n5), .test_so(n4), .test_se(test_se) );
  FIFO_RD_test_1 u_FIFO_RD ( .r_clk(R_CLK), .r_rstn(R_RST), .r_inc(R_INC), 
        .sync_wr_ptr(w2r_ptr), .rd_addr(r_addr), .empty(EMPTY), .gray_rd_ptr(
        gray_rd_ptr), .test_si(n6), .test_so(n5), .test_se(test_se) );
  DF_Sync_DATA_SIZE4_test_0 u_r2w_sync ( .sync_clk(W_CLK), .sync_rstn(n1), 
        .unsync_ip(gray_rd_ptr), .sync_op(r2w_ptr), .test_si(n4), .test_se(
        test_se) );
endmodule


module PULSE_GEN_test_1 ( clk, rst, lvl_sig, pulse_sig, test_si, test_so, 
        test_se );
  input clk, rst, lvl_sig, test_si, test_se;
  output pulse_sig, test_so;
  wire   pls_flop, rcv_flop;
  assign test_so = rcv_flop;

  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
  SDFFRQX2M rcv_flop_reg ( .D(lvl_sig), .SI(pls_flop), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(rcv_flop) );
  SDFFRQX2M pls_flop_reg ( .D(rcv_flop), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(pls_flop) );
endmodule


module Clock_Divider_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Clock_Divider_test_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, 
        o_div_clk, test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  OR2X2M U3 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  NAND2BX2M U4 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  INVX2M U5 ( .A(i_div_ratio[5]), .Y(n6) );
  MX2X2M U6 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n25) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n24) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n23) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n22) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n21) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n20) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n19) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n18) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n17) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
  SDFFRQX2M div_clk_reg ( .D(n18), .SI(count[6]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(div_clk) );
  SDFFSQX2M odd_edge_tog_reg ( .D(n17), .SI(div_clk), .SE(test_se), .CK(
        i_ref_clk), .SN(i_rst_n), .Q(odd_edge_tog) );
  SDFFRQX2M \count_reg[6]  ( .D(n19), .SI(count[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[6]) );
  SDFFRQX2M \count_reg[0]  ( .D(n25), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[0]) );
  SDFFRQX2M \count_reg[5]  ( .D(n20), .SI(count[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[5]) );
  SDFFRQX2M \count_reg[4]  ( .D(n21), .SI(count[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n22), .SI(count[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[3]) );
  SDFFRQX2M \count_reg[2]  ( .D(n23), .SI(count[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n24), .SI(count[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[1]) );
  Clock_Divider_0_DW01_inc_0 add_47 ( .A(count), .SUM({N22, N21, N20, N19, N18, 
        N17, N16}) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  NAND4BX1M U11 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U12 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR3X2M U13 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR3X2M U14 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR4X1M U15 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U16 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  INVX2M U17 ( .A(IN[0]), .Y(n17) );
  INVX2M U18 ( .A(IN[1]), .Y(n16) );
  INVX2M U19 ( .A(IN[2]), .Y(n15) );
  INVX2M U20 ( .A(IN[5]), .Y(n14) );
  OAI211X2M U21 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NOR4X1M U22 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  NAND2X2M U23 ( .A(n7), .B(n6), .Y(n9) );
  INVX2M U3 ( .A(1'b1), .Y(OUT[7]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[4]) );
endmodule


module Clock_Divider_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Clock_Divider_test_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, 
        o_div_clk, test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  OR2X2M U3 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  NAND2BX2M U4 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  MX2X2M U5 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n43) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n44) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n45) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n46) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n47) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n48) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n49) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n50) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n51) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
  SDFFRQX2M div_clk_reg ( .D(n50), .SI(count[6]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(div_clk) );
  SDFFSQX2M odd_edge_tog_reg ( .D(n51), .SI(div_clk), .SE(test_se), .CK(
        i_ref_clk), .SN(i_rst_n), .Q(odd_edge_tog) );
  SDFFRQX2M \count_reg[6]  ( .D(n49), .SI(count[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[6]) );
  SDFFRQX2M \count_reg[0]  ( .D(n43), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[0]) );
  SDFFRQX2M \count_reg[5]  ( .D(n48), .SI(count[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[5]) );
  SDFFRQX2M \count_reg[4]  ( .D(n47), .SI(count[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n46), .SI(count[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[3]) );
  SDFFRQX2M \count_reg[2]  ( .D(n45), .SI(count[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n44), .SI(count[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(count[1]) );
  Clock_Divider_1_DW01_inc_0 add_47 ( .A(count), .SUM({N22, N21, N20, N19, N18, 
        N17, N16}) );
endmodule


module FSM_TX_test_1 ( CLK, RST, Data_Valid, ser_done, parity_enable, 
        Ser_enable, mux_sel, busy, test_si, test_so, test_se );
  output [1:0] mux_sel;
  input CLK, RST, Data_Valid, ser_done, parity_enable, test_si, test_se;
  output Ser_enable, busy, test_so;
  wire   busy_c, n4, n5, n6, n7, n8, n9, n1, n2, n3;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = current_state[2];

  INVX2M U3 ( .A(n9), .Y(n1) );
  NOR3X2M U4 ( .A(n5), .B(ser_done), .C(current_state[2]), .Y(Ser_enable) );
  OAI21X2M U5 ( .A0(current_state[1]), .A1(n2), .B0(n8), .Y(n9) );
  NAND2X2M U6 ( .A(current_state[1]), .B(n2), .Y(n8) );
  NAND2X2M U7 ( .A(n1), .B(current_state[0]), .Y(n5) );
  INVX2M U8 ( .A(current_state[0]), .Y(n2) );
  OAI2B2X1M U9 ( .A1N(current_state[2]), .A0(n8), .B0(current_state[2]), .B1(
        n9), .Y(mux_sel[0]) );
  OAI21X2M U10 ( .A0(current_state[2]), .A1(current_state[0]), .B0(n8), .Y(
        mux_sel[1]) );
  NOR3X2M U11 ( .A(n3), .B(current_state[2]), .C(n4), .Y(next_state[2]) );
  AOI2B1X1M U12 ( .A1N(parity_enable), .A0(ser_done), .B0(n2), .Y(n4) );
  OAI21X2M U13 ( .A0(current_state[2]), .A1(n2), .B0(n8), .Y(busy_c) );
  AOI21X2M U14 ( .A0(n1), .A1(n5), .B0(current_state[2]), .Y(next_state[1]) );
  AOI21X2M U15 ( .A0(n6), .A1(n7), .B0(current_state[2]), .Y(next_state[0]) );
  NAND2BX2M U16 ( .AN(ser_done), .B(current_state[0]), .Y(n6) );
  OAI21X2M U17 ( .A0(Data_Valid), .A1(current_state[0]), .B0(n3), .Y(n7) );
  INVX2M U18 ( .A(current_state[1]), .Y(n3) );
  SDFFRQX2M busy_reg ( .D(busy_c), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(busy) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(busy), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
endmodule


module Serializer_WIDTH8_test_1 ( CLK, RST, DATA, Enable, Busy, Data_Valid, 
        ser_out, ser_done, test_si, test_so, test_se );
  input [7:0] DATA;
  input CLK, RST, Enable, Busy, Data_Valid, test_si, test_se;
  output ser_out, ser_done, test_so;
  wire   N23, N24, N25, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n1, n2, n3, n25, n28,
         n29;
  wire   [7:1] DATA_V;
  wire   [2:0] ser_count;
  assign test_so = ser_count[2];

  NOR2X2M U3 ( .A(n2), .B(n1), .Y(n6) );
  NOR2X2M U4 ( .A(n1), .B(n6), .Y(n4) );
  INVX2M U5 ( .A(Enable), .Y(n2) );
  OAI32X1M U6 ( .A0(n14), .A1(n3), .A2(n2), .B0(n15), .B1(n25), .Y(N25) );
  NAND2X2M U7 ( .A(ser_count[0]), .B(n25), .Y(n14) );
  AOI21X2M U8 ( .A0(Enable), .A1(n3), .B0(N23), .Y(n15) );
  INVX2M U9 ( .A(ser_count[2]), .Y(n25) );
  BUFX2M U10 ( .A(n7), .Y(n1) );
  NOR2BX2M U11 ( .AN(Data_Valid), .B(Busy), .Y(n7) );
  OAI2BB1X2M U12 ( .A0N(ser_out), .A1N(n4), .B0(n5), .Y(n17) );
  AOI22X1M U13 ( .A0(DATA_V[1]), .A1(n6), .B0(DATA[0]), .B1(n1), .Y(n5) );
  OAI2BB1X2M U14 ( .A0N(DATA_V[1]), .A1N(n4), .B0(n13), .Y(n24) );
  AOI22X1M U15 ( .A0(DATA_V[2]), .A1(n6), .B0(DATA[1]), .B1(n1), .Y(n13) );
  OAI2BB1X2M U16 ( .A0N(n4), .A1N(DATA_V[2]), .B0(n12), .Y(n23) );
  AOI22X1M U17 ( .A0(DATA_V[3]), .A1(n6), .B0(DATA[2]), .B1(n1), .Y(n12) );
  OAI2BB1X2M U18 ( .A0N(n4), .A1N(DATA_V[3]), .B0(n11), .Y(n22) );
  AOI22X1M U19 ( .A0(DATA_V[4]), .A1(n6), .B0(DATA[3]), .B1(n1), .Y(n11) );
  OAI2BB1X2M U20 ( .A0N(n4), .A1N(DATA_V[4]), .B0(n10), .Y(n21) );
  AOI22X1M U21 ( .A0(DATA_V[5]), .A1(n6), .B0(DATA[4]), .B1(n1), .Y(n10) );
  OAI2BB1X2M U22 ( .A0N(n4), .A1N(DATA_V[5]), .B0(n9), .Y(n20) );
  AOI22X1M U23 ( .A0(DATA_V[6]), .A1(n6), .B0(DATA[5]), .B1(n1), .Y(n9) );
  OAI2BB1X2M U24 ( .A0N(n4), .A1N(DATA_V[6]), .B0(n8), .Y(n19) );
  AOI22X1M U25 ( .A0(DATA_V[7]), .A1(n6), .B0(DATA[6]), .B1(n1), .Y(n8) );
  AO22X1M U26 ( .A0(n4), .A1(DATA_V[7]), .B0(DATA[7]), .B1(n1), .Y(n18) );
  AND3X2M U27 ( .A(ser_count[0]), .B(ser_count[2]), .C(ser_count[1]), .Y(
        ser_done) );
  NOR2X2M U28 ( .A(n2), .B(ser_count[0]), .Y(N23) );
  NOR2X2M U29 ( .A(n16), .B(n2), .Y(N24) );
  CLKXOR2X2M U30 ( .A(ser_count[0]), .B(n3), .Y(n16) );
  INVX2M U31 ( .A(ser_count[1]), .Y(n3) );
  SDFFRQX2M \DATA_V_reg[6]  ( .D(n19), .SI(DATA_V[5]), .SE(n29), .CK(CLK), 
        .RN(RST), .Q(DATA_V[6]) );
  SDFFRQX2M \DATA_V_reg[5]  ( .D(n20), .SI(DATA_V[4]), .SE(n29), .CK(CLK), 
        .RN(RST), .Q(DATA_V[5]) );
  SDFFRQX2M \DATA_V_reg[4]  ( .D(n21), .SI(DATA_V[3]), .SE(n29), .CK(CLK), 
        .RN(RST), .Q(DATA_V[4]) );
  SDFFRQX2M \DATA_V_reg[3]  ( .D(n22), .SI(DATA_V[2]), .SE(n29), .CK(CLK), 
        .RN(RST), .Q(DATA_V[3]) );
  SDFFRQX2M \DATA_V_reg[2]  ( .D(n23), .SI(DATA_V[1]), .SE(n29), .CK(CLK), 
        .RN(RST), .Q(DATA_V[2]) );
  SDFFRQX2M \DATA_V_reg[1]  ( .D(n24), .SI(ser_out), .SE(n29), .CK(CLK), .RN(
        RST), .Q(DATA_V[1]) );
  SDFFRQX2M \DATA_V_reg[7]  ( .D(n18), .SI(DATA_V[6]), .SE(n29), .CK(CLK), 
        .RN(RST), .Q(DATA_V[7]) );
  SDFFRQX2M \DATA_V_reg[0]  ( .D(n17), .SI(test_si), .SE(n29), .CK(CLK), .RN(
        RST), .Q(ser_out) );
  SDFFRQX2M \ser_count_reg[2]  ( .D(N25), .SI(ser_count[1]), .SE(n29), .CK(CLK), .RN(RST), .Q(ser_count[2]) );
  SDFFRQX2M \ser_count_reg[1]  ( .D(N24), .SI(ser_count[0]), .SE(n29), .CK(CLK), .RN(RST), .Q(ser_count[1]) );
  SDFFRQX2M \ser_count_reg[0]  ( .D(N23), .SI(DATA_V[7]), .SE(n29), .CK(CLK), 
        .RN(RST), .Q(ser_count[0]) );
  INVXLM U32 ( .A(test_se), .Y(n28) );
  INVXLM U33 ( .A(n28), .Y(n29) );
endmodule


module MUX_test_1 ( CLK, RST, IN_0, IN_1, IN_2, IN_3, SEL, OUT, test_si, 
        test_se );
  input [1:0] SEL;
  input CLK, RST, IN_0, IN_1, IN_2, IN_3, test_si, test_se;
  output OUT;
  wire   mux_out, n2, n3, n1;

  INVX2M U3 ( .A(SEL[0]), .Y(n1) );
  OAI2B2X1M U4 ( .A1N(SEL[1]), .A0(n2), .B0(SEL[1]), .B1(n3), .Y(mux_out) );
  AOI22X1M U5 ( .A0(IN_0), .A1(n1), .B0(SEL[0]), .B1(IN_1), .Y(n3) );
  AOI22X1M U6 ( .A0(IN_2), .A1(n1), .B0(IN_3), .B1(SEL[0]), .Y(n2) );
  SDFFRHQX8M OUT_reg ( .D(mux_out), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(OUT) );
endmodule


module Parity_Calc_WIDTH8_test_1 ( CLK, RST, parity_enable, parity_type, Busy, 
        DATA, Data_Valid, parity, test_si, test_se );
  input [7:0] DATA;
  input CLK, RST, parity_enable, parity_type, Busy, Data_Valid, test_si,
         test_se;
  output parity;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2,
         n19, n20;
  wire   [7:0] DATA_V;

  NOR2BX2M U2 ( .AN(Data_Valid), .B(Busy), .Y(n7) );
  AO2B2X2M U3 ( .B0(DATA[0]), .B1(n7), .A0(DATA_V[0]), .A1N(n7), .Y(n9) );
  AO2B2X2M U4 ( .B0(DATA[1]), .B1(n7), .A0(DATA_V[1]), .A1N(n7), .Y(n10) );
  AO2B2X2M U5 ( .B0(DATA[2]), .B1(n7), .A0(DATA_V[2]), .A1N(n7), .Y(n11) );
  AO2B2X2M U6 ( .B0(DATA[3]), .B1(n7), .A0(DATA_V[3]), .A1N(n7), .Y(n12) );
  AO2B2X2M U7 ( .B0(DATA[4]), .B1(n7), .A0(DATA_V[4]), .A1N(n7), .Y(n13) );
  AO2B2X2M U8 ( .B0(DATA[5]), .B1(n7), .A0(DATA_V[5]), .A1N(n7), .Y(n14) );
  AO2B2X2M U9 ( .B0(DATA[6]), .B1(n7), .A0(DATA_V[6]), .A1N(n7), .Y(n15) );
  AO2B2X2M U10 ( .B0(DATA[7]), .B1(n7), .A0(DATA_V[7]), .A1N(n7), .Y(n16) );
  XNOR2X2M U11 ( .A(DATA_V[2]), .B(DATA_V[3]), .Y(n5) );
  XOR3XLM U12 ( .A(DATA_V[5]), .B(DATA_V[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U13 ( .A(DATA_V[7]), .B(DATA_V[6]), .Y(n6) );
  OAI2BB2X1M U14 ( .B0(n1), .B1(n2), .A0N(parity), .A1N(n2), .Y(n8) );
  INVX2M U15 ( .A(parity_enable), .Y(n2) );
  XOR3XLM U16 ( .A(n3), .B(parity_type), .C(n4), .Y(n1) );
  XOR3XLM U17 ( .A(DATA_V[1]), .B(DATA_V[0]), .C(n5), .Y(n4) );
  SDFFRQX2M parity_reg ( .D(n8), .SI(DATA_V[7]), .SE(n20), .CK(CLK), .RN(RST), 
        .Q(parity) );
  SDFFRQX2M \DATA_V_reg[5]  ( .D(n14), .SI(DATA_V[4]), .SE(n20), .CK(CLK), 
        .RN(RST), .Q(DATA_V[5]) );
  SDFFRQX2M \DATA_V_reg[1]  ( .D(n10), .SI(DATA_V[0]), .SE(n20), .CK(CLK), 
        .RN(RST), .Q(DATA_V[1]) );
  SDFFRQX2M \DATA_V_reg[4]  ( .D(n13), .SI(DATA_V[3]), .SE(n20), .CK(CLK), 
        .RN(RST), .Q(DATA_V[4]) );
  SDFFRQX2M \DATA_V_reg[0]  ( .D(n9), .SI(test_si), .SE(n20), .CK(CLK), .RN(
        RST), .Q(DATA_V[0]) );
  SDFFRQX2M \DATA_V_reg[2]  ( .D(n11), .SI(DATA_V[1]), .SE(n20), .CK(CLK), 
        .RN(RST), .Q(DATA_V[2]) );
  SDFFRQX2M \DATA_V_reg[3]  ( .D(n12), .SI(DATA_V[2]), .SE(n20), .CK(CLK), 
        .RN(RST), .Q(DATA_V[3]) );
  SDFFRQX2M \DATA_V_reg[6]  ( .D(n15), .SI(DATA_V[5]), .SE(n20), .CK(CLK), 
        .RN(RST), .Q(DATA_V[6]) );
  SDFFRQX2M \DATA_V_reg[7]  ( .D(n16), .SI(DATA_V[6]), .SE(n20), .CK(CLK), 
        .RN(RST), .Q(DATA_V[7]) );
  INVXLM U18 ( .A(test_se), .Y(n19) );
  INVXLM U19 ( .A(n19), .Y(n20) );
endmodule


module UART_TX_DATA_WIDTH8_test_1 ( p_data, data_vaild, par_en, par_typ, clk, 
        rst, tx_out, busy, test_si2, test_si1, test_so1, test_se );
  input [7:0] p_data;
  input data_vaild, par_en, par_typ, clk, rst, test_si2, test_si1, test_se;
  output tx_out, busy, test_so1;
  wire   seriz_done, seriz_en, ser_data, parity, n1, n2, n5;
  wire   [1:0] mux_sel;

  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rst), .Y(n2) );
  FSM_TX_test_1 U0_FSM_TX ( .CLK(clk), .RST(n1), .Data_Valid(data_vaild), 
        .ser_done(seriz_done), .parity_enable(par_en), .Ser_enable(seriz_en), 
        .mux_sel(mux_sel), .busy(busy), .test_si(test_si1), .test_so(n5), 
        .test_se(test_se) );
  Serializer_WIDTH8_test_1 U0_Serializer ( .CLK(clk), .RST(n1), .DATA(p_data), 
        .Enable(seriz_en), .Busy(busy), .Data_Valid(data_vaild), .ser_out(
        ser_data), .ser_done(seriz_done), .test_si(parity), .test_so(test_so1), 
        .test_se(test_se) );
  MUX_test_1 U0_MUX ( .CLK(clk), .RST(n1), .IN_0(1'b0), .IN_1(ser_data), 
        .IN_2(parity), .IN_3(1'b1), .SEL(mux_sel), .OUT(tx_out), .test_si(
        test_si2), .test_se(test_se) );
  Parity_Calc_WIDTH8_test_1 U0_Parity_Calc ( .CLK(clk), .RST(n1), 
        .parity_enable(par_en), .parity_type(par_typ), .Busy(busy), .DATA(
        p_data), .Data_Valid(data_vaild), .parity(parity), .test_si(n5), 
        .test_se(test_se) );
endmodule


module FSM_RX_DATA_WIDTH8_test_1 ( CLK, RST, S_DATA, Prescale, parity_enable, 
        bit_count, edge_count, par_err, stp_err, strt_glitch, strt_chk_en, 
        edge_bit_en, deser_en, par_chk_en, stp_chk_en, dat_samp_en, data_valid, 
        test_se );
  input [5:0] Prescale;
  input [3:0] bit_count;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, parity_enable, par_err, stp_err, strt_glitch,
         test_se;
  output strt_chk_en, edge_bit_en, deser_en, par_chk_en, stp_chk_en,
         dat_samp_en, data_valid;
  wire   N85, \sub_40/carry[5] , \sub_40/carry[4] , \sub_40/carry[3] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47;
  wire   [5:0] check_edge;
  wire   [5:0] error_check_edge;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign error_check_edge[0] = Prescale[0];

  NOR3XLM U3 ( .A(n18), .B(stp_err), .C(par_err), .Y(N85) );
  OR2X2M U4 ( .A(Prescale[1]), .B(error_check_edge[0]), .Y(n1) );
  INVX2M U5 ( .A(Prescale[3]), .Y(n5) );
  XNOR2X2M U6 ( .A(Prescale[1]), .B(edge_count[1]), .Y(n34) );
  XNOR2X1M U7 ( .A(Prescale[5]), .B(\sub_40/carry[5] ), .Y(error_check_edge[5]) );
  OR2X1M U8 ( .A(Prescale[4]), .B(\sub_40/carry[4] ), .Y(\sub_40/carry[5] ) );
  XNOR2X1M U9 ( .A(\sub_40/carry[4] ), .B(Prescale[4]), .Y(error_check_edge[4]) );
  OR2X1M U10 ( .A(Prescale[3]), .B(\sub_40/carry[3] ), .Y(\sub_40/carry[4] )
         );
  XNOR2X1M U11 ( .A(\sub_40/carry[3] ), .B(Prescale[3]), .Y(
        error_check_edge[3]) );
  OR2X1M U12 ( .A(Prescale[2]), .B(Prescale[1]), .Y(\sub_40/carry[3] ) );
  XNOR2X1M U13 ( .A(Prescale[1]), .B(Prescale[2]), .Y(error_check_edge[2]) );
  CLKINVX1M U14 ( .A(error_check_edge[0]), .Y(check_edge[0]) );
  OAI2BB1X1M U15 ( .A0N(error_check_edge[0]), .A1N(Prescale[1]), .B0(n1), .Y(
        check_edge[1]) );
  NOR2X1M U16 ( .A(n1), .B(Prescale[2]), .Y(n2) );
  AO21XLM U17 ( .A0(n1), .A1(Prescale[2]), .B0(n2), .Y(check_edge[2]) );
  CLKNAND2X2M U18 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1M U19 ( .A0(n2), .A1(n5), .B0(n3), .Y(check_edge[3]) );
  XNOR2X1M U20 ( .A(Prescale[4]), .B(n3), .Y(check_edge[4]) );
  NOR2X1M U21 ( .A(Prescale[4]), .B(n3), .Y(n4) );
  CLKXOR2X2M U22 ( .A(Prescale[5]), .B(n4), .Y(check_edge[5]) );
  NOR2X1M U23 ( .A(current_state[1]), .B(n6), .Y(strt_chk_en) );
  NOR2X1M U24 ( .A(current_state[2]), .B(n7), .Y(par_chk_en) );
  OAI31X1M U25 ( .A0(n8), .A1(parity_enable), .A2(n9), .B0(n10), .Y(
        next_state[2]) );
  AOI31X1M U26 ( .A0(n11), .A1(n12), .A2(n13), .B0(stp_chk_en), .Y(n10) );
  NOR2X1M U27 ( .A(n14), .B(n15), .Y(n13) );
  CLKINVX1M U28 ( .A(bit_count[3]), .Y(n15) );
  CLKINVX1M U29 ( .A(n7), .Y(n12) );
  OAI21X1M U30 ( .A0(current_state[2]), .A1(n16), .B0(n7), .Y(next_state[1])
         );
  AOI31X1M U31 ( .A0(current_state[0]), .A1(n11), .A2(n17), .B0(
        current_state[1]), .Y(n16) );
  NOR3X1M U32 ( .A(bit_count[0]), .B(strt_glitch), .C(bit_count[3]), .Y(n17)
         );
  OAI221X1M U33 ( .A0(S_DATA), .A1(n18), .B0(n19), .B1(n8), .C0(n20), .Y(
        next_state[0]) );
  AOI31X1M U34 ( .A0(n21), .A1(n22), .A2(n23), .B0(n24), .Y(n20) );
  NOR4X1M U35 ( .A(n25), .B(n26), .C(n27), .D(n28), .Y(n24) );
  CLKXOR2X2M U36 ( .A(error_check_edge[5]), .B(edge_count[5]), .Y(n28) );
  CLKXOR2X2M U37 ( .A(error_check_edge[4]), .B(edge_count[4]), .Y(n27) );
  NAND3BX1M U38 ( .AN(bit_count[2]), .B(bit_count[3]), .C(stp_chk_en), .Y(n26)
         );
  NOR2X1M U39 ( .A(n22), .B(n7), .Y(stp_chk_en) );
  NAND4X1M U40 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n25) );
  XNOR2X1M U41 ( .A(edge_count[2]), .B(error_check_edge[2]), .Y(n32) );
  NOR2X1M U42 ( .A(n33), .B(n34), .Y(n31) );
  CLKXOR2X2M U43 ( .A(error_check_edge[0]), .B(edge_count[0]), .Y(n33) );
  XNOR2X1M U44 ( .A(edge_count[3]), .B(error_check_edge[3]), .Y(n30) );
  MXI2X1M U45 ( .A(n35), .B(n36), .S0(parity_enable), .Y(n29) );
  CLKNAND2X2M U46 ( .A(bit_count[1]), .B(n14), .Y(n36) );
  OR2X1M U47 ( .A(bit_count[1]), .B(n14), .Y(n35) );
  MXI2X1M U48 ( .A(S_DATA), .B(n37), .S0(current_state[0]), .Y(n23) );
  NOR4BX1M U49 ( .AN(strt_glitch), .B(bit_count[3]), .C(bit_count[0]), .D(n38), 
        .Y(n37) );
  CLKINVX1M U50 ( .A(n9), .Y(n19) );
  NAND3X1M U51 ( .A(n11), .B(n14), .C(bit_count[3]), .Y(n9) );
  CLKINVX1M U52 ( .A(bit_count[0]), .Y(n14) );
  CLKINVX1M U53 ( .A(n38), .Y(n11) );
  CLKNAND2X2M U54 ( .A(n39), .B(n40), .Y(n38) );
  NOR4X1M U55 ( .A(bit_count[2]), .B(bit_count[1]), .C(n41), .D(n42), .Y(n40)
         );
  CLKXOR2X2M U56 ( .A(edge_count[0]), .B(check_edge[0]), .Y(n42) );
  CLKXOR2X2M U57 ( .A(edge_count[4]), .B(check_edge[4]), .Y(n41) );
  NOR4X1M U58 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n39) );
  CLKXOR2X2M U59 ( .A(edge_count[3]), .B(check_edge[3]), .Y(n46) );
  CLKXOR2X2M U60 ( .A(edge_count[2]), .B(check_edge[2]), .Y(n45) );
  CLKXOR2X2M U61 ( .A(edge_count[5]), .B(check_edge[5]), .Y(n44) );
  CLKXOR2X2M U62 ( .A(edge_count[1]), .B(check_edge[1]), .Y(n43) );
  CLKNAND2X2M U63 ( .A(n6), .B(n7), .Y(edge_bit_en) );
  CLKNAND2X2M U64 ( .A(current_state[1]), .B(n47), .Y(n7) );
  CLKINVX1M U65 ( .A(n8), .Y(deser_en) );
  NAND3X1M U66 ( .A(current_state[1]), .B(n22), .C(current_state[0]), .Y(n8)
         );
  CLKINVX1M U67 ( .A(current_state[2]), .Y(n22) );
  CLKNAND2X2M U68 ( .A(n21), .B(n6), .Y(dat_samp_en) );
  AO21XLM U69 ( .A0(n47), .A1(S_DATA), .B0(current_state[2]), .Y(n6) );
  CLKINVX1M U70 ( .A(current_state[0]), .Y(n47) );
  CLKINVX1M U71 ( .A(current_state[1]), .Y(n21) );
  NAND3X1M U72 ( .A(current_state[2]), .B(current_state[1]), .C(
        current_state[0]), .Y(n18) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(edge_count[5]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(current_state[0]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M data_valid_reg ( .D(N85), .SI(current_state[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(data_valid) );
endmodule


module Edge_Bit_Counter_test_1 ( CLK, RST, Enable, Prescale, bit_count, 
        edge_count, test_si, test_se );
  input [5:0] Prescale;
  output [3:0] bit_count;
  output [5:0] edge_count;
  input CLK, RST, Enable, test_si, test_se;
  wire   N8, N9, N10, N11, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28,
         N29, N30, N31, n4, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, \add_31/carry[5] , \add_31/carry[4] , \add_31/carry[3] ,
         \add_31/carry[2] , n1, n2, n3, n5, n6, n7, n8, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n36, n37;

  INVX2M U3 ( .A(n13), .Y(n29) );
  INVX2M U4 ( .A(Enable), .Y(n33) );
  NOR2X2M U5 ( .A(n33), .B(N31), .Y(n13) );
  AOI21X2M U6 ( .A0(n30), .A1(Enable), .B0(n13), .Y(n16) );
  NOR2BX2M U7 ( .AN(N8), .B(n29), .Y(N20) );
  NOR2BX2M U8 ( .AN(N9), .B(n29), .Y(N21) );
  NOR2BX2M U9 ( .AN(N10), .B(n29), .Y(N22) );
  NOR2BX2M U10 ( .AN(N11), .B(n29), .Y(N23) );
  OAI32X1M U11 ( .A0(n33), .A1(bit_count[0]), .A2(n13), .B0(n30), .B1(n29), 
        .Y(n20) );
  OAI32X1M U12 ( .A0(n14), .A1(bit_count[2]), .A2(n31), .B0(n15), .B1(n32), 
        .Y(n18) );
  AOI21BX2M U13 ( .A0(Enable), .A1(n31), .B0N(n16), .Y(n15) );
  OAI32X1M U14 ( .A0(n9), .A1(n10), .A2(n33), .B0(n11), .B1(n4), .Y(n17) );
  NOR2X2M U15 ( .A(n12), .B(n13), .Y(n11) );
  NAND3X2M U16 ( .A(N31), .B(n4), .C(bit_count[2]), .Y(n9) );
  AOI2BB1X2M U17 ( .A0N(n10), .A1N(n32), .B0(n33), .Y(n12) );
  NAND3X2M U18 ( .A(bit_count[0]), .B(n29), .C(Enable), .Y(n14) );
  OAI22X1M U19 ( .A0(n16), .A1(n31), .B0(bit_count[1]), .B1(n14), .Y(n19) );
  OR2X2M U20 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  NOR2X2M U21 ( .A(n1), .B(n29), .Y(N24) );
  XNOR2X2M U22 ( .A(\add_31/carry[5] ), .B(edge_count[5]), .Y(n1) );
  NOR2X2M U23 ( .A(edge_count[0]), .B(n29), .Y(N19) );
  INVX2M U24 ( .A(Prescale[3]), .Y(n7) );
  NAND2X2M U25 ( .A(bit_count[1]), .B(bit_count[0]), .Y(n10) );
  INVX2M U26 ( .A(bit_count[0]), .Y(n30) );
  INVX2M U27 ( .A(bit_count[1]), .Y(n31) );
  ADDHX1M U28 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_31/carry[2] ), 
        .S(N8) );
  ADDHX1M U29 ( .A(edge_count[3]), .B(\add_31/carry[3] ), .CO(
        \add_31/carry[4] ), .S(N10) );
  ADDHX1M U30 ( .A(edge_count[2]), .B(\add_31/carry[2] ), .CO(
        \add_31/carry[3] ), .S(N9) );
  INVX2M U31 ( .A(bit_count[2]), .Y(n32) );
  ADDHX1M U32 ( .A(edge_count[4]), .B(\add_31/carry[4] ), .CO(
        \add_31/carry[5] ), .S(N11) );
  CLKINVX1M U33 ( .A(Prescale[0]), .Y(N25) );
  OAI2BB1X1M U34 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N26) );
  NOR2X1M U35 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  AO21XLM U36 ( .A0(n2), .A1(Prescale[2]), .B0(n3), .Y(N27) );
  CLKNAND2X2M U37 ( .A(n3), .B(n7), .Y(n5) );
  OAI21X1M U38 ( .A0(n3), .A1(n7), .B0(n5), .Y(N28) );
  XNOR2X1M U39 ( .A(Prescale[4]), .B(n5), .Y(N29) );
  NOR2X1M U40 ( .A(Prescale[4]), .B(n5), .Y(n6) );
  CLKXOR2X2M U41 ( .A(Prescale[5]), .B(n6), .Y(N30) );
  NOR2BX1M U42 ( .AN(edge_count[0]), .B(N25), .Y(n8) );
  OAI2B2X1M U43 ( .A1N(N26), .A0(n8), .B0(edge_count[1]), .B1(n8), .Y(n24) );
  NOR2BX1M U44 ( .AN(N25), .B(edge_count[0]), .Y(n21) );
  OAI2B2X1M U45 ( .A1N(edge_count[1]), .A0(n21), .B0(N26), .B1(n21), .Y(n23)
         );
  XNOR2X1M U46 ( .A(N30), .B(edge_count[5]), .Y(n22) );
  NAND3X1M U47 ( .A(n24), .B(n23), .C(n22), .Y(n28) );
  CLKXOR2X2M U48 ( .A(N29), .B(edge_count[4]), .Y(n27) );
  CLKXOR2X2M U49 ( .A(N27), .B(edge_count[2]), .Y(n26) );
  CLKXOR2X2M U50 ( .A(N28), .B(edge_count[3]), .Y(n25) );
  NOR4X1M U51 ( .A(n28), .B(n27), .C(n26), .D(n25), .Y(N31) );
  SDFFRX1M \bit_count_reg[3]  ( .D(n17), .SI(bit_count[2]), .SE(n37), .CK(CLK), 
        .RN(RST), .Q(bit_count[3]), .QN(n4) );
  SDFFRQX2M \bit_count_reg[2]  ( .D(n18), .SI(bit_count[1]), .SE(n37), .CK(CLK), .RN(RST), .Q(bit_count[2]) );
  SDFFRQX2M \bit_count_reg[1]  ( .D(n19), .SI(bit_count[0]), .SE(n37), .CK(CLK), .RN(RST), .Q(bit_count[1]) );
  SDFFRQX2M \bit_count_reg[0]  ( .D(n20), .SI(test_si), .SE(n37), .CK(CLK), 
        .RN(RST), .Q(bit_count[0]) );
  SDFFRQX2M \edge_count_reg[5]  ( .D(N24), .SI(edge_count[4]), .SE(n37), .CK(
        CLK), .RN(RST), .Q(edge_count[5]) );
  SDFFRQX2M \edge_count_reg[2]  ( .D(N21), .SI(edge_count[1]), .SE(n37), .CK(
        CLK), .RN(RST), .Q(edge_count[2]) );
  SDFFRQX2M \edge_count_reg[4]  ( .D(N23), .SI(edge_count[3]), .SE(n37), .CK(
        CLK), .RN(RST), .Q(edge_count[4]) );
  SDFFRQX2M \edge_count_reg[1]  ( .D(N20), .SI(edge_count[0]), .SE(n37), .CK(
        CLK), .RN(RST), .Q(edge_count[1]) );
  SDFFRQX2M \edge_count_reg[0]  ( .D(N19), .SI(n4), .SE(n37), .CK(CLK), .RN(
        RST), .Q(edge_count[0]) );
  SDFFRQX2M \edge_count_reg[3]  ( .D(N22), .SI(edge_count[2]), .SE(n37), .CK(
        CLK), .RN(RST), .Q(edge_count[3]) );
  INVXLM U52 ( .A(test_se), .Y(n36) );
  INVXLM U53 ( .A(n36), .Y(n37) );
endmodule


module Data_sampling_test_1 ( CLK, RST, S_DATA, Prescale, edge_count, Enable, 
        sampled_bit, test_si, test_se );
  input [5:0] Prescale;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, Enable, test_si, test_se;
  output sampled_bit;
  wire   N58, n21, n22, n23, \add_21/carry[5] , \add_21/carry[4] ,
         \add_21/carry[3] , \add_21/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44;
  wire   [5:0] half_edges;
  wire   [5:0] half_edges_p1;
  wire   [5:0] half_edges_n1;
  wire   [2:0] Samples;

  INVX2M U3 ( .A(half_edges[3]), .Y(n8) );
  OR2X2M U4 ( .A(half_edges[1]), .B(half_edges[0]), .Y(n4) );
  ADDHX1M U5 ( .A(half_edges[3]), .B(\add_21/carry[3] ), .CO(\add_21/carry[4] ), .S(half_edges_p1[3]) );
  ADDHX1M U6 ( .A(half_edges[2]), .B(\add_21/carry[2] ), .CO(\add_21/carry[3] ), .S(half_edges_p1[2]) );
  ADDHX1M U7 ( .A(half_edges[4]), .B(\add_21/carry[4] ), .CO(\add_21/carry[5] ), .S(half_edges_p1[4]) );
  ADDHX1M U8 ( .A(half_edges[1]), .B(half_edges[0]), .CO(\add_21/carry[2] ), 
        .S(half_edges_p1[1]) );
  OR2X2M U9 ( .A(Prescale[2]), .B(Prescale[1]), .Y(n1) );
  CLKINVX1M U10 ( .A(Prescale[1]), .Y(half_edges[0]) );
  OAI2BB1X1M U11 ( .A0N(Prescale[1]), .A1N(Prescale[2]), .B0(n1), .Y(
        half_edges[1]) );
  OR2X1M U12 ( .A(n1), .B(Prescale[3]), .Y(n2) );
  OAI2BB1X1M U13 ( .A0N(n1), .A1N(Prescale[3]), .B0(n2), .Y(half_edges[2]) );
  XNOR2X1M U14 ( .A(Prescale[4]), .B(n2), .Y(half_edges[3]) );
  NOR3X1M U15 ( .A(Prescale[4]), .B(Prescale[5]), .C(n2), .Y(half_edges[5]) );
  OAI21X1M U16 ( .A0(Prescale[4]), .A1(n2), .B0(Prescale[5]), .Y(n3) );
  NAND2BX1M U17 ( .AN(half_edges[5]), .B(n3), .Y(half_edges[4]) );
  CLKXOR2X2M U18 ( .A(\add_21/carry[5] ), .B(half_edges[5]), .Y(
        half_edges_p1[5]) );
  OAI2BB1X1M U19 ( .A0N(half_edges[0]), .A1N(half_edges[1]), .B0(n4), .Y(
        half_edges_n1[1]) );
  NOR2X1M U20 ( .A(n4), .B(half_edges[2]), .Y(n5) );
  AO21XLM U21 ( .A0(n4), .A1(half_edges[2]), .B0(n5), .Y(half_edges_n1[2]) );
  CLKNAND2X2M U22 ( .A(n5), .B(n8), .Y(n6) );
  OAI21X1M U23 ( .A0(n5), .A1(n8), .B0(n6), .Y(half_edges_n1[3]) );
  XNOR2X1M U24 ( .A(half_edges[4]), .B(n6), .Y(half_edges_n1[4]) );
  NOR2X1M U25 ( .A(half_edges[4]), .B(n6), .Y(n7) );
  CLKXOR2X2M U26 ( .A(half_edges[5]), .B(n7), .Y(half_edges_n1[5]) );
  MXI2X1M U27 ( .A(n9), .B(n10), .S0(n11), .Y(n23) );
  NOR2X1M U28 ( .A(n12), .B(n13), .Y(n11) );
  NAND4X1M U29 ( .A(n14), .B(n15), .C(n16), .D(n17), .Y(n13) );
  CLKXOR2X2M U30 ( .A(n18), .B(half_edges_p1[2]), .Y(n17) );
  XNOR2X1M U31 ( .A(edge_count[3]), .B(half_edges_p1[3]), .Y(n16) );
  CLKXOR2X2M U32 ( .A(n19), .B(half_edges_p1[4]), .Y(n15) );
  XNOR2X1M U33 ( .A(edge_count[5]), .B(half_edges_p1[5]), .Y(n14) );
  NAND4X1M U34 ( .A(n20), .B(n24), .C(n25), .D(n26), .Y(n12) );
  XNOR2X1M U35 ( .A(edge_count[0]), .B(Prescale[1]), .Y(n24) );
  XNOR2X1M U36 ( .A(edge_count[1]), .B(half_edges_p1[1]), .Y(n20) );
  CLKNAND2X2M U37 ( .A(Samples[2]), .B(Enable), .Y(n9) );
  MXI2X1M U38 ( .A(n10), .B(n27), .S0(n25), .Y(n22) );
  NAND4X1M U39 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n25) );
  NOR4BX1M U40 ( .AN(n26), .B(n32), .C(n33), .D(n34), .Y(n31) );
  CLKXOR2X2M U41 ( .A(half_edges[2]), .B(edge_count[2]), .Y(n34) );
  CLKXOR2X2M U42 ( .A(half_edges[1]), .B(edge_count[1]), .Y(n33) );
  CLKXOR2X2M U43 ( .A(half_edges[0]), .B(edge_count[0]), .Y(n32) );
  CLKXOR2X2M U44 ( .A(n19), .B(half_edges[4]), .Y(n30) );
  CLKINVX1M U45 ( .A(edge_count[4]), .Y(n19) );
  XNOR2X1M U46 ( .A(edge_count[5]), .B(half_edges[5]), .Y(n29) );
  XNOR2X1M U47 ( .A(edge_count[3]), .B(half_edges[3]), .Y(n28) );
  CLKNAND2X2M U48 ( .A(Samples[1]), .B(Enable), .Y(n27) );
  MXI2X1M U49 ( .A(n10), .B(n35), .S0(n26), .Y(n21) );
  NAND4X1M U50 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n26) );
  NOR3X1M U51 ( .A(n40), .B(n41), .C(n42), .Y(n39) );
  CLKXOR2X2M U52 ( .A(half_edges_n1[4]), .B(edge_count[4]), .Y(n42) );
  CLKXOR2X2M U53 ( .A(half_edges_n1[1]), .B(edge_count[1]), .Y(n41) );
  CLKXOR2X2M U54 ( .A(Prescale[1]), .B(edge_count[0]), .Y(n40) );
  CLKXOR2X2M U55 ( .A(n18), .B(half_edges_n1[2]), .Y(n38) );
  CLKINVX1M U56 ( .A(edge_count[2]), .Y(n18) );
  XNOR2X1M U57 ( .A(edge_count[3]), .B(half_edges_n1[3]), .Y(n37) );
  XNOR2X1M U58 ( .A(edge_count[5]), .B(half_edges_n1[5]), .Y(n36) );
  CLKNAND2X2M U59 ( .A(Samples[0]), .B(Enable), .Y(n35) );
  CLKNAND2X2M U60 ( .A(S_DATA), .B(Enable), .Y(n10) );
  AOI21BX1M U61 ( .A0(n43), .A1(n44), .B0N(Enable), .Y(N58) );
  OAI21X1M U62 ( .A0(Samples[0]), .A1(Samples[1]), .B0(Samples[2]), .Y(n44) );
  CLKNAND2X2M U63 ( .A(Samples[0]), .B(Samples[1]), .Y(n43) );
  SDFFRQX2M \Samples_reg[2]  ( .D(n23), .SI(Samples[1]), .SE(test_se), .CK(CLK), .RN(RST), .Q(Samples[2]) );
  SDFFRQX2M \Samples_reg[1]  ( .D(n22), .SI(Samples[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(Samples[1]) );
  SDFFRQX2M \Samples_reg[0]  ( .D(n21), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Samples[0]) );
  SDFFRQX2M sampled_bit_reg ( .D(N58), .SI(Samples[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sampled_bit) );
endmodule


module Deserializer_DATA_WIDTH8_test_1 ( CLK, RST, sampled_bit, Enable, 
        edge_count, Prescale, P_DATA, test_se );
  input [5:0] edge_count;
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, sampled_bit, Enable, test_se;
  wire   N1, N2, N3, N4, N5, N6, N7, n1, n10, n11, n12, n13, n14, n15, n16,
         n17, n2, n3, n4, n5, n6, n7, n8, n9, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31;

  OAI22X1M U3 ( .A0(n31), .A1(n30), .B0(n1), .B1(n29), .Y(n11) );
  OAI22X1M U4 ( .A0(n31), .A1(n29), .B0(n1), .B1(n28), .Y(n12) );
  OAI22X1M U5 ( .A0(n31), .A1(n28), .B0(n1), .B1(n27), .Y(n13) );
  OAI22X1M U6 ( .A0(n31), .A1(n27), .B0(n1), .B1(n26), .Y(n14) );
  OAI22X1M U7 ( .A0(n31), .A1(n26), .B0(n1), .B1(n25), .Y(n15) );
  OAI22X1M U8 ( .A0(n31), .A1(n25), .B0(n1), .B1(n24), .Y(n16) );
  INVX2M U9 ( .A(n1), .Y(n31) );
  NAND2X2M U10 ( .A(N7), .B(Enable), .Y(n1) );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n30), .A0N(P_DATA[0]), .A1N(n1), .Y(n10) );
  OAI2BB2X1M U12 ( .B0(n31), .B1(n24), .A0N(sampled_bit), .A1N(n31), .Y(n17)
         );
  OR2X2M U13 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  INVX2M U14 ( .A(Prescale[3]), .Y(n6) );
  INVX2M U15 ( .A(P_DATA[2]), .Y(n29) );
  INVX2M U16 ( .A(P_DATA[6]), .Y(n25) );
  INVX2M U17 ( .A(P_DATA[7]), .Y(n24) );
  INVX2M U18 ( .A(P_DATA[3]), .Y(n28) );
  INVX2M U19 ( .A(P_DATA[1]), .Y(n30) );
  INVX2M U20 ( .A(P_DATA[4]), .Y(n27) );
  INVX2M U21 ( .A(P_DATA[5]), .Y(n26) );
  CLKINVX1M U22 ( .A(Prescale[0]), .Y(N1) );
  OAI2BB1X1M U23 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N2) );
  NOR2X1M U24 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  AO21XLM U25 ( .A0(n2), .A1(Prescale[2]), .B0(n3), .Y(N3) );
  CLKNAND2X2M U26 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U27 ( .A0(n3), .A1(n6), .B0(n4), .Y(N4) );
  XNOR2X1M U28 ( .A(Prescale[4]), .B(n4), .Y(N5) );
  NOR2X1M U29 ( .A(Prescale[4]), .B(n4), .Y(n5) );
  CLKXOR2X2M U30 ( .A(Prescale[5]), .B(n5), .Y(N6) );
  NOR2BX1M U31 ( .AN(edge_count[0]), .B(N1), .Y(n7) );
  OAI2B2X1M U32 ( .A1N(N2), .A0(n7), .B0(edge_count[1]), .B1(n7), .Y(n19) );
  NOR2BX1M U33 ( .AN(N1), .B(edge_count[0]), .Y(n8) );
  OAI2B2X1M U34 ( .A1N(edge_count[1]), .A0(n8), .B0(N2), .B1(n8), .Y(n18) );
  XNOR2X1M U35 ( .A(N6), .B(edge_count[5]), .Y(n9) );
  NAND3X1M U36 ( .A(n19), .B(n18), .C(n9), .Y(n23) );
  CLKXOR2X2M U37 ( .A(N5), .B(edge_count[4]), .Y(n22) );
  CLKXOR2X2M U38 ( .A(N3), .B(edge_count[2]), .Y(n21) );
  CLKXOR2X2M U39 ( .A(N4), .B(edge_count[3]), .Y(n20) );
  NOR4X1M U40 ( .A(n23), .B(n22), .C(n21), .D(n20), .Y(N7) );
  SDFFRQX2M \P_DATA_reg[0]  ( .D(n10), .SI(sampled_bit), .SE(test_se), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  SDFFRQX2M \P_DATA_reg[5]  ( .D(n15), .SI(P_DATA[4]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[5]) );
  SDFFRQX2M \P_DATA_reg[1]  ( .D(n11), .SI(P_DATA[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[1]) );
  SDFFRQX2M \P_DATA_reg[4]  ( .D(n14), .SI(P_DATA[3]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[4]) );
  SDFFRQX2M \P_DATA_reg[7]  ( .D(n17), .SI(P_DATA[6]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[7]) );
  SDFFRQX2M \P_DATA_reg[3]  ( .D(n13), .SI(P_DATA[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[3]) );
  SDFFRQX2M \P_DATA_reg[6]  ( .D(n16), .SI(P_DATA[5]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[6]) );
  SDFFRQX2M \P_DATA_reg[2]  ( .D(n12), .SI(P_DATA[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[2]) );
endmodule


module Start_Check_test_1 ( CLK, RST, sampled_bit, Enable, strt_glitch, 
        test_si, test_se );
  input CLK, RST, sampled_bit, Enable, test_si, test_se;
  output strt_glitch;
  wire   n1;

  AO2B2X2M U2 ( .B0(sampled_bit), .B1(Enable), .A0(strt_glitch), .A1N(Enable), 
        .Y(n1) );
  SDFFRQX2M strt_glitch_reg ( .D(n1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(strt_glitch) );
endmodule


module Parity_Check_DATA_WIDTH8_test_1 ( CLK, RST, parity_type, sampled_bit, 
        Enable, P_DATA, par_err, test_si, test_se );
  input [7:0] P_DATA;
  input CLK, RST, parity_type, sampled_bit, Enable, test_si, test_se;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n8, n2, n11, n12;

  XNOR2X2M U2 ( .A(sampled_bit), .B(parity_type), .Y(n5) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U5 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U6 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
  OAI2BB2X1M U7 ( .B0(n1), .B1(n2), .A0N(n12), .A1N(n2), .Y(n8) );
  INVX2M U8 ( .A(Enable), .Y(n2) );
  XOR3XLM U9 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  INVXLM U10 ( .A(par_err), .Y(n11) );
  INVXLM U11 ( .A(n11), .Y(n12) );
  SDFFRQX1M par_err_reg ( .D(n8), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(par_err) );
endmodule


module Stop_Check_test_1 ( CLK, RST, sampled_bit, Enable, stp_err, test_si, 
        test_se );
  input CLK, RST, sampled_bit, Enable, test_si, test_se;
  output stp_err;
  wire   n2, n1, n5, n6;

  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(n6), .A1N(n1), .Y(n2) );
  INVX2M U3 ( .A(Enable), .Y(n1) );
  INVXLM U4 ( .A(stp_err), .Y(n5) );
  INVXLM U5 ( .A(n5), .Y(n6) );
  SDFFRQX2M stp_err_reg ( .D(n2), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(stp_err) );
endmodule


module UART_RX_DATA_WIDTH8_test_1 ( clk, rst, rx_in, par_en, par_typ, prescale, 
        p_data, data_vaild, parity_error, framing_error, test_si, test_se );
  input [5:0] prescale;
  output [7:0] p_data;
  input clk, rst, rx_in, par_en, par_typ, test_si, test_se;
  output data_vaild, parity_error, framing_error;
  wire   n12, n13, strt_glitch, strt_chk_en, edge_bit_en, deser_en, par_chk_en,
         stp_chk_en, dat_samp_en, sampled_bit, n1, n2, n5, n6, n8, n10, n11;
  wire   [3:0] bit_count;
  wire   [5:0] edge_count;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(rst), .Y(n2) );
  DLY1X1M U3 ( .A(n12), .Y(n5) );
  DLY1X1M U4 ( .A(n12), .Y(n6) );
  DLY1X1M U6 ( .A(n13), .Y(n8) );
  INVXLM U8 ( .A(n8), .Y(n10) );
  INVXLM U9 ( .A(n10), .Y(n11) );
  FSM_RX_DATA_WIDTH8_test_1 U0_FSM_RX ( .CLK(clk), .RST(n1), .S_DATA(rx_in), 
        .Prescale(prescale), .parity_enable(par_en), .bit_count(bit_count), 
        .edge_count(edge_count), .par_err(n6), .stp_err(n11), .strt_glitch(
        strt_glitch), .strt_chk_en(strt_chk_en), .edge_bit_en(edge_bit_en), 
        .deser_en(deser_en), .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), 
        .dat_samp_en(dat_samp_en), .data_valid(data_vaild), .test_se(test_se)
         );
  Edge_Bit_Counter_test_1 U0_Edge_Bit_Counter ( .CLK(clk), .RST(n1), .Enable(
        edge_bit_en), .Prescale(prescale), .bit_count(bit_count), .edge_count(
        edge_count), .test_si(p_data[7]), .test_se(test_se) );
  Data_sampling_test_1 U0_Data_sampling ( .CLK(clk), .RST(n1), .S_DATA(rx_in), 
        .Prescale(prescale), .edge_count(edge_count), .Enable(dat_samp_en), 
        .sampled_bit(sampled_bit), .test_si(test_si), .test_se(test_se) );
  Deserializer_DATA_WIDTH8_test_1 U0_Deserializer ( .CLK(clk), .RST(n1), 
        .sampled_bit(sampled_bit), .Enable(deser_en), .edge_count(edge_count), 
        .Prescale(prescale), .P_DATA(p_data), .test_se(test_se) );
  Start_Check_test_1 U0_Start_Check ( .CLK(clk), .RST(n1), .sampled_bit(
        sampled_bit), .Enable(strt_chk_en), .strt_glitch(strt_glitch), 
        .test_si(n5), .test_se(test_se) );
  Parity_Check_DATA_WIDTH8_test_1 U0_Parity_Check ( .CLK(clk), .RST(n1), 
        .parity_type(par_typ), .sampled_bit(sampled_bit), .Enable(par_chk_en), 
        .P_DATA(p_data), .par_err(n12), .test_si(data_vaild), .test_se(test_se) );
  Stop_Check_test_1 U0_Stop_Check ( .CLK(clk), .RST(n1), .sampled_bit(
        sampled_bit), .Enable(stp_chk_en), .stp_err(n13), .test_si(strt_glitch), .test_se(test_se) );
  BUFX6M U5 ( .A(n13), .Y(framing_error) );
  CLKBUFX8M U7 ( .A(n12), .Y(parity_error) );
endmodule


module UART_test_1 ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error, test_si2, test_si1, test_so1, test_se );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type,
         test_si2, test_si1, test_se;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error, test_so1;
  wire   n9, n1, n2, n7;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  DLY1X1M U3 ( .A(n9), .Y(n7) );
  UART_TX_DATA_WIDTH8_test_1 U0_UART_TX ( .p_data(TX_IN_P), .data_vaild(
        TX_IN_V), .par_en(parity_enable), .par_typ(parity_type), .clk(TX_CLK), 
        .rst(n1), .tx_out(TX_OUT_S), .busy(TX_OUT_V), .test_si2(test_si2), 
        .test_si1(n7), .test_so1(test_so1), .test_se(test_se) );
  UART_RX_DATA_WIDTH8_test_1 U0_UART_RX ( .clk(RX_CLK), .rst(n1), .rx_in(
        RX_IN_S), .par_en(parity_enable), .par_typ(parity_type), .prescale(
        Prescale), .p_data(RX_OUT_P), .data_vaild(RX_OUT_V), .parity_error(
        parity_error), .framing_error(n9), .test_si(test_si1), .test_se(
        test_se) );
  CLKBUFX8M U4 ( .A(n9), .Y(framing_error) );
endmodule


module SYS_CTRL_test_1 ( CLK, RST, RF_RdData, RF_RdData_VLD, ALU_OUT, 
        ALU_OUT_VLD, FIFO_FULL, UART_RX_DATA, UART_RX_VLD, RF_WrEn, RF_RdEn, 
        RF_Address, RF_WrData, ALU_EN, ALU_FUN, CLKG_EN, CLKDIV_EN, 
        UART_TX_DATA, UART_TX_VLD, test_si, test_so, test_se );
  input [7:0] RF_RdData;
  input [15:0] ALU_OUT;
  input [7:0] UART_RX_DATA;
  output [3:0] RF_Address;
  output [7:0] RF_WrData;
  output [3:0] ALU_FUN;
  output [7:0] UART_TX_DATA;
  input CLK, RST, RF_RdData_VLD, ALU_OUT_VLD, FIFO_FULL, UART_RX_VLD, test_si,
         test_se;
  output RF_WrEn, RF_RdEn, ALU_EN, CLKG_EN, CLKDIV_EN, UART_TX_VLD, test_so;
  wire   \tx_frame_count[0] , n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n45, n46, n47, n48,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n17, n18, n19, n41,
         n42, n43, n44, n49, n50, n51, n52, n53, n54, n55, n56, n123, n167,
         n168, n169, n170, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196;
  wire   [3:0] state;
  wire   [1:0] frame_count;
  wire   [1:0] tx_frames;
  assign test_so = tx_frames[1];

  OAI32X1M U5 ( .A0(n71), .A1(n170), .A2(n70), .B0(n126), .B1(n48), .Y(
        RF_Address[0]) );
  NOR2X2M U6 ( .A(n133), .B(n22), .Y(ALU_FUN[2]) );
  NOR2X2M U7 ( .A(n133), .B(n24), .Y(ALU_FUN[0]) );
  NOR2X2M U8 ( .A(n126), .B(n46), .Y(RF_Address[2]) );
  INVX2M U9 ( .A(n133), .Y(CLKG_EN) );
  NOR2X2M U10 ( .A(ALU_EN), .B(n17), .Y(n133) );
  INVX2M U11 ( .A(n65), .Y(n12) );
  INVX2M U12 ( .A(n111), .Y(ALU_EN) );
  INVX2M U13 ( .A(n75), .Y(RF_RdEn) );
  INVX2M U14 ( .A(n125), .Y(n44) );
  INVX2M U15 ( .A(n63), .Y(n17) );
  NOR3X2M U16 ( .A(n98), .B(n44), .C(n93), .Y(n66) );
  NOR2BX2M U17 ( .AN(n3), .B(n74), .Y(n79) );
  INVX2M U18 ( .A(n57), .Y(n11) );
  OR2X2M U19 ( .A(n61), .B(FIFO_FULL), .Y(n121) );
  NOR2X2M U20 ( .A(n91), .B(CLKG_EN), .Y(n65) );
  INVX2M U21 ( .A(RF_WrEn), .Y(n41) );
  AND2X2M U22 ( .A(n4), .B(n17), .Y(n77) );
  INVX2M U23 ( .A(n96), .Y(n6) );
  NAND2X2M U24 ( .A(n74), .B(n75), .Y(n60) );
  INVX2M U25 ( .A(n90), .Y(n49) );
  INVX2M U26 ( .A(n119), .Y(n18) );
  INVX2M U27 ( .A(n70), .Y(n42) );
  INVX2M U28 ( .A(n69), .Y(n14) );
  NAND3X2M U29 ( .A(n63), .B(n61), .C(n74), .Y(n99) );
  AOI211X2M U30 ( .A0(n118), .A1(n8), .B0(n119), .C0(FIFO_FULL), .Y(
        UART_TX_VLD) );
  NAND2X2M U31 ( .A(n127), .B(n117), .Y(n75) );
  NAND2X2M U32 ( .A(n128), .B(n127), .Y(n70) );
  NAND2X2M U33 ( .A(n117), .B(n132), .Y(n111) );
  NAND2X2M U34 ( .A(n132), .B(n129), .Y(n63) );
  NAND2X2M U35 ( .A(n116), .B(n128), .Y(n125) );
  NOR4BX1M U36 ( .AN(n58), .B(n59), .C(n12), .D(n170), .Y(n57) );
  NOR3X2M U37 ( .A(n60), .B(n44), .C(n49), .Y(n58) );
  NOR3BX2M U38 ( .AN(n116), .B(n53), .C(n50), .Y(n93) );
  NAND3BX2M U39 ( .AN(FIFO_FULL), .B(n124), .C(n18), .Y(n120) );
  OAI21X2M U40 ( .A0(n10), .A1(n8), .B0(n118), .Y(n124) );
  NOR3X2M U41 ( .A(n169), .B(n56), .C(n107), .Y(n97) );
  AOI21X2M U42 ( .A0(n72), .A1(n125), .B0(n170), .Y(RF_WrEn) );
  OAI32X1M U43 ( .A0(n69), .A1(n70), .A2(n71), .B0(n14), .B1(n52), .Y(n144) );
  NOR2X2M U44 ( .A(n56), .B(n41), .Y(RF_WrData[0]) );
  NOR2X2M U45 ( .A(n123), .B(n41), .Y(RF_WrData[1]) );
  NOR2X2M U46 ( .A(n167), .B(n41), .Y(RF_WrData[2]) );
  NOR2X2M U47 ( .A(n168), .B(n41), .Y(RF_WrData[3]) );
  NOR2X2M U48 ( .A(n169), .B(n41), .Y(RF_WrData[4]) );
  OAI221X1M U49 ( .A0(n63), .A1(n62), .B0(n5), .B1(n9), .C0(n61), .Y(n139) );
  INVX2M U50 ( .A(n62), .Y(n5) );
  NAND3BX2M U51 ( .AN(n60), .B(n73), .C(n66), .Y(n69) );
  AOI211X2M U52 ( .A0(n170), .A1(n59), .B0(CLKG_EN), .C0(n18), .Y(n73) );
  AOI21X2M U53 ( .A0(n54), .A1(n53), .B0(n19), .Y(n91) );
  NAND4X2M U54 ( .A(n115), .B(n87), .C(n89), .D(n111), .Y(n62) );
  OAI22X1M U55 ( .A0(n95), .A1(n96), .B0(n6), .B1(n53), .Y(n163) );
  NOR4X1M U56 ( .A(n97), .B(n98), .C(n94), .D(n99), .Y(n95) );
  NAND2X2M U57 ( .A(n127), .B(n129), .Y(n74) );
  NAND3X2M U58 ( .A(n113), .B(n114), .C(n115), .Y(n96) );
  OAI31X1M U59 ( .A0(n43), .A1(n49), .A2(n59), .B0(n170), .Y(n113) );
  INVX2M U60 ( .A(n66), .Y(n43) );
  OAI211X2M U61 ( .A0(n6), .A1(n54), .B0(n92), .C0(n75), .Y(n162) );
  OAI21X2M U62 ( .A0(n93), .A1(n94), .B0(n6), .Y(n92) );
  NAND3X2M U63 ( .A(n122), .B(n18), .C(n10), .Y(n61) );
  NAND2X2M U64 ( .A(n128), .B(n132), .Y(n119) );
  AND4X2M U65 ( .A(n114), .B(n66), .C(n75), .D(n70), .Y(n87) );
  INVX2M U66 ( .A(n64), .Y(n13) );
  NAND2X2M U67 ( .A(n116), .B(n117), .Y(n90) );
  AND2X2M U68 ( .A(n116), .B(n129), .Y(n98) );
  NAND2X2M U69 ( .A(n42), .B(n52), .Y(n72) );
  BUFX2M U70 ( .A(n76), .Y(n3) );
  NAND2X2M U71 ( .A(n89), .B(n70), .Y(n59) );
  BUFX2M U72 ( .A(n76), .Y(n4) );
  INVX2M U73 ( .A(n122), .Y(n8) );
  INVX2M U74 ( .A(n104), .Y(n55) );
  AOI21X2M U75 ( .A0(UART_RX_VLD), .A1(n44), .B0(RF_RdEn), .Y(n126) );
  NOR2X2M U76 ( .A(n54), .B(state[3]), .Y(n127) );
  NOR2X2M U77 ( .A(n126), .B(n47), .Y(RF_Address[1]) );
  NOR2X2M U78 ( .A(n19), .B(state[2]), .Y(n132) );
  NOR2X2M U79 ( .A(state[0]), .B(state[1]), .Y(n117) );
  NOR2X2M U80 ( .A(n53), .B(state[0]), .Y(n128) );
  NOR2X2M U81 ( .A(n133), .B(n23), .Y(ALU_FUN[1]) );
  NOR2X2M U82 ( .A(state[2]), .B(state[3]), .Y(n116) );
  NOR2X2M U83 ( .A(n50), .B(state[1]), .Y(n129) );
  INVX2M U84 ( .A(state[1]), .Y(n53) );
  NOR2X2M U85 ( .A(n133), .B(n21), .Y(ALU_FUN[3]) );
  INVX2M U86 ( .A(state[0]), .Y(n50) );
  INVX2M U87 ( .A(frame_count[1]), .Y(n52) );
  INVX2M U88 ( .A(state[2]), .Y(n54) );
  INVX2M U89 ( .A(state[3]), .Y(n19) );
  INVX2M U90 ( .A(UART_RX_VLD), .Y(n170) );
  NAND2X2M U91 ( .A(frame_count[0]), .B(n52), .Y(n71) );
  OAI32X1M U92 ( .A0(n72), .A1(frame_count[0]), .A2(n69), .B0(n14), .B1(n51), 
        .Y(n145) );
  NAND4X2M U93 ( .A(UART_RX_VLD), .B(n65), .C(n66), .D(n67), .Y(n64) );
  AOI211X2M U94 ( .A0(n42), .A1(n68), .B0(n60), .C0(n49), .Y(n67) );
  NAND2X2M U95 ( .A(frame_count[1]), .B(n51), .Y(n68) );
  NOR2X2M U96 ( .A(n126), .B(n45), .Y(RF_Address[3]) );
  NOR2BX2M U97 ( .AN(UART_RX_DATA[7]), .B(n41), .Y(RF_WrData[7]) );
  OAI22X1M U98 ( .A0(n6), .A1(n50), .B0(n105), .B1(n96), .Y(n164) );
  NOR4X1M U99 ( .A(n106), .B(RF_RdEn), .C(n97), .D(ALU_EN), .Y(n105) );
  OAI32X1M U100 ( .A0(n107), .A1(UART_RX_DATA[4]), .A2(UART_RX_DATA[0]), .B0(
        n101), .B1(n104), .Y(n106) );
  OAI22X1M U101 ( .A0(n11), .A1(n56), .B0(n57), .B1(n48), .Y(n134) );
  OAI22X1M U102 ( .A0(n11), .A1(n123), .B0(n57), .B1(n47), .Y(n135) );
  OAI22X1M U103 ( .A0(n11), .A1(n167), .B0(n57), .B1(n46), .Y(n136) );
  OAI22X1M U104 ( .A0(n11), .A1(n168), .B0(n57), .B1(n45), .Y(n137) );
  OAI22X1M U105 ( .A0(n168), .A1(n64), .B0(n13), .B1(n21), .Y(n143) );
  OAI22X1M U106 ( .A0(n167), .A1(n64), .B0(n13), .B1(n22), .Y(n142) );
  OAI22X1M U107 ( .A0(n123), .A1(n64), .B0(n13), .B1(n23), .Y(n141) );
  OAI22X1M U108 ( .A0(n56), .A1(n64), .B0(n13), .B1(n24), .Y(n140) );
  NAND3BX2M U109 ( .AN(n101), .B(UART_RX_DATA[5]), .C(n109), .Y(n107) );
  NOR3X2M U110 ( .A(n123), .B(UART_RX_DATA[6]), .C(UART_RX_DATA[2]), .Y(n109)
         );
  NOR2X2M U111 ( .A(n9), .B(tx_frames[0]), .Y(n122) );
  OAI211X2M U112 ( .A0(n6), .A1(n19), .B0(n110), .C0(n111), .Y(n165) );
  OAI21X2M U113 ( .A0(n99), .A1(n112), .B0(n6), .Y(n110) );
  OAI31X1M U114 ( .A0(n70), .A1(frame_count[0]), .A2(n52), .B0(n89), .Y(n112)
         );
  OAI22X1M U115 ( .A0(n40), .A1(n120), .B0(n32), .B1(n121), .Y(UART_TX_DATA[0]) );
  OAI22X1M U116 ( .A0(n39), .A1(n120), .B0(n31), .B1(n121), .Y(UART_TX_DATA[1]) );
  OAI22X1M U117 ( .A0(n38), .A1(n120), .B0(n30), .B1(n121), .Y(UART_TX_DATA[2]) );
  OAI22X1M U118 ( .A0(n37), .A1(n120), .B0(n29), .B1(n121), .Y(UART_TX_DATA[3]) );
  OAI22X1M U119 ( .A0(n36), .A1(n120), .B0(n28), .B1(n121), .Y(UART_TX_DATA[4]) );
  OAI22X1M U120 ( .A0(n35), .A1(n120), .B0(n27), .B1(n121), .Y(UART_TX_DATA[5]) );
  OAI22X1M U121 ( .A0(n34), .A1(n120), .B0(n26), .B1(n121), .Y(UART_TX_DATA[6]) );
  OAI22X1M U122 ( .A0(n33), .A1(n120), .B0(n25), .B1(n121), .Y(UART_TX_DATA[7]) );
  NAND3X2M U123 ( .A(state[1]), .B(state[0]), .C(n127), .Y(n89) );
  OAI2BB2X1M U124 ( .B0(n61), .B1(n62), .A0N(n62), .A1N(\tx_frame_count[0] ), 
        .Y(n138) );
  OAI2BB2X1M U125 ( .B0(n74), .B1(n62), .A0N(n62), .A1N(tx_frames[0]), .Y(n166) );
  OAI2BB2X1M U126 ( .B0(n3), .B1(n25), .A0N(ALU_OUT[15]), .A1N(n77), .Y(n161)
         );
  OAI2BB2X1M U127 ( .B0(n4), .B1(n32), .A0N(ALU_OUT[8]), .A1N(n77), .Y(n152)
         );
  OAI2BB2X1M U128 ( .B0(n3), .B1(n31), .A0N(ALU_OUT[9]), .A1N(n77), .Y(n151)
         );
  OAI2BB2X1M U129 ( .B0(n4), .B1(n30), .A0N(ALU_OUT[10]), .A1N(n77), .Y(n150)
         );
  OAI2BB2X1M U130 ( .B0(n3), .B1(n29), .A0N(ALU_OUT[11]), .A1N(n77), .Y(n149)
         );
  OAI2BB2X1M U131 ( .B0(n4), .B1(n28), .A0N(ALU_OUT[12]), .A1N(n77), .Y(n148)
         );
  OAI2BB2X1M U132 ( .B0(n3), .B1(n27), .A0N(ALU_OUT[13]), .A1N(n77), .Y(n147)
         );
  OAI2BB2X1M U133 ( .B0(n4), .B1(n26), .A0N(ALU_OUT[14]), .A1N(n77), .Y(n146)
         );
  AND2X2M U134 ( .A(UART_RX_DATA[5]), .B(RF_WrEn), .Y(RF_WrData[5]) );
  AND2X2M U135 ( .A(UART_RX_DATA[6]), .B(RF_WrEn), .Y(RF_WrData[6]) );
  OA21X2M U136 ( .A0(ALU_OUT_VLD), .A1(n63), .B0(n130), .Y(n115) );
  OAI21X2M U137 ( .A0(FIFO_FULL), .A1(n131), .B0(n18), .Y(n130) );
  XNOR2X2M U138 ( .A(tx_frames[0]), .B(tx_frames[1]), .Y(n131) );
  OAI21X2M U139 ( .A0(n3), .A1(n40), .B0(n86), .Y(n160) );
  AOI22X1M U140 ( .A0(RF_RdData[0]), .A1(n79), .B0(ALU_OUT[0]), .B1(n77), .Y(
        n86) );
  OAI21X2M U141 ( .A0(n4), .A1(n39), .B0(n85), .Y(n159) );
  AOI22X1M U142 ( .A0(RF_RdData[1]), .A1(n79), .B0(ALU_OUT[1]), .B1(n77), .Y(
        n85) );
  OAI21X2M U143 ( .A0(n3), .A1(n38), .B0(n84), .Y(n158) );
  AOI22X1M U144 ( .A0(RF_RdData[2]), .A1(n79), .B0(ALU_OUT[2]), .B1(n77), .Y(
        n84) );
  OAI21X2M U145 ( .A0(n4), .A1(n37), .B0(n83), .Y(n157) );
  AOI22X1M U146 ( .A0(RF_RdData[3]), .A1(n79), .B0(ALU_OUT[3]), .B1(n77), .Y(
        n83) );
  OAI21X2M U147 ( .A0(n3), .A1(n36), .B0(n82), .Y(n156) );
  AOI22X1M U148 ( .A0(RF_RdData[4]), .A1(n79), .B0(ALU_OUT[4]), .B1(n77), .Y(
        n82) );
  OAI21X2M U149 ( .A0(n4), .A1(n35), .B0(n81), .Y(n155) );
  AOI22X1M U150 ( .A0(RF_RdData[5]), .A1(n79), .B0(ALU_OUT[5]), .B1(n77), .Y(
        n81) );
  OAI21X2M U151 ( .A0(n3), .A1(n34), .B0(n80), .Y(n154) );
  AOI22X1M U152 ( .A0(RF_RdData[6]), .A1(n79), .B0(ALU_OUT[6]), .B1(n77), .Y(
        n80) );
  OAI21X2M U153 ( .A0(n4), .A1(n33), .B0(n78), .Y(n153) );
  AOI22X1M U154 ( .A0(RF_RdData[7]), .A1(n79), .B0(ALU_OUT[7]), .B1(n77), .Y(
        n78) );
  AND4X2M U155 ( .A(n87), .B(n88), .C(n89), .D(n90), .Y(n76) );
  OAI31X1M U156 ( .A0(n7), .A1(n91), .A2(ALU_EN), .B0(n12), .Y(n88) );
  INVX2M U157 ( .A(ALU_OUT_VLD), .Y(n7) );
  INVX2M U158 ( .A(UART_RX_DATA[1]), .Y(n123) );
  NAND3X2M U159 ( .A(n49), .B(UART_RX_DATA[3]), .C(UART_RX_DATA[7]), .Y(n101)
         );
  NAND2X2M U160 ( .A(tx_frames[0]), .B(n9), .Y(n118) );
  INVX2M U161 ( .A(tx_frames[1]), .Y(n9) );
  OR2X2M U162 ( .A(RF_RdData_VLD), .B(n74), .Y(n114) );
  OAI21X2M U163 ( .A0(n100), .A1(n101), .B0(n72), .Y(n94) );
  AOI31X2M U164 ( .A0(n102), .A1(UART_RX_DATA[6]), .A2(n103), .B0(n55), .Y(
        n100) );
  NOR3X2M U165 ( .A(UART_RX_DATA[1]), .B(UART_RX_DATA[5]), .C(UART_RX_DATA[4]), 
        .Y(n103) );
  NOR2X2M U166 ( .A(UART_RX_DATA[0]), .B(n167), .Y(n102) );
  NAND4X2M U167 ( .A(UART_RX_DATA[6]), .B(UART_RX_DATA[2]), .C(UART_RX_DATA[4]), .D(n108), .Y(n104) );
  NOR3X2M U168 ( .A(n56), .B(UART_RX_DATA[5]), .C(UART_RX_DATA[1]), .Y(n108)
         );
  INVX2M U169 ( .A(UART_RX_DATA[0]), .Y(n56) );
  INVX2M U170 ( .A(UART_RX_DATA[2]), .Y(n167) );
  INVX2M U171 ( .A(UART_RX_DATA[4]), .Y(n169) );
  INVX2M U172 ( .A(UART_RX_DATA[3]), .Y(n168) );
  INVX2M U173 ( .A(frame_count[0]), .Y(n51) );
  INVX2M U174 ( .A(\tx_frame_count[0] ), .Y(n10) );
  SDFFRQX2M \tx_frame_count_reg[0]  ( .D(n138), .SI(state[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\tx_frame_count[0] ) );
  SDFFRX1M \result_reg_reg[7]  ( .D(n153), .SI(n195), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n196), .QN(n33) );
  SDFFRX1M \result_reg_reg[6]  ( .D(n154), .SI(n194), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n195), .QN(n34) );
  SDFFRX1M \result_reg_reg[5]  ( .D(n155), .SI(n193), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n194), .QN(n35) );
  SDFFRX1M \result_reg_reg[4]  ( .D(n156), .SI(n192), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n193), .QN(n36) );
  SDFFRX1M \result_reg_reg[3]  ( .D(n157), .SI(n191), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n192), .QN(n37) );
  SDFFRX1M \result_reg_reg[2]  ( .D(n158), .SI(n190), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n191), .QN(n38) );
  SDFFRX1M \result_reg_reg[1]  ( .D(n159), .SI(n189), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n190), .QN(n39) );
  SDFFRX1M \result_reg_reg[0]  ( .D(n160), .SI(frame_count[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(n189), .QN(n40) );
  SDFFRX1M \result_reg_reg[14]  ( .D(n146), .SI(n187), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n188), .QN(n26) );
  SDFFRX1M \result_reg_reg[13]  ( .D(n147), .SI(n186), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n187), .QN(n27) );
  SDFFRX1M \result_reg_reg[12]  ( .D(n148), .SI(n185), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n186), .QN(n28) );
  SDFFRX1M \result_reg_reg[11]  ( .D(n149), .SI(n184), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n185), .QN(n29) );
  SDFFRX1M \result_reg_reg[10]  ( .D(n150), .SI(n183), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n184), .QN(n30) );
  SDFFRX1M \result_reg_reg[9]  ( .D(n151), .SI(n182), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n183), .QN(n31) );
  SDFFRX1M \result_reg_reg[8]  ( .D(n152), .SI(n196), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n182), .QN(n32) );
  SDFFRX1M \result_reg_reg[15]  ( .D(n161), .SI(n188), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n181), .QN(n25) );
  SDFFRQX2M \tx_frames_reg[1]  ( .D(n139), .SI(tx_frames[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(tx_frames[1]) );
  SDFFRQX2M \tx_frames_reg[0]  ( .D(n166), .SI(\tx_frame_count[0] ), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(tx_frames[0]) );
  SDFFRX1M \alu_fun_reg_reg[0]  ( .D(n140), .SI(test_si), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(n180), .QN(n24) );
  SDFFRX1M \alu_fun_reg_reg[1]  ( .D(n141), .SI(n180), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n179), .QN(n23) );
  SDFFRX1M \alu_fun_reg_reg[2]  ( .D(n142), .SI(n179), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n178), .QN(n22) );
  SDFFRX1M \alu_fun_reg_reg[3]  ( .D(n143), .SI(n178), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n177), .QN(n21) );
  SDFFRX1M \rf_addr_reg_reg[3]  ( .D(n137), .SI(n175), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n176), .QN(n45) );
  SDFFRX1M \rf_addr_reg_reg[2]  ( .D(n136), .SI(n174), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n175), .QN(n46) );
  SDFFRX1M \rf_addr_reg_reg[1]  ( .D(n135), .SI(n173), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n174), .QN(n47) );
  SDFFRX1M \rf_addr_reg_reg[0]  ( .D(n134), .SI(n181), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n173), .QN(n48) );
  SDFFRQX2M \frame_count_reg[1]  ( .D(n144), .SI(frame_count[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(frame_count[1]) );
  SDFFRQX2M \frame_count_reg[0]  ( .D(n145), .SI(n177), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(frame_count[0]) );
  SDFFRQX2M \state_reg[3]  ( .D(n165), .SI(state[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(state[3]) );
  SDFFRQX2M \state_reg[2]  ( .D(n162), .SI(state[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(state[2]) );
  SDFFRQX2M \state_reg[0]  ( .D(n164), .SI(n176), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(state[0]) );
  SDFFRQX2M \state_reg[1]  ( .D(n163), .SI(state[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(state[1]) );
  INVX2M U3 ( .A(1'b0), .Y(CLKDIV_EN) );
endmodule


module RegFile_test_1 ( clk, rst, WrEn, RdEn, Address, WrData, RdData, 
        RdData_VLD, REG0, REG1, REG2, REG3, test_si2, test_si1, test_so2, 
        test_so1, test_se );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input clk, rst, WrEn, RdEn, test_si2, test_si1, test_se;
  output RdData_VLD, test_so2, test_so1;
  wire   N11, N12, N13, N14, \regArr[15][7] , \regArr[15][6] , \regArr[15][5] ,
         \regArr[15][4] , \regArr[15][3] , \regArr[15][2] , \regArr[15][1] ,
         \regArr[15][0] , \regArr[14][7] , \regArr[14][6] , \regArr[14][5] ,
         \regArr[14][4] , \regArr[14][3] , \regArr[14][2] , \regArr[14][1] ,
         \regArr[14][0] , \regArr[13][7] , \regArr[13][6] , \regArr[13][5] ,
         \regArr[13][4] , \regArr[13][3] , \regArr[13][2] , \regArr[13][1] ,
         \regArr[13][0] , \regArr[12][7] , \regArr[12][6] , \regArr[12][5] ,
         \regArr[12][4] , \regArr[12][3] , \regArr[12][2] , \regArr[12][1] ,
         \regArr[12][0] , \regArr[11][7] , \regArr[11][6] , \regArr[11][5] ,
         \regArr[11][4] , \regArr[11][3] , \regArr[11][2] , \regArr[11][1] ,
         \regArr[11][0] , \regArr[10][7] , \regArr[10][6] , \regArr[10][5] ,
         \regArr[10][4] , \regArr[10][3] , \regArr[10][2] , \regArr[10][1] ,
         \regArr[10][0] , \regArr[9][7] , \regArr[9][6] , \regArr[9][5] ,
         \regArr[9][4] , \regArr[9][3] , \regArr[9][2] , \regArr[9][1] ,
         \regArr[9][0] , \regArr[8][7] , \regArr[8][6] , \regArr[8][5] ,
         \regArr[8][4] , \regArr[8][3] , \regArr[8][2] , \regArr[8][1] ,
         \regArr[8][0] , \regArr[7][7] , \regArr[7][6] , \regArr[7][5] ,
         \regArr[7][4] , \regArr[7][3] , \regArr[7][2] , \regArr[7][1] ,
         \regArr[7][0] , \regArr[6][7] , \regArr[6][6] , \regArr[6][5] ,
         \regArr[6][4] , \regArr[6][3] , \regArr[6][2] , \regArr[6][1] ,
         \regArr[6][0] , \regArr[5][7] , \regArr[5][6] , \regArr[5][5] ,
         \regArr[5][4] , \regArr[5][3] , \regArr[5][2] , \regArr[5][1] ,
         \regArr[5][0] , \regArr[4][7] , \regArr[4][6] , \regArr[4][5] ,
         \regArr[4][4] , \regArr[4][3] , \regArr[4][2] , \regArr[4][1] ,
         \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n308, n309, n310, n311;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];
  assign test_so2 = \regArr[15][7] ;
  assign test_so1 = \regArr[8][3] ;

  NOR2X2M U3 ( .A(n272), .B(N13), .Y(n20) );
  NOR2X2M U4 ( .A(N12), .B(N13), .Y(n15) );
  INVX2M U5 ( .A(WrData[5]), .Y(n303) );
  INVX2M U6 ( .A(WrData[6]), .Y(n304) );
  INVX2M U7 ( .A(n274), .Y(n275) );
  INVX2M U8 ( .A(n40), .Y(n295) );
  BUFX2M U9 ( .A(n1), .Y(n274) );
  INVX2M U10 ( .A(n277), .Y(n278) );
  NAND2X2M U11 ( .A(RdEn), .B(n296), .Y(n40) );
  NOR2X2M U12 ( .A(n296), .B(RdEn), .Y(n13) );
  OR2X2M U13 ( .A(n272), .B(n273), .Y(n1) );
  BUFX2M U14 ( .A(n3), .Y(n277) );
  INVX2M U15 ( .A(n2), .Y(n279) );
  INVX2M U16 ( .A(n4), .Y(n276) );
  NAND2X2M U17 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U18 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U19 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U20 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U21 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U22 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U23 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U24 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U25 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U26 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U27 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U28 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U29 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U30 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U31 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U32 ( .A(n15), .B(n16), .Y(n14) );
  AND2X2M U33 ( .A(n27), .B(n273), .Y(n16) );
  AND2X2M U34 ( .A(n38), .B(n273), .Y(n30) );
  INVX2M U35 ( .A(WrEn), .Y(n296) );
  BUFX2M U36 ( .A(n294), .Y(n280) );
  BUFX2M U37 ( .A(n291), .Y(n287) );
  BUFX2M U38 ( .A(n291), .Y(n286) );
  BUFX2M U39 ( .A(n292), .Y(n285) );
  BUFX2M U40 ( .A(n293), .Y(n283) );
  BUFX2M U41 ( .A(n293), .Y(n282) );
  BUFX2M U42 ( .A(n294), .Y(n281) );
  BUFX2M U43 ( .A(n292), .Y(n284) );
  BUFX2M U44 ( .A(n290), .Y(n288) );
  BUFX2M U45 ( .A(n290), .Y(n289) );
  OR2X2M U46 ( .A(N11), .B(N12), .Y(n2) );
  OR2X2M U47 ( .A(n273), .B(N12), .Y(n3) );
  OR2X2M U48 ( .A(n272), .B(N11), .Y(n4) );
  INVX2M U49 ( .A(N11), .Y(n273) );
  INVX2M U50 ( .A(N12), .Y(n272) );
  INVX2M U51 ( .A(WrData[0]), .Y(n302) );
  INVX2M U52 ( .A(WrData[1]), .Y(n301) );
  INVX2M U53 ( .A(WrData[2]), .Y(n300) );
  INVX2M U54 ( .A(WrData[3]), .Y(n299) );
  INVX2M U55 ( .A(WrData[4]), .Y(n298) );
  AND2X2M U56 ( .A(n27), .B(N11), .Y(n18) );
  AND2X2M U57 ( .A(n38), .B(N11), .Y(n32) );
  AND2X2M U58 ( .A(N13), .B(n272), .Y(n23) );
  AND2X2M U59 ( .A(N13), .B(N12), .Y(n26) );
  NOR2BX2M U60 ( .AN(n13), .B(N14), .Y(n27) );
  INVX2M U61 ( .A(N13), .Y(n271) );
  AND2X2M U62 ( .A(N14), .B(n13), .Y(n38) );
  INVX2M U63 ( .A(N14), .Y(n270) );
  BUFX2M U64 ( .A(rst), .Y(n291) );
  BUFX2M U65 ( .A(rst), .Y(n293) );
  BUFX2M U66 ( .A(rst), .Y(n292) );
  BUFX2M U67 ( .A(rst), .Y(n294) );
  BUFX2M U68 ( .A(rst), .Y(n290) );
  AO22X1M U69 ( .A0(N43), .A1(n295), .B0(RdData[0]), .B1(n40), .Y(n170) );
  AO22X1M U70 ( .A0(N42), .A1(n295), .B0(RdData[1]), .B1(n40), .Y(n171) );
  AO22X1M U71 ( .A0(N41), .A1(n295), .B0(RdData[2]), .B1(n40), .Y(n172) );
  AO22X1M U72 ( .A0(N40), .A1(n295), .B0(RdData[3]), .B1(n40), .Y(n173) );
  AO22X1M U73 ( .A0(N39), .A1(n295), .B0(RdData[4]), .B1(n40), .Y(n174) );
  AO22X1M U74 ( .A0(N38), .A1(n295), .B0(RdData[5]), .B1(n40), .Y(n175) );
  AO22X1M U75 ( .A0(N37), .A1(n295), .B0(RdData[6]), .B1(n40), .Y(n176) );
  AO22X1M U76 ( .A0(N36), .A1(n295), .B0(RdData[7]), .B1(n40), .Y(n177) );
  INVX2M U77 ( .A(WrData[7]), .Y(n297) );
  OAI2BB2X1M U78 ( .B0(n14), .B1(n302), .A0N(REG0[0]), .A1N(n14), .Y(n42) );
  OAI2BB2X1M U79 ( .B0(n14), .B1(n301), .A0N(REG0[1]), .A1N(n14), .Y(n43) );
  OAI2BB2X1M U80 ( .B0(n14), .B1(n300), .A0N(REG0[2]), .A1N(n14), .Y(n44) );
  OAI2BB2X1M U81 ( .B0(n14), .B1(n299), .A0N(REG0[3]), .A1N(n14), .Y(n45) );
  OAI2BB2X1M U82 ( .B0(n14), .B1(n298), .A0N(REG0[4]), .A1N(n14), .Y(n46) );
  OAI2BB2X1M U83 ( .B0(n14), .B1(n303), .A0N(REG0[5]), .A1N(n14), .Y(n47) );
  OAI2BB2X1M U84 ( .B0(n14), .B1(n304), .A0N(REG0[6]), .A1N(n14), .Y(n48) );
  OAI2BB2X1M U85 ( .B0(n14), .B1(n297), .A0N(REG0[7]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U86 ( .B0(n301), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n59) );
  OAI2BB2X1M U87 ( .B0(n300), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n60) );
  OAI2BB2X1M U88 ( .B0(n299), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n61) );
  OAI2BB2X1M U89 ( .B0(n298), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n62) );
  OAI2BB2X1M U90 ( .B0(n303), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n63) );
  OAI2BB2X1M U91 ( .B0(n304), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n64) );
  OAI2BB2X1M U92 ( .B0(n302), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n66) );
  OAI2BB2X1M U93 ( .B0(n301), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n67) );
  OAI2BB2X1M U94 ( .B0(n300), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n68) );
  OAI2BB2X1M U95 ( .B0(n299), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n69) );
  OAI2BB2X1M U96 ( .B0(n298), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n70) );
  OAI2BB2X1M U97 ( .B0(n304), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n72) );
  OAI2BB2X1M U98 ( .B0(n297), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U99 ( .B0(n302), .B1(n17), .A0N(REG1[0]), .A1N(n17), .Y(n50) );
  OAI2BB2X1M U100 ( .B0(n301), .B1(n17), .A0N(REG1[1]), .A1N(n17), .Y(n51) );
  OAI2BB2X1M U101 ( .B0(n300), .B1(n17), .A0N(REG1[2]), .A1N(n17), .Y(n52) );
  OAI2BB2X1M U102 ( .B0(n299), .B1(n17), .A0N(REG1[3]), .A1N(n17), .Y(n53) );
  OAI2BB2X1M U103 ( .B0(n298), .B1(n17), .A0N(REG1[4]), .A1N(n17), .Y(n54) );
  OAI2BB2X1M U104 ( .B0(n303), .B1(n17), .A0N(REG1[5]), .A1N(n17), .Y(n55) );
  OAI2BB2X1M U105 ( .B0(n304), .B1(n17), .A0N(REG1[6]), .A1N(n17), .Y(n56) );
  OAI2BB2X1M U106 ( .B0(n297), .B1(n17), .A0N(REG1[7]), .A1N(n17), .Y(n57) );
  OAI2BB2X1M U107 ( .B0(n302), .B1(n29), .A0N(\regArr[8][0] ), .A1N(n29), .Y(
        n106) );
  OAI2BB2X1M U108 ( .B0(n301), .B1(n29), .A0N(\regArr[8][1] ), .A1N(n29), .Y(
        n107) );
  OAI2BB2X1M U109 ( .B0(n300), .B1(n29), .A0N(\regArr[8][2] ), .A1N(n29), .Y(
        n108) );
  OAI2BB2X1M U110 ( .B0(n299), .B1(n29), .A0N(\regArr[8][3] ), .A1N(n29), .Y(
        n109) );
  OAI2BB2X1M U111 ( .B0(n298), .B1(n29), .A0N(\regArr[8][4] ), .A1N(n29), .Y(
        n110) );
  OAI2BB2X1M U112 ( .B0(n303), .B1(n29), .A0N(\regArr[8][5] ), .A1N(n29), .Y(
        n111) );
  OAI2BB2X1M U113 ( .B0(n304), .B1(n29), .A0N(\regArr[8][6] ), .A1N(n29), .Y(
        n112) );
  OAI2BB2X1M U114 ( .B0(n297), .B1(n29), .A0N(\regArr[8][7] ), .A1N(n29), .Y(
        n113) );
  OAI2BB2X1M U115 ( .B0(n302), .B1(n31), .A0N(\regArr[9][0] ), .A1N(n31), .Y(
        n114) );
  OAI2BB2X1M U116 ( .B0(n301), .B1(n31), .A0N(\regArr[9][1] ), .A1N(n31), .Y(
        n115) );
  OAI2BB2X1M U117 ( .B0(n300), .B1(n31), .A0N(\regArr[9][2] ), .A1N(n31), .Y(
        n116) );
  OAI2BB2X1M U118 ( .B0(n299), .B1(n31), .A0N(\regArr[9][3] ), .A1N(n31), .Y(
        n117) );
  OAI2BB2X1M U119 ( .B0(n298), .B1(n31), .A0N(\regArr[9][4] ), .A1N(n31), .Y(
        n118) );
  OAI2BB2X1M U120 ( .B0(n303), .B1(n31), .A0N(\regArr[9][5] ), .A1N(n31), .Y(
        n119) );
  OAI2BB2X1M U121 ( .B0(n304), .B1(n31), .A0N(\regArr[9][6] ), .A1N(n31), .Y(
        n120) );
  OAI2BB2X1M U122 ( .B0(n297), .B1(n31), .A0N(\regArr[9][7] ), .A1N(n31), .Y(
        n121) );
  OAI2BB2X1M U123 ( .B0(n302), .B1(n33), .A0N(\regArr[10][0] ), .A1N(n33), .Y(
        n122) );
  OAI2BB2X1M U124 ( .B0(n301), .B1(n33), .A0N(\regArr[10][1] ), .A1N(n33), .Y(
        n123) );
  OAI2BB2X1M U125 ( .B0(n300), .B1(n33), .A0N(\regArr[10][2] ), .A1N(n33), .Y(
        n124) );
  OAI2BB2X1M U126 ( .B0(n299), .B1(n33), .A0N(\regArr[10][3] ), .A1N(n33), .Y(
        n125) );
  OAI2BB2X1M U127 ( .B0(n298), .B1(n33), .A0N(\regArr[10][4] ), .A1N(n33), .Y(
        n126) );
  OAI2BB2X1M U128 ( .B0(n303), .B1(n33), .A0N(\regArr[10][5] ), .A1N(n33), .Y(
        n127) );
  OAI2BB2X1M U129 ( .B0(n304), .B1(n33), .A0N(\regArr[10][6] ), .A1N(n33), .Y(
        n128) );
  OAI2BB2X1M U130 ( .B0(n297), .B1(n33), .A0N(\regArr[10][7] ), .A1N(n33), .Y(
        n129) );
  OAI2BB2X1M U131 ( .B0(n302), .B1(n34), .A0N(\regArr[11][0] ), .A1N(n34), .Y(
        n130) );
  OAI2BB2X1M U132 ( .B0(n301), .B1(n34), .A0N(\regArr[11][1] ), .A1N(n34), .Y(
        n131) );
  OAI2BB2X1M U133 ( .B0(n300), .B1(n34), .A0N(\regArr[11][2] ), .A1N(n34), .Y(
        n132) );
  OAI2BB2X1M U134 ( .B0(n299), .B1(n34), .A0N(\regArr[11][3] ), .A1N(n34), .Y(
        n133) );
  OAI2BB2X1M U135 ( .B0(n298), .B1(n34), .A0N(\regArr[11][4] ), .A1N(n34), .Y(
        n134) );
  OAI2BB2X1M U136 ( .B0(n303), .B1(n34), .A0N(\regArr[11][5] ), .A1N(n34), .Y(
        n135) );
  OAI2BB2X1M U137 ( .B0(n304), .B1(n34), .A0N(\regArr[11][6] ), .A1N(n34), .Y(
        n136) );
  OAI2BB2X1M U138 ( .B0(n297), .B1(n34), .A0N(\regArr[11][7] ), .A1N(n34), .Y(
        n137) );
  OAI2BB2X1M U139 ( .B0(n302), .B1(n24), .A0N(\regArr[5][0] ), .A1N(n24), .Y(
        n82) );
  OAI2BB2X1M U140 ( .B0(n301), .B1(n24), .A0N(\regArr[5][1] ), .A1N(n24), .Y(
        n83) );
  OAI2BB2X1M U141 ( .B0(n300), .B1(n24), .A0N(\regArr[5][2] ), .A1N(n24), .Y(
        n84) );
  OAI2BB2X1M U142 ( .B0(n299), .B1(n24), .A0N(\regArr[5][3] ), .A1N(n24), .Y(
        n85) );
  OAI2BB2X1M U143 ( .B0(n298), .B1(n24), .A0N(\regArr[5][4] ), .A1N(n24), .Y(
        n86) );
  OAI2BB2X1M U144 ( .B0(n303), .B1(n24), .A0N(\regArr[5][5] ), .A1N(n24), .Y(
        n87) );
  OAI2BB2X1M U145 ( .B0(n304), .B1(n24), .A0N(\regArr[5][6] ), .A1N(n24), .Y(
        n88) );
  OAI2BB2X1M U146 ( .B0(n297), .B1(n24), .A0N(\regArr[5][7] ), .A1N(n24), .Y(
        n89) );
  OAI2BB2X1M U147 ( .B0(n302), .B1(n28), .A0N(\regArr[7][0] ), .A1N(n28), .Y(
        n98) );
  OAI2BB2X1M U148 ( .B0(n301), .B1(n28), .A0N(\regArr[7][1] ), .A1N(n28), .Y(
        n99) );
  OAI2BB2X1M U149 ( .B0(n300), .B1(n28), .A0N(\regArr[7][2] ), .A1N(n28), .Y(
        n100) );
  OAI2BB2X1M U150 ( .B0(n299), .B1(n28), .A0N(\regArr[7][3] ), .A1N(n28), .Y(
        n101) );
  OAI2BB2X1M U151 ( .B0(n298), .B1(n28), .A0N(\regArr[7][4] ), .A1N(n28), .Y(
        n102) );
  OAI2BB2X1M U152 ( .B0(n303), .B1(n28), .A0N(\regArr[7][5] ), .A1N(n28), .Y(
        n103) );
  OAI2BB2X1M U153 ( .B0(n304), .B1(n28), .A0N(\regArr[7][6] ), .A1N(n28), .Y(
        n104) );
  OAI2BB2X1M U154 ( .B0(n297), .B1(n28), .A0N(\regArr[7][7] ), .A1N(n28), .Y(
        n105) );
  OAI2BB2X1M U155 ( .B0(n302), .B1(n22), .A0N(\regArr[4][0] ), .A1N(n22), .Y(
        n74) );
  OAI2BB2X1M U156 ( .B0(n301), .B1(n22), .A0N(\regArr[4][1] ), .A1N(n22), .Y(
        n75) );
  OAI2BB2X1M U157 ( .B0(n300), .B1(n22), .A0N(\regArr[4][2] ), .A1N(n22), .Y(
        n76) );
  OAI2BB2X1M U158 ( .B0(n299), .B1(n22), .A0N(\regArr[4][3] ), .A1N(n22), .Y(
        n77) );
  OAI2BB2X1M U159 ( .B0(n298), .B1(n22), .A0N(\regArr[4][4] ), .A1N(n22), .Y(
        n78) );
  OAI2BB2X1M U160 ( .B0(n303), .B1(n22), .A0N(\regArr[4][5] ), .A1N(n22), .Y(
        n79) );
  OAI2BB2X1M U161 ( .B0(n304), .B1(n22), .A0N(\regArr[4][6] ), .A1N(n22), .Y(
        n80) );
  OAI2BB2X1M U162 ( .B0(n297), .B1(n22), .A0N(\regArr[4][7] ), .A1N(n22), .Y(
        n81) );
  OAI2BB2X1M U163 ( .B0(n302), .B1(n25), .A0N(\regArr[6][0] ), .A1N(n25), .Y(
        n90) );
  OAI2BB2X1M U164 ( .B0(n301), .B1(n25), .A0N(\regArr[6][1] ), .A1N(n25), .Y(
        n91) );
  OAI2BB2X1M U165 ( .B0(n300), .B1(n25), .A0N(\regArr[6][2] ), .A1N(n25), .Y(
        n92) );
  OAI2BB2X1M U166 ( .B0(n299), .B1(n25), .A0N(\regArr[6][3] ), .A1N(n25), .Y(
        n93) );
  OAI2BB2X1M U167 ( .B0(n298), .B1(n25), .A0N(\regArr[6][4] ), .A1N(n25), .Y(
        n94) );
  OAI2BB2X1M U168 ( .B0(n303), .B1(n25), .A0N(\regArr[6][5] ), .A1N(n25), .Y(
        n95) );
  OAI2BB2X1M U169 ( .B0(n304), .B1(n25), .A0N(\regArr[6][6] ), .A1N(n25), .Y(
        n96) );
  OAI2BB2X1M U170 ( .B0(n297), .B1(n25), .A0N(\regArr[6][7] ), .A1N(n25), .Y(
        n97) );
  OAI2BB2X1M U171 ( .B0(n302), .B1(n35), .A0N(\regArr[12][0] ), .A1N(n35), .Y(
        n138) );
  OAI2BB2X1M U172 ( .B0(n301), .B1(n35), .A0N(\regArr[12][1] ), .A1N(n35), .Y(
        n139) );
  OAI2BB2X1M U173 ( .B0(n300), .B1(n35), .A0N(\regArr[12][2] ), .A1N(n35), .Y(
        n140) );
  OAI2BB2X1M U174 ( .B0(n299), .B1(n35), .A0N(\regArr[12][3] ), .A1N(n35), .Y(
        n141) );
  OAI2BB2X1M U175 ( .B0(n298), .B1(n35), .A0N(\regArr[12][4] ), .A1N(n35), .Y(
        n142) );
  OAI2BB2X1M U176 ( .B0(n303), .B1(n35), .A0N(\regArr[12][5] ), .A1N(n35), .Y(
        n143) );
  OAI2BB2X1M U177 ( .B0(n304), .B1(n35), .A0N(\regArr[12][6] ), .A1N(n35), .Y(
        n144) );
  OAI2BB2X1M U178 ( .B0(n297), .B1(n35), .A0N(\regArr[12][7] ), .A1N(n35), .Y(
        n145) );
  OAI2BB2X1M U179 ( .B0(n302), .B1(n36), .A0N(\regArr[13][0] ), .A1N(n36), .Y(
        n146) );
  OAI2BB2X1M U180 ( .B0(n301), .B1(n36), .A0N(\regArr[13][1] ), .A1N(n36), .Y(
        n147) );
  OAI2BB2X1M U181 ( .B0(n300), .B1(n36), .A0N(\regArr[13][2] ), .A1N(n36), .Y(
        n148) );
  OAI2BB2X1M U182 ( .B0(n299), .B1(n36), .A0N(\regArr[13][3] ), .A1N(n36), .Y(
        n149) );
  OAI2BB2X1M U183 ( .B0(n298), .B1(n36), .A0N(\regArr[13][4] ), .A1N(n36), .Y(
        n150) );
  OAI2BB2X1M U184 ( .B0(n303), .B1(n36), .A0N(\regArr[13][5] ), .A1N(n36), .Y(
        n151) );
  OAI2BB2X1M U185 ( .B0(n304), .B1(n36), .A0N(\regArr[13][6] ), .A1N(n36), .Y(
        n152) );
  OAI2BB2X1M U186 ( .B0(n297), .B1(n36), .A0N(\regArr[13][7] ), .A1N(n36), .Y(
        n153) );
  OAI2BB2X1M U187 ( .B0(n302), .B1(n37), .A0N(\regArr[14][0] ), .A1N(n37), .Y(
        n154) );
  OAI2BB2X1M U188 ( .B0(n301), .B1(n37), .A0N(\regArr[14][1] ), .A1N(n37), .Y(
        n155) );
  OAI2BB2X1M U189 ( .B0(n300), .B1(n37), .A0N(\regArr[14][2] ), .A1N(n37), .Y(
        n156) );
  OAI2BB2X1M U190 ( .B0(n299), .B1(n37), .A0N(\regArr[14][3] ), .A1N(n37), .Y(
        n157) );
  OAI2BB2X1M U191 ( .B0(n298), .B1(n37), .A0N(\regArr[14][4] ), .A1N(n37), .Y(
        n158) );
  OAI2BB2X1M U192 ( .B0(n303), .B1(n37), .A0N(\regArr[14][5] ), .A1N(n37), .Y(
        n159) );
  OAI2BB2X1M U193 ( .B0(n304), .B1(n37), .A0N(\regArr[14][6] ), .A1N(n37), .Y(
        n160) );
  OAI2BB2X1M U194 ( .B0(n297), .B1(n37), .A0N(\regArr[14][7] ), .A1N(n37), .Y(
        n161) );
  OAI2BB2X1M U195 ( .B0(n302), .B1(n39), .A0N(\regArr[15][0] ), .A1N(n39), .Y(
        n162) );
  OAI2BB2X1M U196 ( .B0(n301), .B1(n39), .A0N(\regArr[15][1] ), .A1N(n39), .Y(
        n163) );
  OAI2BB2X1M U197 ( .B0(n300), .B1(n39), .A0N(\regArr[15][2] ), .A1N(n39), .Y(
        n164) );
  OAI2BB2X1M U198 ( .B0(n299), .B1(n39), .A0N(\regArr[15][3] ), .A1N(n39), .Y(
        n165) );
  OAI2BB2X1M U199 ( .B0(n298), .B1(n39), .A0N(\regArr[15][4] ), .A1N(n39), .Y(
        n166) );
  OAI2BB2X1M U200 ( .B0(n303), .B1(n39), .A0N(\regArr[15][5] ), .A1N(n39), .Y(
        n167) );
  OAI2BB2X1M U201 ( .B0(n304), .B1(n39), .A0N(\regArr[15][6] ), .A1N(n39), .Y(
        n168) );
  OAI2BB2X1M U202 ( .B0(n297), .B1(n39), .A0N(\regArr[15][7] ), .A1N(n39), .Y(
        n169) );
  OAI2BB2X1M U203 ( .B0(n302), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n58) );
  OAI2BB2X1M U204 ( .B0(n297), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U205 ( .B0(n303), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n71) );
  AO21XLM U206 ( .A0(RdData_VLD), .A1(n13), .B0(n295), .Y(n41) );
  AOI22X1M U207 ( .A0(\regArr[10][0] ), .A1(n276), .B0(\regArr[11][0] ), .B1(
        n275), .Y(n6) );
  AOI22X1M U208 ( .A0(\regArr[8][0] ), .A1(n279), .B0(\regArr[9][0] ), .B1(
        n278), .Y(n5) );
  CLKNAND2X2M U209 ( .A(N14), .B(n271), .Y(n254) );
  AOI21X1M U210 ( .A0(n6), .A1(n5), .B0(n254), .Y(n181) );
  AOI22X1M U211 ( .A0(\regArr[14][0] ), .A1(n276), .B0(\regArr[15][0] ), .B1(
        n275), .Y(n8) );
  AOI22X1M U212 ( .A0(\regArr[12][0] ), .A1(n279), .B0(\regArr[13][0] ), .B1(
        n278), .Y(n7) );
  CLKNAND2X2M U213 ( .A(N14), .B(N13), .Y(n257) );
  AOI21X1M U214 ( .A0(n8), .A1(n7), .B0(n257), .Y(n180) );
  AOI22X1M U215 ( .A0(REG2[0]), .A1(n276), .B0(REG3[0]), .B1(n275), .Y(n10) );
  AOI22X1M U216 ( .A0(REG0[0]), .A1(n279), .B0(REG1[0]), .B1(n278), .Y(n9) );
  CLKNAND2X2M U217 ( .A(n271), .B(n270), .Y(n260) );
  AOI21X1M U218 ( .A0(n10), .A1(n9), .B0(n260), .Y(n179) );
  AOI22X1M U219 ( .A0(\regArr[6][0] ), .A1(n276), .B0(\regArr[7][0] ), .B1(
        n275), .Y(n12) );
  AOI22X1M U220 ( .A0(\regArr[4][0] ), .A1(n279), .B0(\regArr[5][0] ), .B1(
        n278), .Y(n11) );
  CLKNAND2X2M U221 ( .A(N13), .B(n270), .Y(n263) );
  AOI21X1M U222 ( .A0(n12), .A1(n11), .B0(n263), .Y(n178) );
  OR4X1M U223 ( .A(n181), .B(n180), .C(n179), .D(n178), .Y(N43) );
  AOI22X1M U224 ( .A0(\regArr[10][1] ), .A1(n276), .B0(\regArr[11][1] ), .B1(
        n275), .Y(n183) );
  AOI22X1M U225 ( .A0(\regArr[8][1] ), .A1(n279), .B0(\regArr[9][1] ), .B1(
        n278), .Y(n182) );
  AOI21X1M U226 ( .A0(n183), .A1(n182), .B0(n254), .Y(n193) );
  AOI22X1M U227 ( .A0(\regArr[14][1] ), .A1(n276), .B0(\regArr[15][1] ), .B1(
        n275), .Y(n185) );
  AOI22X1M U228 ( .A0(\regArr[12][1] ), .A1(n279), .B0(\regArr[13][1] ), .B1(
        n278), .Y(n184) );
  AOI21X1M U229 ( .A0(n185), .A1(n184), .B0(n257), .Y(n192) );
  AOI22X1M U230 ( .A0(REG2[1]), .A1(n276), .B0(REG3[1]), .B1(n275), .Y(n187)
         );
  AOI22X1M U231 ( .A0(REG0[1]), .A1(n279), .B0(REG1[1]), .B1(n278), .Y(n186)
         );
  AOI21X1M U232 ( .A0(n187), .A1(n186), .B0(n260), .Y(n191) );
  AOI22X1M U233 ( .A0(\regArr[6][1] ), .A1(n276), .B0(\regArr[7][1] ), .B1(
        n275), .Y(n189) );
  AOI22X1M U234 ( .A0(\regArr[4][1] ), .A1(n279), .B0(\regArr[5][1] ), .B1(
        n278), .Y(n188) );
  AOI21X1M U235 ( .A0(n189), .A1(n188), .B0(n263), .Y(n190) );
  OR4X1M U236 ( .A(n193), .B(n192), .C(n191), .D(n190), .Y(N42) );
  AOI22X1M U237 ( .A0(\regArr[10][2] ), .A1(n276), .B0(\regArr[11][2] ), .B1(
        n275), .Y(n195) );
  AOI22X1M U238 ( .A0(\regArr[8][2] ), .A1(n279), .B0(\regArr[9][2] ), .B1(
        n278), .Y(n194) );
  AOI21X1M U239 ( .A0(n195), .A1(n194), .B0(n254), .Y(n205) );
  AOI22X1M U240 ( .A0(\regArr[14][2] ), .A1(n276), .B0(\regArr[15][2] ), .B1(
        n275), .Y(n197) );
  AOI22X1M U241 ( .A0(\regArr[12][2] ), .A1(n279), .B0(\regArr[13][2] ), .B1(
        n278), .Y(n196) );
  AOI21X1M U242 ( .A0(n197), .A1(n196), .B0(n257), .Y(n204) );
  AOI22X1M U243 ( .A0(REG2[2]), .A1(n276), .B0(REG3[2]), .B1(n275), .Y(n199)
         );
  AOI22X1M U244 ( .A0(REG0[2]), .A1(n279), .B0(REG1[2]), .B1(n278), .Y(n198)
         );
  AOI21X1M U245 ( .A0(n199), .A1(n198), .B0(n260), .Y(n203) );
  AOI22X1M U246 ( .A0(\regArr[6][2] ), .A1(n276), .B0(\regArr[7][2] ), .B1(
        n275), .Y(n201) );
  AOI22X1M U247 ( .A0(\regArr[4][2] ), .A1(n279), .B0(\regArr[5][2] ), .B1(
        n278), .Y(n200) );
  AOI21X1M U248 ( .A0(n201), .A1(n200), .B0(n263), .Y(n202) );
  OR4X1M U249 ( .A(n205), .B(n204), .C(n203), .D(n202), .Y(N41) );
  AOI22X1M U250 ( .A0(\regArr[10][3] ), .A1(n276), .B0(\regArr[11][3] ), .B1(
        n275), .Y(n207) );
  AOI22X1M U251 ( .A0(\regArr[8][3] ), .A1(n279), .B0(\regArr[9][3] ), .B1(
        n278), .Y(n206) );
  AOI21X1M U252 ( .A0(n207), .A1(n206), .B0(n254), .Y(n217) );
  AOI22X1M U253 ( .A0(\regArr[14][3] ), .A1(n276), .B0(\regArr[15][3] ), .B1(
        n275), .Y(n209) );
  AOI22X1M U254 ( .A0(\regArr[12][3] ), .A1(n279), .B0(\regArr[13][3] ), .B1(
        n278), .Y(n208) );
  AOI21X1M U255 ( .A0(n209), .A1(n208), .B0(n257), .Y(n216) );
  AOI22X1M U256 ( .A0(REG2[3]), .A1(n276), .B0(REG3[3]), .B1(n275), .Y(n211)
         );
  AOI22X1M U257 ( .A0(REG0[3]), .A1(n279), .B0(REG1[3]), .B1(n278), .Y(n210)
         );
  AOI21X1M U258 ( .A0(n211), .A1(n210), .B0(n260), .Y(n215) );
  AOI22X1M U259 ( .A0(\regArr[6][3] ), .A1(n276), .B0(\regArr[7][3] ), .B1(
        n275), .Y(n213) );
  AOI22X1M U260 ( .A0(\regArr[4][3] ), .A1(n279), .B0(\regArr[5][3] ), .B1(
        n278), .Y(n212) );
  AOI21X1M U261 ( .A0(n213), .A1(n212), .B0(n263), .Y(n214) );
  OR4X1M U262 ( .A(n217), .B(n216), .C(n215), .D(n214), .Y(N40) );
  AOI22X1M U263 ( .A0(\regArr[10][4] ), .A1(n276), .B0(\regArr[11][4] ), .B1(
        n275), .Y(n219) );
  AOI22X1M U264 ( .A0(\regArr[8][4] ), .A1(n279), .B0(\regArr[9][4] ), .B1(
        n278), .Y(n218) );
  AOI21X1M U265 ( .A0(n219), .A1(n218), .B0(n254), .Y(n229) );
  AOI22X1M U266 ( .A0(\regArr[14][4] ), .A1(n276), .B0(\regArr[15][4] ), .B1(
        n275), .Y(n221) );
  AOI22X1M U267 ( .A0(\regArr[12][4] ), .A1(n279), .B0(\regArr[13][4] ), .B1(
        n278), .Y(n220) );
  AOI21X1M U268 ( .A0(n221), .A1(n220), .B0(n257), .Y(n228) );
  AOI22X1M U269 ( .A0(REG2[4]), .A1(n276), .B0(REG3[4]), .B1(n275), .Y(n223)
         );
  AOI22X1M U270 ( .A0(REG0[4]), .A1(n279), .B0(REG1[4]), .B1(n278), .Y(n222)
         );
  AOI21X1M U271 ( .A0(n223), .A1(n222), .B0(n260), .Y(n227) );
  AOI22X1M U272 ( .A0(\regArr[6][4] ), .A1(n276), .B0(\regArr[7][4] ), .B1(
        n275), .Y(n225) );
  AOI22X1M U273 ( .A0(\regArr[4][4] ), .A1(n279), .B0(\regArr[5][4] ), .B1(
        n278), .Y(n224) );
  AOI21X1M U274 ( .A0(n225), .A1(n224), .B0(n263), .Y(n226) );
  OR4X1M U275 ( .A(n229), .B(n228), .C(n227), .D(n226), .Y(N39) );
  AOI22X1M U276 ( .A0(\regArr[10][5] ), .A1(n276), .B0(\regArr[11][5] ), .B1(
        n275), .Y(n231) );
  AOI22X1M U277 ( .A0(\regArr[8][5] ), .A1(n279), .B0(\regArr[9][5] ), .B1(
        n278), .Y(n230) );
  AOI21X1M U278 ( .A0(n231), .A1(n230), .B0(n254), .Y(n241) );
  AOI22X1M U279 ( .A0(\regArr[14][5] ), .A1(n276), .B0(\regArr[15][5] ), .B1(
        n275), .Y(n233) );
  AOI22X1M U280 ( .A0(\regArr[12][5] ), .A1(n279), .B0(\regArr[13][5] ), .B1(
        n278), .Y(n232) );
  AOI21X1M U281 ( .A0(n233), .A1(n232), .B0(n257), .Y(n240) );
  AOI22X1M U282 ( .A0(REG2[5]), .A1(n276), .B0(REG3[5]), .B1(n275), .Y(n235)
         );
  AOI22X1M U283 ( .A0(REG0[5]), .A1(n279), .B0(REG1[5]), .B1(n278), .Y(n234)
         );
  AOI21X1M U284 ( .A0(n235), .A1(n234), .B0(n260), .Y(n239) );
  AOI22X1M U285 ( .A0(\regArr[6][5] ), .A1(n276), .B0(\regArr[7][5] ), .B1(
        n275), .Y(n237) );
  AOI22X1M U286 ( .A0(\regArr[4][5] ), .A1(n279), .B0(\regArr[5][5] ), .B1(
        n278), .Y(n236) );
  AOI21X1M U287 ( .A0(n237), .A1(n236), .B0(n263), .Y(n238) );
  OR4X1M U288 ( .A(n241), .B(n240), .C(n239), .D(n238), .Y(N38) );
  AOI22X1M U289 ( .A0(\regArr[10][6] ), .A1(n276), .B0(\regArr[11][6] ), .B1(
        n275), .Y(n243) );
  AOI22X1M U290 ( .A0(\regArr[8][6] ), .A1(n279), .B0(\regArr[9][6] ), .B1(
        n278), .Y(n242) );
  AOI21X1M U291 ( .A0(n243), .A1(n242), .B0(n254), .Y(n253) );
  AOI22X1M U292 ( .A0(\regArr[14][6] ), .A1(n276), .B0(\regArr[15][6] ), .B1(
        n275), .Y(n245) );
  AOI22X1M U293 ( .A0(\regArr[12][6] ), .A1(n279), .B0(\regArr[13][6] ), .B1(
        n278), .Y(n244) );
  AOI21X1M U294 ( .A0(n245), .A1(n244), .B0(n257), .Y(n252) );
  AOI22X1M U295 ( .A0(REG2[6]), .A1(n276), .B0(REG3[6]), .B1(n275), .Y(n247)
         );
  AOI22X1M U296 ( .A0(REG0[6]), .A1(n279), .B0(REG1[6]), .B1(n278), .Y(n246)
         );
  AOI21X1M U297 ( .A0(n247), .A1(n246), .B0(n260), .Y(n251) );
  AOI22X1M U298 ( .A0(\regArr[6][6] ), .A1(n276), .B0(\regArr[7][6] ), .B1(
        n275), .Y(n249) );
  AOI22X1M U299 ( .A0(\regArr[4][6] ), .A1(n279), .B0(\regArr[5][6] ), .B1(
        n278), .Y(n248) );
  AOI21X1M U300 ( .A0(n249), .A1(n248), .B0(n263), .Y(n250) );
  OR4X1M U301 ( .A(n253), .B(n252), .C(n251), .D(n250), .Y(N37) );
  AOI22X1M U302 ( .A0(\regArr[10][7] ), .A1(n276), .B0(\regArr[11][7] ), .B1(
        n275), .Y(n256) );
  AOI22X1M U303 ( .A0(\regArr[8][7] ), .A1(n279), .B0(\regArr[9][7] ), .B1(
        n278), .Y(n255) );
  AOI21X1M U304 ( .A0(n256), .A1(n255), .B0(n254), .Y(n269) );
  AOI22X1M U305 ( .A0(\regArr[14][7] ), .A1(n276), .B0(\regArr[15][7] ), .B1(
        n275), .Y(n259) );
  AOI22X1M U306 ( .A0(\regArr[12][7] ), .A1(n279), .B0(\regArr[13][7] ), .B1(
        n278), .Y(n258) );
  AOI21X1M U307 ( .A0(n259), .A1(n258), .B0(n257), .Y(n268) );
  AOI22X1M U308 ( .A0(REG2[7]), .A1(n276), .B0(REG3[7]), .B1(n275), .Y(n262)
         );
  AOI22X1M U309 ( .A0(REG0[7]), .A1(n279), .B0(REG1[7]), .B1(n278), .Y(n261)
         );
  AOI21X1M U310 ( .A0(n262), .A1(n261), .B0(n260), .Y(n267) );
  AOI22X1M U311 ( .A0(\regArr[6][7] ), .A1(n276), .B0(\regArr[7][7] ), .B1(
        n275), .Y(n265) );
  AOI22X1M U312 ( .A0(\regArr[4][7] ), .A1(n279), .B0(\regArr[5][7] ), .B1(
        n278), .Y(n264) );
  AOI21X1M U313 ( .A0(n265), .A1(n264), .B0(n263), .Y(n266) );
  OR4X1M U314 ( .A(n269), .B(n268), .C(n267), .D(n266), .Y(N36) );
  SDFFRQX2M \RdData_reg[7]  ( .D(n177), .SI(RdData[6]), .SE(n309), .CK(clk), 
        .RN(n288), .Q(RdData[7]) );
  SDFFRQX2M \RdData_reg[6]  ( .D(n176), .SI(RdData[5]), .SE(n308), .CK(clk), 
        .RN(n280), .Q(RdData[6]) );
  SDFFRQX2M \RdData_reg[5]  ( .D(n175), .SI(RdData[4]), .SE(n311), .CK(clk), 
        .RN(n284), .Q(RdData[5]) );
  SDFFRQX2M \RdData_reg[4]  ( .D(n174), .SI(RdData[3]), .SE(n310), .CK(clk), 
        .RN(n281), .Q(RdData[4]) );
  SDFFRQX2M \RdData_reg[3]  ( .D(n173), .SI(RdData[2]), .SE(n309), .CK(clk), 
        .RN(n281), .Q(RdData[3]) );
  SDFFRQX2M \RdData_reg[2]  ( .D(n172), .SI(RdData[1]), .SE(n308), .CK(clk), 
        .RN(n281), .Q(RdData[2]) );
  SDFFRQX2M \RdData_reg[1]  ( .D(n171), .SI(RdData[0]), .SE(n311), .CK(clk), 
        .RN(n281), .Q(RdData[1]) );
  SDFFRQX2M \RdData_reg[0]  ( .D(n170), .SI(RdData_VLD), .SE(n310), .CK(clk), 
        .RN(n281), .Q(RdData[0]) );
  SDFFRQX2M \regArr_reg[15][7]  ( .D(n169), .SI(\regArr[15][6] ), .SE(n308), 
        .CK(clk), .RN(n280), .Q(\regArr[15][7] ) );
  SDFFRQX2M \regArr_reg[15][6]  ( .D(n168), .SI(\regArr[15][5] ), .SE(n311), 
        .CK(clk), .RN(n280), .Q(\regArr[15][6] ) );
  SDFFRQX2M \regArr_reg[15][5]  ( .D(n167), .SI(\regArr[15][4] ), .SE(n310), 
        .CK(clk), .RN(n280), .Q(\regArr[15][5] ) );
  SDFFRQX2M \regArr_reg[15][4]  ( .D(n166), .SI(\regArr[15][3] ), .SE(n309), 
        .CK(clk), .RN(n280), .Q(\regArr[15][4] ) );
  SDFFRQX2M \regArr_reg[15][3]  ( .D(n165), .SI(\regArr[15][2] ), .SE(n308), 
        .CK(clk), .RN(n280), .Q(\regArr[15][3] ) );
  SDFFRQX2M \regArr_reg[15][2]  ( .D(n164), .SI(\regArr[15][1] ), .SE(n311), 
        .CK(clk), .RN(n280), .Q(\regArr[15][2] ) );
  SDFFRQX2M \regArr_reg[15][1]  ( .D(n163), .SI(\regArr[15][0] ), .SE(n310), 
        .CK(clk), .RN(n280), .Q(\regArr[15][1] ) );
  SDFFRQX2M \regArr_reg[15][0]  ( .D(n162), .SI(\regArr[14][7] ), .SE(n309), 
        .CK(clk), .RN(n280), .Q(\regArr[15][0] ) );
  SDFFRQX2M \regArr_reg[13][7]  ( .D(n153), .SI(\regArr[13][6] ), .SE(n308), 
        .CK(clk), .RN(n281), .Q(\regArr[13][7] ) );
  SDFFRQX2M \regArr_reg[13][6]  ( .D(n152), .SI(\regArr[13][5] ), .SE(n311), 
        .CK(clk), .RN(n281), .Q(\regArr[13][6] ) );
  SDFFRQX2M \regArr_reg[13][5]  ( .D(n151), .SI(\regArr[13][4] ), .SE(n310), 
        .CK(clk), .RN(n281), .Q(\regArr[13][5] ) );
  SDFFRQX2M \regArr_reg[13][4]  ( .D(n150), .SI(\regArr[13][3] ), .SE(n309), 
        .CK(clk), .RN(n281), .Q(\regArr[13][4] ) );
  SDFFRQX2M \regArr_reg[13][3]  ( .D(n149), .SI(\regArr[13][2] ), .SE(n308), 
        .CK(clk), .RN(n281), .Q(\regArr[13][3] ) );
  SDFFRQX2M \regArr_reg[13][2]  ( .D(n148), .SI(\regArr[13][1] ), .SE(n311), 
        .CK(clk), .RN(n281), .Q(\regArr[13][2] ) );
  SDFFRQX2M \regArr_reg[13][1]  ( .D(n147), .SI(\regArr[13][0] ), .SE(n310), 
        .CK(clk), .RN(n281), .Q(\regArr[13][1] ) );
  SDFFRQX2M \regArr_reg[13][0]  ( .D(n146), .SI(\regArr[12][7] ), .SE(n309), 
        .CK(clk), .RN(n281), .Q(\regArr[13][0] ) );
  SDFFRQX2M \regArr_reg[11][7]  ( .D(n137), .SI(\regArr[11][6] ), .SE(n308), 
        .CK(clk), .RN(n282), .Q(\regArr[11][7] ) );
  SDFFRQX2M \regArr_reg[11][6]  ( .D(n136), .SI(\regArr[11][5] ), .SE(n311), 
        .CK(clk), .RN(n282), .Q(\regArr[11][6] ) );
  SDFFRQX2M \regArr_reg[11][5]  ( .D(n135), .SI(\regArr[11][4] ), .SE(n310), 
        .CK(clk), .RN(n282), .Q(\regArr[11][5] ) );
  SDFFRQX2M \regArr_reg[11][4]  ( .D(n134), .SI(\regArr[11][3] ), .SE(n309), 
        .CK(clk), .RN(n282), .Q(\regArr[11][4] ) );
  SDFFRQX2M \regArr_reg[11][3]  ( .D(n133), .SI(\regArr[11][2] ), .SE(n308), 
        .CK(clk), .RN(n282), .Q(\regArr[11][3] ) );
  SDFFRQX2M \regArr_reg[11][2]  ( .D(n132), .SI(\regArr[11][1] ), .SE(n311), 
        .CK(clk), .RN(n282), .Q(\regArr[11][2] ) );
  SDFFRQX2M \regArr_reg[11][1]  ( .D(n131), .SI(\regArr[11][0] ), .SE(n310), 
        .CK(clk), .RN(n282), .Q(\regArr[11][1] ) );
  SDFFRQX2M \regArr_reg[11][0]  ( .D(n130), .SI(\regArr[10][7] ), .SE(n309), 
        .CK(clk), .RN(n282), .Q(\regArr[11][0] ) );
  SDFFRQX2M \regArr_reg[9][7]  ( .D(n121), .SI(\regArr[9][6] ), .SE(n308), 
        .CK(clk), .RN(n283), .Q(\regArr[9][7] ) );
  SDFFRQX2M \regArr_reg[9][6]  ( .D(n120), .SI(\regArr[9][5] ), .SE(n311), 
        .CK(clk), .RN(n283), .Q(\regArr[9][6] ) );
  SDFFRQX2M \regArr_reg[9][5]  ( .D(n119), .SI(\regArr[9][4] ), .SE(n310), 
        .CK(clk), .RN(n283), .Q(\regArr[9][5] ) );
  SDFFRQX2M \regArr_reg[9][4]  ( .D(n118), .SI(\regArr[9][3] ), .SE(n309), 
        .CK(clk), .RN(n283), .Q(\regArr[9][4] ) );
  SDFFRQX2M \regArr_reg[9][3]  ( .D(n117), .SI(\regArr[9][2] ), .SE(n308), 
        .CK(clk), .RN(n283), .Q(\regArr[9][3] ) );
  SDFFRQX2M \regArr_reg[9][2]  ( .D(n116), .SI(\regArr[9][1] ), .SE(n311), 
        .CK(clk), .RN(n283), .Q(\regArr[9][2] ) );
  SDFFRQX2M \regArr_reg[9][1]  ( .D(n115), .SI(\regArr[9][0] ), .SE(n310), 
        .CK(clk), .RN(n283), .Q(\regArr[9][1] ) );
  SDFFRQX2M \regArr_reg[9][0]  ( .D(n114), .SI(\regArr[8][7] ), .SE(n309), 
        .CK(clk), .RN(n285), .Q(\regArr[9][0] ) );
  SDFFRQX2M \regArr_reg[7][7]  ( .D(n105), .SI(\regArr[7][6] ), .SE(n310), 
        .CK(clk), .RN(n284), .Q(\regArr[7][7] ) );
  SDFFRQX2M \regArr_reg[7][6]  ( .D(n104), .SI(\regArr[7][5] ), .SE(n309), 
        .CK(clk), .RN(n284), .Q(\regArr[7][6] ) );
  SDFFRQX2M \regArr_reg[7][5]  ( .D(n103), .SI(\regArr[7][4] ), .SE(n308), 
        .CK(clk), .RN(n284), .Q(\regArr[7][5] ) );
  SDFFRQX2M \regArr_reg[7][4]  ( .D(n102), .SI(\regArr[7][3] ), .SE(n311), 
        .CK(clk), .RN(n284), .Q(\regArr[7][4] ) );
  SDFFRQX2M \regArr_reg[7][3]  ( .D(n101), .SI(\regArr[7][2] ), .SE(n310), 
        .CK(clk), .RN(n284), .Q(\regArr[7][3] ) );
  SDFFRQX2M \regArr_reg[7][2]  ( .D(n100), .SI(\regArr[7][1] ), .SE(n309), 
        .CK(clk), .RN(n286), .Q(\regArr[7][2] ) );
  SDFFRQX2M \regArr_reg[7][1]  ( .D(n99), .SI(\regArr[7][0] ), .SE(n308), .CK(
        clk), .RN(n286), .Q(\regArr[7][1] ) );
  SDFFRQX2M \regArr_reg[7][0]  ( .D(n98), .SI(\regArr[6][7] ), .SE(n311), .CK(
        clk), .RN(n286), .Q(\regArr[7][0] ) );
  SDFFRQX2M \regArr_reg[5][7]  ( .D(n89), .SI(\regArr[5][6] ), .SE(n310), .CK(
        clk), .RN(n285), .Q(\regArr[5][7] ) );
  SDFFRQX2M \regArr_reg[5][6]  ( .D(n88), .SI(\regArr[5][5] ), .SE(n309), .CK(
        clk), .RN(n285), .Q(\regArr[5][6] ) );
  SDFFRQX2M \regArr_reg[5][5]  ( .D(n87), .SI(\regArr[5][4] ), .SE(n308), .CK(
        clk), .RN(n285), .Q(\regArr[5][5] ) );
  SDFFRQX2M \regArr_reg[5][4]  ( .D(n86), .SI(\regArr[5][3] ), .SE(n311), .CK(
        clk), .RN(n285), .Q(\regArr[5][4] ) );
  SDFFRQX2M \regArr_reg[5][3]  ( .D(n85), .SI(\regArr[5][2] ), .SE(n310), .CK(
        clk), .RN(n287), .Q(\regArr[5][3] ) );
  SDFFRQX2M \regArr_reg[5][2]  ( .D(n84), .SI(\regArr[5][1] ), .SE(n309), .CK(
        clk), .RN(n287), .Q(\regArr[5][2] ) );
  SDFFRQX2M \regArr_reg[5][1]  ( .D(n83), .SI(\regArr[5][0] ), .SE(n308), .CK(
        clk), .RN(n287), .Q(\regArr[5][1] ) );
  SDFFRQX2M \regArr_reg[5][0]  ( .D(n82), .SI(\regArr[4][7] ), .SE(n311), .CK(
        clk), .RN(n287), .Q(\regArr[5][0] ) );
  SDFFRQX2M \regArr_reg[14][7]  ( .D(n161), .SI(\regArr[14][6] ), .SE(n308), 
        .CK(clk), .RN(n280), .Q(\regArr[14][7] ) );
  SDFFRQX2M \regArr_reg[14][6]  ( .D(n160), .SI(\regArr[14][5] ), .SE(n311), 
        .CK(clk), .RN(n280), .Q(\regArr[14][6] ) );
  SDFFRQX2M \regArr_reg[14][5]  ( .D(n159), .SI(\regArr[14][4] ), .SE(n310), 
        .CK(clk), .RN(n282), .Q(\regArr[14][5] ) );
  SDFFRQX2M \regArr_reg[14][4]  ( .D(n158), .SI(\regArr[14][3] ), .SE(n309), 
        .CK(clk), .RN(n282), .Q(\regArr[14][4] ) );
  SDFFRQX2M \regArr_reg[14][3]  ( .D(n157), .SI(\regArr[14][2] ), .SE(n308), 
        .CK(clk), .RN(n282), .Q(\regArr[14][3] ) );
  SDFFRQX2M \regArr_reg[14][2]  ( .D(n156), .SI(\regArr[14][1] ), .SE(n311), 
        .CK(clk), .RN(n282), .Q(\regArr[14][2] ) );
  SDFFRQX2M \regArr_reg[14][1]  ( .D(n155), .SI(\regArr[14][0] ), .SE(n310), 
        .CK(clk), .RN(n282), .Q(\regArr[14][1] ) );
  SDFFRQX2M \regArr_reg[14][0]  ( .D(n154), .SI(\regArr[13][7] ), .SE(n309), 
        .CK(clk), .RN(n281), .Q(\regArr[14][0] ) );
  SDFFRQX2M \regArr_reg[12][7]  ( .D(n145), .SI(\regArr[12][6] ), .SE(n308), 
        .CK(clk), .RN(n281), .Q(\regArr[12][7] ) );
  SDFFRQX2M \regArr_reg[12][6]  ( .D(n144), .SI(\regArr[12][5] ), .SE(n311), 
        .CK(clk), .RN(n283), .Q(\regArr[12][6] ) );
  SDFFRQX2M \regArr_reg[12][5]  ( .D(n143), .SI(\regArr[12][4] ), .SE(n310), 
        .CK(clk), .RN(n283), .Q(\regArr[12][5] ) );
  SDFFRQX2M \regArr_reg[12][4]  ( .D(n142), .SI(\regArr[12][3] ), .SE(n309), 
        .CK(clk), .RN(n283), .Q(\regArr[12][4] ) );
  SDFFRQX2M \regArr_reg[12][3]  ( .D(n141), .SI(\regArr[12][2] ), .SE(n308), 
        .CK(clk), .RN(n283), .Q(\regArr[12][3] ) );
  SDFFRQX2M \regArr_reg[12][2]  ( .D(n140), .SI(\regArr[12][1] ), .SE(n311), 
        .CK(clk), .RN(n283), .Q(\regArr[12][2] ) );
  SDFFRQX2M \regArr_reg[12][1]  ( .D(n139), .SI(\regArr[12][0] ), .SE(n310), 
        .CK(clk), .RN(n282), .Q(\regArr[12][1] ) );
  SDFFRQX2M \regArr_reg[12][0]  ( .D(n138), .SI(\regArr[11][7] ), .SE(n309), 
        .CK(clk), .RN(n282), .Q(\regArr[12][0] ) );
  SDFFRQX2M \regArr_reg[10][7]  ( .D(n129), .SI(\regArr[10][6] ), .SE(n308), 
        .CK(clk), .RN(n284), .Q(\regArr[10][7] ) );
  SDFFRQX2M \regArr_reg[10][6]  ( .D(n128), .SI(\regArr[10][5] ), .SE(n311), 
        .CK(clk), .RN(n284), .Q(\regArr[10][6] ) );
  SDFFRQX2M \regArr_reg[10][5]  ( .D(n127), .SI(\regArr[10][4] ), .SE(n310), 
        .CK(clk), .RN(n284), .Q(\regArr[10][5] ) );
  SDFFRQX2M \regArr_reg[10][4]  ( .D(n126), .SI(\regArr[10][3] ), .SE(n309), 
        .CK(clk), .RN(n284), .Q(\regArr[10][4] ) );
  SDFFRQX2M \regArr_reg[10][3]  ( .D(n125), .SI(\regArr[10][2] ), .SE(n308), 
        .CK(clk), .RN(n284), .Q(\regArr[10][3] ) );
  SDFFRQX2M \regArr_reg[10][2]  ( .D(n124), .SI(\regArr[10][1] ), .SE(n311), 
        .CK(clk), .RN(n283), .Q(\regArr[10][2] ) );
  SDFFRQX2M \regArr_reg[10][1]  ( .D(n123), .SI(\regArr[10][0] ), .SE(n310), 
        .CK(clk), .RN(n283), .Q(\regArr[10][1] ) );
  SDFFRQX2M \regArr_reg[10][0]  ( .D(n122), .SI(\regArr[9][7] ), .SE(n309), 
        .CK(clk), .RN(n283), .Q(\regArr[10][0] ) );
  SDFFRQX2M \regArr_reg[8][7]  ( .D(n113), .SI(\regArr[8][6] ), .SE(n308), 
        .CK(clk), .RN(n285), .Q(\regArr[8][7] ) );
  SDFFRQX2M \regArr_reg[8][6]  ( .D(n112), .SI(\regArr[8][5] ), .SE(n311), 
        .CK(clk), .RN(n285), .Q(\regArr[8][6] ) );
  SDFFRQX2M \regArr_reg[8][5]  ( .D(n111), .SI(\regArr[8][4] ), .SE(n310), 
        .CK(clk), .RN(n285), .Q(\regArr[8][5] ) );
  SDFFRQX2M \regArr_reg[8][4]  ( .D(n110), .SI(test_si2), .SE(n309), .CK(clk), 
        .RN(n285), .Q(\regArr[8][4] ) );
  SDFFRQX2M \regArr_reg[8][3]  ( .D(n109), .SI(\regArr[8][2] ), .SE(n310), 
        .CK(clk), .RN(n285), .Q(\regArr[8][3] ) );
  SDFFRQX2M \regArr_reg[8][2]  ( .D(n108), .SI(\regArr[8][1] ), .SE(n309), 
        .CK(clk), .RN(n284), .Q(\regArr[8][2] ) );
  SDFFRQX2M \regArr_reg[8][1]  ( .D(n107), .SI(\regArr[8][0] ), .SE(n308), 
        .CK(clk), .RN(n284), .Q(\regArr[8][1] ) );
  SDFFRQX2M \regArr_reg[8][0]  ( .D(n106), .SI(\regArr[7][7] ), .SE(n311), 
        .CK(clk), .RN(n284), .Q(\regArr[8][0] ) );
  SDFFRQX2M \regArr_reg[6][7]  ( .D(n97), .SI(\regArr[6][6] ), .SE(n310), .CK(
        clk), .RN(n286), .Q(\regArr[6][7] ) );
  SDFFRQX2M \regArr_reg[6][6]  ( .D(n96), .SI(\regArr[6][5] ), .SE(n309), .CK(
        clk), .RN(n286), .Q(\regArr[6][6] ) );
  SDFFRQX2M \regArr_reg[6][5]  ( .D(n95), .SI(\regArr[6][4] ), .SE(n308), .CK(
        clk), .RN(n286), .Q(\regArr[6][5] ) );
  SDFFRQX2M \regArr_reg[6][4]  ( .D(n94), .SI(\regArr[6][3] ), .SE(n311), .CK(
        clk), .RN(n285), .Q(\regArr[6][4] ) );
  SDFFRQX2M \regArr_reg[6][3]  ( .D(n93), .SI(\regArr[6][2] ), .SE(n310), .CK(
        clk), .RN(n285), .Q(\regArr[6][3] ) );
  SDFFRQX2M \regArr_reg[6][2]  ( .D(n92), .SI(\regArr[6][1] ), .SE(n309), .CK(
        clk), .RN(n285), .Q(\regArr[6][2] ) );
  SDFFRQX2M \regArr_reg[6][1]  ( .D(n91), .SI(\regArr[6][0] ), .SE(n308), .CK(
        clk), .RN(n285), .Q(\regArr[6][1] ) );
  SDFFRQX2M \regArr_reg[6][0]  ( .D(n90), .SI(\regArr[5][7] ), .SE(n311), .CK(
        clk), .RN(n285), .Q(\regArr[6][0] ) );
  SDFFRQX2M \regArr_reg[4][7]  ( .D(n81), .SI(\regArr[4][6] ), .SE(n310), .CK(
        clk), .RN(n287), .Q(\regArr[4][7] ) );
  SDFFRQX2M \regArr_reg[4][6]  ( .D(n80), .SI(\regArr[4][5] ), .SE(n309), .CK(
        clk), .RN(n287), .Q(\regArr[4][6] ) );
  SDFFRQX2M \regArr_reg[4][5]  ( .D(n79), .SI(\regArr[4][4] ), .SE(n308), .CK(
        clk), .RN(n286), .Q(\regArr[4][5] ) );
  SDFFRQX2M \regArr_reg[4][4]  ( .D(n78), .SI(\regArr[4][3] ), .SE(n311), .CK(
        clk), .RN(n286), .Q(\regArr[4][4] ) );
  SDFFRQX2M \regArr_reg[4][3]  ( .D(n77), .SI(\regArr[4][2] ), .SE(n310), .CK(
        clk), .RN(n286), .Q(\regArr[4][3] ) );
  SDFFRQX2M \regArr_reg[4][2]  ( .D(n76), .SI(\regArr[4][1] ), .SE(n309), .CK(
        clk), .RN(n286), .Q(\regArr[4][2] ) );
  SDFFRQX2M \regArr_reg[4][1]  ( .D(n75), .SI(\regArr[4][0] ), .SE(n308), .CK(
        clk), .RN(n286), .Q(\regArr[4][1] ) );
  SDFFRQX2M \regArr_reg[4][0]  ( .D(n74), .SI(REG3[7]), .SE(n311), .CK(clk), 
        .RN(n286), .Q(\regArr[4][0] ) );
  SDFFRQX2M \regArr_reg[3][0]  ( .D(n66), .SI(REG2[7]), .SE(n308), .CK(clk), 
        .RN(n288), .Q(REG3[0]) );
  SDFFRQX2M RdData_VLD_reg ( .D(n41), .SI(test_si1), .SE(n309), .CK(clk), .RN(
        n284), .Q(RdData_VLD) );
  SDFFRQX2M \regArr_reg[2][1]  ( .D(n59), .SI(REG2[0]), .SE(n310), .CK(clk), 
        .RN(n287), .Q(REG2[1]) );
  SDFFSQX2M \regArr_reg[2][0]  ( .D(n58), .SI(REG1[7]), .SE(n311), .CK(clk), 
        .SN(n280), .Q(REG2[0]) );
  SDFFRQX2M \regArr_reg[3][6]  ( .D(n72), .SI(REG3[5]), .SE(n309), .CK(clk), 
        .RN(n286), .Q(REG3[6]) );
  SDFFRQX2M \regArr_reg[3][7]  ( .D(n73), .SI(REG3[6]), .SE(n310), .CK(clk), 
        .RN(n286), .Q(REG3[7]) );
  SDFFSQX2M \regArr_reg[3][5]  ( .D(n71), .SI(REG3[4]), .SE(test_se), .CK(clk), 
        .SN(n280), .Q(REG3[5]) );
  SDFFRQX2M \regArr_reg[3][4]  ( .D(n70), .SI(REG3[3]), .SE(n308), .CK(clk), 
        .RN(n286), .Q(REG3[4]) );
  SDFFRQX2M \regArr_reg[3][2]  ( .D(n68), .SI(REG3[1]), .SE(n310), .CK(clk), 
        .RN(n288), .Q(REG3[2]) );
  SDFFRQX2M \regArr_reg[3][3]  ( .D(n69), .SI(REG3[2]), .SE(n311), .CK(clk), 
        .RN(n288), .Q(REG3[3]) );
  SDFFRQX2M \regArr_reg[3][1]  ( .D(n67), .SI(REG3[0]), .SE(n309), .CK(clk), 
        .RN(n288), .Q(REG3[1]) );
  SDFFSQX2M \regArr_reg[2][7]  ( .D(n65), .SI(REG2[6]), .SE(n308), .CK(clk), 
        .SN(n280), .Q(REG2[7]) );
  SDFFRQX2M \regArr_reg[2][2]  ( .D(n60), .SI(REG2[1]), .SE(n311), .CK(clk), 
        .RN(n287), .Q(REG2[2]) );
  SDFFRQX2M \regArr_reg[2][4]  ( .D(n62), .SI(REG2[3]), .SE(n309), .CK(clk), 
        .RN(n287), .Q(REG2[4]) );
  SDFFRQX2M \regArr_reg[2][6]  ( .D(n64), .SI(REG2[5]), .SE(n311), .CK(clk), 
        .RN(n288), .Q(REG2[6]) );
  SDFFRQX2M \regArr_reg[2][3]  ( .D(n61), .SI(REG2[2]), .SE(n308), .CK(clk), 
        .RN(n287), .Q(REG2[3]) );
  SDFFRQX2M \regArr_reg[2][5]  ( .D(n63), .SI(REG2[4]), .SE(n310), .CK(clk), 
        .RN(n288), .Q(REG2[5]) );
  SDFFRQX2M \regArr_reg[0][1]  ( .D(n43), .SI(REG0[0]), .SE(n311), .CK(clk), 
        .RN(n288), .Q(REG0[1]) );
  SDFFRQX2M \regArr_reg[0][0]  ( .D(n42), .SI(RdData[7]), .SE(n310), .CK(clk), 
        .RN(n288), .Q(REG0[0]) );
  SDFFRQX2M \regArr_reg[0][2]  ( .D(n44), .SI(REG0[1]), .SE(n308), .CK(clk), 
        .RN(n288), .Q(REG0[2]) );
  SDFFRQX2M \regArr_reg[0][3]  ( .D(n45), .SI(REG0[2]), .SE(n309), .CK(clk), 
        .RN(n288), .Q(REG0[3]) );
  SDFFRQX2M \regArr_reg[0][4]  ( .D(n46), .SI(REG0[3]), .SE(n310), .CK(clk), 
        .RN(n288), .Q(REG0[4]) );
  SDFFRQX2M \regArr_reg[0][5]  ( .D(n47), .SI(REG0[4]), .SE(n311), .CK(clk), 
        .RN(n288), .Q(REG0[5]) );
  SDFFRQX2M \regArr_reg[0][7]  ( .D(n49), .SI(REG0[6]), .SE(n309), .CK(clk), 
        .RN(n288), .Q(REG0[7]) );
  SDFFRQX2M \regArr_reg[0][6]  ( .D(n48), .SI(REG0[5]), .SE(n308), .CK(clk), 
        .RN(n280), .Q(REG0[6]) );
  SDFFRQX2M \regArr_reg[1][6]  ( .D(n56), .SI(REG1[5]), .SE(n308), .CK(clk), 
        .RN(n287), .Q(REG1[6]) );
  SDFFRQX2M \regArr_reg[1][1]  ( .D(n51), .SI(REG1[0]), .SE(n311), .CK(clk), 
        .RN(n289), .Q(REG1[1]) );
  SDFFRQX2M \regArr_reg[1][5]  ( .D(n55), .SI(REG1[4]), .SE(n311), .CK(clk), 
        .RN(n287), .Q(REG1[5]) );
  SDFFRQX2M \regArr_reg[1][4]  ( .D(n54), .SI(REG1[3]), .SE(n310), .CK(clk), 
        .RN(n287), .Q(REG1[4]) );
  SDFFRQX2M \regArr_reg[1][7]  ( .D(n57), .SI(REG1[6]), .SE(n309), .CK(clk), 
        .RN(n287), .Q(REG1[7]) );
  SDFFRQX2M \regArr_reg[1][3]  ( .D(n53), .SI(REG1[2]), .SE(n309), .CK(clk), 
        .RN(n287), .Q(REG1[3]) );
  SDFFRQX2M \regArr_reg[1][2]  ( .D(n52), .SI(REG1[1]), .SE(n308), .CK(clk), 
        .RN(n289), .Q(REG1[2]) );
  SDFFRQX2M \regArr_reg[1][0]  ( .D(n50), .SI(REG0[7]), .SE(n310), .CK(clk), 
        .RN(n288), .Q(REG1[0]) );
  DLY1X1M U315 ( .A(test_se), .Y(n308) );
  DLY1X1M U316 ( .A(test_se), .Y(n309) );
  DLY1X1M U317 ( .A(test_se), .Y(n310) );
  DLY1X1M U318 ( .A(test_se), .Y(n311) );
endmodule


module alu_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n18), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n18), .Y(n5) );
  NAND2X2M U15 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  NAND2X2M U17 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U18 ( .A(a[2]), .Y(n8) );
  NAND2X2M U19 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U20 ( .A(a[1]), .Y(n9) );
  NAND2X2M U21 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U22 ( .A(a[0]), .Y(n10) );
  NAND2X2M U23 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U24 ( .A(a[6]), .Y(n2) );
  INVX2M U25 ( .A(n18), .Y(n1) );
  XNOR2X2M U26 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(b[1]), .Y(n17) );
  INVX2M U29 ( .A(b[2]), .Y(n16) );
  INVX2M U30 ( .A(b[3]), .Y(n15) );
  INVX2M U31 ( .A(b[4]), .Y(n14) );
  INVX2M U32 ( .A(b[5]), .Y(n13) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module alu_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  XNOR2X2M U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module alu_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module alu_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n5), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n4), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n7), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n6), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  AND2X2M U2 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U15 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U16 ( .A(\ab[0][3] ), .Y(n19) );
  AND2X2M U17 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n18) );
  CLKXOR2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U23 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U24 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n14) );
  AND2X2M U25 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U27 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  XNOR2X2M U28 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U29 ( .A(\SUMB[7][1] ), .Y(n17) );
  CLKXOR2X2M U30 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U34 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  INVX2M U38 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U39 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U40 ( .A(A[3]), .Y(n36) );
  INVX2M U41 ( .A(A[2]), .Y(n37) );
  INVX2M U42 ( .A(A[4]), .Y(n35) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[6]), .Y(n33) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
  alu_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n13, n14, n12, n11, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
endmodule


module alu_test_1 ( a, b, EN, ALU_FUN, clk, rst, ALU_OUT, OUT_VaLID, test_si, 
        test_se );
  input [7:0] a;
  input [7:0] b;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, clk, rst, test_si, test_se;
  output OUT_VaLID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140;
  wire   [15:0] ALU_OUT_Comb;

  NOR3BX2M U3 ( .AN(n105), .B(n138), .C(ALU_FUN[2]), .Y(n49) );
  NOR3X2M U4 ( .A(n136), .B(ALU_FUN[2]), .C(n138), .Y(n35) );
  BUFX2M U7 ( .A(a[6]), .Y(n11) );
  OAI2BB1X2M U8 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U9 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U10 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U11 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U12 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U13 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U14 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  INVX2M U15 ( .A(EN), .Y(n140) );
  OAI2BB1X2M U16 ( .A0N(n139), .A1N(n105), .B0(n101), .Y(n47) );
  OAI2BB1X2M U17 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  NAND2X2M U18 ( .A(EN), .B(n123), .Y(n32) );
  INVX2M U19 ( .A(n107), .Y(n139) );
  NOR2BX2M U20 ( .AN(n106), .B(n136), .Y(n37) );
  AND2X2M U21 ( .A(n99), .B(n105), .Y(n42) );
  NOR2BX2M U22 ( .AN(n35), .B(n140), .Y(n31) );
  AND2X2M U23 ( .A(n106), .B(n105), .Y(n50) );
  BUFX2M U24 ( .A(n41), .Y(n13) );
  NOR2X2M U25 ( .A(n107), .B(n136), .Y(n41) );
  INVX2M U26 ( .A(n100), .Y(n136) );
  INVX2M U27 ( .A(n91), .Y(n137) );
  AOI31X2M U28 ( .A0(n93), .A1(n94), .A2(n95), .B0(n140), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U29 ( .A0(N100), .A1(n50), .B0(N91), .B1(n37), .Y(n93) );
  AOI211X2M U30 ( .A0(n13), .A1(n134), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X1M U31 ( .A0(N109), .A1(n35), .B0(n5), .B1(n42), .C0(N125), .C1(n49), 
        .Y(n94) );
  AOI31X2M U32 ( .A0(n81), .A1(n82), .A2(n83), .B0(n140), .Y(ALU_OUT_Comb[1])
         );
  AOI222X1M U33 ( .A0(N92), .A1(n37), .B0(N110), .B1(n35), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U34 ( .A0(n7), .A1(n137), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U35 ( .A0(N126), .A1(n49), .B0(n13), .B1(n133), .C0(n6), .C1(n42), 
        .Y(n82) );
  AOI31X2M U36 ( .A0(n75), .A1(n76), .A2(n77), .B0(n140), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U37 ( .A0(N102), .A1(n50), .B0(N93), .B1(n37), .Y(n75) );
  AOI221XLM U38 ( .A0(n8), .A1(n137), .B0(n13), .B1(n132), .C0(n78), .Y(n77)
         );
  AOI222X1M U39 ( .A0(N111), .A1(n35), .B0(n7), .B1(n42), .C0(N127), .C1(n49), 
        .Y(n76) );
  AOI31X2M U40 ( .A0(n69), .A1(n70), .A2(n71), .B0(n140), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U41 ( .A0(N103), .A1(n50), .B0(N94), .B1(n37), .Y(n69) );
  AOI221XLM U42 ( .A0(n9), .A1(n137), .B0(n13), .B1(n131), .C0(n72), .Y(n71)
         );
  AOI222X1M U43 ( .A0(N112), .A1(n35), .B0(n8), .B1(n42), .C0(N128), .C1(n49), 
        .Y(n70) );
  AOI31X2M U44 ( .A0(n63), .A1(n64), .A2(n65), .B0(n140), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U45 ( .A0(N104), .A1(n50), .B0(N95), .B1(n37), .Y(n63) );
  AOI221XLM U46 ( .A0(n137), .A1(n10), .B0(n13), .B1(n130), .C0(n66), .Y(n65)
         );
  AOI222X1M U47 ( .A0(N113), .A1(n35), .B0(n9), .B1(n42), .C0(N129), .C1(n49), 
        .Y(n64) );
  AOI31X2M U48 ( .A0(n57), .A1(n58), .A2(n59), .B0(n140), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U49 ( .A0(N105), .A1(n50), .B0(N96), .B1(n37), .Y(n57) );
  AOI221XLM U50 ( .A0(n137), .A1(n11), .B0(n13), .B1(n129), .C0(n60), .Y(n59)
         );
  AOI222X1M U51 ( .A0(N114), .A1(n35), .B0(n10), .B1(n42), .C0(N130), .C1(n49), 
        .Y(n58) );
  AOI31X2M U52 ( .A0(n51), .A1(n52), .A2(n53), .B0(n140), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U53 ( .A0(N106), .A1(n50), .B0(N97), .B1(n37), .Y(n51) );
  AOI221XLM U54 ( .A0(n137), .A1(n12), .B0(n13), .B1(n128), .C0(n54), .Y(n53)
         );
  AOI222X1M U55 ( .A0(N115), .A1(n35), .B0(n42), .B1(n11), .C0(N131), .C1(n49), 
        .Y(n52) );
  AOI31X2M U56 ( .A0(n38), .A1(n39), .A2(n40), .B0(n140), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U57 ( .A0(N107), .A1(n50), .B0(N98), .B1(n37), .Y(n38) );
  AOI221XLM U58 ( .A0(n13), .A1(n127), .B0(n42), .B1(n12), .C0(n43), .Y(n40)
         );
  AOI22X1M U59 ( .A0(N132), .A1(n49), .B0(N116), .B1(n35), .Y(n39) );
  AOI21X2M U60 ( .A0(n33), .A1(n34), .B0(n140), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U61 ( .A0(N99), .A1(n37), .B0(n123), .Y(n33) );
  AOI2BB2XLM U62 ( .B0(N117), .B1(n35), .A0N(n127), .A1N(n36), .Y(n34) );
  OAI222X1M U63 ( .A0(n55), .A1(n122), .B0(n4), .B1(n56), .C0(n36), .C1(n129), 
        .Y(n54) );
  AOI221XLM U64 ( .A0(n11), .A1(n46), .B0(n47), .B1(n128), .C0(n13), .Y(n56)
         );
  AOI221XLM U65 ( .A0(n46), .A1(n128), .B0(n11), .B1(n48), .C0(n42), .Y(n55)
         );
  NOR2X2M U66 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  AND3X2M U67 ( .A(n106), .B(n135), .C(n3), .Y(n46) );
  INVX2M U68 ( .A(n4), .Y(n122) );
  NAND2X2M U69 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  INVX2M U70 ( .A(ALU_FUN[0]), .Y(n135) );
  NOR2X2M U71 ( .A(n135), .B(n3), .Y(n105) );
  NOR2X2M U72 ( .A(n3), .B(ALU_FUN[0]), .Y(n100) );
  INVX2M U73 ( .A(n92), .Y(n123) );
  AOI211X2M U74 ( .A0(N108), .A1(n50), .B0(n13), .C0(n47), .Y(n92) );
  INVX2M U75 ( .A(ALU_FUN[1]), .Y(n138) );
  NAND3X2M U76 ( .A(n106), .B(ALU_FUN[0]), .C(n3), .Y(n101) );
  AND2X2M U77 ( .A(ALU_FUN[2]), .B(n138), .Y(n99) );
  AND4X2M U78 ( .A(N159), .B(n99), .C(n3), .D(n135), .Y(n90) );
  NAND3X2M U79 ( .A(n139), .B(n135), .C(n3), .Y(n36) );
  NAND3X2M U80 ( .A(n3), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  INVX2M U81 ( .A(n6), .Y(n133) );
  INVX2M U82 ( .A(n5), .Y(n134) );
  INVX2M U83 ( .A(n11), .Y(n128) );
  INVX2M U84 ( .A(n12), .Y(n127) );
  INVX2M U85 ( .A(n8), .Y(n131) );
  INVX2M U86 ( .A(n7), .Y(n132) );
  INVX2M U87 ( .A(n10), .Y(n129) );
  INVX2M U88 ( .A(n9), .Y(n130) );
  BUFX2M U89 ( .A(b[6]), .Y(n4) );
  BUFX2M U90 ( .A(a[7]), .Y(n12) );
  BUFX2M U91 ( .A(a[5]), .Y(n10) );
  BUFX2M U92 ( .A(a[4]), .Y(n9) );
  BUFX2M U93 ( .A(a[3]), .Y(n8) );
  BUFX2M U94 ( .A(a[2]), .Y(n7) );
  BUFX2M U95 ( .A(a[1]), .Y(n6) );
  BUFX2M U96 ( .A(a[0]), .Y(n5) );
  INVX2M U97 ( .A(n25), .Y(n120) );
  OAI222X1M U98 ( .A0(n79), .A1(n119), .B0(b[2]), .B1(n80), .C0(n36), .C1(n133), .Y(n78) );
  AOI221XLM U99 ( .A0(n7), .A1(n46), .B0(n47), .B1(n132), .C0(n13), .Y(n80) );
  AOI221XLM U100 ( .A0(n46), .A1(n132), .B0(n7), .B1(n48), .C0(n42), .Y(n79)
         );
  OAI222X1M U101 ( .A0(n73), .A1(n121), .B0(b[3]), .B1(n74), .C0(n36), .C1(
        n132), .Y(n72) );
  AOI221XLM U102 ( .A0(n8), .A1(n46), .B0(n47), .B1(n131), .C0(n13), .Y(n74)
         );
  AOI221XLM U103 ( .A0(n46), .A1(n131), .B0(n8), .B1(n48), .C0(n42), .Y(n73)
         );
  OAI222X1M U104 ( .A0(n67), .A1(n126), .B0(b[4]), .B1(n68), .C0(n36), .C1(
        n131), .Y(n66) );
  INVX2M U105 ( .A(b[4]), .Y(n126) );
  AOI221XLM U106 ( .A0(n9), .A1(n46), .B0(n47), .B1(n130), .C0(n13), .Y(n68)
         );
  AOI221XLM U107 ( .A0(n46), .A1(n130), .B0(n9), .B1(n48), .C0(n42), .Y(n67)
         );
  OAI222X1M U108 ( .A0(n61), .A1(n125), .B0(b[5]), .B1(n62), .C0(n36), .C1(
        n130), .Y(n60) );
  INVX2M U109 ( .A(b[5]), .Y(n125) );
  AOI221XLM U110 ( .A0(n10), .A1(n46), .B0(n47), .B1(n129), .C0(n13), .Y(n62)
         );
  AOI221XLM U111 ( .A0(n46), .A1(n129), .B0(n10), .B1(n48), .C0(n42), .Y(n61)
         );
  OAI222X1M U112 ( .A0(n44), .A1(n124), .B0(b[7]), .B1(n45), .C0(n36), .C1(
        n128), .Y(n43) );
  INVX2M U113 ( .A(b[7]), .Y(n124) );
  AOI221XLM U114 ( .A0(n46), .A1(n12), .B0(n47), .B1(n127), .C0(n13), .Y(n45)
         );
  AOI221XLM U115 ( .A0(n46), .A1(n127), .B0(n12), .B1(n48), .C0(n42), .Y(n44)
         );
  INVX2M U116 ( .A(n14), .Y(n118) );
  OAI21X2M U117 ( .A0(b[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI221XLM U118 ( .A0(n6), .A1(n46), .B0(n47), .B1(n133), .C0(n13), .Y(n87)
         );
  AOI31X2M U119 ( .A0(N158), .A1(n3), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U120 ( .A(n135), .B(ALU_FUN[2]), .C(n138), .Y(n89) );
  OAI2B2X1M U121 ( .A1N(b[0]), .A0(n98), .B0(n91), .B1(n133), .Y(n97) );
  AOI221XLM U122 ( .A0(n46), .A1(n134), .B0(n5), .B1(n48), .C0(n42), .Y(n98)
         );
  OAI2B2X1M U123 ( .A1N(b[1]), .A0(n86), .B0(n36), .B1(n134), .Y(n85) );
  AOI221XLM U124 ( .A0(n46), .A1(n133), .B0(n6), .B1(n48), .C0(n42), .Y(n86)
         );
  OAI21X2M U125 ( .A0(b[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI221XLM U126 ( .A0(n5), .A1(n46), .B0(n47), .B1(n134), .C0(n13), .Y(n102)
         );
  AOI31X2M U127 ( .A0(N157), .A1(n3), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U128 ( .A(n138), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  BUFX2M U129 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U130 ( .A(b[0]), .Y(n117) );
  INVX2M U131 ( .A(b[2]), .Y(n119) );
  INVX2M U132 ( .A(b[3]), .Y(n121) );
  NOR2X1M U133 ( .A(n127), .B(b[7]), .Y(n113) );
  NAND2BX1M U134 ( .AN(b[4]), .B(n9), .Y(n29) );
  NAND2BX1M U135 ( .AN(n9), .B(b[4]), .Y(n18) );
  CLKNAND2X2M U136 ( .A(n29), .B(n18), .Y(n108) );
  NOR2X1M U137 ( .A(n121), .B(n8), .Y(n26) );
  NOR2X1M U138 ( .A(n119), .B(n7), .Y(n17) );
  NOR2X1M U139 ( .A(n117), .B(n5), .Y(n14) );
  CLKNAND2X2M U140 ( .A(n7), .B(n119), .Y(n28) );
  NAND2BX1M U141 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U142 ( .A0(n14), .A1(n133), .B0(b[1]), .Y(n15) );
  AOI211X1M U143 ( .A0(n6), .A1(n118), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U144 ( .A(n8), .B(n121), .Y(n27) );
  OAI31X1M U145 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U146 ( .AN(n10), .B(b[5]), .Y(n111) );
  OAI211X1M U147 ( .A0(n108), .A1(n19), .B0(n18), .C0(n111), .Y(n20) );
  NAND2BX1M U148 ( .AN(b[5]), .B(n10), .Y(n30) );
  XNOR2X1M U149 ( .A(n11), .B(n4), .Y(n110) );
  AOI32X1M U150 ( .A0(n20), .A1(n30), .A2(n110), .B0(n4), .B1(n128), .Y(n21)
         );
  CLKNAND2X2M U151 ( .A(b[7]), .B(n127), .Y(n114) );
  OAI21X1M U152 ( .A0(n113), .A1(n21), .B0(n114), .Y(N159) );
  CLKNAND2X2M U153 ( .A(n5), .B(n117), .Y(n24) );
  OA21X1M U154 ( .A0(n24), .A1(n133), .B0(b[1]), .Y(n22) );
  AOI211X1M U155 ( .A0(n24), .A1(n133), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U156 ( .A0(n120), .A1(n28), .A2(n27), .B0(n26), .Y(n109) );
  OAI2B11X1M U157 ( .A1N(n109), .A0(n108), .B0(n30), .C0(n29), .Y(n112) );
  AOI32X1M U158 ( .A0(n112), .A1(n111), .A2(n110), .B0(n11), .B1(n122), .Y(
        n115) );
  AOI2B1X1M U159 ( .A1N(n115), .A0(n114), .B0(n113), .Y(n116) );
  CLKINVX1M U160 ( .A(n116), .Y(N158) );
  NOR2X1M U161 ( .A(N159), .B(N158), .Y(N157) );
  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .SI(ALU_OUT[14]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .SI(ALU_OUT[13]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .SI(ALU_OUT[12]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .SI(ALU_OUT[11]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .SI(ALU_OUT[10]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .SI(ALU_OUT[9]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .SI(ALU_OUT[8]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .SI(ALU_OUT[7]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[8]) );
  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .SI(ALU_OUT[6]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .SI(ALU_OUT[5]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .SI(ALU_OUT[4]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .SI(ALU_OUT[3]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .SI(ALU_OUT[2]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .SI(ALU_OUT[1]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .SI(ALU_OUT[0]), .SE(
        test_se), .CK(clk), .RN(rst), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .SI(test_si), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(ALU_OUT[0]) );
  SDFFRQX2M OUT_VaLID_reg ( .D(EN), .SI(ALU_OUT[15]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(OUT_VaLID) );
  alu_DW_div_uns_0 div_52 ( .a({n12, n11, n10, n9, n8, n7, n6, n5}), .b({b[7], 
        n4, b[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, N126, 
        N125}) );
  alu_DW01_sub_0 sub_46 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, n5}), .B({
        1'b0, b[7], n4, b[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, N105, 
        N104, N103, N102, N101, N100}) );
  alu_DW01_add_0 add_43 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, n5}), .B({
        1'b0, b[7], n4, b[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92, N91}) );
  alu_DW02_mult_0 mult_49 ( .A({n12, n11, n10, n9, n8, n7, n6, n5}), .B({b[7], 
        n4, b[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, N119, 
        N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP_DATA_WIDTH8_RF_ADDR4_NUM_OF_CHAINS3 ( scan_clk, scan_rst, 
        test_mode, SE, SI, So, RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, 
        parity_error, framing_error, test_si4 );
  input [2:0] SI;
  output [2:0] So;
  input scan_clk, scan_rst, test_mode, SE, RST_N, UART_CLK, REF_CLK,
         UART_RX_IN, test_si4;
  output UART_TX_O, parity_error, framing_error;
  wire   rst_mux, Sync_UART_RST, rst_uart_mux, Sync_REF_RST, rst_ref_mux,
         clk_uart_mux, clk_ref_mux, UART_TX_CLK, clk_div1_mux, UART_RX_CLK,
         clk_div2_mux, CLK_Gateing_EN, clk_gate_enable_or, UART_RX_Vaild_OUT,
         UART_RX_Vaild_Sync, UART_TX_Vaild, UART_TX_Busy_Pulse, FIFO_FULL,
         UART_TX_Vaild_Sync, UART_TX_Busy, RdData_Vaild, WrEn, RdEn, ALU_EN,
         ALU_OUT_Vaild, ALU_CLK, n1, n2, n3, n4, n5, n7, n8, n9, n12, n15, n16,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_Sync;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] UART_TX_Sync;
  wire   [7:0] Divider_Ratio;
  wire   [7:0] UART_Config;
  wire   [7:0] Divider_Ratio_RX;
  wire   [7:0] RdData;
  wire   [3:0] Address;
  wire   [7:0] WrData;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  INVX2M U2 ( .A(UART_TX_Vaild_Sync), .Y(n1) );
  INVX4M U3 ( .A(n3), .Y(n2) );
  INVX2M U4 ( .A(rst_ref_mux), .Y(n3) );
  INVX4M U5 ( .A(n5), .Y(n4) );
  INVX2M U6 ( .A(rst_uart_mux), .Y(n5) );
  INVXLM U12 ( .A(n3), .Y(n20) );
  INVXLM U13 ( .A(n34), .Y(n21) );
  INVXLM U14 ( .A(n21), .Y(n22) );
  INVXLM U15 ( .A(n21), .Y(n23) );
  INVXLM U16 ( .A(n21), .Y(n24) );
  DLY1X1M U17 ( .A(n27), .Y(n25) );
  INVXLM U18 ( .A(n33), .Y(n26) );
  INVXLM U19 ( .A(n26), .Y(n27) );
  DLY1X1M U20 ( .A(n30), .Y(n28) );
  INVXLM U21 ( .A(n35), .Y(n29) );
  INVXLM U22 ( .A(n29), .Y(n30) );
  INVXLM U23 ( .A(n29), .Y(n31) );
  INVXLM U24 ( .A(SE), .Y(n32) );
  INVXLM U25 ( .A(n32), .Y(n33) );
  INVXLM U26 ( .A(n32), .Y(n34) );
  INVXLM U27 ( .A(n32), .Y(n35) );
  mux_rst_0 U0_mux_rst ( .IN_0(RST_N), .IN_1(scan_rst), .SEL(test_mode), .OUT(
        rst_mux) );
  mux_rst_2 U1_mux_rst ( .IN_0(Sync_UART_RST), .IN_1(scan_rst), .SEL(test_mode), .OUT(rst_uart_mux) );
  mux_rst_1 U2_mux_rst ( .IN_0(Sync_REF_RST), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(rst_ref_mux) );
  mux_uart U0_mux_uart ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(clk_uart_mux) );
  mux_ref U0_mux_ref ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        clk_ref_mux) );
  mux_div_0 U0_mux_div ( .IN_0(UART_TX_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(clk_div1_mux) );
  mux_div_1 U1_mux_div ( .IN_0(UART_RX_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(clk_div2_mux) );
  or_clk_gate U0_or_clk_gate ( .IN_0(CLK_Gateing_EN), .IN_1(test_mode), .OUT(
        clk_gate_enable_or) );
  RST_Synchronizer_NUM_STAGES2_test_0 U1_RST_Synchronizer ( .clk(clk_ref_mux), 
        .rst(rst_mux), .SYNC_RST(Sync_REF_RST), .test_si(n8), .test_se(n33) );
  RST_Synchronizer_NUM_STAGES2_test_1 U2_RST_Synchronizer ( .clk(clk_uart_mux), 
        .rst(rst_mux), .SYNC_RST(Sync_UART_RST), .test_si(Sync_REF_RST), 
        .test_se(n31) );
  Data_Synchronizer_NUM_STAGES2_BUS_WIDTH8_test_1 U0_Data_Synchronizer ( 
        .unsync_bus(UART_RX_OUT), .bus_enable(UART_RX_Vaild_OUT), .clk(
        clk_ref_mux), .rst(n2), .sync_bus(UART_RX_Sync), .enable_pluse(
        UART_RX_Vaild_Sync), .test_si(n16), .test_se(n35) );
  ASYNC_FIFO_DATA_WIDTH8_P_SIZE4_F_DEPTH8_test_1 U0_ASYNC_FIFO ( .W_CLK(
        clk_ref_mux), .W_RST(n20), .W_INC(UART_TX_Vaild), .R_CLK(clk_div1_mux), 
        .R_RST(n4), .R_INC(UART_TX_Busy_Pulse), .WR_DATA(UART_TX_IN), 
        .RD_DATA(UART_TX_Sync), .FULL(FIFO_FULL), .EMPTY(UART_TX_Vaild_Sync), 
        .test_si2(SI[1]), .test_si1(SI[2]), .test_so2(n16), .test_so1(So[2]), 
        .test_se(SE) );
  PULSE_GEN_test_1 U0_PULSE_GEN ( .clk(clk_div1_mux), .rst(n4), .lvl_sig(
        UART_TX_Busy), .pulse_sig(UART_TX_Busy_Pulse), .test_si(
        UART_RX_Sync[7]), .test_so(n15), .test_se(n24) );
  Clock_Divider_test_1 UO_Clock_Divider ( .i_ref_clk(clk_uart_mux), .i_rst_n(
        n4), .i_clk_en(1'b1), .i_div_ratio(Divider_Ratio), .o_div_clk(
        UART_TX_CLK), .test_si(Sync_UART_RST), .test_so(n7), .test_se(n23) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        Divider_Ratio_RX[3:0]}) );
  Clock_Divider_test_0 U1_Clock_Divider ( .i_ref_clk(clk_uart_mux), .i_rst_n(
        n4), .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        Divider_Ratio_RX[3:0]}), .o_div_clk(UART_RX_CLK), .test_si(
        ALU_OUT_Vaild), .test_so(n8), .test_se(n31) );
  UART_test_1 U0_UART ( .RST(n4), .TX_CLK(clk_div1_mux), .RX_CLK(clk_div2_mux), 
        .RX_IN_S(UART_RX_IN), .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(
        UART_RX_Vaild_OUT), .TX_IN_P(UART_TX_Sync), .TX_IN_V(n1), .TX_OUT_S(
        UART_TX_O), .TX_OUT_V(UART_TX_Busy), .Prescale(UART_Config[7:2]), 
        .parity_enable(UART_Config[0]), .parity_type(UART_Config[1]), 
        .parity_error(parity_error), .framing_error(framing_error), .test_si2(
        n7), .test_si1(test_si4), .test_so1(n9), .test_se(n28) );
  SYS_CTRL_test_1 U0_SYS_CTRL ( .CLK(clk_ref_mux), .RST(n2), .RF_RdData(RdData), .RF_RdData_VLD(RdData_Vaild), .ALU_OUT(ALU_OUT), .ALU_OUT_VLD(ALU_OUT_Vaild), 
        .FIFO_FULL(FIFO_FULL), .UART_RX_DATA(UART_RX_Sync), .UART_RX_VLD(
        UART_RX_Vaild_Sync), .RF_WrEn(WrEn), .RF_RdEn(RdEn), .RF_Address(
        Address), .RF_WrData(WrData), .ALU_EN(ALU_EN), .ALU_FUN(ALU_FUN), 
        .CLKG_EN(CLK_Gateing_EN), .UART_TX_DATA(UART_TX_IN), .UART_TX_VLD(
        UART_TX_Vaild), .test_si(n12), .test_so(So[0]), .test_se(n25) );
  RegFile_test_1 U0_RegFile ( .clk(clk_ref_mux), .rst(n20), .WrEn(WrEn), 
        .RdEn(RdEn), .Address(Address), .WrData(WrData), .RdData(RdData), 
        .RdData_VLD(RdData_Vaild), .REG0(Operand_A), .REG1(Operand_B), .REG2(
        UART_Config), .REG3(Divider_Ratio), .test_si2(SI[0]), .test_si1(n15), 
        .test_so2(n12), .test_so1(So[1]), .test_se(SE) );
  alu_test_1 U0_alu ( .a(Operand_A), .b(Operand_B), .EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .clk(ALU_CLK), .rst(n2), .ALU_OUT(ALU_OUT), .OUT_VaLID(
        ALU_OUT_Vaild), .test_si(n9), .test_se(n22) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(clk_gate_enable_or), .CLK(clk_ref_mux), 
        .GATED_CLK(ALU_CLK) );
endmodule

