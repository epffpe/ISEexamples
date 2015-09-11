--------------------------------------------------------------------------------
-- Company: 		 Xilinx
--
-- Create Date:    15:53:35 02/01/05
-- Design Name:    Stopwatch
-- Module Name:    led_control - led_control_arch
-- Project Name:   ISE In Depth Tutorial
-- Target Device:  xc3s200-4ft256
-- Tool versions:  ISE 8.2i
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity led_control is
    Port ( CLK : in std_logic;
           HUNDREDTHS : in std_logic_vector(7 downto 0);
           TENTHS : in std_logic_vector(7 downto 0);
           ONES : in std_logic_vector(7 downto 0);
           TENS : in std_logic_vector(7 downto 0);
           MINUTES : in std_logic_vector(7 downto 0);
           AN : out std_logic_vector(3 downto 0);
           SEVEN_SEG : out std_logic_vector(7 downto 0));
end led_control;

architecture led_control_arch of led_control is

  signal d0, d1 : std_logic_vector (7 downto 0);
  signal cnt : std_logic_vector (15 downto 0);
  signal sel : std_logic_vector (1 downto 0);

begin

  sel <= cnt (15 downto 14);

  process (sel, TENS, MINUTES, ONES, TENTHS, HUNDREDTHS)
  begin
    case (sel) is
	   when "00" => 
		  AN <= "0111";
		  d0 <= TENS;
		  d1 <= MINUTES;
      when "01" =>
		  AN <= "1011";
		  d0 <= ONES;
		  d1 <= TENS;
      when "10" =>
		  AN <= "1101";
		  d0 <= TENTHS;
		  d1 <= ONES;
      when others =>
		  AN <= "1110";
		  d0 <= HUNDREDTHS;
		  d1 <= TENTHS;
    end case;
  end process;

  process (CLK)
  begin
    if CLK'event and CLK = '1' then
	   cnt <= cnt + 1;
    end if;
  end process;

  process (CLK)
  begin
    if CLK'event and CLK = '1' then
	   if MINUTES = "10000000" then
		  SEVEN_SEG <= d0;
      else
		  SEVEN_SEG <= d1;
      end if;
    end if;
  end process;

end led_control_arch;
