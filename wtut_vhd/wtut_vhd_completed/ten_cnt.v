////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2006 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: I.32
//  \   \         Application: netgen
//  /   /         Filename: ten_cnt.v
// /___/   /\     Timestamp: Fri Jul 14 09:45:52 2006
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\InDepthTutorial\wtut_vhd\_cg\ten_cnt.ngc C:\InDepthTutorial\wtut_vhd\_cg\ten_cnt.v 
// Device	: 3s200ft256-4
// Input file	: C:/InDepthTutorial/wtut_vhd/_cg/ten_cnt.ngc
// Output file	: C:/InDepthTutorial/wtut_vhd/_cg/ten_cnt.v
// # of Modules	: 1
// Design Name	: ten_cnt
// Xilinx        : C:\xilinx82
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23
//     Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module ten_cnt (
  ce, clk, ainit, thresh0, q
);
  input ce;
  input clk;
  input ainit;
  output thresh0;
  output [3 : 0] q;
  
  // The synopsys directives "translate_off/translate_on" specified
  // below are supported by XST, FPGA Compiler II, Mentor Graphics and Synplicity
  // synthesis tools. Ensure they are correct for your synthesis tool(s)
  
  // synopsys translate_off
  
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_3_rt_2 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_2_rt_3 ;
  wire \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_4_rt_4 ;
  wire \BU2/N0 ;
  wire \BU2/q_thresh1 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire [3 : 0] NlwRenamedSig_OI_q;
  wire [3 : 0] \BU2/U0/q_next ;
  wire [2 : 0] \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple ;
  wire [0 : 0] \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum ;
  wire [3 : 0] \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003 ;
  assign
    q[3] = NlwRenamedSig_OI_q[3],
    q[2] = NlwRenamedSig_OI_q[2],
    q[1] = NlwRenamedSig_OI_q[1],
    q[0] = NlwRenamedSig_OI_q[0];
  VCC VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  INV \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/_not00001_INV_0  (
    .I(NlwRenamedSig_OI_q[0]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0])
  );
  defparam \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003<3>1 .INIT = 16'h7F00;
  LUT4 \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003<3>1  (
    .I0(ce),
    .I1(NlwRenamedSig_OI_q[0]),
    .I2(NlwRenamedSig_OI_q[3]),
    .I3(\BU2/U0/q_next [0]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003 [3])
  );
  defparam \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003<2>1 .INIT = 16'h7F00;
  LUT4 \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003<2>1  (
    .I0(ce),
    .I1(NlwRenamedSig_OI_q[0]),
    .I2(NlwRenamedSig_OI_q[3]),
    .I3(\BU2/U0/q_next [1]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003 [2])
  );
  defparam \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003<1>1 .INIT = 16'h7F00;
  LUT4 \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003<1>1  (
    .I0(ce),
    .I1(NlwRenamedSig_OI_q[0]),
    .I2(NlwRenamedSig_OI_q[3]),
    .I3(\BU2/U0/q_next [2]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003 [1])
  );
  defparam \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003<0>1 .INIT = 16'h7F00;
  LUT4 \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003<0>1  (
    .I0(ce),
    .I1(NlwRenamedSig_OI_q[0]),
    .I2(NlwRenamedSig_OI_q[3]),
    .I3(\BU2/U0/q_next [3]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003 [0])
  );
  defparam \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_4_rt .INIT = 4'h2;
  LUT1 \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_4_rt  (
    .I0(NlwRenamedSig_OI_q[3]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_4_rt_4 )
  );
  defparam \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_3_rt .INIT = 4'h2;
  LUT1 \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_3_rt  (
    .I0(NlwRenamedSig_OI_q[2]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_3_rt_2 )
  );
  defparam \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_2_rt .INIT = 4'h2;
  LUT1 \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_2_rt  (
    .I0(NlwRenamedSig_OI_q[1]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_2_rt_3 )
  );
  defparam \BU2/U0/_cmp_eq00001 .INIT = 16'h0004;
  LUT4 \BU2/U0/_cmp_eq00001  (
    .I0(\BU2/U0/q_next [1]),
    .I1(\BU2/U0/q_next [0]),
    .I2(\BU2/U0/q_next [3]),
    .I3(\BU2/U0/q_next [2]),
    .O(thresh0)
  );
  XORCY \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[2].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_3_rt_2 ),
    .O(\BU2/U0/q_next [2])
  );
  MUXCY \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[2].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_3_rt_2 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [2])
  );
  XORCY \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[1].carryxor  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_2_rt_3 ),
    .O(\BU2/U0/q_next [1])
  );
  MUXCY \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[1].carrymux  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0]),
    .DI(\BU2/N0 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_2_rt_3 ),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1])
  );
  XORCY \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carryxortop  (
    .CI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [2]),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_4_rt_4 ),
    .O(\BU2/U0/q_next [3])
  );
  XORCY \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.carryxor0  (
    .CI(\BU2/N0 ),
    .LI(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0]),
    .O(\BU2/U0/q_next [0])
  );
  MUXCY \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_need_mux.carrymux0  (
    .CI(\BU2/N0 ),
    .DI(\BU2/q_thresh1 ),
    .S(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0]),
    .O(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0])
  );
  defparam \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_4 .INIT = 1'b0;
  FDCE \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_4  (
    .D(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003 [0]),
    .CE(ce),
    .CLR(ainit),
    .C(clk),
    .Q(NlwRenamedSig_OI_q[3])
  );
  defparam \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_3 .INIT = 1'b0;
  FDCE \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_3  (
    .D(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003 [1]),
    .CE(ce),
    .CLR(ainit),
    .C(clk),
    .Q(NlwRenamedSig_OI_q[2])
  );
  defparam \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_2 .INIT = 1'b0;
  FDCE \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_2  (
    .D(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003 [2]),
    .CE(ce),
    .CLR(ainit),
    .C(clk),
    .Q(NlwRenamedSig_OI_q[1])
  );
  defparam \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_1 .INIT = 1'b0;
  FDCE \BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_1  (
    .D(\BU2/U0/the_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/_mux0003 [3]),
    .CE(ce),
    .CLR(ainit),
    .C(clk),
    .Q(NlwRenamedSig_OI_q[0])
  );
  VCC \BU2/XST_VCC  (
    .P(\BU2/q_thresh1 )
  );
  GND \BU2/XST_GND  (
    .G(\BU2/N0 )
  );

// synopsys translate_on

endmodule

// synopsys translate_off

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

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

// synopsys translate_on
