--------------------------------------------------------------------------------
-- Copyright (c) 1995-2006 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: I.31
--  \   \         Application: netgen
--  /   /         Filename: stopwatch_synthesis.vhd
-- /___/   /\     Timestamp: Fri Jan 19 11:40:09 2007
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm stopwatch -w -dir netgen/synthesis -ofmt vhdl -sim stopwatch.ngc stopwatch_synthesis.vhd 
-- Device	: xc3s200-4-ft256
-- Input file	: stopwatch.ngc
-- Output file	: C:\Xilinx\ISEexamples\wtut_vhd\wtut_vhd\netgen\synthesis\stopwatch_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: stopwatch
-- Xilinx	: C:\Xilinx
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Development System Reference Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity stopwatch is
  port (
    CLK : in STD_LOGIC := 'X'; 
    STRTSTOP : in STD_LOGIC := 'X'; 
    RESET : in STD_LOGIC := 'X'; 
    SEG_A : out STD_LOGIC; 
    SEG_B : out STD_LOGIC; 
    SEG_C : out STD_LOGIC; 
    SEG_D : out STD_LOGIC; 
    SEG_E : out STD_LOGIC; 
    SEG_F : out STD_LOGIC; 
    SEG_G : out STD_LOGIC; 
    SEG_DP : out STD_LOGIC; 
    AN : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end stopwatch;

architecture Structure of stopwatch is
  component ten_cnt
    port (
      ce : in STD_LOGIC := 'X'; 
      clk : in STD_LOGIC := 'X'; 
      ainit : in STD_LOGIC := 'X'; 
      thresh0 : out STD_LOGIC; 
      q : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
    );
  end component;
  component TIMECNT_1#time_cnt
    port (
      CLK : in STD_LOGIC := 'X'; 
      CE : in STD_LOGIC := 'X'; 
      CLR : in STD_LOGIC := 'X'; 
      SEC_LSB : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
      SEC_MSB : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
      MINUTES : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
    );
  end component;
  component LEDCONTROL_1#led_control
    port (
      CLK : in STD_LOGIC := 'X'; 
      HUNDREDTHS : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
      TENTHS : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
      ONES : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
      TENS : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
      MINUTES : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
      AN : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
      SEVEN_SEG : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
    );
  end component;
  signal STRTSTOP_IBUF_0 : STD_LOGIC; 
  signal RESET_IBUF_1 : STD_LOGIC; 
  signal SEG_A_OBUF_2 : STD_LOGIC; 
  signal SEG_B_OBUF_3 : STD_LOGIC; 
  signal SEG_C_OBUF_4 : STD_LOGIC; 
  signal SEG_D_OBUF_5 : STD_LOGIC; 
  signal SEG_E_OBUF_6 : STD_LOGIC; 
  signal SEG_F_OBUF_7 : STD_LOGIC; 
  signal SEG_G_OBUF_8 : STD_LOGIC; 
  signal SEG_DP_OBUF_9 : STD_LOGIC; 
  signal CLKDIV262K_1_temp_div_262144_3_Q : STD_LOGIC; 
  signal clk_int : STD_LOGIC; 
  signal ten_cnt_thresh1 : STD_LOGIC; 
  signal ten_cnt_thresh2 : STD_LOGIC; 
  signal strtstop_debounced : STD_LOGIC; 
  signal clk_262144k : STD_LOGIC; 
  signal locked : STD_LOGIC; 
  signal time_cnt_ce : STD_LOGIC; 
  signal clk_en_int : STD_LOGIC; 
  signal rst_int : STD_LOGIC; 
  signal AN_3_OBUF_10 : STD_LOGIC; 
  signal AN_2_OBUF_11 : STD_LOGIC; 
  signal AN_1_OBUF_12 : STD_LOGIC; 
  signal AN_0_OBUF_13 : STD_LOGIC; 
  signal DCM1_1_CLKIN_IBUFG_OUT : STD_LOGIC; 
  signal DCM1_1_CLK0_BUF : STD_LOGIC; 
  signal DCM1_1_CLKFX_BUF : STD_LOGIC; 
  signal DEBOUNCE_1_int1_14 : STD_LOGIC; 
  signal DEBOUNCE_1_int2_15 : STD_LOGIC; 
  signal DEBOUNCE_1_int3_16 : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd1_17 : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd2_18 : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd3_19 : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd1_In_20 : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd2_In : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd3_In_21 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N3 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal N5 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal N9 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal N11 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal N13 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal N15 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N17 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N19 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal N23 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal N25 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal N27 : STD_LOGIC; 
  signal N28 : STD_LOGIC; 
  signal N29 : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal N31 : STD_LOGIC; 
  signal N32 : STD_LOGIC; 
  signal N33 : STD_LOGIC; 
  signal N34 : STD_LOGIC; 
  signal N35 : STD_LOGIC; 
  signal N36 : STD_LOGIC; 
  signal CLKDIV262K_1_temp_div_262144_0_Q : STD_LOGIC; 
  signal CLKDIV262K_1_div_32_15_Q : STD_LOGIC; 
  signal CLKDIV262K_1_div_32_0_Q : STD_LOGIC; 
  signal CLKDIV262K_1_div_1024_15_Q : STD_LOGIC; 
  signal CLKDIV262K_1_div_1024_0_Q : STD_LOGIC; 
  signal CLKDIV262K_1_div_32768_15_Q : STD_LOGIC; 
  signal CLKDIV262K_1_div_32768_0_Q : STD_LOGIC; 
  signal N241 : STD_LOGIC; 
  signal N251 : STD_LOGIC; 
  signal N261 : STD_LOGIC; 
  signal N271 : STD_LOGIC; 
  signal CLKDIV262K_1_temp_div_262144_31_22 : STD_LOGIC; 
  signal N281 : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_div_32_15_23 : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_div_1024_15_24 : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_div_32768_15_25 : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_temp_div_262144_31_26 : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_STATUS_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_STATUS_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_STATUS_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_STATUS_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_STATUS_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_STATUS_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_STATUS_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_STATUS_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_CLK90_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_CLK180_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_CLK270_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_CLK2X_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_CLK2X180_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_CLKDV_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_CLKFX180_UNCONNECTED : STD_LOGIC; 
  signal NLW_DCM1_1_DCM_INST_PSDONE_UNCONNECTED : STD_LOGIC; 
  signal hex2led_int1 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal hex2led_int2 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal hex2led_int3 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal hex2led_int4 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal hex2led_int5 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal hundredths_concat : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal ones_concat : STD_LOGIC_VECTOR ( 0 downto 0 ); 
begin
  XST_VCC : VCC
    port map (
      P => hundredths_concat(0)
    );
  XST_GND : GND
    port map (
      G => ones_concat(0)
    );
  ten_cnt1 : ten_cnt
    port map (
      ce => clk_en_int,
      clk => CLKDIV262K_1_temp_div_262144_3_Q,
      ainit => rst_int,
      thresh0 => ten_cnt_thresh1,
      q(3) => hex2led_int1(3),
      q(2) => hex2led_int1(2),
      q(1) => hex2led_int1(1),
      q(0) => hex2led_int1(0)
    );
  ten_cnt2 : ten_cnt
    port map (
      ce => clk_en_int,
      clk => CLKDIV262K_1_temp_div_262144_3_Q,
      ainit => rst_int,
      thresh0 => ten_cnt_thresh2,
      q(3) => hex2led_int2(3),
      q(2) => hex2led_int2(2),
      q(1) => hex2led_int2(1),
      q(0) => hex2led_int2(0)
    );
  DEBOUNCE_1_int1 : FD
    port map (
      D => STRTSTOP_IBUF_0,
      C => CLKDIV262K_1_temp_div_262144_3_Q,
      Q => DEBOUNCE_1_int1_14
    );
  DEBOUNCE_1_int2 : FD
    port map (
      D => DEBOUNCE_1_int1_14,
      C => CLKDIV262K_1_temp_div_262144_3_Q,
      Q => DEBOUNCE_1_int2_15
    );
  DEBOUNCE_1_int3 : FD
    port map (
      D => DEBOUNCE_1_int2_15,
      C => CLKDIV262K_1_temp_div_262144_3_Q,
      Q => DEBOUNCE_1_int3_16
    );
  STATEMACH_1_sreg_FFd3 : FDC
    port map (
      D => STATEMACH_1_sreg_FFd3_In_21,
      CLR => RESET_IBUF_1,
      C => CLKDIV262K_1_temp_div_262144_3_Q,
      Q => STATEMACH_1_sreg_FFd3_19
    );
  STATEMACH_1_sreg_FFd1 : FDC
    port map (
      D => STATEMACH_1_sreg_FFd1_In_20,
      CLR => RESET_IBUF_1,
      C => CLKDIV262K_1_temp_div_262144_3_Q,
      Q => STATEMACH_1_sreg_FFd1_17
    );
  STATEMACH_1_sreg_FFd2 : FDC
    port map (
      D => STATEMACH_1_sreg_FFd2_In,
      CLR => RESET_IBUF_1,
      C => CLKDIV262K_1_temp_div_262144_3_Q,
      Q => STATEMACH_1_sreg_FFd2_18
    );
  HEX2LED_1_Mrom_LED1 : LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      I0 => hex2led_int1(0),
      I1 => hex2led_int1(1),
      I2 => hex2led_int1(2),
      I3 => hex2led_int1(3),
      O => N2
    );
  HEX2LED_1_Mrom_LED2 : LUT4
    generic map(
      INIT => X"D680"
    )
    port map (
      I0 => hex2led_int1(0),
      I1 => hex2led_int1(1),
      I2 => hex2led_int1(3),
      I3 => hex2led_int1(2),
      O => N3
    );
  HEX2LED_1_Mrom_LED3 : LUT4
    generic map(
      INIT => X"8098"
    )
    port map (
      I0 => hex2led_int1(2),
      I1 => hex2led_int1(3),
      I2 => hex2led_int1(1),
      I3 => hex2led_int1(0),
      O => N4
    );
  HEX2LED_1_Mrom_LED4 : LUT4
    generic map(
      INIT => X"8492"
    )
    port map (
      I0 => hex2led_int1(0),
      I1 => hex2led_int1(1),
      I2 => hex2led_int1(2),
      I3 => hex2led_int1(3),
      O => N5
    );
  HEX2LED_1_Mrom_LED5 : LUT4
    generic map(
      INIT => X"10F4"
    )
    port map (
      I0 => hex2led_int1(1),
      I1 => hex2led_int1(2),
      I2 => hex2led_int1(0),
      I3 => hex2led_int1(3),
      O => N6
    );
  HEX2LED_1_Mrom_LED6 : LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      I0 => hex2led_int1(1),
      I1 => hex2led_int1(3),
      I2 => hex2led_int1(0),
      I3 => hex2led_int1(2),
      O => N7
    );
  HEX2LED_1_Mrom_LED7 : LUT4
    generic map(
      INIT => X"1083"
    )
    port map (
      I0 => hex2led_int1(0),
      I1 => hex2led_int1(1),
      I2 => hex2led_int1(2),
      I3 => hex2led_int1(3),
      O => N8
    );
  HEX2LED_2_Mrom_LED1 : LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      I0 => hex2led_int2(0),
      I1 => hex2led_int2(1),
      I2 => hex2led_int2(2),
      I3 => hex2led_int2(3),
      O => N9
    );
  HEX2LED_2_Mrom_LED2 : LUT4
    generic map(
      INIT => X"D680"
    )
    port map (
      I0 => hex2led_int2(0),
      I1 => hex2led_int2(1),
      I2 => hex2led_int2(3),
      I3 => hex2led_int2(2),
      O => N10
    );
  HEX2LED_2_Mrom_LED3 : LUT4
    generic map(
      INIT => X"8098"
    )
    port map (
      I0 => hex2led_int2(2),
      I1 => hex2led_int2(3),
      I2 => hex2led_int2(1),
      I3 => hex2led_int2(0),
      O => N11
    );
  HEX2LED_2_Mrom_LED4 : LUT4
    generic map(
      INIT => X"8492"
    )
    port map (
      I0 => hex2led_int2(0),
      I1 => hex2led_int2(1),
      I2 => hex2led_int2(2),
      I3 => hex2led_int2(3),
      O => N12
    );
  HEX2LED_2_Mrom_LED5 : LUT4
    generic map(
      INIT => X"10F4"
    )
    port map (
      I0 => hex2led_int2(1),
      I1 => hex2led_int2(2),
      I2 => hex2led_int2(0),
      I3 => hex2led_int2(3),
      O => N13
    );
  HEX2LED_2_Mrom_LED6 : LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      I0 => hex2led_int2(1),
      I1 => hex2led_int2(3),
      I2 => hex2led_int2(0),
      I3 => hex2led_int2(2),
      O => N14
    );
  HEX2LED_2_Mrom_LED7 : LUT4
    generic map(
      INIT => X"1083"
    )
    port map (
      I0 => hex2led_int2(0),
      I1 => hex2led_int2(1),
      I2 => hex2led_int2(2),
      I3 => hex2led_int2(3),
      O => N15
    );
  HEX2LED_4_Mrom_LED1 : LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      I0 => hex2led_int4(0),
      I1 => hex2led_int4(1),
      I2 => hex2led_int4(2),
      I3 => hex2led_int4(3),
      O => N16
    );
  HEX2LED_4_Mrom_LED2 : LUT4
    generic map(
      INIT => X"D680"
    )
    port map (
      I0 => hex2led_int4(0),
      I1 => hex2led_int4(1),
      I2 => hex2led_int4(3),
      I3 => hex2led_int4(2),
      O => N17
    );
  HEX2LED_4_Mrom_LED3 : LUT4
    generic map(
      INIT => X"8098"
    )
    port map (
      I0 => hex2led_int4(2),
      I1 => hex2led_int4(3),
      I2 => hex2led_int4(1),
      I3 => hex2led_int4(0),
      O => N18
    );
  HEX2LED_4_Mrom_LED4 : LUT4
    generic map(
      INIT => X"8492"
    )
    port map (
      I0 => hex2led_int4(0),
      I1 => hex2led_int4(1),
      I2 => hex2led_int4(2),
      I3 => hex2led_int4(3),
      O => N19
    );
  HEX2LED_4_Mrom_LED5 : LUT4
    generic map(
      INIT => X"10F4"
    )
    port map (
      I0 => hex2led_int4(1),
      I1 => hex2led_int4(2),
      I2 => hex2led_int4(0),
      I3 => hex2led_int4(3),
      O => N20
    );
  HEX2LED_4_Mrom_LED6 : LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      I0 => hex2led_int4(1),
      I1 => hex2led_int4(3),
      I2 => hex2led_int4(0),
      I3 => hex2led_int4(2),
      O => N21
    );
  HEX2LED_4_Mrom_LED7 : LUT4
    generic map(
      INIT => X"1083"
    )
    port map (
      I0 => hex2led_int4(0),
      I1 => hex2led_int4(1),
      I2 => hex2led_int4(2),
      I3 => hex2led_int4(3),
      O => N22
    );
  HEX2LED_5_Mrom_LED1 : LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      I0 => hex2led_int5(0),
      I1 => hex2led_int5(1),
      I2 => hex2led_int5(2),
      I3 => hex2led_int5(3),
      O => N23
    );
  HEX2LED_5_Mrom_LED2 : LUT4
    generic map(
      INIT => X"D680"
    )
    port map (
      I0 => hex2led_int5(0),
      I1 => hex2led_int5(1),
      I2 => hex2led_int5(3),
      I3 => hex2led_int5(2),
      O => N24
    );
  HEX2LED_5_Mrom_LED3 : LUT4
    generic map(
      INIT => X"8098"
    )
    port map (
      I0 => hex2led_int5(2),
      I1 => hex2led_int5(3),
      I2 => hex2led_int5(1),
      I3 => hex2led_int5(0),
      O => N25
    );
  HEX2LED_5_Mrom_LED4 : LUT4
    generic map(
      INIT => X"8492"
    )
    port map (
      I0 => hex2led_int5(0),
      I1 => hex2led_int5(1),
      I2 => hex2led_int5(2),
      I3 => hex2led_int5(3),
      O => N26
    );
  HEX2LED_5_Mrom_LED5 : LUT4
    generic map(
      INIT => X"10F4"
    )
    port map (
      I0 => hex2led_int5(1),
      I1 => hex2led_int5(2),
      I2 => hex2led_int5(0),
      I3 => hex2led_int5(3),
      O => N27
    );
  HEX2LED_5_Mrom_LED6 : LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      I0 => hex2led_int5(1),
      I1 => hex2led_int5(3),
      I2 => hex2led_int5(0),
      I3 => hex2led_int5(2),
      O => N28
    );
  HEX2LED_5_Mrom_LED7 : LUT4
    generic map(
      INIT => X"1083"
    )
    port map (
      I0 => hex2led_int5(0),
      I1 => hex2led_int5(1),
      I2 => hex2led_int5(2),
      I3 => hex2led_int5(3),
      O => N29
    );
  HEX2LED_3_Mrom_LED1 : LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      I0 => hex2led_int3(0),
      I1 => hex2led_int3(1),
      I2 => hex2led_int3(2),
      I3 => hex2led_int3(3),
      O => N30
    );
  HEX2LED_3_Mrom_LED2 : LUT4
    generic map(
      INIT => X"D680"
    )
    port map (
      I0 => hex2led_int3(0),
      I1 => hex2led_int3(1),
      I2 => hex2led_int3(3),
      I3 => hex2led_int3(2),
      O => N31
    );
  HEX2LED_3_Mrom_LED3 : LUT4
    generic map(
      INIT => X"8098"
    )
    port map (
      I0 => hex2led_int3(2),
      I1 => hex2led_int3(3),
      I2 => hex2led_int3(1),
      I3 => hex2led_int3(0),
      O => N32
    );
  HEX2LED_3_Mrom_LED4 : LUT4
    generic map(
      INIT => X"8492"
    )
    port map (
      I0 => hex2led_int3(0),
      I1 => hex2led_int3(1),
      I2 => hex2led_int3(2),
      I3 => hex2led_int3(3),
      O => N33
    );
  HEX2LED_3_Mrom_LED5 : LUT4
    generic map(
      INIT => X"10F4"
    )
    port map (
      I0 => hex2led_int3(1),
      I1 => hex2led_int3(2),
      I2 => hex2led_int3(0),
      I3 => hex2led_int3(3),
      O => N34
    );
  HEX2LED_3_Mrom_LED6 : LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      I0 => hex2led_int3(1),
      I1 => hex2led_int3(3),
      I2 => hex2led_int3(0),
      I3 => hex2led_int3(2),
      O => N35
    );
  HEX2LED_3_Mrom_LED7 : LUT4
    generic map(
      INIT => X"1083"
    )
    port map (
      I0 => hex2led_int3(0),
      I1 => hex2led_int3(1),
      I2 => hex2led_int3(2),
      I3 => hex2led_int3(3),
      O => N36
    );
  DCM1_1_CLKFX_BUFG_INST : BUFG
    port map (
      I => DCM1_1_CLKFX_BUF,
      O => clk_262144k
    );
  DCM1_1_CLKIN_IBUFG_INST : IBUFG
    port map (
      I => CLK,
      O => DCM1_1_CLKIN_IBUFG_OUT
    );
  DCM1_1_CLK0_BUFG_INST : BUFG
    port map (
      I => DCM1_1_CLK0_BUF,
      O => clk_int
    );
  DCM1_1_DCM_INST : DCM
    generic map(
      CLK_FEEDBACK => "1X",
      CLKDV_DIVIDE => 2.0,
      CLKFX_DIVIDE => 25,
      CLKFX_MULTIPLY => 13,
      CLKIN_DIVIDE_BY_2 => FALSE,
      CLKIN_PERIOD => 20.0,
      CLKOUT_PHASE_SHIFT => "NONE",
      DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
      DFS_FREQUENCY_MODE => "LOW",
      DLL_FREQUENCY_MODE => "LOW",
      DSS_MODE => "NONE",
      DUTY_CYCLE_CORRECTION => TRUE,
      PHASE_SHIFT => 0,
      STARTUP_WAIT => TRUE,
      FACTORY_JF => X"C080"
    )
    port map (
      RST => RESET_IBUF_1,
      CLKIN => DCM1_1_CLKIN_IBUFG_OUT,
      CLKFB => clk_int,
      PSINCDEC => ones_concat(0),
      PSEN => ones_concat(0),
      PSCLK => ones_concat(0),
      DSSEN => ones_concat(0),
      CLK0 => DCM1_1_CLK0_BUF,
      CLK90 => NLW_DCM1_1_DCM_INST_CLK90_UNCONNECTED,
      CLK180 => NLW_DCM1_1_DCM_INST_CLK180_UNCONNECTED,
      CLK270 => NLW_DCM1_1_DCM_INST_CLK270_UNCONNECTED,
      CLK2X => NLW_DCM1_1_DCM_INST_CLK2X_UNCONNECTED,
      CLK2X180 => NLW_DCM1_1_DCM_INST_CLK2X180_UNCONNECTED,
      CLKDV => NLW_DCM1_1_DCM_INST_CLKDV_UNCONNECTED,
      CLKFX => DCM1_1_CLKFX_BUF,
      CLKFX180 => NLW_DCM1_1_DCM_INST_CLKFX180_UNCONNECTED,
      LOCKED => locked,
      PSDONE => NLW_DCM1_1_DCM_INST_PSDONE_UNCONNECTED,
      STATUS(7) => NLW_DCM1_1_DCM_INST_STATUS_7_UNCONNECTED,
      STATUS(6) => NLW_DCM1_1_DCM_INST_STATUS_6_UNCONNECTED,
      STATUS(5) => NLW_DCM1_1_DCM_INST_STATUS_5_UNCONNECTED,
      STATUS(4) => NLW_DCM1_1_DCM_INST_STATUS_4_UNCONNECTED,
      STATUS(3) => NLW_DCM1_1_DCM_INST_STATUS_3_UNCONNECTED,
      STATUS(2) => NLW_DCM1_1_DCM_INST_STATUS_2_UNCONNECTED,
      STATUS(1) => NLW_DCM1_1_DCM_INST_STATUS_1_UNCONNECTED,
      STATUS(0) => NLW_DCM1_1_DCM_INST_STATUS_0_UNCONNECTED
    );
  TIMECNT_1 : TIMECNT_1#time_cnt
    port map (
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      CE => time_cnt_ce,
      CLR => rst_int,
      SEC_LSB(3) => hex2led_int3(3),
      SEC_LSB(2) => hex2led_int3(2),
      SEC_LSB(1) => hex2led_int3(1),
      SEC_LSB(0) => hex2led_int3(0),
      SEC_MSB(3) => hex2led_int4(3),
      SEC_MSB(2) => hex2led_int4(2),
      SEC_MSB(1) => hex2led_int4(1),
      SEC_MSB(0) => hex2led_int4(0),
      MINUTES(3) => hex2led_int5(3),
      MINUTES(2) => hex2led_int5(2),
      MINUTES(1) => hex2led_int5(1),
      MINUTES(0) => hex2led_int5(0)
    );
  LEDCONTROL_1 : LEDCONTROL_1#led_control
    port map (
      CLK => clk_int,
      HUNDREDTHS(7) => N8,
      HUNDREDTHS(6) => N7,
      HUNDREDTHS(5) => N6,
      HUNDREDTHS(4) => N5,
      HUNDREDTHS(3) => N4,
      HUNDREDTHS(2) => N3,
      HUNDREDTHS(1) => N2,
      HUNDREDTHS(0) => hundredths_concat(0),
      TENTHS(7) => N15,
      TENTHS(6) => N14,
      TENTHS(5) => N13,
      TENTHS(4) => N12,
      TENTHS(3) => N11,
      TENTHS(2) => N10,
      TENTHS(1) => N9,
      TENTHS(0) => hundredths_concat(0),
      ONES(7) => N36,
      ONES(6) => N35,
      ONES(5) => N34,
      ONES(4) => N33,
      ONES(3) => N32,
      ONES(2) => N31,
      ONES(1) => N30,
      ONES(0) => ones_concat(0),
      TENS(7) => N22,
      TENS(6) => N21,
      TENS(5) => N20,
      TENS(4) => N19,
      TENS(3) => N18,
      TENS(2) => N17,
      TENS(1) => N16,
      TENS(0) => hundredths_concat(0),
      MINUTES(7) => N29,
      MINUTES(6) => N28,
      MINUTES(5) => N27,
      MINUTES(4) => N26,
      MINUTES(3) => N25,
      MINUTES(2) => N24,
      MINUTES(1) => N23,
      MINUTES(0) => ones_concat(0),
      AN(3) => AN_3_OBUF_10,
      AN(2) => AN_2_OBUF_11,
      AN(1) => AN_1_OBUF_12,
      AN(0) => AN_0_OBUF_13,
      SEVEN_SEG(7) => SEG_G_OBUF_8,
      SEVEN_SEG(6) => SEG_F_OBUF_7,
      SEVEN_SEG(5) => SEG_E_OBUF_6,
      SEVEN_SEG(4) => SEG_D_OBUF_5,
      SEVEN_SEG(3) => SEG_C_OBUF_4,
      SEVEN_SEG(2) => SEG_B_OBUF_3,
      SEVEN_SEG(1) => SEG_A_OBUF_2,
      SEVEN_SEG(0) => SEG_DP_OBUF_9
    );
  STATEMACH_1_sreg_Out01 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => STATEMACH_1_sreg_FFd3_19,
      I1 => STATEMACH_1_sreg_FFd2_18,
      I2 => STATEMACH_1_sreg_FFd1_17,
      O => rst_int
    );
  DEBOUNCE_1_SIG_OUT1 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => DEBOUNCE_1_int2_15,
      I1 => DEBOUNCE_1_int3_16,
      I2 => STRTSTOP_IBUF_0,
      I3 => DEBOUNCE_1_int1_14,
      O => strtstop_debounced
    );
  time_cnt_ce1 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => ten_cnt_thresh2,
      I1 => clk_en_int,
      I2 => ten_cnt_thresh1,
      O => time_cnt_ce
    );
  STATEMACH_1_sreg_Out11 : LUT3
    generic map(
      INIT => X"54"
    )
    port map (
      I0 => STATEMACH_1_sreg_FFd3_19,
      I1 => STATEMACH_1_sreg_FFd1_17,
      I2 => STATEMACH_1_sreg_FFd2_18,
      O => clk_en_int
    );
  STRTSTOP_IBUF : IBUF
    port map (
      I => STRTSTOP,
      O => STRTSTOP_IBUF_0
    );
  RESET_IBUF : IBUF
    port map (
      I => RESET,
      O => RESET_IBUF_1
    );
  SEG_A_OBUF : OBUF
    port map (
      I => SEG_A_OBUF_2,
      O => SEG_A
    );
  SEG_B_OBUF : OBUF
    port map (
      I => SEG_B_OBUF_3,
      O => SEG_B
    );
  SEG_C_OBUF : OBUF
    port map (
      I => SEG_C_OBUF_4,
      O => SEG_C
    );
  SEG_D_OBUF : OBUF
    port map (
      I => SEG_D_OBUF_5,
      O => SEG_D
    );
  SEG_E_OBUF : OBUF
    port map (
      I => SEG_E_OBUF_6,
      O => SEG_E
    );
  SEG_F_OBUF : OBUF
    port map (
      I => SEG_F_OBUF_7,
      O => SEG_F
    );
  SEG_G_OBUF : OBUF
    port map (
      I => SEG_G_OBUF_8,
      O => SEG_G
    );
  SEG_DP_OBUF : OBUF
    port map (
      I => SEG_DP_OBUF_9,
      O => SEG_DP
    );
  AN_3_OBUF : OBUF
    port map (
      I => AN_3_OBUF_10,
      O => AN(3)
    );
  AN_2_OBUF : OBUF
    port map (
      I => AN_2_OBUF_11,
      O => AN(2)
    );
  AN_1_OBUF : OBUF
    port map (
      I => AN_1_OBUF_12,
      O => AN(1)
    );
  AN_0_OBUF : OBUF
    port map (
      I => AN_0_OBUF_13,
      O => AN(0)
    );
  stopwatch_TIMESPEC_XST : TIMESPEC
