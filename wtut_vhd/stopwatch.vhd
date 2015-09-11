--------------------------------------------------------------------------------
-- Company:        Xilinx
--
-- Create Date:    12:23:44 01/27/05
-- Design Name:    stopwatch
-- Module Name:    stopwatch - stopwatch_arch
-- Project Name:   ISE in Depth Tutorial
-- Target Device:  xc3s200-4ft256
-- Tool versions:  ISE 8.2i
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch is
    port ( STRTSTOP : in std_logic;
           RESET    : in std_logic;
           CLK      : in std_logic;
           SEG_A    : out std_logic;
           SEG_B    : out std_logic;
           SEG_C    : out std_logic;
           SEG_D    : out std_logic;
           SEG_E    : out std_logic;
           SEG_F    : out std_logic;
           SEG_G    : out std_logic;
           SEG_DP   : out std_logic;
           AN       : out std_logic_vector(3 downto 0));

attribute LOC : string;
attribute LOC of AN : signal is "e14,f14,g14,d14";

end stopwatch;

architecture stopwatch_arch of stopwatch is

  component debounce is
    port ( SIG_IN  : in std_logic;
           CLK     : in std_logic;
           SIG_OUT : out std_logic);
  end component;

  component clk_div_262k is
    port ( CLK        : in std_logic;
           DIV_262144 : out std_logic);
  end component;

  component hex2led is
    port ( HEX : in std_logic_vector(3 downto 0);
           LED : out std_logic_vector(6 downto 0));
  end component;

  component led_control is
    port ( CLK        : in std_logic;
           HUNDREDTHS : in std_logic_vector(7 downto 0);
           TENTHS     : in std_logic_vector(7 downto 0);
           ONES       : in std_logic_vector(7 downto 0);
           TENS       : in std_logic_vector(7 downto 0);
           MINUTES    : in std_logic_vector(7 downto 0);
           AN         : out std_logic_vector(3 downto 0);
           SEVEN_SEG  : out std_logic_vector(7 downto 0));
  end component;

  component statmach is
    port (CLK,LOCKED,RESET,STRTSTOP: in std_logic;
		   CLKEN,RST_INT : out std_logic);
  end component;

  component time_cnt is
    port ( CLK     : in std_logic;
           CE      : in std_logic;
           CLR	 : in std_logic;
           SEC_LSB : out std_logic_vector(3 downto 0);
           SEC_MSB : out std_logic_vector(3 downto 0);
           MINUTES : out std_logic_vector(3 downto 0));
  end component;

-- Insert Coregen Counter Component Declaration

-- Insert DCM1 component declaration here

  signal hundredthsout, tenthsout : std_logic_vector (6 downto 0);
  signal onesout, tensout, minutesout : std_logic_vector (6 downto 0);
  signal hex2led_int1, hex2led_int2, hex2led_int3 : std_logic_vector (3 downto 0);
  signal hex2led_int4, hex2led_int5 : std_logic_vector (3 downto 0);
  signal time_cnt_ce, ten_cnt_ce, ten_cnt_thresh1, ten_cnt_thresh2 : std_logic;
  signal clk_262144k, clk_int, clk_100, clk_en_int : std_logic;
  signal rst_int, locked, strtstop_debounced : std_logic;
  signal hundredths_concat, tenths_concat	: std_logic_vector (7 downto 0);
  signal ones_concat, tens_concat, minutes_concat : std_logic_vector (7 downto 0);

begin

  hundredths_concat <= hundredthsout & '1';
  tenths_concat <= tenthsout & '1';
  ones_concat <= onesout & '0';
  tens_concat <= tensout & '1';
  minutes_concat <= minutesout & '0';
  ten_cnt_ce <= clk_en_int and ten_cnt_thresh1;
  time_cnt_ce <= ten_cnt_thresh2 and ten_cnt_ce;

--Insert Coregen Counter Instantiation

-- Insert DCM1 instantiation here

  HEX2LED_1 : hex2led port map (
    HEX => hex2led_int1,
    LED => hundredthsout);

  HEX2LED_2 : hex2led port map (
    HEX => hex2led_int2,
    LED => tenthsout);

  HEX2LED_3 : hex2led port map (
    HEX => hex2led_int3,
    LED => onesout);

  HEX2LED_4 : hex2led port map (
    HEX => hex2led_int4,
    LED => tensout);

  HEX2LED_5 : hex2led port map (
    HEX => hex2led_int5,
    LED => minutesout);

  DEBOUNCE_1 : debounce port map (
    SIG_IN => STRTSTOP,
    CLK => clk_100,
    SIG_OUT => strtstop_debounced);

  TIMECNT_1 : time_cnt port map (
    CLK => clk_100,
    CE => time_cnt_ce,
    CLR => rst_int,
    SEC_LSB => hex2led_int3,
    SEC_MSB => hex2led_int4,
    MINUTES => hex2led_int5);

  STATEMACH_1 : statmach port map (
    CLK => clk_100,
    reset => RESET,
    locked => locked,
    strtstop => strtstop_debounced,
    clken => clk_en_int,
    rst_int => rst_int);

  LEDCONTROL_1 : led_control port map (
    CLK => clk_int,
    HUNDREDTHS => hundredths_concat,
    TENTHS	 => tenths_concat,
    ONES => ones_concat,
    TENS => tens_concat,
    MINUTES => minutes_concat,
    AN => AN,
    SEVEN_SEG(7) => SEG_G,
    SEVEN_SEG(6) => SEG_F,
    SEVEN_SEG(5) => SEG_E,
    SEVEN_SEG(4) => SEG_D,
    SEVEN_SEG(3) => SEG_C,
    SEVEN_SEG(2) => SEG_B,
    SEVEN_SEG(1) => SEG_A,
    SEVEN_SEG(0) => SEG_DP);

  CLKDIV262K_1 : clk_div_262k port map (
    CLK => clk_262144k,
    DIV_262144 => clk_100);
	
end stopwatch_arch;
