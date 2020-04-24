// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Apr 24 21:56:09 2020
// Host        : ASUS-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/Pedro/Dropbox/UA/CR/Labs/Lab5/CountDownTimerCustomHw/CountDownTimerCustomHw.srcs/sources_1/bd/mb_design/ip/mb_design_Nexys4DisplayDriver_0_0/mb_design_Nexys4DisplayDriver_0_0_sim_netlist.v
// Design      : mb_design_Nexys4DisplayDriver_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mb_design_Nexys4DisplayDriver_0_0,Nexys4DisplayDriver_v1_0,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "Nexys4DisplayDriver_v1_0,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module mb_design_Nexys4DisplayDriver_0_0
   (dispEn_n,
    dispSeg_n,
    dispPt_n,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  output [7:0]dispEn_n;
  output [6:0]dispSeg_n;
  output dispPt_n;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0" *) input s00_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* x_interface_parameter = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [3:0]s00_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) input s00_axi_rready;

  wire \<const0> ;
  wire [7:0]dispEn_n;
  wire dispPt_n;
  wire [6:0]dispSeg_n;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  mb_design_Nexys4DisplayDriver_0_0_Nexys4DisplayDriver_v1_0 U0
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WREADY(s00_axi_wready),
        .dispEn_n(dispEn_n),
        .dispPt_n(dispPt_n),
        .dispSeg_n(dispSeg_n),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "Nexys4DisplayDriver" *) 
