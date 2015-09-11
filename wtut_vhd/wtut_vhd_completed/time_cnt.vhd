--------------------------------------------------------------------------------
-- Company: 		 Xilinx
--
-- Create Date:    16:40:22 02/01/05
-- Design Name:    Stopwatch
-- Module Name:    time_cnt - time_cnt_arch
-- Project Name:   ISE In Depth Tutorial
-- Target Device:  xc3s200-4ft256
-- Tool versions:  ISE 8.2i
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity time_cnt is
    port ( CLK : in std_logic;
           CE : in std_logic;
           CLR : in std_logic;
           SEC_LSB : out std_logic_vector(3 downto 0);
           SEC_MSB : out std_logic_vector(3 downto 0);
           MINUTES : out std_logic_vector(3 downto 0));
end time_cnt;

architecture time_cnt_arch of time_cnt is

  signal ones_cnt, mins_cnt : std_logic_vector (3 downto 0);
  signal tens_cnt : std_logic_vector (2 downto 0);

begin

  process (CLK, CLR)
  begin
    if CLR = '1' then
      ones_cnt <= "0000";
    elsif CLK'event and CLK = '1' then
      if CE = '1' then
        if ones_cnt = "1001" then
          ones_cnt <= "0000";
        else
          ones_cnt <= ones_cnt + 1;
        end if;
      end if;
    end if;
  end process;

  process (CLK, CLR)
  begin
    if CLR = '1' then
      tens_cnt <= "000";
    elsif CLK'event and CLK = '1' then
      if (ones_cnt = "1001" and CE = '1') then
        if tens_cnt = "101" then
          tens_cnt <= "000";
        else
          tens_cnt <= tens_cnt + 1;
        end if;
      end if;
    end if;
  end process;

  process (CLK, CLR)
  begin
    if CLR = '1' then
      mins_cnt <= "0000";
    elsif CLK'event and CLK = '1' then
      if (tens_cnt = "101" and ones_cnt = "1001" and CE = '1') then
        if mins_cnt = "1001" then
          mins_cnt <= "0000";
        else
          mins_cnt <= mins_cnt + 1;
        end if;
      end if;
    end if;
  end process;

  SEC_LSB <= ones_cnt;
  SEC_MSB <= '0' & tens_cnt;
  MINUTES <= mins_cnt;

end time_cnt_arch;
