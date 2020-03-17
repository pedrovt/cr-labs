// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Mon Feb 26 14:59:22 2018
// Host        : id3904 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/asroliveira/CloudStation/CR/2018/RegInputsDemo/RegInputsDemo.sim/sim_1/impl/timing/xsim/RegInpusTop_time_impl.v
// Design      : RegInpusTop
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "be85fc46" *) 
(* NotValidForBitStream *)
module RegInpusTop
   (clk,
    sw,
    led);
  input clk;
  input [1:0]sw;
  output [11:0]led;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [11:0]led;
  wire [11:0]led_OBUF;
  wire [1:0]sw;
  wire [1:0]sw_IBUF;

initial begin
 $sdf_annotate("RegInpusTop_time_impl.sdf",,,,"tool_control");
end
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \led_OBUF[0]_inst 
       (.I(led_OBUF[0]),
        .O(led[0]));
  OBUF \led_OBUF[10]_inst 
       (.I(led_OBUF[10]),
        .O(led[10]));
  OBUF \led_OBUF[11]_inst 
       (.I(led_OBUF[11]),
        .O(led[11]));
  OBUF \led_OBUF[1]_inst 
       (.I(led_OBUF[1]),
        .O(led[1]));
  OBUF \led_OBUF[2]_inst 
       (.I(led_OBUF[2]),
        .O(led[2]));
  OBUF \led_OBUF[3]_inst 
       (.I(led_OBUF[3]),
        .O(led[3]));
  OBUF \led_OBUF[4]_inst 
       (.I(led_OBUF[4]),
        .O(led[4]));
  OBUF \led_OBUF[5]_inst 
       (.I(led_OBUF[5]),
        .O(led[5]));
  OBUF \led_OBUF[6]_inst 
       (.I(led_OBUF[6]),
        .O(led[6]));
  OBUF \led_OBUF[7]_inst 
       (.I(led_OBUF[7]),
        .O(led[7]));
  OBUF \led_OBUF[8]_inst 
       (.I(led_OBUF[8]),
        .O(led[8]));
  OBUF \led_OBUF[9]_inst 
       (.I(led_OBUF[9]),
        .O(led[9]));
  IBUF \sw_IBUF[0]_inst 
       (.I(sw[0]),
        .O(sw_IBUF[0]));
  IBUF \sw_IBUF[1]_inst 
       (.I(sw[1]),
        .O(sw_IBUF[1]));
  RegInputsDemo system_core
       (.clk(clk_IBUF_BUFG),
        .led_OBUF(led_OBUF),
        .sw(sw_IBUF));
endmodule

module RegInputsDemo
   (led_OBUF,
    sw,
    clk);
  output [11:0]led_OBUF;
  input [1:0]sw;
  input clk;

  wire clk;
  wire [11:0]led_OBUF;
  wire \led_OBUF[11]_inst_i_2_n_0 ;
  wire [0:0]minusOp;
  wire [3:0]plusOp;
  wire \s_cnt2[1]_i_1_n_0 ;
  wire \s_cnt2[2]_i_1_n_0 ;
  wire \s_cnt2[3]_i_1_n_0 ;
  wire s_enable;
  wire [1:0]sw;

  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    \led_OBUF[10]_inst_i_1 
       (.I0(led_OBUF[4]),
        .I1(led_OBUF[0]),
        .I2(led_OBUF[1]),
        .I3(led_OBUF[5]),
        .I4(led_OBUF[6]),
        .I5(led_OBUF[2]),
        .O(led_OBUF[10]));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \led_OBUF[11]_inst_i_1 
       (.I0(\led_OBUF[11]_inst_i_2_n_0 ),
        .I1(led_OBUF[2]),
        .I2(led_OBUF[6]),
        .I3(led_OBUF[7]),
        .I4(led_OBUF[3]),
        .O(led_OBUF[11]));
  LUT4 #(
    .INIT(16'hE888)) 
    \led_OBUF[11]_inst_i_2 
       (.I0(led_OBUF[5]),
        .I1(led_OBUF[1]),
        .I2(led_OBUF[0]),
        .I3(led_OBUF[4]),
        .O(\led_OBUF[11]_inst_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \led_OBUF[8]_inst_i_1 
       (.I0(led_OBUF[0]),
        .I1(led_OBUF[4]),
        .O(led_OBUF[8]));
  LUT4 #(
    .INIT(16'h8778)) 
    \led_OBUF[9]_inst_i_1 
       (.I0(led_OBUF[0]),
        .I1(led_OBUF[4]),
        .I2(led_OBUF[5]),
        .I3(led_OBUF[1]),
        .O(led_OBUF[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \s_cnt1[0]_i_1 
       (.I0(led_OBUF[0]),
        .O(plusOp[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \s_cnt1[1]_i_1 
       (.I0(led_OBUF[0]),
        .I1(led_OBUF[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \s_cnt1[2]_i_1 
       (.I0(led_OBUF[0]),
        .I1(led_OBUF[1]),
        .I2(led_OBUF[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \s_cnt1[3]_i_1 
       (.I0(led_OBUF[1]),
        .I1(led_OBUF[0]),
        .I2(led_OBUF[2]),
        .I3(led_OBUF[3]),
        .O(plusOp[3]));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt1_reg[0] 
       (.C(clk),
        .CE(s_enable),
        .D(plusOp[0]),
        .Q(led_OBUF[0]),
        .R(sw[0]));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt1_reg[1] 
       (.C(clk),
        .CE(s_enable),
        .D(plusOp[1]),
        .Q(led_OBUF[1]),
        .R(sw[0]));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt1_reg[2] 
       (.C(clk),
        .CE(s_enable),
        .D(plusOp[2]),
        .Q(led_OBUF[2]),
        .R(sw[0]));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt1_reg[3] 
       (.C(clk),
        .CE(s_enable),
        .D(plusOp[3]),
        .Q(led_OBUF[3]),
        .R(sw[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \s_cnt2[0]_i_1 
       (.I0(led_OBUF[4]),
        .O(minusOp));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \s_cnt2[1]_i_1 
       (.I0(led_OBUF[4]),
        .I1(led_OBUF[5]),
        .O(\s_cnt2[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    \s_cnt2[2]_i_1 
       (.I0(led_OBUF[5]),
        .I1(led_OBUF[4]),
        .I2(led_OBUF[6]),
        .O(\s_cnt2[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    \s_cnt2[3]_i_1 
       (.I0(led_OBUF[6]),
        .I1(led_OBUF[4]),
        .I2(led_OBUF[5]),
        .I3(led_OBUF[7]),
        .O(\s_cnt2[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt2_reg[0] 
       (.C(clk),
        .CE(s_enable),
        .D(minusOp),
        .Q(led_OBUF[4]),
        .R(sw[0]));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt2_reg[1] 
       (.C(clk),
        .CE(s_enable),
        .D(\s_cnt2[1]_i_1_n_0 ),
        .Q(led_OBUF[5]),
        .R(sw[0]));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt2_reg[2] 
       (.C(clk),
        .CE(s_enable),
        .D(\s_cnt2[2]_i_1_n_0 ),
        .Q(led_OBUF[6]),
        .R(sw[0]));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt2_reg[3] 
       (.C(clk),
        .CE(s_enable),
        .D(\s_cnt2[3]_i_1_n_0 ),
        .Q(led_OBUF[7]),
        .R(sw[0]));
  FDRE #(
    .INIT(1'b0)) 
    s_enable_reg
       (.C(clk),
        .CE(1'b1),
        .D(sw[1]),
        .Q(s_enable),
        .R(1'b0));
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