module mb_design_Nexys4DisplayDriver_0_0_Nexys4DisplayDriver
   (dispSeg_n,
    dispPt_n,
    dispEn_n,
    Q,
    \dispSeg_n[6]_INST_0_i_4_0 ,
    s_clkEnable,
    s00_axi_aclk);
  output [6:0]dispSeg_n;
  output dispPt_n;
  output [7:0]dispEn_n;
  input [15:0]Q;
  input [31:0]\dispSeg_n[6]_INST_0_i_4_0 ;
  input s_clkEnable;
  input s00_axi_aclk;

  wire [15:0]Q;
  wire [7:0]dispEn_n;
  wire dispPt_n;
  wire dispPt_n_INST_0_i_1_n_0;
  wire dispPt_n_INST_0_i_2_n_0;
  wire [6:0]dispSeg_n;
  wire \dispSeg_n[6]_INST_0_i_10_n_0 ;
  wire \dispSeg_n[6]_INST_0_i_11_n_0 ;
  wire \dispSeg_n[6]_INST_0_i_12_n_0 ;
  wire \dispSeg_n[6]_INST_0_i_13_n_0 ;
  wire \dispSeg_n[6]_INST_0_i_14_n_0 ;
  wire \dispSeg_n[6]_INST_0_i_15_n_0 ;
  wire [31:0]\dispSeg_n[6]_INST_0_i_4_0 ;
  wire \dispSeg_n[6]_INST_0_i_6_n_0 ;
  wire \dispSeg_n[6]_INST_0_i_7_n_0 ;
  wire \dispSeg_n[6]_INST_0_i_8_n_0 ;
  wire \dispSeg_n[6]_INST_0_i_9_n_0 ;
  wire s00_axi_aclk;
  wire s_clkEnable;
  wire [2:0]s_counter;
  wire \s_counter[0]_i_1_n_0 ;
  wire \s_counter[1]_i_1_n_0 ;
  wire \s_counter[2]_i_1_n_0 ;
  wire [3:0]s_currentV__27;
  wire s_enableDigit__6;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \dispEn_n[0]_INST_0 
       (.I0(s_counter[1]),
        .I1(s_counter[2]),
        .I2(s_counter[0]),
        .O(dispEn_n[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \dispEn_n[1]_INST_0 
       (.I0(s_counter[1]),
        .I1(s_counter[2]),
        .I2(s_counter[0]),
        .O(dispEn_n[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \dispEn_n[2]_INST_0 
       (.I0(s_counter[2]),
        .I1(s_counter[0]),
        .I2(s_counter[1]),
        .O(dispEn_n[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \dispEn_n[3]_INST_0 
       (.I0(s_counter[1]),
        .I1(s_counter[0]),
        .I2(s_counter[2]),
        .O(dispEn_n[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \dispEn_n[4]_INST_0 
       (.I0(s_counter[1]),
        .I1(s_counter[0]),
        .I2(s_counter[2]),
        .O(dispEn_n[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \dispEn_n[5]_INST_0 
       (.I0(s_counter[2]),
        .I1(s_counter[0]),
        .I2(s_counter[1]),
        .O(dispEn_n[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \dispEn_n[6]_INST_0 
       (.I0(s_counter[1]),
        .I1(s_counter[2]),
        .I2(s_counter[0]),
        .O(dispEn_n[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \dispEn_n[7]_INST_0 
       (.I0(s_counter[2]),
        .I1(s_counter[0]),
        .I2(s_counter[1]),
        .O(dispEn_n[7]));
  MUXF7 dispPt_n_INST_0
       (.I0(dispPt_n_INST_0_i_1_n_0),
        .I1(dispPt_n_INST_0_i_2_n_0),
        .O(dispPt_n),
        .S(s_counter[2]));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    dispPt_n_INST_0_i_1
       (.I0(Q[11]),
        .I1(Q[10]),
        .I2(s_counter[1]),
        .I3(Q[9]),
        .I4(s_counter[0]),
        .I5(Q[8]),
        .O(dispPt_n_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    dispPt_n_INST_0_i_2
       (.I0(Q[15]),
        .I1(Q[14]),
        .I2(s_counter[1]),
        .I3(Q[13]),
        .I4(s_counter[0]),
        .I5(Q[12]),
        .O(dispPt_n_INST_0_i_2_n_0));
  LUT5 #(
    .INIT(32'h4814FFFF)) 
    \dispSeg_n[0]_INST_0 
       (.I0(s_currentV__27[1]),
        .I1(s_currentV__27[0]),
        .I2(s_currentV__27[2]),
        .I3(s_currentV__27[3]),
        .I4(s_enableDigit__6),
        .O(dispSeg_n[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hD860FFFF)) 
    \dispSeg_n[1]_INST_0 
       (.I0(s_currentV__27[0]),
        .I1(s_currentV__27[1]),
        .I2(s_currentV__27[2]),
        .I3(s_currentV__27[3]),
        .I4(s_enableDigit__6),
        .O(dispSeg_n[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h8A04FFFF)) 
    \dispSeg_n[2]_INST_0 
       (.I0(s_currentV__27[2]),
        .I1(s_currentV__27[1]),
        .I2(s_currentV__27[0]),
        .I3(s_currentV__27[3]),
        .I4(s_enableDigit__6),
        .O(dispSeg_n[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h8294FFFF)) 
    \dispSeg_n[3]_INST_0 
       (.I0(s_currentV__27[1]),
        .I1(s_currentV__27[0]),
        .I2(s_currentV__27[2]),
        .I3(s_currentV__27[3]),
        .I4(s_enableDigit__6),
        .O(dispSeg_n[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h02AEFFFF)) 
    \dispSeg_n[4]_INST_0 
       (.I0(s_currentV__27[0]),
        .I1(s_currentV__27[2]),
        .I2(s_currentV__27[1]),
        .I3(s_currentV__27[3]),
        .I4(s_enableDigit__6),
        .O(dispSeg_n[4]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h408EFFFF)) 
    \dispSeg_n[5]_INST_0 
       (.I0(s_currentV__27[1]),
        .I1(s_currentV__27[0]),
        .I2(s_currentV__27[2]),
        .I3(s_currentV__27[3]),
        .I4(s_enableDigit__6),
        .O(dispSeg_n[5]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0491FFFF)) 
    \dispSeg_n[6]_INST_0 
       (.I0(s_currentV__27[1]),
        .I1(s_currentV__27[2]),
        .I2(s_currentV__27[0]),
        .I3(s_currentV__27[3]),
        .I4(s_enableDigit__6),
        .O(dispSeg_n[6]));
  MUXF7 \dispSeg_n[6]_INST_0_i_1 
       (.I0(\dispSeg_n[6]_INST_0_i_6_n_0 ),
        .I1(\dispSeg_n[6]_INST_0_i_7_n_0 ),
        .O(s_currentV__27[1]),
        .S(s_counter[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dispSeg_n[6]_INST_0_i_10 
       (.I0(\dispSeg_n[6]_INST_0_i_4_0 [12]),
        .I1(\dispSeg_n[6]_INST_0_i_4_0 [8]),
        .I2(s_counter[1]),
        .I3(\dispSeg_n[6]_INST_0_i_4_0 [4]),
        .I4(s_counter[0]),
        .I5(\dispSeg_n[6]_INST_0_i_4_0 [0]),
        .O(\dispSeg_n[6]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dispSeg_n[6]_INST_0_i_11 
       (.I0(\dispSeg_n[6]_INST_0_i_4_0 [28]),
        .I1(\dispSeg_n[6]_INST_0_i_4_0 [24]),
        .I2(s_counter[1]),
        .I3(\dispSeg_n[6]_INST_0_i_4_0 [20]),
        .I4(s_counter[0]),
        .I5(\dispSeg_n[6]_INST_0_i_4_0 [16]),
        .O(\dispSeg_n[6]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dispSeg_n[6]_INST_0_i_12 
       (.I0(\dispSeg_n[6]_INST_0_i_4_0 [15]),
        .I1(\dispSeg_n[6]_INST_0_i_4_0 [11]),
        .I2(s_counter[1]),
        .I3(\dispSeg_n[6]_INST_0_i_4_0 [7]),
        .I4(s_counter[0]),
        .I5(\dispSeg_n[6]_INST_0_i_4_0 [3]),
        .O(\dispSeg_n[6]_INST_0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dispSeg_n[6]_INST_0_i_13 
       (.I0(\dispSeg_n[6]_INST_0_i_4_0 [31]),
        .I1(\dispSeg_n[6]_INST_0_i_4_0 [27]),
        .I2(s_counter[1]),
        .I3(\dispSeg_n[6]_INST_0_i_4_0 [23]),
        .I4(s_counter[0]),
        .I5(\dispSeg_n[6]_INST_0_i_4_0 [19]),
        .O(\dispSeg_n[6]_INST_0_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dispSeg_n[6]_INST_0_i_14 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(s_counter[1]),
        .I3(Q[1]),
        .I4(s_counter[0]),
        .I5(Q[0]),
        .O(\dispSeg_n[6]_INST_0_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dispSeg_n[6]_INST_0_i_15 
       (.I0(Q[7]),
        .I1(Q[6]),
        .I2(s_counter[1]),
        .I3(Q[5]),
        .I4(s_counter[0]),
        .I5(Q[4]),
        .O(\dispSeg_n[6]_INST_0_i_15_n_0 ));
  MUXF7 \dispSeg_n[6]_INST_0_i_2 
       (.I0(\dispSeg_n[6]_INST_0_i_8_n_0 ),
        .I1(\dispSeg_n[6]_INST_0_i_9_n_0 ),
        .O(s_currentV__27[2]),
        .S(s_counter[2]));
  MUXF7 \dispSeg_n[6]_INST_0_i_3 
       (.I0(\dispSeg_n[6]_INST_0_i_10_n_0 ),
        .I1(\dispSeg_n[6]_INST_0_i_11_n_0 ),
        .O(s_currentV__27[0]),
        .S(s_counter[2]));
  MUXF7 \dispSeg_n[6]_INST_0_i_4 
       (.I0(\dispSeg_n[6]_INST_0_i_12_n_0 ),
        .I1(\dispSeg_n[6]_INST_0_i_13_n_0 ),
        .O(s_currentV__27[3]),
        .S(s_counter[2]));
  MUXF7 \dispSeg_n[6]_INST_0_i_5 
       (.I0(\dispSeg_n[6]_INST_0_i_14_n_0 ),
        .I1(\dispSeg_n[6]_INST_0_i_15_n_0 ),
        .O(s_enableDigit__6),
        .S(s_counter[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dispSeg_n[6]_INST_0_i_6 
       (.I0(\dispSeg_n[6]_INST_0_i_4_0 [13]),
        .I1(\dispSeg_n[6]_INST_0_i_4_0 [9]),
        .I2(s_counter[1]),
        .I3(\dispSeg_n[6]_INST_0_i_4_0 [5]),
        .I4(s_counter[0]),
        .I5(\dispSeg_n[6]_INST_0_i_4_0 [1]),
        .O(\dispSeg_n[6]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dispSeg_n[6]_INST_0_i_7 
       (.I0(\dispSeg_n[6]_INST_0_i_4_0 [29]),
        .I1(\dispSeg_n[6]_INST_0_i_4_0 [25]),
        .I2(s_counter[1]),
        .I3(\dispSeg_n[6]_INST_0_i_4_0 [21]),
        .I4(s_counter[0]),
        .I5(\dispSeg_n[6]_INST_0_i_4_0 [17]),
        .O(\dispSeg_n[6]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dispSeg_n[6]_INST_0_i_8 
       (.I0(\dispSeg_n[6]_INST_0_i_4_0 [14]),
        .I1(\dispSeg_n[6]_INST_0_i_4_0 [10]),
        .I2(s_counter[1]),
        .I3(\dispSeg_n[6]_INST_0_i_4_0 [6]),
        .I4(s_counter[0]),
        .I5(\dispSeg_n[6]_INST_0_i_4_0 [2]),
        .O(\dispSeg_n[6]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dispSeg_n[6]_INST_0_i_9 
       (.I0(\dispSeg_n[6]_INST_0_i_4_0 [30]),
        .I1(\dispSeg_n[6]_INST_0_i_4_0 [26]),
        .I2(s_counter[1]),
        .I3(\dispSeg_n[6]_INST_0_i_4_0 [22]),
        .I4(s_counter[0]),
        .I5(\dispSeg_n[6]_INST_0_i_4_0 [18]),
        .O(\dispSeg_n[6]_INST_0_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \s_counter[0]_i_1 
       (.I0(s_clkEnable),
        .I1(s_counter[0]),
        .O(\s_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \s_counter[1]_i_1 
       (.I0(s_counter[0]),
        .I1(s_clkEnable),
        .I2(s_counter[1]),
        .O(\s_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \s_counter[2]_i_1 
       (.I0(s_counter[1]),
        .I1(s_counter[0]),
        .I2(s_clkEnable),
        .I3(s_counter[2]),
        .O(\s_counter[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s_counter_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\s_counter[0]_i_1_n_0 ),
        .Q(s_counter[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s_counter_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\s_counter[1]_i_1_n_0 ),
        .Q(s_counter[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s_counter_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\s_counter[2]_i_1_n_0 ),
        .Q(s_counter[2]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "Nexys4DisplayDriver_v1_0" *) 
module mb_design_Nexys4DisplayDriver_0_0_Nexys4DisplayDriver_v1_0
   (dispSeg_n,
    S_AXI_AWREADY,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    dispPt_n,
    dispEn_n,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wstrb,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output [6:0]dispSeg_n;
  output S_AXI_AWREADY;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output dispPt_n;
  output [7:0]dispEn_n;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire [7:0]dispEn_n;
  wire dispPt_n;
  wire [6:0]dispSeg_n;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  mb_design_Nexys4DisplayDriver_0_0_Nexys4DisplayDriver_v1_0_S00_AXI Nexys4DisplayDriver_v1_0_S00_AXI_inst
       (.S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WREADY(S_AXI_WREADY),
        .dispEn_n(dispEn_n),
        .dispPt_n(dispPt_n),
        .dispSeg_n(dispSeg_n),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "Nexys4DisplayDriver_v1_0_S00_AXI" *) 
module mb_design_Nexys4DisplayDriver_0_0_Nexys4DisplayDriver_v1_0_S00_AXI
   (dispSeg_n,
    S_AXI_AWREADY,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    dispPt_n,
    dispEn_n,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wstrb,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output [6:0]dispSeg_n;
  output S_AXI_AWREADY;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output dispPt_n;
  output [7:0]dispEn_n;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire [3:0]data1;
  wire [3:0]data2;
  wire [3:0]data3;
  wire [3:0]data4;
  wire [3:0]data5;
  wire [3:0]data6;
  wire [3:0]data7;
  wire [7:0]dispEn_n;
  wire dispPt_n;
  wire [6:0]dispSeg_n;
  wire [1:0]p_0_in;
  wire [31:7]p_1_in;
  wire [31:0]reg_data_out;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire s_clkEnable;
  wire s_clkEnable_0;
  wire [31:0]s_clkEnbCnt;
  wire \s_clkEnbCnt[31]_i_10_n_0 ;
  wire \s_clkEnbCnt[31]_i_2_n_0 ;
  wire \s_clkEnbCnt[31]_i_3_n_0 ;
  wire \s_clkEnbCnt[31]_i_4_n_0 ;
  wire \s_clkEnbCnt[31]_i_5_n_0 ;
  wire \s_clkEnbCnt[31]_i_7_n_0 ;
  wire \s_clkEnbCnt[31]_i_8_n_0 ;
  wire \s_clkEnbCnt[31]_i_9_n_0 ;
  wire [31:0]s_clkEnbCnt_1;
  wire \s_clkEnbCnt_reg[12]_i_2_n_0 ;
  wire \s_clkEnbCnt_reg[12]_i_2_n_1 ;
  wire \s_clkEnbCnt_reg[12]_i_2_n_2 ;
  wire \s_clkEnbCnt_reg[12]_i_2_n_3 ;
  wire \s_clkEnbCnt_reg[12]_i_2_n_4 ;
  wire \s_clkEnbCnt_reg[12]_i_2_n_5 ;
  wire \s_clkEnbCnt_reg[12]_i_2_n_6 ;
  wire \s_clkEnbCnt_reg[12]_i_2_n_7 ;
  wire \s_clkEnbCnt_reg[16]_i_2_n_0 ;
  wire \s_clkEnbCnt_reg[16]_i_2_n_1 ;
  wire \s_clkEnbCnt_reg[16]_i_2_n_2 ;
  wire \s_clkEnbCnt_reg[16]_i_2_n_3 ;
  wire \s_clkEnbCnt_reg[16]_i_2_n_4 ;
  wire \s_clkEnbCnt_reg[16]_i_2_n_5 ;
  wire \s_clkEnbCnt_reg[16]_i_2_n_6 ;
  wire \s_clkEnbCnt_reg[16]_i_2_n_7 ;
  wire \s_clkEnbCnt_reg[20]_i_2_n_0 ;
  wire \s_clkEnbCnt_reg[20]_i_2_n_1 ;
  wire \s_clkEnbCnt_reg[20]_i_2_n_2 ;
  wire \s_clkEnbCnt_reg[20]_i_2_n_3 ;
  wire \s_clkEnbCnt_reg[20]_i_2_n_4 ;
  wire \s_clkEnbCnt_reg[20]_i_2_n_5 ;
  wire \s_clkEnbCnt_reg[20]_i_2_n_6 ;
  wire \s_clkEnbCnt_reg[20]_i_2_n_7 ;
  wire \s_clkEnbCnt_reg[24]_i_2_n_0 ;
  wire \s_clkEnbCnt_reg[24]_i_2_n_1 ;
  wire \s_clkEnbCnt_reg[24]_i_2_n_2 ;
  wire \s_clkEnbCnt_reg[24]_i_2_n_3 ;
  wire \s_clkEnbCnt_reg[24]_i_2_n_4 ;
  wire \s_clkEnbCnt_reg[24]_i_2_n_5 ;
  wire \s_clkEnbCnt_reg[24]_i_2_n_6 ;
  wire \s_clkEnbCnt_reg[24]_i_2_n_7 ;
  wire \s_clkEnbCnt_reg[28]_i_2_n_0 ;
  wire \s_clkEnbCnt_reg[28]_i_2_n_1 ;
  wire \s_clkEnbCnt_reg[28]_i_2_n_2 ;
  wire \s_clkEnbCnt_reg[28]_i_2_n_3 ;
  wire \s_clkEnbCnt_reg[28]_i_2_n_4 ;
  wire \s_clkEnbCnt_reg[28]_i_2_n_5 ;
  wire \s_clkEnbCnt_reg[28]_i_2_n_6 ;
  wire \s_clkEnbCnt_reg[28]_i_2_n_7 ;
  wire \s_clkEnbCnt_reg[31]_i_6_n_2 ;
  wire \s_clkEnbCnt_reg[31]_i_6_n_3 ;
  wire \s_clkEnbCnt_reg[31]_i_6_n_5 ;
  wire \s_clkEnbCnt_reg[31]_i_6_n_6 ;
  wire \s_clkEnbCnt_reg[31]_i_6_n_7 ;
  wire \s_clkEnbCnt_reg[4]_i_2_n_0 ;
  wire \s_clkEnbCnt_reg[4]_i_2_n_1 ;
  wire \s_clkEnbCnt_reg[4]_i_2_n_2 ;
  wire \s_clkEnbCnt_reg[4]_i_2_n_3 ;
  wire \s_clkEnbCnt_reg[4]_i_2_n_4 ;
  wire \s_clkEnbCnt_reg[4]_i_2_n_5 ;
  wire \s_clkEnbCnt_reg[4]_i_2_n_6 ;
  wire \s_clkEnbCnt_reg[4]_i_2_n_7 ;
  wire \s_clkEnbCnt_reg[8]_i_2_n_0 ;
  wire \s_clkEnbCnt_reg[8]_i_2_n_1 ;
  wire \s_clkEnbCnt_reg[8]_i_2_n_2 ;
  wire \s_clkEnbCnt_reg[8]_i_2_n_3 ;
  wire \s_clkEnbCnt_reg[8]_i_2_n_4 ;
  wire \s_clkEnbCnt_reg[8]_i_2_n_5 ;
  wire \s_clkEnbCnt_reg[8]_i_2_n_6 ;
  wire \s_clkEnbCnt_reg[8]_i_2_n_7 ;
  wire [31:0]slv_reg0;
  wire \slv_reg0[15]_i_1_n_0 ;
  wire \slv_reg0[23]_i_1_n_0 ;
  wire \slv_reg0[31]_i_1_n_0 ;
  wire \slv_reg0[7]_i_1_n_0 ;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire \slv_reg1_reg_n_0_[0] ;
  wire \slv_reg1_reg_n_0_[1] ;
  wire \slv_reg1_reg_n_0_[2] ;
  wire \slv_reg1_reg_n_0_[3] ;
  wire [31:0]slv_reg2;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire [31:0]slv_reg3;
  wire slv_reg_rden;
  wire slv_reg_wren__2;
  wire [3:2]\NLW_s_clkEnbCnt_reg[31]_i_6_CO_UNCONNECTED ;
  wire [3:3]\NLW_s_clkEnbCnt_reg[31]_i_6_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hBFFFBF00BF00BF00)) 
    aw_en_i_1
       (.I0(S_AXI_AWREADY),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_wvalid),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDSE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .S(axi_awready_i_1_n_0));
  FDSE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .S(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(aw_en_reg_n_0),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .I4(S_AXI_AWREADY),
        .I5(p_0_in[0]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(aw_en_reg_n_0),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .I4(S_AXI_AWREADY),
        .I5(p_0_in[1]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(p_0_in[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(p_0_in[1]),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    axi_awready_i_2
       (.I0(aw_en_reg_n_0),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awvalid),
        .I3(S_AXI_AWREADY),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(S_AXI_AWREADY),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_WREADY),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[0]_i_1 
       (.I0(\slv_reg1_reg_n_0_[0] ),
        .I1(slv_reg0[0]),
        .I2(slv_reg3[0]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[0]),
        .O(reg_data_out[0]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[10]_i_1 
       (.I0(data2[2]),
        .I1(slv_reg0[10]),
        .I2(slv_reg3[10]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[10]),
        .O(reg_data_out[10]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[11]_i_1 
       (.I0(data2[3]),
        .I1(slv_reg0[11]),
        .I2(slv_reg3[11]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[11]),
        .O(reg_data_out[11]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[12]_i_1 
       (.I0(data3[0]),
        .I1(slv_reg0[12]),
        .I2(slv_reg3[12]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[12]),
        .O(reg_data_out[12]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[13]_i_1 
       (.I0(data3[1]),
        .I1(slv_reg0[13]),
        .I2(slv_reg3[13]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[13]),
        .O(reg_data_out[13]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[14]_i_1 
       (.I0(data3[2]),
        .I1(slv_reg0[14]),
        .I2(slv_reg3[14]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[14]),
        .O(reg_data_out[14]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[15]_i_1 
       (.I0(data3[3]),
        .I1(slv_reg0[15]),
        .I2(slv_reg3[15]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[15]),
        .O(reg_data_out[15]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[16]_i_1 
       (.I0(data4[0]),
        .I1(slv_reg0[16]),
        .I2(slv_reg3[16]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[16]),
        .O(reg_data_out[16]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[17]_i_1 
       (.I0(data4[1]),
        .I1(slv_reg0[17]),
        .I2(slv_reg3[17]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[17]),
        .O(reg_data_out[17]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[18]_i_1 
       (.I0(data4[2]),
        .I1(slv_reg0[18]),
        .I2(slv_reg3[18]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[18]),
        .O(reg_data_out[18]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[19]_i_1 
       (.I0(data4[3]),
        .I1(slv_reg0[19]),
        .I2(slv_reg3[19]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[19]),
        .O(reg_data_out[19]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[1]_i_1 
       (.I0(\slv_reg1_reg_n_0_[1] ),
        .I1(slv_reg0[1]),
        .I2(slv_reg3[1]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[1]),
        .O(reg_data_out[1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[20]_i_1 
       (.I0(data5[0]),
        .I1(slv_reg0[20]),
        .I2(slv_reg3[20]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[20]),
        .O(reg_data_out[20]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[21]_i_1 
       (.I0(data5[1]),
        .I1(slv_reg0[21]),
        .I2(slv_reg3[21]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[21]),
        .O(reg_data_out[21]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[22]_i_1 
       (.I0(data5[2]),
        .I1(slv_reg0[22]),
        .I2(slv_reg3[22]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[22]),
        .O(reg_data_out[22]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[23]_i_1 
       (.I0(data5[3]),
        .I1(slv_reg0[23]),
        .I2(slv_reg3[23]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[23]),
        .O(reg_data_out[23]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[24]_i_1 
       (.I0(data6[0]),
        .I1(slv_reg0[24]),
        .I2(slv_reg3[24]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[24]),
        .O(reg_data_out[24]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[25]_i_1 
       (.I0(data6[1]),
        .I1(slv_reg0[25]),
        .I2(slv_reg3[25]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[25]),
        .O(reg_data_out[25]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[26]_i_1 
       (.I0(data6[2]),
        .I1(slv_reg0[26]),
        .I2(slv_reg3[26]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[26]),
        .O(reg_data_out[26]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[27]_i_1 
       (.I0(data6[3]),
        .I1(slv_reg0[27]),
        .I2(slv_reg3[27]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[27]),
        .O(reg_data_out[27]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[28]_i_1 
       (.I0(data7[0]),
        .I1(slv_reg0[28]),
        .I2(slv_reg3[28]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[28]),
        .O(reg_data_out[28]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[29]_i_1 
       (.I0(data7[1]),
        .I1(slv_reg0[29]),
        .I2(slv_reg3[29]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[29]),
        .O(reg_data_out[29]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[2]_i_1 
       (.I0(\slv_reg1_reg_n_0_[2] ),
        .I1(slv_reg0[2]),
        .I2(slv_reg3[2]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[2]),
        .O(reg_data_out[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[30]_i_1 
       (.I0(data7[2]),
        .I1(slv_reg0[30]),
        .I2(slv_reg3[30]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[30]),
        .O(reg_data_out[30]));
  LUT3 #(
    .INIT(8'h08)) 
    \axi_rdata[31]_i_1 
       (.I0(S_AXI_ARREADY),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .O(slv_reg_rden));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[31]_i_2 
       (.I0(data7[3]),
        .I1(slv_reg0[31]),
        .I2(slv_reg3[31]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[31]),
        .O(reg_data_out[31]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[3]_i_1 
       (.I0(\slv_reg1_reg_n_0_[3] ),
        .I1(slv_reg0[3]),
        .I2(slv_reg3[3]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[3]),
        .O(reg_data_out[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[4]_i_1 
       (.I0(data1[0]),
        .I1(slv_reg0[4]),
        .I2(slv_reg3[4]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[4]),
        .O(reg_data_out[4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[5]_i_1 
       (.I0(data1[1]),
        .I1(slv_reg0[5]),
        .I2(slv_reg3[5]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[5]),
        .O(reg_data_out[5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[6]_i_1 
       (.I0(data1[2]),
        .I1(slv_reg0[6]),
        .I2(slv_reg3[6]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[6]),
        .O(reg_data_out[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[7]_i_1 
       (.I0(data1[3]),
        .I1(slv_reg0[7]),
        .I2(slv_reg3[7]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[7]),
        .O(reg_data_out[7]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[8]_i_1 
       (.I0(data2[0]),
        .I1(slv_reg0[8]),
        .I2(slv_reg3[8]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[8]),
        .O(reg_data_out[8]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[9]_i_1 
       (.I0(data2[1]),
        .I1(slv_reg0[9]),
        .I2(slv_reg3[9]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[9]),
        .O(reg_data_out[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    axi_wready_i_1
       (.I0(aw_en_reg_n_0),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awvalid),
        .I3(S_AXI_WREADY),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(S_AXI_WREADY),
        .R(axi_awready_i_1_n_0));
  mb_design_Nexys4DisplayDriver_0_0_Nexys4DisplayDriver display_driver
       (.Q(slv_reg0[15:0]),
        .dispEn_n(dispEn_n),
        .dispPt_n(dispPt_n),
        .dispSeg_n(dispSeg_n),
        .\dispSeg_n[6]_INST_0_i_4_0 ({data7,data6,data5,data4,data3,data2,data1,\slv_reg1_reg_n_0_[3] ,\slv_reg1_reg_n_0_[2] ,\slv_reg1_reg_n_0_[1] ,\slv_reg1_reg_n_0_[0] }),
        .s00_axi_aclk(s00_axi_aclk),
        .s_clkEnable(s_clkEnable));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    s_clkEnable_i_1
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .O(s_clkEnable_0));
  FDRE s_clkEnable_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnable_0),
        .Q(s_clkEnable),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \s_clkEnbCnt[0]_i_1 
       (.I0(s_clkEnbCnt[0]),
        .O(s_clkEnbCnt_1[0]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[10]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[12]_i_2_n_6 ),
        .O(s_clkEnbCnt_1[10]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[11]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[12]_i_2_n_5 ),
        .O(s_clkEnbCnt_1[11]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[12]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[12]_i_2_n_4 ),
        .O(s_clkEnbCnt_1[12]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[13]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[16]_i_2_n_7 ),
        .O(s_clkEnbCnt_1[13]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[14]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[16]_i_2_n_6 ),
        .O(s_clkEnbCnt_1[14]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[15]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[16]_i_2_n_5 ),
        .O(s_clkEnbCnt_1[15]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[16]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[16]_i_2_n_4 ),
        .O(s_clkEnbCnt_1[16]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[17]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[20]_i_2_n_7 ),
        .O(s_clkEnbCnt_1[17]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[18]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[20]_i_2_n_6 ),
        .O(s_clkEnbCnt_1[18]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[19]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[20]_i_2_n_5 ),
        .O(s_clkEnbCnt_1[19]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[1]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[4]_i_2_n_7 ),
        .O(s_clkEnbCnt_1[1]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[20]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[20]_i_2_n_4 ),
        .O(s_clkEnbCnt_1[20]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[21]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[24]_i_2_n_7 ),
        .O(s_clkEnbCnt_1[21]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[22]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[24]_i_2_n_6 ),
        .O(s_clkEnbCnt_1[22]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[23]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[24]_i_2_n_5 ),
        .O(s_clkEnbCnt_1[23]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[24]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[24]_i_2_n_4 ),
        .O(s_clkEnbCnt_1[24]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[25]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[28]_i_2_n_7 ),
        .O(s_clkEnbCnt_1[25]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[26]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[28]_i_2_n_6 ),
        .O(s_clkEnbCnt_1[26]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[27]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[28]_i_2_n_5 ),
        .O(s_clkEnbCnt_1[27]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[28]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[28]_i_2_n_4 ),
        .O(s_clkEnbCnt_1[28]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[29]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[31]_i_6_n_7 ),
        .O(s_clkEnbCnt_1[29]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[2]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[4]_i_2_n_6 ),
        .O(s_clkEnbCnt_1[2]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[30]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[31]_i_6_n_6 ),
        .O(s_clkEnbCnt_1[30]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[31]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[31]_i_6_n_5 ),
        .O(s_clkEnbCnt_1[31]));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \s_clkEnbCnt[31]_i_10 
       (.I0(s_clkEnbCnt[13]),
        .I1(s_clkEnbCnt[12]),
        .I2(s_clkEnbCnt[15]),
        .I3(s_clkEnbCnt[14]),
        .O(\s_clkEnbCnt[31]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \s_clkEnbCnt[31]_i_2 
       (.I0(s_clkEnbCnt[18]),
        .I1(s_clkEnbCnt[19]),
        .I2(s_clkEnbCnt[17]),
        .I3(s_clkEnbCnt[16]),
        .I4(\s_clkEnbCnt[31]_i_7_n_0 ),
        .O(\s_clkEnbCnt[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \s_clkEnbCnt[31]_i_3 
       (.I0(s_clkEnbCnt[26]),
        .I1(s_clkEnbCnt[27]),
        .I2(s_clkEnbCnt[24]),
        .I3(s_clkEnbCnt[25]),
        .I4(\s_clkEnbCnt[31]_i_8_n_0 ),
        .O(\s_clkEnbCnt[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFBFFF)) 
    \s_clkEnbCnt[31]_i_4 
       (.I0(s_clkEnbCnt[3]),
        .I1(s_clkEnbCnt[2]),
        .I2(s_clkEnbCnt[0]),
        .I3(s_clkEnbCnt[1]),
        .I4(\s_clkEnbCnt[31]_i_9_n_0 ),
        .O(\s_clkEnbCnt[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \s_clkEnbCnt[31]_i_5 
       (.I0(s_clkEnbCnt[10]),
        .I1(s_clkEnbCnt[11]),
        .I2(s_clkEnbCnt[8]),
        .I3(s_clkEnbCnt[9]),
        .I4(\s_clkEnbCnt[31]_i_10_n_0 ),
        .O(\s_clkEnbCnt[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_clkEnbCnt[31]_i_7 
       (.I0(s_clkEnbCnt[21]),
        .I1(s_clkEnbCnt[20]),
        .I2(s_clkEnbCnt[23]),
        .I3(s_clkEnbCnt[22]),
        .O(\s_clkEnbCnt[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_clkEnbCnt[31]_i_8 
       (.I0(s_clkEnbCnt[29]),
        .I1(s_clkEnbCnt[28]),
        .I2(s_clkEnbCnt[31]),
        .I3(s_clkEnbCnt[30]),
        .O(\s_clkEnbCnt[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \s_clkEnbCnt[31]_i_9 
       (.I0(s_clkEnbCnt[5]),
        .I1(s_clkEnbCnt[4]),
        .I2(s_clkEnbCnt[6]),
        .I3(s_clkEnbCnt[7]),
        .O(\s_clkEnbCnt[31]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[3]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[4]_i_2_n_5 ),
        .O(s_clkEnbCnt_1[3]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[4]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[4]_i_2_n_4 ),
        .O(s_clkEnbCnt_1[4]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[5]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[8]_i_2_n_7 ),
        .O(s_clkEnbCnt_1[5]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[6]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[8]_i_2_n_6 ),
        .O(s_clkEnbCnt_1[6]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[7]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[8]_i_2_n_5 ),
        .O(s_clkEnbCnt_1[7]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[8]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[8]_i_2_n_4 ),
        .O(s_clkEnbCnt_1[8]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \s_clkEnbCnt[9]_i_1 
       (.I0(\s_clkEnbCnt[31]_i_2_n_0 ),
        .I1(\s_clkEnbCnt[31]_i_3_n_0 ),
        .I2(\s_clkEnbCnt[31]_i_4_n_0 ),
        .I3(\s_clkEnbCnt[31]_i_5_n_0 ),
        .I4(\s_clkEnbCnt_reg[12]_i_2_n_7 ),
        .O(s_clkEnbCnt_1[9]));
  FDRE \s_clkEnbCnt_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[0]),
        .Q(s_clkEnbCnt[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[10]),
        .Q(s_clkEnbCnt[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[11]),
        .Q(s_clkEnbCnt[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[12]),
        .Q(s_clkEnbCnt[12]),
        .R(axi_awready_i_1_n_0));
  CARRY4 \s_clkEnbCnt_reg[12]_i_2 
       (.CI(\s_clkEnbCnt_reg[8]_i_2_n_0 ),
        .CO({\s_clkEnbCnt_reg[12]_i_2_n_0 ,\s_clkEnbCnt_reg[12]_i_2_n_1 ,\s_clkEnbCnt_reg[12]_i_2_n_2 ,\s_clkEnbCnt_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_clkEnbCnt_reg[12]_i_2_n_4 ,\s_clkEnbCnt_reg[12]_i_2_n_5 ,\s_clkEnbCnt_reg[12]_i_2_n_6 ,\s_clkEnbCnt_reg[12]_i_2_n_7 }),
        .S(s_clkEnbCnt[12:9]));
  FDRE \s_clkEnbCnt_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[13]),
        .Q(s_clkEnbCnt[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[14]),
        .Q(s_clkEnbCnt[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[15]),
        .Q(s_clkEnbCnt[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[16]),
        .Q(s_clkEnbCnt[16]),
        .R(axi_awready_i_1_n_0));
  CARRY4 \s_clkEnbCnt_reg[16]_i_2 
       (.CI(\s_clkEnbCnt_reg[12]_i_2_n_0 ),
        .CO({\s_clkEnbCnt_reg[16]_i_2_n_0 ,\s_clkEnbCnt_reg[16]_i_2_n_1 ,\s_clkEnbCnt_reg[16]_i_2_n_2 ,\s_clkEnbCnt_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_clkEnbCnt_reg[16]_i_2_n_4 ,\s_clkEnbCnt_reg[16]_i_2_n_5 ,\s_clkEnbCnt_reg[16]_i_2_n_6 ,\s_clkEnbCnt_reg[16]_i_2_n_7 }),
        .S(s_clkEnbCnt[16:13]));
  FDRE \s_clkEnbCnt_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[17]),
        .Q(s_clkEnbCnt[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[18]),
        .Q(s_clkEnbCnt[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[19]),
        .Q(s_clkEnbCnt[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[1]),
        .Q(s_clkEnbCnt[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[20]),
        .Q(s_clkEnbCnt[20]),
        .R(axi_awready_i_1_n_0));
  CARRY4 \s_clkEnbCnt_reg[20]_i_2 
       (.CI(\s_clkEnbCnt_reg[16]_i_2_n_0 ),
        .CO({\s_clkEnbCnt_reg[20]_i_2_n_0 ,\s_clkEnbCnt_reg[20]_i_2_n_1 ,\s_clkEnbCnt_reg[20]_i_2_n_2 ,\s_clkEnbCnt_reg[20]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_clkEnbCnt_reg[20]_i_2_n_4 ,\s_clkEnbCnt_reg[20]_i_2_n_5 ,\s_clkEnbCnt_reg[20]_i_2_n_6 ,\s_clkEnbCnt_reg[20]_i_2_n_7 }),
        .S(s_clkEnbCnt[20:17]));
  FDRE \s_clkEnbCnt_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[21]),
        .Q(s_clkEnbCnt[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[22]),
        .Q(s_clkEnbCnt[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[23]),
        .Q(s_clkEnbCnt[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[24]),
        .Q(s_clkEnbCnt[24]),
        .R(axi_awready_i_1_n_0));
  CARRY4 \s_clkEnbCnt_reg[24]_i_2 
       (.CI(\s_clkEnbCnt_reg[20]_i_2_n_0 ),
        .CO({\s_clkEnbCnt_reg[24]_i_2_n_0 ,\s_clkEnbCnt_reg[24]_i_2_n_1 ,\s_clkEnbCnt_reg[24]_i_2_n_2 ,\s_clkEnbCnt_reg[24]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_clkEnbCnt_reg[24]_i_2_n_4 ,\s_clkEnbCnt_reg[24]_i_2_n_5 ,\s_clkEnbCnt_reg[24]_i_2_n_6 ,\s_clkEnbCnt_reg[24]_i_2_n_7 }),
        .S(s_clkEnbCnt[24:21]));
  FDRE \s_clkEnbCnt_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[25]),
        .Q(s_clkEnbCnt[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[26]),
        .Q(s_clkEnbCnt[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[27]),
        .Q(s_clkEnbCnt[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[28]),
        .Q(s_clkEnbCnt[28]),
        .R(axi_awready_i_1_n_0));
  CARRY4 \s_clkEnbCnt_reg[28]_i_2 
       (.CI(\s_clkEnbCnt_reg[24]_i_2_n_0 ),
        .CO({\s_clkEnbCnt_reg[28]_i_2_n_0 ,\s_clkEnbCnt_reg[28]_i_2_n_1 ,\s_clkEnbCnt_reg[28]_i_2_n_2 ,\s_clkEnbCnt_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_clkEnbCnt_reg[28]_i_2_n_4 ,\s_clkEnbCnt_reg[28]_i_2_n_5 ,\s_clkEnbCnt_reg[28]_i_2_n_6 ,\s_clkEnbCnt_reg[28]_i_2_n_7 }),
        .S(s_clkEnbCnt[28:25]));
  FDRE \s_clkEnbCnt_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[29]),
        .Q(s_clkEnbCnt[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[2]),
        .Q(s_clkEnbCnt[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[30]),
        .Q(s_clkEnbCnt[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[31]),
        .Q(s_clkEnbCnt[31]),
        .R(axi_awready_i_1_n_0));
  CARRY4 \s_clkEnbCnt_reg[31]_i_6 
       (.CI(\s_clkEnbCnt_reg[28]_i_2_n_0 ),
        .CO({\NLW_s_clkEnbCnt_reg[31]_i_6_CO_UNCONNECTED [3:2],\s_clkEnbCnt_reg[31]_i_6_n_2 ,\s_clkEnbCnt_reg[31]_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_s_clkEnbCnt_reg[31]_i_6_O_UNCONNECTED [3],\s_clkEnbCnt_reg[31]_i_6_n_5 ,\s_clkEnbCnt_reg[31]_i_6_n_6 ,\s_clkEnbCnt_reg[31]_i_6_n_7 }),
        .S({1'b0,s_clkEnbCnt[31:29]}));
  FDRE \s_clkEnbCnt_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[3]),
        .Q(s_clkEnbCnt[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[4]),
        .Q(s_clkEnbCnt[4]),
        .R(axi_awready_i_1_n_0));
  CARRY4 \s_clkEnbCnt_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\s_clkEnbCnt_reg[4]_i_2_n_0 ,\s_clkEnbCnt_reg[4]_i_2_n_1 ,\s_clkEnbCnt_reg[4]_i_2_n_2 ,\s_clkEnbCnt_reg[4]_i_2_n_3 }),
        .CYINIT(s_clkEnbCnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_clkEnbCnt_reg[4]_i_2_n_4 ,\s_clkEnbCnt_reg[4]_i_2_n_5 ,\s_clkEnbCnt_reg[4]_i_2_n_6 ,\s_clkEnbCnt_reg[4]_i_2_n_7 }),
        .S(s_clkEnbCnt[4:1]));
  FDRE \s_clkEnbCnt_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[5]),
        .Q(s_clkEnbCnt[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[6]),
        .Q(s_clkEnbCnt[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[7]),
        .Q(s_clkEnbCnt[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \s_clkEnbCnt_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[8]),
        .Q(s_clkEnbCnt[8]),
        .R(axi_awready_i_1_n_0));
  CARRY4 \s_clkEnbCnt_reg[8]_i_2 
       (.CI(\s_clkEnbCnt_reg[4]_i_2_n_0 ),
        .CO({\s_clkEnbCnt_reg[8]_i_2_n_0 ,\s_clkEnbCnt_reg[8]_i_2_n_1 ,\s_clkEnbCnt_reg[8]_i_2_n_2 ,\s_clkEnbCnt_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_clkEnbCnt_reg[8]_i_2_n_4 ,\s_clkEnbCnt_reg[8]_i_2_n_5 ,\s_clkEnbCnt_reg[8]_i_2_n_6 ,\s_clkEnbCnt_reg[8]_i_2_n_7 }),
        .S(s_clkEnbCnt[8:5]));
  FDRE \s_clkEnbCnt_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s_clkEnbCnt_1[9]),
        .Q(s_clkEnbCnt[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[15]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[1]),
        .O(\slv_reg0[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[2]),
        .O(\slv_reg0[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[31]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[3]),
        .O(\slv_reg0[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg0[31]_i_2 
       (.I0(s00_axi_awvalid),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_WREADY),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__2));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[7]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[0]),
        .O(\slv_reg0[7]_i_1_n_0 ));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg0[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg0[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg0[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg0[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg0[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg0[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg0[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg0[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg0[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg0[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg0[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg0[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg0[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg0[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg0[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg0[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg0[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg0[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg0[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg0[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg0[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg0[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg0[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg0[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg0[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg0[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg0[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg0[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg0[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg0[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg0[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg0[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[15]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[3]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg1_reg_n_0_[0] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(data2[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(data2[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(data3[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(data3[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(data3[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(data3[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(data4[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(data4[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(data4[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(data4[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg1_reg_n_0_[1] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(data5[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(data5[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(data5[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(data5[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(data6[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(data6[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(data6[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(data6[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(data7[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(data7[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg1_reg_n_0_[2] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(data7[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(data7[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg1_reg_n_0_[3] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(data1[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(data1[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(data1[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(data1[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(data2[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(data2[1]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg2[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg2[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg2[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg2[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg2[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg2[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg2[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg2[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg2[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg2[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg2[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg2[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg2[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg2[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg2[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg2[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg2[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg2[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg2[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg2[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg2[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg2[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg2[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg2[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg2[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg2[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg2[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg2[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg2[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg2[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg2[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg2[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[15]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[23]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[31]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[3]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[7]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[7]));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg3[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg3[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg3[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg3[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg3[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg3[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg3[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg3[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg3[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg3[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg3[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg3[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg3[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg3[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg3[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg3[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg3[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg3[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg3[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg3[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg3[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg3[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg3[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg3[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg3[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg3[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg3[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg3[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg3[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg3[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg3[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg3[9]),
        .R(axi_awready_i_1_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
