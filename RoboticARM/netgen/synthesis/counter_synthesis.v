////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: counter_synthesis.v
// /___/   /\     Timestamp: Tue Jan 11 17:10:54 2022
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim counter.ngc counter_synthesis.v 
// Device	: xc7a100t-1-csg324
// Input file	: counter.ngc
// Output file	: C:\M8\bitcounter\netgen\synthesis\counter_synthesis.v
// # of Modules	: 1
// Design Name	: counter
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module counter (
  btnu, btnd, rst, clk, led
);
  input btnu;
  input btnd;
  input rst;
  input clk;
  output [7 : 0] led;
  wire btnd_BUFGP_0;
  wire led_1_OBUF_2;
  wire counter_3;
  wire [0 : 0] n0004;
  GND   XST_GND (
    .G(led_1_OBUF_2)
  );
  LD #(
    .INIT ( 1'b0 ))
  counter (
    .D(n0004[0]),
    .G(btnd_BUFGP_0),
    .Q(counter_3)
  );
  OBUF   led_7_OBUF (
    .I(led_1_OBUF_2),
    .O(led[7])
  );
  OBUF   led_6_OBUF (
    .I(led_1_OBUF_2),
    .O(led[6])
  );
  OBUF   led_5_OBUF (
    .I(led_1_OBUF_2),
    .O(led[5])
  );
  OBUF   led_4_OBUF (
    .I(led_1_OBUF_2),
    .O(led[4])
  );
  OBUF   led_3_OBUF (
    .I(led_1_OBUF_2),
    .O(led[3])
  );
  OBUF   led_2_OBUF (
    .I(led_1_OBUF_2),
    .O(led[2])
  );
  OBUF   led_1_OBUF (
    .I(led_1_OBUF_2),
    .O(led[1])
  );
  OBUF   led_0_OBUF (
    .I(counter_3),
    .O(led[0])
  );
  BUFGP   btnd_BUFGP (
    .I(btnd),
    .O(btnd_BUFGP_0)
  );
  INV   \Msub_n0004_Madd_xor<0>11_INV_0  (
    .I(counter_3),
    .O(n0004[0])
  );
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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
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

