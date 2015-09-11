////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2006 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: I.31
//  \   \         Application: netgen
//  /   /         Filename: counter_timesim.v
// /___/   /\     Timestamp: Fri Jan 19 17:43:04 2007
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 4 -pcf counter.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -w -dir netgen/par -ofmt verilog -sim counter.ncd counter_timesim.v 
// Device	: 3s200ft256-4 (PRODUCTION 1.38 2006-05-03)
// Input file	: counter.ncd
// Output file	: C:\Xilinx\ISEexamples\modulo2\Tutorial\netgen\par\counter_timesim.v
// # of Modules	: 1
// Design Name	: counter
// Xilinx        : C:\Xilinx
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

module counter (
  DIRECTION, CLOCK, COUNT_OUT
);
  input DIRECTION;
  input CLOCK;
  output [3 : 0] COUNT_OUT;
  wire DIRECTION_IBUF_0;
  wire GLOBAL_LOGIC1;
  wire CLOCK_BUFGP;
  wire \DIRECTION/INBUF ;
  wire \CLOCK/INBUF ;
  wire \COUNT_OUT<0>/O ;
  wire \COUNT_OUT<1>/O ;
  wire \COUNT_OUT<2>/O ;
  wire \COUNT_OUT<3>/O ;
  wire \CLOCK_BUFGP/BUFG/S_INVNOT ;
  wire \CLOCK_BUFGP/BUFG/I0_INV ;
  wire \count_int<3>/DXMUX_1 ;
  wire \count_int<3>/F5MUX_2 ;
  wire N11;
  wire \count_int<3>/BXINV_3 ;
  wire N12;
  wire \count_int<3>/CLKINV_4 ;
  wire \count_int<2>/DXMUX_5 ;
  wire \count_int<2>/DYMUX_6 ;
  wire \count_int<2>/CLKINV_7 ;
  wire \count_int<0>/DYMUX_8 ;
  wire \count_int<0>/SRINV_9 ;
  wire \count_int<0>/CLKINV_10 ;
  wire GND;
  wire VCC;
  wire [3 : 0] count_int;
  wire [2 : 1] count_int__addsub0000;
  initial $sdf_annotate("netgen/par/counter_timesim.sdf");
  defparam \DIRECTION/PAD .LOC = "PAD82";
  X_IPAD \DIRECTION/PAD  (
    .PAD(DIRECTION)
  );
  defparam DIRECTION_IBUF.LOC = "PAD82";
  X_BUF DIRECTION_IBUF (
    .I(DIRECTION),
    .O(\DIRECTION/INBUF )
  );
  defparam \DIRECTION/IFF/IMUX .LOC = "PAD82";
  X_BUF \DIRECTION/IFF/IMUX  (
    .I(\DIRECTION/INBUF ),
    .O(DIRECTION_IBUF_0)
  );
  defparam \CLOCK/PAD .LOC = "PAD123";
  X_IPAD \CLOCK/PAD  (
    .PAD(CLOCK)
  );
  defparam \CLOCK_BUFGP/IBUFG .LOC = "PAD123";
  X_BUF \CLOCK_BUFGP/IBUFG  (
    .I(CLOCK),
    .O(\CLOCK/INBUF )
  );
  defparam \COUNT_OUT<0>/PAD .LOC = "PAD83";
  X_OPAD \COUNT_OUT<0>/PAD  (
    .PAD(COUNT_OUT[0])
  );
  defparam COUNT_OUT_0_OBUF.LOC = "PAD83";
  X_OBUF COUNT_OUT_0_OBUF (
    .I(\COUNT_OUT<0>/O ),
    .O(COUNT_OUT[0])
  );
  defparam \COUNT_OUT<1>/PAD .LOC = "PAD96";
  X_OPAD \COUNT_OUT<1>/PAD  (
    .PAD(COUNT_OUT[1])
  );
  defparam COUNT_OUT_1_OBUF.LOC = "PAD96";
  X_OBUF COUNT_OUT_1_OBUF (
    .I(\COUNT_OUT<1>/O ),
    .O(COUNT_OUT[1])
  );
  defparam \COUNT_OUT<2>/PAD .LOC = "PAD84";
  X_OPAD \COUNT_OUT<2>/PAD  (
    .PAD(COUNT_OUT[2])
  );
  defparam COUNT_OUT_2_OBUF.LOC = "PAD84";
  X_OBUF COUNT_OUT_2_OBUF (
    .I(\COUNT_OUT<2>/O ),
    .O(COUNT_OUT[2])
  );
  defparam \COUNT_OUT<3>/PAD .LOC = "PAD92";
  X_OPAD \COUNT_OUT<3>/PAD  (
    .PAD(COUNT_OUT[3])
  );
  defparam COUNT_OUT_3_OBUF.LOC = "PAD92";
  X_OBUF COUNT_OUT_3_OBUF (
    .I(\COUNT_OUT<3>/O ),
    .O(COUNT_OUT[3])
  );
  defparam \CLOCK_BUFGP/BUFG .LOC = "BUFGMUX0";
  X_BUFGMUX \CLOCK_BUFGP/BUFG  (
    .I0(\CLOCK_BUFGP/BUFG/I0_INV ),
    .I1(GND),
    .S(\CLOCK_BUFGP/BUFG/S_INVNOT ),
    .O(CLOCK_BUFGP)
  );
  defparam \CLOCK_BUFGP/BUFG/SINV .LOC = "BUFGMUX0";
  X_INV \CLOCK_BUFGP/BUFG/SINV  (
    .I(GLOBAL_LOGIC1),
    .O(\CLOCK_BUFGP/BUFG/S_INVNOT )
  );
  defparam \CLOCK_BUFGP/BUFG/I0_USED .LOC = "BUFGMUX0";
  X_BUF \CLOCK_BUFGP/BUFG/I0_USED  (
    .I(\CLOCK/INBUF ),
    .O(\CLOCK_BUFGP/BUFG/I0_INV )
  );
  defparam \count_int<3>/DXMUX .LOC = "SLICE_X38Y8";
  X_BUF \count_int<3>/DXMUX  (
    .I(\count_int<3>/F5MUX_2 ),
    .O(\count_int<3>/DXMUX_1 )
  );
  defparam \count_int<3>/F5MUX .LOC = "SLICE_X38Y8";
  X_MUX2 \count_int<3>/F5MUX  (
    .IA(N12),
    .IB(N11),
    .SEL(\count_int<3>/BXINV_3 ),
    .O(\count_int<3>/F5MUX_2 )
  );
  defparam \count_int<3>/BXINV .LOC = "SLICE_X38Y8";
  X_BUF \count_int<3>/BXINV  (
    .I(DIRECTION_IBUF_0),
    .O(\count_int<3>/BXINV_3 )
  );
  defparam \count_int<3>/CLKINV .LOC = "SLICE_X38Y8";
  X_BUF \count_int<3>/CLKINV  (
    .I(CLOCK_BUFGP),
    .O(\count_int<3>/CLKINV_4 )
  );
  defparam \count_int<2>/DXMUX .LOC = "SLICE_X38Y9";
  X_BUF \count_int<2>/DXMUX  (
    .I(count_int__addsub0000[2]),
    .O(\count_int<2>/DXMUX_5 )
  );
  defparam \count_int<2>/DYMUX .LOC = "SLICE_X38Y9";
  X_BUF \count_int<2>/DYMUX  (
    .I(count_int__addsub0000[1]),
    .O(\count_int<2>/DYMUX_6 )
  );
  defparam \count_int<2>/CLKINV .LOC = "SLICE_X38Y9";
  X_BUF \count_int<2>/CLKINV  (
    .I(CLOCK_BUFGP),
    .O(\count_int<2>/CLKINV_7 )
  );
  defparam \counter_01_xo<1>1 .INIT = 16'h5AA5;
  defparam \counter_01_xo<1>1 .LOC = "SLICE_X38Y9";
  X_LUT4 \counter_01_xo<1>1  (
    .ADR0(DIRECTION_IBUF_0),
    .ADR1(VCC),
    .ADR2(count_int[1]),
    .ADR3(count_int[0]),
    .O(count_int__addsub0000[1])
  );
  defparam \count_int<0>/DYMUX .LOC = "SLICE_X38Y12";
  X_BUF \count_int<0>/DYMUX  (
    .I(GLOBAL_LOGIC1),
    .O(\count_int<0>/DYMUX_8 )
  );
  defparam \count_int<0>/SRINV .LOC = "SLICE_X38Y12";
  X_BUF \count_int<0>/SRINV  (
    .I(count_int[0]),
    .O(\count_int<0>/SRINV_9 )
  );
  defparam \count_int<0>/CLKINV .LOC = "SLICE_X38Y12";
  X_BUF \count_int<0>/CLKINV  (
    .I(CLOCK_BUFGP),
    .O(\count_int<0>/CLKINV_10 )
  );
  defparam \counter_0_xo<1>12 .INIT = 16'hFE01;
  defparam \counter_0_xo<1>12 .LOC = "SLICE_X38Y8";
  X_LUT4 \counter_0_xo<1>12  (
    .ADR0(count_int[1]),
    .ADR1(count_int[2]),
    .ADR2(count_int[0]),
    .ADR3(count_int[3]),
    .O(N12)
  );
  defparam \counter_0_xo<1>11 .INIT = 16'h7F80;
  defparam \counter_0_xo<1>11 .LOC = "SLICE_X38Y8";
  X_LUT4 \counter_0_xo<1>11  (
    .ADR0(count_int[1]),
    .ADR1(count_int[2]),
    .ADR2(count_int[0]),
    .ADR3(count_int[3]),
    .O(N11)
  );
  defparam count_int_3.LOC = "SLICE_X38Y8";
  defparam count_int_3.INIT = 1'b0;
  X_FF count_int_3 (
    .I(\count_int<3>/DXMUX_1 ),
    .CE(VCC),
    .CLK(\count_int<3>/CLKINV_4 ),
    .SET(GND),
    .RST(GND),
    .O(count_int[3])
  );
  defparam count_int_1.LOC = "SLICE_X38Y9";
  defparam count_int_1.INIT = 1'b0;
  X_FF count_int_1 (
    .I(\count_int<2>/DYMUX_6 ),
    .CE(VCC),
    .CLK(\count_int<2>/CLKINV_7 ),
    .SET(GND),
    .RST(GND),
    .O(count_int[1])
  );
  defparam \counter_02_xo<1>2 .INIT = 16'h6CC9;
  defparam \counter_02_xo<1>2 .LOC = "SLICE_X38Y9";
  X_LUT4 \counter_02_xo<1>2  (
    .ADR0(DIRECTION_IBUF_0),
    .ADR1(count_int[2]),
    .ADR2(count_int[1]),
    .ADR3(count_int[0]),
    .O(count_int__addsub0000[2])
  );
  defparam count_int_2.LOC = "SLICE_X38Y9";
  defparam count_int_2.INIT = 1'b0;
  X_FF count_int_2 (
    .I(\count_int<2>/DXMUX_5 ),
    .CE(VCC),
    .CLK(\count_int<2>/CLKINV_7 ),
    .SET(GND),
    .RST(GND),
    .O(count_int[2])
  );
  defparam count_int_0.LOC = "SLICE_X38Y12";
  defparam count_int_0.INIT = 1'b0;
  X_SFF count_int_0 (
    .I(\count_int<0>/DYMUX_8 ),
    .CE(VCC),
    .CLK(\count_int<0>/CLKINV_10 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\count_int<0>/SRINV_9 ),
    .O(count_int[0])
  );
  X_ONE GLOBAL_LOGIC1_VCC (
    .O(GLOBAL_LOGIC1)
  );
  defparam \COUNT_OUT<0>/OUTPUT/OFF/OMUX .LOC = "PAD83";
  X_BUF \COUNT_OUT<0>/OUTPUT/OFF/OMUX  (
    .I(count_int[0]),
    .O(\COUNT_OUT<0>/O )
  );
  defparam \COUNT_OUT<1>/OUTPUT/OFF/OMUX .LOC = "PAD96";
  X_BUF \COUNT_OUT<1>/OUTPUT/OFF/OMUX  (
    .I(count_int[1]),
    .O(\COUNT_OUT<1>/O )
  );
  defparam \COUNT_OUT<2>/OUTPUT/OFF/OMUX .LOC = "PAD84";
  X_BUF \COUNT_OUT<2>/OUTPUT/OFF/OMUX  (
    .I(count_int[2]),
    .O(\COUNT_OUT<2>/O )
  );
  defparam \COUNT_OUT<3>/OUTPUT/OFF/OMUX .LOC = "PAD92";
  X_BUF \COUNT_OUT<3>/OUTPUT/OFF/OMUX  (
    .I(count_int[3]),
    .O(\COUNT_OUT<3>/O )
  );
  X_ZERO NlwBlock_counter_GND (
    .O(GND)
  );
  X_ONE NlwBlock_counter_VCC (
    .O(VCC)
  );
endmodule


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