;
  CLKDIV262K_1_div_32_0 : FDR
    port map (
      D => hundredths_concat(0),
      R => CLKDIV262K_1_div_32_15_Q,
      C => clk_262144k,
      Q => CLKDIV262K_1_div_32_0_Q
    );
  CLKDIV262K_1_div_1024_0 : FDR
    port map (
      D => hundredths_concat(0),
      R => CLKDIV262K_1_div_1024_15_Q,
      C => CLKDIV262K_1_div_32_15_Q,
      Q => CLKDIV262K_1_div_1024_0_Q
    );
  CLKDIV262K_1_div_32768_0 : FDR
    port map (
      D => hundredths_concat(0),
      R => CLKDIV262K_1_div_32768_15_Q,
      C => CLKDIV262K_1_div_1024_15_Q,
      Q => CLKDIV262K_1_div_32768_0_Q
    );
  CLKDIV262K_1_temp_div_262144_0 : FDR
    port map (
      D => hundredths_concat(0),
      R => CLKDIV262K_1_temp_div_262144_31_22,
      C => CLKDIV262K_1_div_32768_15_Q,
      Q => CLKDIV262K_1_temp_div_262144_0_Q
    );
  STATEMACH_1_sreg_FFd1_In : MUXF5
    port map (
      I0 => N241,
      I1 => N251,
      S => strtstop_debounced,
      O => STATEMACH_1_sreg_FFd1_In_20
    );
  STATEMACH_1_sreg_FFd1_In_F : LUT4
    generic map(
      INIT => X"A8F8"
    )
    port map (
      I0 => STATEMACH_1_sreg_FFd3_19,
      I1 => STATEMACH_1_sreg_FFd2_18,
      I2 => STATEMACH_1_sreg_FFd1_17,
      I3 => locked,
      O => N241
    );
  STATEMACH_1_sreg_FFd1_In_G : LUT4
    generic map(
      INIT => X"FF20"
    )
    port map (
      I0 => STATEMACH_1_sreg_FFd3_19,
      I1 => STATEMACH_1_sreg_FFd2_18,
      I2 => locked,
      I3 => STATEMACH_1_sreg_FFd1_17,
      O => N251
    );
  STATEMACH_1_sreg_FFd3_In : MUXF5
    port map (
      I0 => N261,
      I1 => N271,
      S => locked,
      O => STATEMACH_1_sreg_FFd3_In_21
    );
  STATEMACH_1_sreg_FFd3_In_F : LUT3
    generic map(
      INIT => X"FD"
    )
    port map (
      I0 => STATEMACH_1_sreg_FFd1_17,
      I1 => STATEMACH_1_sreg_FFd2_18,
      I2 => STATEMACH_1_sreg_FFd3_19,
      O => N261
    );
  STATEMACH_1_sreg_FFd3_In_G : LUT4
    generic map(
      INIT => X"EE47"
    )
    port map (
      I0 => strtstop_debounced,
      I1 => STATEMACH_1_sreg_FFd3_19,
      I2 => STATEMACH_1_sreg_FFd1_17,
      I3 => STATEMACH_1_sreg_FFd2_18,
      O => N271
    );
  CLKDIV262K_1_temp_div_262144_3_BUFG : BUFG
    port map (
      I => CLKDIV262K_1_temp_div_262144_31_22,
      O => CLKDIV262K_1_temp_div_262144_3_Q
    );
  STATEMACH_1_sreg_FFd2_In1 : LUT4
    generic map(
      INIT => X"5540"
    )
    port map (
      I0 => STATEMACH_1_sreg_FFd3_19,
      I1 => STATEMACH_1_sreg_FFd1_17,
      I2 => locked,
      I3 => STATEMACH_1_sreg_FFd2_18,
      O => N281
    );
  STATEMACH_1_sreg_FFd2_In_f5 : MUXF5
    port map (
      I0 => N281,
      I1 => STATEMACH_1_sreg_FFd2_18,
      S => strtstop_debounced,
      O => STATEMACH_1_sreg_FFd2_In
    );
  CLKDIV262K_1_Mshreg_div_32_15 : SRL16
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => hundredths_concat(0),
      A1 => ones_concat(0),
      A2 => hundredths_concat(0),
      A3 => hundredths_concat(0),
      CLK => clk_262144k,
      D => CLKDIV262K_1_div_32_0_Q,
      Q => CLKDIV262K_1_Mshreg_div_32_15_23
    );
  CLKDIV262K_1_div_32_15 : FD
    port map (
      D => CLKDIV262K_1_Mshreg_div_32_15_23,
      C => clk_262144k,
      Q => CLKDIV262K_1_div_32_15_Q
    );
  CLKDIV262K_1_Mshreg_div_1024_15 : SRL16
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => hundredths_concat(0),
      A1 => ones_concat(0),
      A2 => hundredths_concat(0),
      A3 => hundredths_concat(0),
      CLK => CLKDIV262K_1_div_32_15_Q,
      D => CLKDIV262K_1_div_1024_0_Q,
      Q => CLKDIV262K_1_Mshreg_div_1024_15_24
    );
  CLKDIV262K_1_div_1024_15 : FD
    port map (
      D => CLKDIV262K_1_Mshreg_div_1024_15_24,
      C => CLKDIV262K_1_div_32_15_Q,
      Q => CLKDIV262K_1_div_1024_15_Q
    );
  CLKDIV262K_1_Mshreg_div_32768_15 : SRL16
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => hundredths_concat(0),
      A1 => ones_concat(0),
      A2 => hundredths_concat(0),
      A3 => hundredths_concat(0),
      CLK => CLKDIV262K_1_div_1024_15_Q,
      D => CLKDIV262K_1_div_32768_0_Q,
      Q => CLKDIV262K_1_Mshreg_div_32768_15_25
    );
  CLKDIV262K_1_div_32768_15 : FD
    port map (
      D => CLKDIV262K_1_Mshreg_div_32768_15_25,
      C => CLKDIV262K_1_div_1024_15_Q,
      Q => CLKDIV262K_1_div_32768_15_Q
    );
  CLKDIV262K_1_Mshreg_temp_div_262144_31 : SRL16
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => hundredths_concat(0),
      A1 => ones_concat(0),
      A2 => ones_concat(0),
      A3 => ones_concat(0),
      CLK => CLKDIV262K_1_div_32768_15_Q,
      D => CLKDIV262K_1_temp_div_262144_0_Q,
      Q => CLKDIV262K_1_Mshreg_temp_div_262144_31_26
    );
  CLKDIV262K_1_temp_div_262144_31 : FD
    port map (
      D => CLKDIV262K_1_Mshreg_temp_div_262144_31_26,
      C => CLKDIV262K_1_div_32768_15_Q,
      Q => CLKDIV262K_1_temp_div_262144_31_22
    );

end Structure;

