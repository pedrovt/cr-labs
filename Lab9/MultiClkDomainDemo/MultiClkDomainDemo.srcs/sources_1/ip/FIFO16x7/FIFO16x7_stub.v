// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Jun  2 15:27:45 2020
// Host        : ASUS-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/Pedro/Dropbox/UA/CR/Labs/Lab9/MultiClkDomainDemo/MultiClkDomainDemo.srcs/sources_1/ip/FIFO16x7/FIFO16x7_stub.v
// Design      : FIFO16x7
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_5,Vivado 2019.2" *)
module FIFO16x7(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[6:0],wr_en,rd_en,dout[6:0],full,empty" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [6:0]din;
  input wr_en;
  input rd_en;
  output [6:0]dout;
  output full;
  output empty;
endmodule
