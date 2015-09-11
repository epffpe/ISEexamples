--------------------------------------------------------------------------------
-- Copyright (c) 1995-2006 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: I.31
--  \   \         Application: netgen
--  /   /         Filename: stopwatch_translate.vhd
-- /___/   /\     Timestamp: Fri Jan 19 11:48:40 2007
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm stopwatch -w -dir netgen/translate -ofmt vhdl -sim stopwatch.ngd stopwatch_translate.vhd 
-- Device	: 3s200ft256-4
-- Input file	: stopwatch.ngd
-- Output file	: C:\Xilinx\ISEexamples\wtut_vhd\wtut_vhd\netgen\translate\stopwatch_translate.vhd
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
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

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
  signal STRTSTOP_IBUF_11 : STD_LOGIC; 
  signal RESET_IBUF_12 : STD_LOGIC; 
  signal SEG_A_OBUF_13 : STD_LOGIC; 
  signal SEG_B_OBUF_14 : STD_LOGIC; 
  signal SEG_C_OBUF_15 : STD_LOGIC; 
  signal SEG_D_OBUF_16 : STD_LOGIC; 
  signal SEG_E_OBUF_17 : STD_LOGIC; 
  signal SEG_F_OBUF_18 : STD_LOGIC; 
  signal SEG_G_OBUF_19 : STD_LOGIC; 
  signal SEG_DP_OBUF_20 : STD_LOGIC; 
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
  signal AN_3_OBUF_21 : STD_LOGIC; 
  signal AN_2_OBUF_22 : STD_LOGIC; 
  signal AN_1_OBUF_23 : STD_LOGIC; 
  signal AN_0_OBUF_24 : STD_LOGIC; 
  signal DCM1_1_CLKIN_IBUFG_OUT : STD_LOGIC; 
  signal DCM1_1_CLK0_BUF : STD_LOGIC; 
  signal DCM1_1_CLKFX_BUF : STD_LOGIC; 
  signal DEBOUNCE_1_int1_25 : STD_LOGIC; 
  signal DEBOUNCE_1_int2_26 : STD_LOGIC; 
  signal DEBOUNCE_1_int3_27 : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd1_28 : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd2_29 : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd3_30 : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd1_In_31 : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd2_In : STD_LOGIC; 
  signal STATEMACH_1_sreg_FFd3_In_32 : STD_LOGIC; 
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
  signal CLKDIV262K_1_temp_div_262144_31_33 : STD_LOGIC; 
  signal N281 : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_div_32_15 : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_div_1024_15 : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_div_32768_15 : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_temp_div_262144_31 : STD_LOGIC; 
  signal ten_cnt1_BU2_U0_not0002 : STD_LOGIC; 
  signal ten_cnt1_BU2_U0_q_i_2_rt_34 : STD_LOGIC; 
  signal ten_cnt1_BU2_U0_q_i_1_rt_35 : STD_LOGIC; 
  signal ten_cnt1_BU2_U0_q_i_3_rt_36 : STD_LOGIC; 
  signal ten_cnt1_BU2_N0 : STD_LOGIC; 
  signal ten_cnt1_BU2_q_thresh1 : STD_LOGIC; 
  signal ten_cnt2_BU2_U0_not0002 : STD_LOGIC; 
  signal ten_cnt2_BU2_U0_q_i_2_rt_37 : STD_LOGIC; 
  signal ten_cnt2_BU2_U0_q_i_1_rt_38 : STD_LOGIC; 
  signal ten_cnt2_BU2_U0_q_i_3_rt_39 : STD_LOGIC; 
  signal ten_cnt2_BU2_N0 : STD_LOGIC; 
  signal ten_cnt2_BU2_q_thresh1 : STD_LOGIC; 
  signal TIMECNT_1_N15 : STD_LOGIC; 
  signal TIMECNT_1_N14 : STD_LOGIC; 
  signal TIMECNT_1_and0000 : STD_LOGIC; 
  signal TIMECNT_1_and0001 : STD_LOGIC; 
  signal LEDCONTROL_1_cmp_eq0000_map26 : STD_LOGIC; 
  signal LEDCONTROL_1_cmp_eq0000_map20 : STD_LOGIC; 
  signal LEDCONTROL_1_N171 : STD_LOGIC; 
  signal LEDCONTROL_1_N161 : STD_LOGIC; 
  signal LEDCONTROL_1_N151 : STD_LOGIC; 
  signal LEDCONTROL_1_N141 : STD_LOGIC; 
  signal LEDCONTROL_1_N131 : STD_LOGIC; 
  signal LEDCONTROL_1_N121 : STD_LOGIC; 
  signal LEDCONTROL_1_N111 : STD_LOGIC; 
  signal LEDCONTROL_1_N101 : STD_LOGIC; 
  signal LEDCONTROL_1_N912 : STD_LOGIC; 
  signal LEDCONTROL_1_N812 : STD_LOGIC; 
  signal LEDCONTROL_1_N712 : STD_LOGIC; 
  signal LEDCONTROL_1_N612 : STD_LOGIC; 
  signal LEDCONTROL_1_N512 : STD_LOGIC; 
  signal LEDCONTROL_1_N412 : STD_LOGIC; 
  signal LEDCONTROL_1_N312 : STD_LOGIC; 
  signal LEDCONTROL_1_N212 : STD_LOGIC; 
  signal LEDCONTROL_1_N17 : STD_LOGIC; 
  signal LEDCONTROL_1_N16 : STD_LOGIC; 
  signal LEDCONTROL_1_N15 : STD_LOGIC; 
  signal LEDCONTROL_1_N14 : STD_LOGIC; 
  signal LEDCONTROL_1_N13 : STD_LOGIC; 
  signal LEDCONTROL_1_N12 : STD_LOGIC; 
  signal LEDCONTROL_1_N11 : STD_LOGIC; 
  signal LEDCONTROL_1_N10 : STD_LOGIC; 
  signal LEDCONTROL_1_N91 : STD_LOGIC; 
  signal LEDCONTROL_1_N81 : STD_LOGIC; 
  signal LEDCONTROL_1_N71 : STD_LOGIC; 
  signal LEDCONTROL_1_N61 : STD_LOGIC; 
  signal LEDCONTROL_1_N51 : STD_LOGIC; 
  signal LEDCONTROL_1_N41 : STD_LOGIC; 
  signal LEDCONTROL_1_N31 : STD_LOGIC; 
  signal LEDCONTROL_1_N21 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_15_rt_40 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_14_rt_41 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_13_rt_42 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_12_rt_43 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_11_rt_44 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_10_rt_45 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_9_rt_46 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_8_rt_47 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_7_rt_48 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_6_rt_49 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_5_rt_50 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_4_rt_51 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_3_rt_52 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_2_rt_53 : STD_LOGIC; 
  signal LEDCONTROL_1_cnt_1_rt_54 : STD_LOGIC; 
  signal LEDCONTROL_1_N3 : STD_LOGIC; 
  signal LEDCONTROL_1_N2 : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_div_32_15_CE : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_div_1024_15_CE : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_div_32768_15_CE : STD_LOGIC; 
  signal CLKDIV262K_1_Mshreg_temp_div_262144_31_CE : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
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
  signal NLW_ten_cnt1_GND_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_ten_cnt1_VCC_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_ten_cnt2_GND_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_ten_cnt2_VCC_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_CLKDIV262K_1_Mshreg_div_32_15_SRL16E_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_CLKDIV262K_1_Mshreg_div_1024_15_SRL16E_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_CLKDIV262K_1_Mshreg_div_32768_15_SRL16E_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_CLKDIV262K_1_Mshreg_temp_div_262144_31_SRL16E_Q15_UNCONNECTED : STD_LOGIC; 
  signal hex2led_int1 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal hex2led_int2 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal hex2led_int3 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal hex2led_int4 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal hex2led_int5 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal hundredths_concat : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal ones_concat : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal ten_cnt1_BU2_U0_q_next : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_halfsum : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal ten_cnt1_BU2_U0_mux0002 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal ten_cnt2_BU2_U0_q_next : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_halfsum : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal ten_cnt2_BU2_U0_mux0002 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal TIMECNT_1_tens_cnt_mux0000 : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal TIMECNT_1_ones_cnt_mux0000 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal TIMECNT_1_mins_cnt_mux0000 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal LEDCONTROL_1_d1 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal LEDCONTROL_1_d0 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal LEDCONTROL_1_Mcount_cnt_cy : STD_LOGIC_VECTOR ( 14 downto 0 ); 
  signal LEDCONTROL_1_Result : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal LEDCONTROL_1_cnt : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal LEDCONTROL_1_mux0001 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  XST_VCC : X_ONE
    port map (
      O => hundredths_concat(0)
    );
  XST_GND : X_ZERO
    port map (
      O => ones_concat(0)
    );
  DEBOUNCE_1_int1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => STRTSTOP_IBUF_11,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => DEBOUNCE_1_int1_25,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  DEBOUNCE_1_int2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => DEBOUNCE_1_int1_25,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => DEBOUNCE_1_int2_26,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  DEBOUNCE_1_int3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => DEBOUNCE_1_int2_26,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => DEBOUNCE_1_int3_27,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  STATEMACH_1_sreg_FFd3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => STATEMACH_1_sreg_FFd3_In_32,
      RST => RESET_IBUF_12,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => STATEMACH_1_sreg_FFd3_30,
      CE => VCC,
      SET => GND
    );
  STATEMACH_1_sreg_FFd1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => STATEMACH_1_sreg_FFd1_In_31,
      RST => RESET_IBUF_12,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => STATEMACH_1_sreg_FFd1_28,
      CE => VCC,
      SET => GND
    );
  STATEMACH_1_sreg_FFd2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => STATEMACH_1_sreg_FFd2_In,
      RST => RESET_IBUF_12,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => STATEMACH_1_sreg_FFd2_29,
      CE => VCC,
      SET => GND
    );
  HEX2LED_1_Mrom_LED1 : X_LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      ADR0 => hex2led_int1(0),
      ADR1 => hex2led_int1(1),
      ADR2 => hex2led_int1(2),
      ADR3 => hex2led_int1(3),
      O => N2
    );
  HEX2LED_1_Mrom_LED2 : X_LUT4
    generic map(
      INIT => X"D680"
    )
    port map (
      ADR0 => hex2led_int1(0),
      ADR1 => hex2led_int1(1),
      ADR2 => hex2led_int1(3),
      ADR3 => hex2led_int1(2),
      O => N3
    );
  HEX2LED_1_Mrom_LED3 : X_LUT4
    generic map(
      INIT => X"8098"
    )
    port map (
      ADR0 => hex2led_int1(2),
      ADR1 => hex2led_int1(3),
      ADR2 => hex2led_int1(1),
      ADR3 => hex2led_int1(0),
      O => N4
    );
  HEX2LED_1_Mrom_LED4 : X_LUT4
    generic map(
      INIT => X"8492"
    )
    port map (
      ADR0 => hex2led_int1(0),
      ADR1 => hex2led_int1(1),
      ADR2 => hex2led_int1(2),
      ADR3 => hex2led_int1(3),
      O => N5
    );
  HEX2LED_1_Mrom_LED5 : X_LUT4
    generic map(
      INIT => X"10F4"
    )
    port map (
      ADR0 => hex2led_int1(1),
      ADR1 => hex2led_int1(2),
      ADR2 => hex2led_int1(0),
      ADR3 => hex2led_int1(3),
      O => N6
    );
  HEX2LED_1_Mrom_LED6 : X_LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      ADR0 => hex2led_int1(1),
      ADR1 => hex2led_int1(3),
      ADR2 => hex2led_int1(0),
      ADR3 => hex2led_int1(2),
      O => N7
    );
  HEX2LED_1_Mrom_LED7 : X_LUT4
    generic map(
      INIT => X"1083"
    )
    port map (
      ADR0 => hex2led_int1(0),
      ADR1 => hex2led_int1(1),
      ADR2 => hex2led_int1(2),
      ADR3 => hex2led_int1(3),
      O => N8
    );
  HEX2LED_2_Mrom_LED1 : X_LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      ADR0 => hex2led_int2(0),
      ADR1 => hex2led_int2(1),
      ADR2 => hex2led_int2(2),
      ADR3 => hex2led_int2(3),
      O => N9
    );
  HEX2LED_2_Mrom_LED2 : X_LUT4
    generic map(
      INIT => X"D680"
    )
    port map (
      ADR0 => hex2led_int2(0),
      ADR1 => hex2led_int2(1),
      ADR2 => hex2led_int2(3),
      ADR3 => hex2led_int2(2),
      O => N10
    );
  HEX2LED_2_Mrom_LED3 : X_LUT4
    generic map(
      INIT => X"8098"
    )
    port map (
      ADR0 => hex2led_int2(2),
      ADR1 => hex2led_int2(3),
      ADR2 => hex2led_int2(1),
      ADR3 => hex2led_int2(0),
      O => N11
    );
  HEX2LED_2_Mrom_LED4 : X_LUT4
    generic map(
      INIT => X"8492"
    )
    port map (
      ADR0 => hex2led_int2(0),
      ADR1 => hex2led_int2(1),
      ADR2 => hex2led_int2(2),
      ADR3 => hex2led_int2(3),
      O => N12
    );
  HEX2LED_2_Mrom_LED5 : X_LUT4
    generic map(
      INIT => X"10F4"
    )
    port map (
      ADR0 => hex2led_int2(1),
      ADR1 => hex2led_int2(2),
      ADR2 => hex2led_int2(0),
      ADR3 => hex2led_int2(3),
      O => N13
    );
  HEX2LED_2_Mrom_LED6 : X_LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      ADR0 => hex2led_int2(1),
      ADR1 => hex2led_int2(3),
      ADR2 => hex2led_int2(0),
      ADR3 => hex2led_int2(2),
      O => N14
    );
  HEX2LED_2_Mrom_LED7 : X_LUT4
    generic map(
      INIT => X"1083"
    )
    port map (
      ADR0 => hex2led_int2(0),
      ADR1 => hex2led_int2(1),
      ADR2 => hex2led_int2(2),
      ADR3 => hex2led_int2(3),
      O => N15
    );
  HEX2LED_4_Mrom_LED1 : X_LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      ADR0 => hex2led_int4(0),
      ADR1 => hex2led_int4(1),
      ADR2 => hex2led_int4(2),
      ADR3 => hex2led_int4(3),
      O => N16
    );
  HEX2LED_4_Mrom_LED2 : X_LUT4
    generic map(
      INIT => X"D680"
    )
    port map (
      ADR0 => hex2led_int4(0),
      ADR1 => hex2led_int4(1),
      ADR2 => hex2led_int4(3),
      ADR3 => hex2led_int4(2),
      O => N17
    );
  HEX2LED_4_Mrom_LED3 : X_LUT4
    generic map(
      INIT => X"8098"
    )
    port map (
      ADR0 => hex2led_int4(2),
      ADR1 => hex2led_int4(3),
      ADR2 => hex2led_int4(1),
      ADR3 => hex2led_int4(0),
      O => N18
    );
  HEX2LED_4_Mrom_LED4 : X_LUT4
    generic map(
      INIT => X"8492"
    )
    port map (
      ADR0 => hex2led_int4(0),
      ADR1 => hex2led_int4(1),
      ADR2 => hex2led_int4(2),
      ADR3 => hex2led_int4(3),
      O => N19
    );
  HEX2LED_4_Mrom_LED5 : X_LUT4
    generic map(
      INIT => X"10F4"
    )
    port map (
      ADR0 => hex2led_int4(1),
      ADR1 => hex2led_int4(2),
      ADR2 => hex2led_int4(0),
      ADR3 => hex2led_int4(3),
      O => N20
    );
  HEX2LED_4_Mrom_LED6 : X_LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      ADR0 => hex2led_int4(1),
      ADR1 => hex2led_int4(3),
      ADR2 => hex2led_int4(0),
      ADR3 => hex2led_int4(2),
      O => N21
    );
  HEX2LED_4_Mrom_LED7 : X_LUT4
    generic map(
      INIT => X"1083"
    )
    port map (
      ADR0 => hex2led_int4(0),
      ADR1 => hex2led_int4(1),
      ADR2 => hex2led_int4(2),
      ADR3 => hex2led_int4(3),
      O => N22
    );
  HEX2LED_5_Mrom_LED1 : X_LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      ADR0 => hex2led_int5(0),
      ADR1 => hex2led_int5(1),
      ADR2 => hex2led_int5(2),
      ADR3 => hex2led_int5(3),
      O => N23
    );
  HEX2LED_5_Mrom_LED2 : X_LUT4
    generic map(
      INIT => X"D680"
    )
    port map (
      ADR0 => hex2led_int5(0),
      ADR1 => hex2led_int5(1),
      ADR2 => hex2led_int5(3),
      ADR3 => hex2led_int5(2),
      O => N24
    );
  HEX2LED_5_Mrom_LED3 : X_LUT4
    generic map(
      INIT => X"8098"
    )
    port map (
      ADR0 => hex2led_int5(2),
      ADR1 => hex2led_int5(3),
      ADR2 => hex2led_int5(1),
      ADR3 => hex2led_int5(0),
      O => N25
    );
  HEX2LED_5_Mrom_LED4 : X_LUT4
    generic map(
      INIT => X"8492"
    )
    port map (
      ADR0 => hex2led_int5(0),
      ADR1 => hex2led_int5(1),
      ADR2 => hex2led_int5(2),
      ADR3 => hex2led_int5(3),
      O => N26
    );
  HEX2LED_5_Mrom_LED5 : X_LUT4
    generic map(
      INIT => X"10F4"
    )
    port map (
      ADR0 => hex2led_int5(1),
      ADR1 => hex2led_int5(2),
      ADR2 => hex2led_int5(0),
      ADR3 => hex2led_int5(3),
      O => N27
    );
  HEX2LED_5_Mrom_LED6 : X_LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      ADR0 => hex2led_int5(1),
      ADR1 => hex2led_int5(3),
      ADR2 => hex2led_int5(0),
      ADR3 => hex2led_int5(2),
      O => N28
    );
  HEX2LED_5_Mrom_LED7 : X_LUT4
    generic map(
      INIT => X"1083"
    )
    port map (
      ADR0 => hex2led_int5(0),
      ADR1 => hex2led_int5(1),
      ADR2 => hex2led_int5(2),
      ADR3 => hex2led_int5(3),
      O => N29
    );
  HEX2LED_3_Mrom_LED1 : X_LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      ADR0 => hex2led_int3(0),
      ADR1 => hex2led_int3(1),
      ADR2 => hex2led_int3(2),
      ADR3 => hex2led_int3(3),
      O => N30
    );
  HEX2LED_3_Mrom_LED2 : X_LUT4
    generic map(
      INIT => X"D680"
    )
    port map (
      ADR0 => hex2led_int3(0),
      ADR1 => hex2led_int3(1),
      ADR2 => hex2led_int3(3),
      ADR3 => hex2led_int3(2),
      O => N31
    );
  HEX2LED_3_Mrom_LED3 : X_LUT4
    generic map(
      INIT => X"8098"
    )
    port map (
      ADR0 => hex2led_int3(2),
      ADR1 => hex2led_int3(3),
      ADR2 => hex2led_int3(1),
      ADR3 => hex2led_int3(0),
      O => N32
    );
  HEX2LED_3_Mrom_LED4 : X_LUT4
    generic map(
      INIT => X"8492"
    )
    port map (
      ADR0 => hex2led_int3(0),
      ADR1 => hex2led_int3(1),
      ADR2 => hex2led_int3(2),
      ADR3 => hex2led_int3(3),
      O => N33
    );
  HEX2LED_3_Mrom_LED5 : X_LUT4
    generic map(
      INIT => X"10F4"
    )
    port map (
      ADR0 => hex2led_int3(1),
      ADR1 => hex2led_int3(2),
      ADR2 => hex2led_int3(0),
      ADR3 => hex2led_int3(3),
      O => N34
    );
  HEX2LED_3_Mrom_LED6 : X_LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      ADR0 => hex2led_int3(1),
      ADR1 => hex2led_int3(3),
      ADR2 => hex2led_int3(0),
      ADR3 => hex2led_int3(2),
      O => N35
    );
  HEX2LED_3_Mrom_LED7 : X_LUT4
    generic map(
      INIT => X"1083"
    )
    port map (
      ADR0 => hex2led_int3(0),
      ADR1 => hex2led_int3(1),
      ADR2 => hex2led_int3(2),
      ADR3 => hex2led_int3(3),
      O => N36
    );
  DCM1_1_CLKFX_BUFG_INST : X_CKBUF
    port map (
      I => DCM1_1_CLKFX_BUF,
      O => clk_262144k
    );
  DCM1_1_CLKIN_IBUFG_INST : X_CKBUF
    port map (
      I => CLK,
      O => DCM1_1_CLKIN_IBUFG_OUT
    );
  DCM1_1_CLK0_BUFG_INST : X_CKBUF
    port map (
      I => DCM1_1_CLK0_BUF,
      O => clk_int
    );
  DCM1_1_DCM_INST : X_DCM
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
      RST => RESET_IBUF_12,
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
  STATEMACH_1_sreg_Out01 : X_LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      ADR0 => STATEMACH_1_sreg_FFd3_30,
      ADR1 => STATEMACH_1_sreg_FFd2_29,
      ADR2 => STATEMACH_1_sreg_FFd1_28,
      O => rst_int
    );
  DEBOUNCE_1_SIG_OUT1 : X_LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      ADR0 => DEBOUNCE_1_int2_26,
      ADR1 => DEBOUNCE_1_int3_27,
      ADR2 => STRTSTOP_IBUF_11,
      ADR3 => DEBOUNCE_1_int1_25,
      O => strtstop_debounced
    );
  time_cnt_ce1 : X_LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      ADR0 => ten_cnt_thresh2,
      ADR1 => clk_en_int,
      ADR2 => ten_cnt_thresh1,
      O => time_cnt_ce
    );
  STATEMACH_1_sreg_Out11 : X_LUT3
    generic map(
      INIT => X"54"
    )
    port map (
      ADR0 => STATEMACH_1_sreg_FFd3_30,
      ADR1 => STATEMACH_1_sreg_FFd1_28,
      ADR2 => STATEMACH_1_sreg_FFd2_29,
      O => clk_en_int
    );
  STRTSTOP_IBUF : X_BUF
    port map (
      I => STRTSTOP,
      O => STRTSTOP_IBUF_11
    );
  RESET_IBUF : X_BUF
    port map (
      I => RESET,
      O => RESET_IBUF_12
    );
  CLKDIV262K_1_div_32_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => hundredths_concat(0),
      SRST => CLKDIV262K_1_div_32_15_Q,
      CLK => clk_262144k,
      O => CLKDIV262K_1_div_32_0_Q,
      CE => VCC,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  CLKDIV262K_1_div_1024_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => hundredths_concat(0),
      SRST => CLKDIV262K_1_div_1024_15_Q,
      CLK => CLKDIV262K_1_div_32_15_Q,
      O => CLKDIV262K_1_div_1024_0_Q,
      CE => VCC,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  CLKDIV262K_1_div_32768_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => hundredths_concat(0),
      SRST => CLKDIV262K_1_div_32768_15_Q,
      CLK => CLKDIV262K_1_div_1024_15_Q,
      O => CLKDIV262K_1_div_32768_0_Q,
      CE => VCC,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  CLKDIV262K_1_temp_div_262144_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => hundredths_concat(0),
      SRST => CLKDIV262K_1_temp_div_262144_31_33,
      CLK => CLKDIV262K_1_div_32768_15_Q,
      O => CLKDIV262K_1_temp_div_262144_0_Q,
      CE => VCC,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  STATEMACH_1_sreg_FFd1_In : X_MUX2
    port map (
      IA => N241,
      IB => N251,
      SEL => strtstop_debounced,
      O => STATEMACH_1_sreg_FFd1_In_31
    );
  STATEMACH_1_sreg_FFd1_In_F : X_LUT4
    generic map(
      INIT => X"A8F8"
    )
    port map (
      ADR0 => STATEMACH_1_sreg_FFd3_30,
      ADR1 => STATEMACH_1_sreg_FFd2_29,
      ADR2 => STATEMACH_1_sreg_FFd1_28,
      ADR3 => locked,
      O => N241
    );
  STATEMACH_1_sreg_FFd1_In_G : X_LUT4
    generic map(
      INIT => X"FF20"
    )
    port map (
      ADR0 => STATEMACH_1_sreg_FFd3_30,
      ADR1 => STATEMACH_1_sreg_FFd2_29,
      ADR2 => locked,
      ADR3 => STATEMACH_1_sreg_FFd1_28,
      O => N251
    );
  STATEMACH_1_sreg_FFd3_In : X_MUX2
    port map (
      IA => N261,
      IB => N271,
      SEL => locked,
      O => STATEMACH_1_sreg_FFd3_In_32
    );
  STATEMACH_1_sreg_FFd3_In_F : X_LUT3
    generic map(
      INIT => X"FD"
    )
    port map (
      ADR0 => STATEMACH_1_sreg_FFd1_28,
      ADR1 => STATEMACH_1_sreg_FFd2_29,
      ADR2 => STATEMACH_1_sreg_FFd3_30,
      O => N261
    );
  STATEMACH_1_sreg_FFd3_In_G : X_LUT4
    generic map(
      INIT => X"EE47"
    )
    port map (
      ADR0 => strtstop_debounced,
      ADR1 => STATEMACH_1_sreg_FFd3_30,
      ADR2 => STATEMACH_1_sreg_FFd1_28,
      ADR3 => STATEMACH_1_sreg_FFd2_29,
      O => N271
    );
  CLKDIV262K_1_temp_div_262144_3_BUFG : X_CKBUF
    port map (
      I => CLKDIV262K_1_temp_div_262144_31_33,
      O => CLKDIV262K_1_temp_div_262144_3_Q
    );
  STATEMACH_1_sreg_FFd2_In1 : X_LUT4
    generic map(
      INIT => X"5540"
    )
    port map (
      ADR0 => STATEMACH_1_sreg_FFd3_30,
      ADR1 => STATEMACH_1_sreg_FFd1_28,
      ADR2 => locked,
      ADR3 => STATEMACH_1_sreg_FFd2_29,
      O => N281
    );
  STATEMACH_1_sreg_FFd2_In_f5 : X_MUX2
    port map (
      IA => N281,
      IB => STATEMACH_1_sreg_FFd2_29,
      SEL => strtstop_debounced,
      O => STATEMACH_1_sreg_FFd2_In
    );
  CLKDIV262K_1_div_32_15 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => CLKDIV262K_1_Mshreg_div_32_15,
      CLK => clk_262144k,
      O => CLKDIV262K_1_div_32_15_Q,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  CLKDIV262K_1_div_1024_15 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => CLKDIV262K_1_Mshreg_div_1024_15,
      CLK => CLKDIV262K_1_div_32_15_Q,
      O => CLKDIV262K_1_div_1024_15_Q,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  CLKDIV262K_1_div_32768_15 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => CLKDIV262K_1_Mshreg_div_32768_15,
      CLK => CLKDIV262K_1_div_1024_15_Q,
      O => CLKDIV262K_1_div_32768_15_Q,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  CLKDIV262K_1_temp_div_262144_31 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => CLKDIV262K_1_Mshreg_temp_div_262144_31,
      CLK => CLKDIV262K_1_div_32768_15_Q,
      O => CLKDIV262K_1_temp_div_262144_31_33,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  ten_cnt1_GND : X_ZERO
    port map (
      O => NLW_ten_cnt1_GND_O_UNCONNECTED
    );
  ten_cnt1_VCC : X_ONE
    port map (
      O => NLW_ten_cnt1_VCC_O_UNCONNECTED
    );
  ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_halfsum_0_1_INV_0 : X_INV
    port map (
      I => hex2led_int1(0),
      O => ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_halfsum(0)
    );
  ten_cnt1_BU2_U0_mux0002_3_11 : X_LUT3
    generic map(
      INIT => X"D0"
    )
    port map (
      ADR0 => clk_en_int,
      ADR1 => ten_cnt1_BU2_U0_not0002,
      ADR2 => ten_cnt1_BU2_U0_q_next(0),
      O => ten_cnt1_BU2_U0_mux0002(3)
    );
  ten_cnt1_BU2_U0_mux0002_2_11 : X_LUT3
    generic map(
      INIT => X"D0"
    )
    port map (
      ADR0 => clk_en_int,
      ADR1 => ten_cnt1_BU2_U0_not0002,
      ADR2 => ten_cnt1_BU2_U0_q_next(1),
      O => ten_cnt1_BU2_U0_mux0002(2)
    );
  ten_cnt1_BU2_U0_mux0002_1_11 : X_LUT3
    generic map(
      INIT => X"D0"
    )
    port map (
      ADR0 => clk_en_int,
      ADR1 => ten_cnt1_BU2_U0_not0002,
      ADR2 => ten_cnt1_BU2_U0_q_next(2),
      O => ten_cnt1_BU2_U0_mux0002(1)
    );
  ten_cnt1_BU2_U0_mux0002_0_11 : X_LUT3
    generic map(
      INIT => X"D0"
    )
    port map (
      ADR0 => clk_en_int,
      ADR1 => ten_cnt1_BU2_U0_not0002,
      ADR2 => ten_cnt1_BU2_U0_q_next(3),
      O => ten_cnt1_BU2_U0_mux0002(0)
    );
  ten_cnt1_BU2_U0_q_i_3_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => hex2led_int1(3),
      O => ten_cnt1_BU2_U0_q_i_3_rt_36,
      ADR1 => GND
    );
  ten_cnt1_BU2_U0_q_i_2_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => hex2led_int1(2),
      O => ten_cnt1_BU2_U0_q_i_2_rt_34,
      ADR1 => GND
    );
  ten_cnt1_BU2_U0_q_i_1_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => hex2led_int1(1),
      O => ten_cnt1_BU2_U0_q_i_1_rt_35,
      ADR1 => GND
    );
  ten_cnt1_BU2_U0_not000211 : X_LUT4
    generic map(
      INIT => X"EFFF"
    )
    port map (
      ADR0 => hex2led_int1(2),
      ADR1 => hex2led_int1(1),
      ADR2 => hex2led_int1(0),
      ADR3 => hex2led_int1(3),
      O => ten_cnt1_BU2_U0_not0002
    );
  ten_cnt1_BU2_thresh01 : X_LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      ADR0 => hex2led_int1(3),
      ADR1 => hex2led_int1(1),
      ADR2 => hex2led_int1(2),
      ADR3 => hex2led_int1(0),
      O => ten_cnt_thresh1
    );
  ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carrychaingen_2_carryxor : X_XOR2
    port map (
      I0 => ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(1),
      I1 => ten_cnt1_BU2_U0_q_i_2_rt_34,
      O => ten_cnt1_BU2_U0_q_next(2)
    );
  ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carrychaingen_2_carrymux : X_MUX2
    port map (
      IB => ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(1),
      IA => ten_cnt1_BU2_N0,
      SEL => ten_cnt1_BU2_U0_q_i_2_rt_34,
      O => ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(2)
    );
  ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carrychaingen_1_carryxor : X_XOR2
    port map (
      I0 => ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(0),
      I1 => ten_cnt1_BU2_U0_q_i_1_rt_35,
      O => ten_cnt1_BU2_U0_q_next(1)
    );
  ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carrychaingen_1_carrymux : X_MUX2
    port map (
      IB => ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(0),
      IA => ten_cnt1_BU2_N0,
      SEL => ten_cnt1_BU2_U0_q_i_1_rt_35,
      O => ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(1)
    );
  ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carryxortop : X_XOR2
    port map (
      I0 => ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(2),
      I1 => ten_cnt1_BU2_U0_q_i_3_rt_36,
      O => ten_cnt1_BU2_U0_q_next(3)
    );
  ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carryxor0 : X_XOR2
    port map (
      I0 => ten_cnt1_BU2_N0,
      I1 => ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_halfsum(0),
      O => ten_cnt1_BU2_U0_q_next(0)
    );
  ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carrymux0 : X_MUX2
    port map (
      IB => ten_cnt1_BU2_N0,
      IA => ten_cnt1_BU2_q_thresh1,
      SEL => ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_halfsum(0),
      O => ten_cnt1_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(0)
    );
  ten_cnt1_BU2_U0_q_i_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => ten_cnt1_BU2_U0_mux0002(0),
      CE => clk_en_int,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int1(3),
      SET => GND
    );
  ten_cnt1_BU2_U0_q_i_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => ten_cnt1_BU2_U0_mux0002(1),
      CE => clk_en_int,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int1(2),
      SET => GND
    );
  ten_cnt1_BU2_U0_q_i_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => ten_cnt1_BU2_U0_mux0002(2),
      CE => clk_en_int,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int1(1),
      SET => GND
    );
  ten_cnt1_BU2_U0_q_i_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => ten_cnt1_BU2_U0_mux0002(3),
      CE => clk_en_int,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int1(0),
      SET => GND
    );
  ten_cnt1_BU2_XST_VCC : X_ONE
    port map (
      O => ten_cnt1_BU2_q_thresh1
    );
  ten_cnt1_BU2_XST_GND : X_ZERO
    port map (
      O => ten_cnt1_BU2_N0
    );
  ten_cnt2_GND : X_ZERO
    port map (
      O => NLW_ten_cnt2_GND_O_UNCONNECTED
    );
  ten_cnt2_VCC : X_ONE
    port map (
      O => NLW_ten_cnt2_VCC_O_UNCONNECTED
    );
  ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_halfsum_0_1_INV_0 : X_INV
    port map (
      I => hex2led_int2(0),
      O => ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_halfsum(0)
    );
  ten_cnt2_BU2_U0_mux0002_3_11 : X_LUT3
    generic map(
      INIT => X"D0"
    )
    port map (
      ADR0 => clk_en_int,
      ADR1 => ten_cnt2_BU2_U0_not0002,
      ADR2 => ten_cnt2_BU2_U0_q_next(0),
      O => ten_cnt2_BU2_U0_mux0002(3)
    );
  ten_cnt2_BU2_U0_mux0002_2_11 : X_LUT3
    generic map(
      INIT => X"D0"
    )
    port map (
      ADR0 => clk_en_int,
      ADR1 => ten_cnt2_BU2_U0_not0002,
      ADR2 => ten_cnt2_BU2_U0_q_next(1),
      O => ten_cnt2_BU2_U0_mux0002(2)
    );
  ten_cnt2_BU2_U0_mux0002_1_11 : X_LUT3
    generic map(
      INIT => X"D0"
    )
    port map (
      ADR0 => clk_en_int,
      ADR1 => ten_cnt2_BU2_U0_not0002,
      ADR2 => ten_cnt2_BU2_U0_q_next(2),
      O => ten_cnt2_BU2_U0_mux0002(1)
    );
  ten_cnt2_BU2_U0_mux0002_0_11 : X_LUT3
    generic map(
      INIT => X"D0"
    )
    port map (
      ADR0 => clk_en_int,
      ADR1 => ten_cnt2_BU2_U0_not0002,
      ADR2 => ten_cnt2_BU2_U0_q_next(3),
      O => ten_cnt2_BU2_U0_mux0002(0)
    );
  ten_cnt2_BU2_U0_q_i_3_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => hex2led_int2(3),
      O => ten_cnt2_BU2_U0_q_i_3_rt_39,
      ADR1 => GND
    );
  ten_cnt2_BU2_U0_q_i_2_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => hex2led_int2(2),
      O => ten_cnt2_BU2_U0_q_i_2_rt_37,
      ADR1 => GND
    );
  ten_cnt2_BU2_U0_q_i_1_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => hex2led_int2(1),
      O => ten_cnt2_BU2_U0_q_i_1_rt_38,
      ADR1 => GND
    );
  ten_cnt2_BU2_U0_not000211 : X_LUT4
    generic map(
      INIT => X"EFFF"
    )
    port map (
      ADR0 => hex2led_int2(2),
      ADR1 => hex2led_int2(1),
      ADR2 => hex2led_int2(0),
      ADR3 => hex2led_int2(3),
      O => ten_cnt2_BU2_U0_not0002
    );
  ten_cnt2_BU2_thresh01 : X_LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      ADR0 => hex2led_int2(3),
      ADR1 => hex2led_int2(1),
      ADR2 => hex2led_int2(2),
      ADR3 => hex2led_int2(0),
      O => ten_cnt_thresh2
    );
  ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carrychaingen_2_carryxor : X_XOR2
    port map (
      I0 => ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(1),
      I1 => ten_cnt2_BU2_U0_q_i_2_rt_37,
      O => ten_cnt2_BU2_U0_q_next(2)
    );
  ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carrychaingen_2_carrymux : X_MUX2
    port map (
      IB => ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(1),
      IA => ten_cnt2_BU2_N0,
      SEL => ten_cnt2_BU2_U0_q_i_2_rt_37,
      O => ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(2)
    );
  ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carrychaingen_1_carryxor : X_XOR2
    port map (
      I0 => ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(0),
      I1 => ten_cnt2_BU2_U0_q_i_1_rt_38,
      O => ten_cnt2_BU2_U0_q_next(1)
    );
  ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carrychaingen_1_carrymux : X_MUX2
    port map (
      IB => ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(0),
      IA => ten_cnt2_BU2_N0,
      SEL => ten_cnt2_BU2_U0_q_i_1_rt_38,
      O => ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(1)
    );
  ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carryxortop : X_XOR2
    port map (
      I0 => ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(2),
      I1 => ten_cnt2_BU2_U0_q_i_3_rt_39,
      O => ten_cnt2_BU2_U0_q_next(3)
    );
  ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carryxor0 : X_XOR2
    port map (
      I0 => ten_cnt2_BU2_N0,
      I1 => ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_halfsum(0),
      O => ten_cnt2_BU2_U0_q_next(0)
    );
  ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_i_simple_model_carrymux0 : X_MUX2
    port map (
      IB => ten_cnt2_BU2_N0,
      IA => ten_cnt2_BU2_q_thresh1,
      SEL => ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_halfsum(0),
      O => ten_cnt2_BU2_U0_the_addsub_no_pipelining_the_addsub_carry_simple(0)
    );
  ten_cnt2_BU2_U0_q_i_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => ten_cnt2_BU2_U0_mux0002(0),
      CE => clk_en_int,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int2(3),
      SET => GND
    );
  ten_cnt2_BU2_U0_q_i_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => ten_cnt2_BU2_U0_mux0002(1),
      CE => clk_en_int,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int2(2),
      SET => GND
    );
  ten_cnt2_BU2_U0_q_i_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => ten_cnt2_BU2_U0_mux0002(2),
      CE => clk_en_int,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int2(1),
      SET => GND
    );
  ten_cnt2_BU2_U0_q_i_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => ten_cnt2_BU2_U0_mux0002(3),
      CE => clk_en_int,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int2(0),
      SET => GND
    );
  ten_cnt2_BU2_XST_VCC : X_ONE
    port map (
      O => ten_cnt2_BU2_q_thresh1
    );
  ten_cnt2_BU2_XST_GND : X_ZERO
    port map (
      O => ten_cnt2_BU2_N0
    );
  TIMECNT_1_and00011_f5 : X_MUX2
    port map (
      IA => hex2led_int4(3),
      IB => TIMECNT_1_N15,
      SEL => hex2led_int3(3),
      O => TIMECNT_1_and0000
    );
  TIMECNT_1_and000111 : X_LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      ADR0 => hex2led_int3(0),
      ADR1 => time_cnt_ce,
      ADR2 => hex2led_int3(2),
      ADR3 => hex2led_int3(1),
      O => TIMECNT_1_N15
    );
  TIMECNT_1_XST_VCC : X_ONE
    port map (
      O => TIMECNT_1_N14
    );
  TIMECNT_1_and00012 : X_LUT4
    generic map(
      INIT => X"4000"
    )
    port map (
      ADR0 => hex2led_int4(1),
      ADR1 => hex2led_int4(0),
      ADR2 => hex2led_int4(2),
      ADR3 => TIMECNT_1_and0000,
      O => TIMECNT_1_and0001
    );
  TIMECNT_1_ones_cnt_mux0000_3_1 : X_LUT4
    generic map(
      INIT => X"68CC"
    )
    port map (
      ADR0 => hex2led_int3(2),
      ADR1 => hex2led_int3(3),
      ADR2 => hex2led_int3(1),
      ADR3 => hex2led_int3(0),
      O => TIMECNT_1_ones_cnt_mux0000(3)
    );
  TIMECNT_1_mins_cnt_mux0000_3_1 : X_LUT4
    generic map(
      INIT => X"68CC"
    )
    port map (
      ADR0 => hex2led_int5(2),
      ADR1 => hex2led_int5(3),
      ADR2 => hex2led_int5(1),
      ADR3 => hex2led_int5(0),
      O => TIMECNT_1_mins_cnt_mux0000(3)
    );
  TIMECNT_1_mins_cnt_mux0000_1_1 : X_LUT4
    generic map(
      INIT => X"6466"
    )
    port map (
      ADR0 => hex2led_int5(0),
      ADR1 => hex2led_int5(1),
      ADR2 => hex2led_int5(2),
      ADR3 => hex2led_int5(3),
      O => TIMECNT_1_mins_cnt_mux0000(1)
    );
  TIMECNT_1_ones_cnt_mux0000_1_1 : X_LUT4
    generic map(
      INIT => X"6466"
    )
    port map (
      ADR0 => hex2led_int3(0),
      ADR1 => hex2led_int3(1),
      ADR2 => hex2led_int3(2),
      ADR3 => hex2led_int3(3),
      O => TIMECNT_1_ones_cnt_mux0000(1)
    );
  TIMECNT_1_ones_cnt_mux0000_2_1 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => hex2led_int3(2),
      ADR1 => hex2led_int3(1),
      ADR2 => hex2led_int3(0),
      O => TIMECNT_1_ones_cnt_mux0000(2)
    );
  TIMECNT_1_mins_cnt_mux0000_2_1 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => hex2led_int5(2),
      ADR1 => hex2led_int5(1),
      ADR2 => hex2led_int5(0),
      O => TIMECNT_1_mins_cnt_mux0000(2)
    );
  TIMECNT_1_tens_cnt_mux0000_2_1 : X_LUT3
    generic map(
      INIT => X"64"
    )
    port map (
      ADR0 => hex2led_int4(0),
      ADR1 => hex2led_int4(2),
      ADR2 => hex2led_int4(1),
      O => TIMECNT_1_tens_cnt_mux0000(2)
    );
  TIMECNT_1_tens_cnt_mux0000_1_1 : X_LUT3
    generic map(
      INIT => X"26"
    )
    port map (
      ADR0 => hex2led_int4(1),
      ADR1 => hex2led_int4(0),
      ADR2 => hex2led_int4(2),
      O => TIMECNT_1_tens_cnt_mux0000(1)
    );
  TIMECNT_1_tens_cnt_mux0000_0_1 : X_LUT2
    generic map(
      INIT => X"5"
    )
    port map (
      ADR0 => hex2led_int4(0),
      O => TIMECNT_1_tens_cnt_mux0000(0),
      ADR1 => GND
    );
  TIMECNT_1_ones_cnt_mux0000_0_1 : X_LUT2
    generic map(
      INIT => X"5"
    )
    port map (
      ADR0 => hex2led_int3(0),
      O => TIMECNT_1_ones_cnt_mux0000(0),
      ADR1 => GND
    );
  TIMECNT_1_mins_cnt_mux0000_0_1 : X_LUT2
    generic map(
      INIT => X"5"
    )
    port map (
      ADR0 => hex2led_int5(0),
      O => TIMECNT_1_mins_cnt_mux0000(0),
      ADR1 => GND
    );
  TIMECNT_1_tens_cnt_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => TIMECNT_1_tens_cnt_mux0000(2),
      CE => TIMECNT_1_and0000,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int4(2),
      SET => GND
    );
  TIMECNT_1_tens_cnt_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => TIMECNT_1_tens_cnt_mux0000(1),
      CE => TIMECNT_1_and0000,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int4(1),
      SET => GND
    );
  TIMECNT_1_tens_cnt_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => TIMECNT_1_tens_cnt_mux0000(0),
      CE => TIMECNT_1_and0000,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int4(0),
      SET => GND
    );
  TIMECNT_1_ones_cnt_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => TIMECNT_1_ones_cnt_mux0000(3),
      CE => time_cnt_ce,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int3(3),
      SET => GND
    );
  TIMECNT_1_ones_cnt_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => TIMECNT_1_ones_cnt_mux0000(2),
      CE => time_cnt_ce,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int3(2),
      SET => GND
    );
  TIMECNT_1_ones_cnt_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => TIMECNT_1_ones_cnt_mux0000(1),
      CE => time_cnt_ce,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int3(1),
      SET => GND
    );
  TIMECNT_1_ones_cnt_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => TIMECNT_1_ones_cnt_mux0000(0),
      CE => time_cnt_ce,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int3(0),
      SET => GND
    );
  TIMECNT_1_mins_cnt_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => TIMECNT_1_mins_cnt_mux0000(3),
      CE => TIMECNT_1_and0001,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int5(3),
      SET => GND
    );
  TIMECNT_1_mins_cnt_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => TIMECNT_1_mins_cnt_mux0000(2),
      CE => TIMECNT_1_and0001,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int5(2),
      SET => GND
    );
  TIMECNT_1_mins_cnt_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => TIMECNT_1_mins_cnt_mux0000(1),
      CE => TIMECNT_1_and0001,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int5(1),
      SET => GND
    );
  TIMECNT_1_mins_cnt_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => TIMECNT_1_mins_cnt_mux0000(0),
      CE => TIMECNT_1_and0001,
      RST => rst_int,
      CLK => CLKDIV262K_1_temp_div_262144_3_Q,
      O => hex2led_int5(0),
      SET => GND
    );
  TIMECNT_1_XST_GND : X_ZERO
    port map (
      O => hex2led_int4(3)
    );
  LEDCONTROL_1_mux0001_0_1 : X_LUT4
    generic map(
      INIT => X"F780"
    )
    port map (
      ADR0 => LEDCONTROL_1_cmp_eq0000_map26,
      ADR1 => LEDCONTROL_1_cmp_eq0000_map20,
      ADR2 => LEDCONTROL_1_d0(0),
      ADR3 => LEDCONTROL_1_d1(0),
      O => LEDCONTROL_1_mux0001(0)
    );
  LEDCONTROL_1_mux0001_1_1 : X_LUT4
    generic map(
      INIT => X"F780"
    )
    port map (
      ADR0 => LEDCONTROL_1_cmp_eq0000_map26,
      ADR1 => LEDCONTROL_1_cmp_eq0000_map20,
      ADR2 => LEDCONTROL_1_d0(1),
      ADR3 => LEDCONTROL_1_d1(1),
      O => LEDCONTROL_1_mux0001(1)
    );
  LEDCONTROL_1_mux0001_2_1 : X_LUT4
    generic map(
      INIT => X"F780"
    )
    port map (
      ADR0 => LEDCONTROL_1_cmp_eq0000_map26,
      ADR1 => LEDCONTROL_1_cmp_eq0000_map20,
      ADR2 => LEDCONTROL_1_d0(2),
      ADR3 => LEDCONTROL_1_d1(2),
      O => LEDCONTROL_1_mux0001(2)
    );
  LEDCONTROL_1_mux0001_3_1 : X_LUT4
    generic map(
      INIT => X"F780"
    )
    port map (
      ADR0 => LEDCONTROL_1_cmp_eq0000_map26,
      ADR1 => LEDCONTROL_1_cmp_eq0000_map20,
      ADR2 => LEDCONTROL_1_d0(3),
      ADR3 => LEDCONTROL_1_d1(3),
      O => LEDCONTROL_1_mux0001(3)
    );
  LEDCONTROL_1_mux0001_4_1 : X_LUT4
    generic map(
      INIT => X"F780"
    )
    port map (
      ADR0 => LEDCONTROL_1_cmp_eq0000_map26,
      ADR1 => LEDCONTROL_1_cmp_eq0000_map20,
      ADR2 => LEDCONTROL_1_d0(4),
      ADR3 => LEDCONTROL_1_d1(4),
      O => LEDCONTROL_1_mux0001(4)
    );
  LEDCONTROL_1_mux0001_5_1 : X_LUT4
    generic map(
      INIT => X"F780"
    )
    port map (
      ADR0 => LEDCONTROL_1_cmp_eq0000_map26,
      ADR1 => LEDCONTROL_1_cmp_eq0000_map20,
      ADR2 => LEDCONTROL_1_d0(5),
      ADR3 => LEDCONTROL_1_d1(5),
      O => LEDCONTROL_1_mux0001(5)
    );
  LEDCONTROL_1_mux0001_6_1 : X_LUT4
    generic map(
      INIT => X"F780"
    )
    port map (
      ADR0 => LEDCONTROL_1_cmp_eq0000_map26,
      ADR1 => LEDCONTROL_1_cmp_eq0000_map20,
      ADR2 => LEDCONTROL_1_d0(6),
      ADR3 => LEDCONTROL_1_d1(6),
      O => LEDCONTROL_1_mux0001(6)
    );
  LEDCONTROL_1_mux0001_7_1 : X_LUT4
    generic map(
      INIT => X"F780"
    )
    port map (
      ADR0 => LEDCONTROL_1_cmp_eq0000_map26,
      ADR1 => LEDCONTROL_1_cmp_eq0000_map20,
      ADR2 => LEDCONTROL_1_d0(7),
      ADR3 => LEDCONTROL_1_d1(7),
      O => LEDCONTROL_1_mux0001(7)
    );
  LEDCONTROL_1_cnt_15_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_cnt_15_rt_40,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_14_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_cnt_14_rt_41,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_13_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(13),
      O => LEDCONTROL_1_cnt_13_rt_42,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_12_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(12),
      O => LEDCONTROL_1_cnt_12_rt_43,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_11_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(11),
      O => LEDCONTROL_1_cnt_11_rt_44,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_10_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(10),
      O => LEDCONTROL_1_cnt_10_rt_45,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_9_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(9),
      O => LEDCONTROL_1_cnt_9_rt_46,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_8_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(8),
      O => LEDCONTROL_1_cnt_8_rt_47,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_7_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(7),
      O => LEDCONTROL_1_cnt_7_rt_48,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_6_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(6),
      O => LEDCONTROL_1_cnt_6_rt_49,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_5_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(5),
      O => LEDCONTROL_1_cnt_5_rt_50,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_4_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(4),
      O => LEDCONTROL_1_cnt_4_rt_51,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_3_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(3),
      O => LEDCONTROL_1_cnt_3_rt_52,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_2_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(2),
      O => LEDCONTROL_1_cnt_2_rt_53,
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_1_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(1),
      O => LEDCONTROL_1_cnt_1_rt_54,
      ADR1 => GND
    );
  LEDCONTROL_1_cmp_eq000024 : X_LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      ADR0 => N28,
      ADR1 => N29,
      ADR2 => N27,
      ADR3 => N26,
      O => LEDCONTROL_1_cmp_eq0000_map26
    );
  LEDCONTROL_1_cmp_eq000012 : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => N25,
      ADR1 => N24,
      ADR2 => N23,
      ADR3 => ones_concat(0),
      O => LEDCONTROL_1_cmp_eq0000_map20
    );
  LEDCONTROL_1_Mmux_d1_f5_6 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N171,
      IB => LEDCONTROL_1_N161,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d1(7)
    );
  LEDCONTROL_1_cnt_14_151 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N22,
      ADR1 => N29,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N171
    );
  LEDCONTROL_1_cnt_14_141 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N15,
      ADR1 => N36,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N161
    );
  LEDCONTROL_1_Mmux_d1_f5_5 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N151,
      IB => LEDCONTROL_1_N141,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d1(6)
    );
  LEDCONTROL_1_cnt_14_131 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N21,
      ADR1 => N28,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N151
    );
  LEDCONTROL_1_cnt_14_121 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N14,
      ADR1 => N35,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N141
    );
  LEDCONTROL_1_Mmux_d1_f5_4 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N131,
      IB => LEDCONTROL_1_N121,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d1(5)
    );
  LEDCONTROL_1_cnt_14_111 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N20,
      ADR1 => N27,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N131
    );
  LEDCONTROL_1_cnt_14_101 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N13,
      ADR1 => N34,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N121
    );
  LEDCONTROL_1_Mmux_d1_f5_3 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N111,
      IB => LEDCONTROL_1_N101,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d1(4)
    );
  LEDCONTROL_1_cnt_14_91 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N19,
      ADR1 => N26,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N111
    );
  LEDCONTROL_1_cnt_14_81 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N12,
      ADR1 => N33,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N101
    );
  LEDCONTROL_1_Mmux_d1_f5_2 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N912,
      IB => LEDCONTROL_1_N812,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d1(3)
    );
  LEDCONTROL_1_cnt_14_71 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N18,
      ADR1 => N25,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N912
    );
  LEDCONTROL_1_cnt_14_61 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N11,
      ADR1 => N32,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N812
    );
  LEDCONTROL_1_Mmux_d1_f5_1 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N712,
      IB => LEDCONTROL_1_N612,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d1(2)
    );
  LEDCONTROL_1_cnt_14_51 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N17,
      ADR1 => N24,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N712
    );
  LEDCONTROL_1_cnt_14_41 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N10,
      ADR1 => N31,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N612
    );
  LEDCONTROL_1_Mmux_d1_f5_0 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N512,
      IB => LEDCONTROL_1_N412,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d1(1)
    );
  LEDCONTROL_1_cnt_14_31 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N16,
      ADR1 => N23,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N512
    );
  LEDCONTROL_1_cnt_14_21 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N9,
      ADR1 => N30,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N412
    );
  LEDCONTROL_1_Mmux_d1_f5 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N312,
      IB => LEDCONTROL_1_N212,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d1(0)
    );
  LEDCONTROL_1_cnt_14_17 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => hundredths_concat(0),
      ADR1 => ones_concat(0),
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N312
    );
  LEDCONTROL_1_cnt_14_16 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => hundredths_concat(0),
      ADR1 => ones_concat(0),
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N212
    );
  LEDCONTROL_1_Mmux_d0_f5_6 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N17,
      IB => LEDCONTROL_1_N16,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d0(7)
    );
  LEDCONTROL_1_cnt_14_15 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N36,
      ADR1 => N22,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N17
    );
  LEDCONTROL_1_cnt_14_14 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N8,
      ADR1 => N15,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N16
    );
  LEDCONTROL_1_Mmux_d0_f5_5 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N15,
      IB => LEDCONTROL_1_N14,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d0(6)
    );
  LEDCONTROL_1_cnt_14_13 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N35,
      ADR1 => N21,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N15
    );
  LEDCONTROL_1_cnt_14_12 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N7,
      ADR1 => N14,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N14
    );
  LEDCONTROL_1_Mmux_d0_f5_4 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N13,
      IB => LEDCONTROL_1_N12,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d0(5)
    );
  LEDCONTROL_1_cnt_14_11 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N34,
      ADR1 => N20,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N13
    );
  LEDCONTROL_1_cnt_14_10 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N6,
      ADR1 => N13,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N12
    );
  LEDCONTROL_1_Mmux_d0_f5_3 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N11,
      IB => LEDCONTROL_1_N10,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d0(4)
    );
  LEDCONTROL_1_cnt_14_9 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N33,
      ADR1 => N19,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N11
    );
  LEDCONTROL_1_cnt_14_8 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N5,
      ADR1 => N12,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N10
    );
  LEDCONTROL_1_Mmux_d0_f5_2 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N91,
      IB => LEDCONTROL_1_N81,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d0(3)
    );
  LEDCONTROL_1_cnt_14_7 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N32,
      ADR1 => N18,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N91
    );
  LEDCONTROL_1_cnt_14_6 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N4,
      ADR1 => N11,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N81
    );
  LEDCONTROL_1_Mmux_d0_f5_1 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N71,
      IB => LEDCONTROL_1_N61,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d0(2)
    );
  LEDCONTROL_1_cnt_14_5 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N31,
      ADR1 => N17,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N71
    );
  LEDCONTROL_1_cnt_14_4 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N3,
      ADR1 => N10,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N61
    );
  LEDCONTROL_1_Mmux_d0_f5_0 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N51,
      IB => LEDCONTROL_1_N41,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d0(1)
    );
  LEDCONTROL_1_cnt_14_3 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N30,
      ADR1 => N16,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N51
    );
  LEDCONTROL_1_cnt_14_2 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => N2,
      ADR1 => N9,
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N41
    );
  LEDCONTROL_1_Mmux_d0_f5 : X_MUX2
    port map (
      IA => LEDCONTROL_1_N31,
      IB => LEDCONTROL_1_N21,
      SEL => LEDCONTROL_1_cnt(15),
      O => LEDCONTROL_1_d0(0)
    );
  LEDCONTROL_1_cnt_14_1 : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => ones_concat(0),
      ADR1 => hundredths_concat(0),
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N31
    );
  LEDCONTROL_1_cnt_14_Q : X_LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      ADR0 => hundredths_concat(0),
      ADR1 => hundredths_concat(0),
      ADR2 => LEDCONTROL_1_cnt(14),
      O => LEDCONTROL_1_N21
    );
  LEDCONTROL_1_Mcount_cnt_xor_15_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(14),
      I1 => LEDCONTROL_1_cnt_15_rt_40,
      O => LEDCONTROL_1_Result(15)
    );
  LEDCONTROL_1_Mcount_cnt_xor_14_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(13),
      I1 => LEDCONTROL_1_cnt_14_rt_41,
      O => LEDCONTROL_1_Result(14)
    );
  LEDCONTROL_1_Mcount_cnt_cy_14_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(13),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_14_rt_41,
      O => LEDCONTROL_1_Mcount_cnt_cy(14)
    );
  LEDCONTROL_1_Mcount_cnt_xor_13_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(12),
      I1 => LEDCONTROL_1_cnt_13_rt_42,
      O => LEDCONTROL_1_Result(13)
    );
  LEDCONTROL_1_Mcount_cnt_cy_13_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(12),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_13_rt_42,
      O => LEDCONTROL_1_Mcount_cnt_cy(13)
    );
  LEDCONTROL_1_Mcount_cnt_xor_12_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(11),
      I1 => LEDCONTROL_1_cnt_12_rt_43,
      O => LEDCONTROL_1_Result(12)
    );
  LEDCONTROL_1_Mcount_cnt_cy_12_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(11),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_12_rt_43,
      O => LEDCONTROL_1_Mcount_cnt_cy(12)
    );
  LEDCONTROL_1_Mcount_cnt_xor_11_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(10),
      I1 => LEDCONTROL_1_cnt_11_rt_44,
      O => LEDCONTROL_1_Result(11)
    );
  LEDCONTROL_1_Mcount_cnt_cy_11_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(10),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_11_rt_44,
      O => LEDCONTROL_1_Mcount_cnt_cy(11)
    );
  LEDCONTROL_1_Mcount_cnt_xor_10_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(9),
      I1 => LEDCONTROL_1_cnt_10_rt_45,
      O => LEDCONTROL_1_Result(10)
    );
  LEDCONTROL_1_Mcount_cnt_cy_10_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(9),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_10_rt_45,
      O => LEDCONTROL_1_Mcount_cnt_cy(10)
    );
  LEDCONTROL_1_Mcount_cnt_xor_9_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(8),
      I1 => LEDCONTROL_1_cnt_9_rt_46,
      O => LEDCONTROL_1_Result(9)
    );
  LEDCONTROL_1_Mcount_cnt_cy_9_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(8),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_9_rt_46,
      O => LEDCONTROL_1_Mcount_cnt_cy(9)
    );
  LEDCONTROL_1_Mcount_cnt_xor_8_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(7),
      I1 => LEDCONTROL_1_cnt_8_rt_47,
      O => LEDCONTROL_1_Result(8)
    );
  LEDCONTROL_1_Mcount_cnt_cy_8_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(7),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_8_rt_47,
      O => LEDCONTROL_1_Mcount_cnt_cy(8)
    );
  LEDCONTROL_1_Mcount_cnt_xor_7_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(6),
      I1 => LEDCONTROL_1_cnt_7_rt_48,
      O => LEDCONTROL_1_Result(7)
    );
  LEDCONTROL_1_Mcount_cnt_cy_7_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(6),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_7_rt_48,
      O => LEDCONTROL_1_Mcount_cnt_cy(7)
    );
  LEDCONTROL_1_Mcount_cnt_xor_6_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(5),
      I1 => LEDCONTROL_1_cnt_6_rt_49,
      O => LEDCONTROL_1_Result(6)
    );
  LEDCONTROL_1_Mcount_cnt_cy_6_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(5),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_6_rt_49,
      O => LEDCONTROL_1_Mcount_cnt_cy(6)
    );
  LEDCONTROL_1_Mcount_cnt_xor_5_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(4),
      I1 => LEDCONTROL_1_cnt_5_rt_50,
      O => LEDCONTROL_1_Result(5)
    );
  LEDCONTROL_1_Mcount_cnt_cy_5_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(4),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_5_rt_50,
      O => LEDCONTROL_1_Mcount_cnt_cy(5)
    );
  LEDCONTROL_1_Mcount_cnt_xor_4_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(3),
      I1 => LEDCONTROL_1_cnt_4_rt_51,
      O => LEDCONTROL_1_Result(4)
    );
  LEDCONTROL_1_Mcount_cnt_cy_4_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(3),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_4_rt_51,
      O => LEDCONTROL_1_Mcount_cnt_cy(4)
    );
  LEDCONTROL_1_Mcount_cnt_xor_3_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(2),
      I1 => LEDCONTROL_1_cnt_3_rt_52,
      O => LEDCONTROL_1_Result(3)
    );
  LEDCONTROL_1_Mcount_cnt_cy_3_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(2),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_3_rt_52,
      O => LEDCONTROL_1_Mcount_cnt_cy(3)
    );
  LEDCONTROL_1_Mcount_cnt_xor_2_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(1),
      I1 => LEDCONTROL_1_cnt_2_rt_53,
      O => LEDCONTROL_1_Result(2)
    );
  LEDCONTROL_1_Mcount_cnt_cy_2_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(1),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_2_rt_53,
      O => LEDCONTROL_1_Mcount_cnt_cy(2)
    );
  LEDCONTROL_1_Mcount_cnt_xor_1_Q : X_XOR2
    port map (
      I0 => LEDCONTROL_1_Mcount_cnt_cy(0),
      I1 => LEDCONTROL_1_cnt_1_rt_54,
      O => LEDCONTROL_1_Result(1)
    );
  LEDCONTROL_1_Mcount_cnt_cy_1_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_Mcount_cnt_cy(0),
      IA => LEDCONTROL_1_N2,
      SEL => LEDCONTROL_1_cnt_1_rt_54,
      O => LEDCONTROL_1_Mcount_cnt_cy(1)
    );
  LEDCONTROL_1_Mcount_cnt_cy_0_Q : X_MUX2
    port map (
      IB => LEDCONTROL_1_N2,
      IA => LEDCONTROL_1_N3,
      SEL => LEDCONTROL_1_Result(0),
      O => LEDCONTROL_1_Mcount_cnt_cy(0)
    );
  LEDCONTROL_1_Mcount_cnt_lut_0_Q : X_LUT2
    generic map(
      INIT => X"5"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(0),
      O => LEDCONTROL_1_Result(0),
      ADR1 => GND
    );
  LEDCONTROL_1_cnt_15 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(15),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(15),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_14 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(14),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(14),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_13 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(13),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(13),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_12 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(12),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(12),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_11 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(11),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(11),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_10 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(10),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(10),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_9 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(9),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(9),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_8 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(8),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(8),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(7),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(7),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(6),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(6),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(5),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(5),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(4),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(4),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(3),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(3),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(2),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(2),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(1),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(1),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_cnt_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_Result(0),
      CLK => clk_int,
      O => LEDCONTROL_1_cnt(0),
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_Mrom_AN4 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(15),
      ADR1 => LEDCONTROL_1_cnt(14),
      O => AN_3_OBUF_21
    );
  LEDCONTROL_1_Mrom_AN3 : X_LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(14),
      ADR1 => LEDCONTROL_1_cnt(15),
      O => AN_2_OBUF_22
    );
  LEDCONTROL_1_Mrom_AN2 : X_LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(15),
      ADR1 => LEDCONTROL_1_cnt(14),
      O => AN_1_OBUF_23
    );
  LEDCONTROL_1_Mrom_AN1 : X_LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      ADR0 => LEDCONTROL_1_cnt(14),
      ADR1 => LEDCONTROL_1_cnt(15),
      O => AN_0_OBUF_24
    );
  LEDCONTROL_1_XST_VCC : X_ONE
    port map (
      O => LEDCONTROL_1_N3
    );
  LEDCONTROL_1_XST_GND : X_ZERO
    port map (
      O => LEDCONTROL_1_N2
    );
  LEDCONTROL_1_SEVEN_SEG_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_mux0001(7),
      CLK => clk_int,
      O => SEG_G_OBUF_19,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_SEVEN_SEG_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_mux0001(6),
      CLK => clk_int,
      O => SEG_F_OBUF_18,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_SEVEN_SEG_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_mux0001(5),
      CLK => clk_int,
      O => SEG_E_OBUF_17,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_SEVEN_SEG_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_mux0001(4),
      CLK => clk_int,
      O => SEG_D_OBUF_16,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_SEVEN_SEG_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_mux0001(3),
      CLK => clk_int,
      O => SEG_C_OBUF_15,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_SEVEN_SEG_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_mux0001(2),
      CLK => clk_int,
      O => SEG_B_OBUF_14,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_SEVEN_SEG_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_mux0001(1),
      CLK => clk_int,
      O => SEG_A_OBUF_13,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  LEDCONTROL_1_SEVEN_SEG_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      I => LEDCONTROL_1_mux0001(0),
      CLK => clk_int,
      O => SEG_DP_OBUF_20,
      CE => VCC,
      SET => GND,
      RST => GND
    );
  CLKDIV262K_1_Mshreg_div_32_15_VCC : X_ONE
    port map (
      O => CLKDIV262K_1_Mshreg_div_32_15_CE
    );
  CLKDIV262K_1_Mshreg_div_32_15_SRL16E : X_SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      D => CLKDIV262K_1_div_32_0_Q,
      CE => CLKDIV262K_1_Mshreg_div_32_15_CE,
      CLK => clk_262144k,
      A3 => hundredths_concat(0),
      A2 => hundredths_concat(0),
      A1 => ones_concat(0),
      A0 => hundredths_concat(0),
      Q => CLKDIV262K_1_Mshreg_div_32_15,
      Q15 => NLW_CLKDIV262K_1_Mshreg_div_32_15_SRL16E_Q15_UNCONNECTED
    );
  CLKDIV262K_1_Mshreg_div_1024_15_VCC : X_ONE
    port map (
      O => CLKDIV262K_1_Mshreg_div_1024_15_CE
    );
  CLKDIV262K_1_Mshreg_div_1024_15_SRL16E : X_SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      D => CLKDIV262K_1_div_1024_0_Q,
      CE => CLKDIV262K_1_Mshreg_div_1024_15_CE,
      CLK => CLKDIV262K_1_div_32_15_Q,
      A3 => hundredths_concat(0),
      A2 => hundredths_concat(0),
      A1 => ones_concat(0),
      A0 => hundredths_concat(0),
      Q => CLKDIV262K_1_Mshreg_div_1024_15,
      Q15 => NLW_CLKDIV262K_1_Mshreg_div_1024_15_SRL16E_Q15_UNCONNECTED
    );
  CLKDIV262K_1_Mshreg_div_32768_15_VCC : X_ONE
    port map (
      O => CLKDIV262K_1_Mshreg_div_32768_15_CE
    );
  CLKDIV262K_1_Mshreg_div_32768_15_SRL16E : X_SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      D => CLKDIV262K_1_div_32768_0_Q,
      CE => CLKDIV262K_1_Mshreg_div_32768_15_CE,
      CLK => CLKDIV262K_1_div_1024_15_Q,
      A3 => hundredths_concat(0),
      A2 => hundredths_concat(0),
      A1 => ones_concat(0),
      A0 => hundredths_concat(0),
      Q => CLKDIV262K_1_Mshreg_div_32768_15,
      Q15 => NLW_CLKDIV262K_1_Mshreg_div_32768_15_SRL16E_Q15_UNCONNECTED
    );
  CLKDIV262K_1_Mshreg_temp_div_262144_31_VCC : X_ONE
    port map (
      O => CLKDIV262K_1_Mshreg_temp_div_262144_31_CE
    );
  CLKDIV262K_1_Mshreg_temp_div_262144_31_SRL16E : X_SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      D => CLKDIV262K_1_temp_div_262144_0_Q,
      CE => CLKDIV262K_1_Mshreg_temp_div_262144_31_CE,
      CLK => CLKDIV262K_1_div_32768_15_Q,
      A3 => ones_concat(0),
      A2 => ones_concat(0),
      A1 => ones_concat(0),
      A0 => hundredths_concat(0),
      Q => CLKDIV262K_1_Mshreg_temp_div_262144_31,
      Q15 => NLW_CLKDIV262K_1_Mshreg_temp_div_262144_31_SRL16E_Q15_UNCONNECTED
    );
  SEG_A_OBUF : X_OBUF
    port map (
      I => SEG_A_OBUF_13,
      O => SEG_A
    );
  SEG_B_OBUF : X_OBUF
    port map (
      I => SEG_B_OBUF_14,
      O => SEG_B
    );
  SEG_C_OBUF : X_OBUF
    port map (
      I => SEG_C_OBUF_15,
      O => SEG_C
    );
  SEG_D_OBUF : X_OBUF
    port map (
      I => SEG_D_OBUF_16,
      O => SEG_D
    );
  SEG_E_OBUF : X_OBUF
    port map (
      I => SEG_E_OBUF_17,
      O => SEG_E
    );
  SEG_F_OBUF : X_OBUF
    port map (
      I => SEG_F_OBUF_18,
      O => SEG_F
    );
  SEG_G_OBUF : X_OBUF
    port map (
      I => SEG_G_OBUF_19,
      O => SEG_G
    );
  SEG_DP_OBUF : X_OBUF
    port map (
      I => SEG_DP_OBUF_20,
      O => SEG_DP
    );
  AN_3_OBUF : X_OBUF
    port map (
      I => AN_3_OBUF_21,
      O => AN(3)
    );
  AN_2_OBUF : X_OBUF
    port map (
      I => AN_2_OBUF_22,
      O => AN(2)
    );
  AN_1_OBUF : X_OBUF
    port map (
      I => AN_1_OBUF_23,
      O => AN(1)
    );
  AN_0_OBUF : X_OBUF
    port map (
      I => AN_0_OBUF_24,
      O => AN(0)
    );
  NlwBlock_stopwatch_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlock_stopwatch_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

