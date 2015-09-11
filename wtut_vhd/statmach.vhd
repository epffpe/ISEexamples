--------------------------------------------------------------------------------
-- Company: 		 Xilinx
--
-- Create Date:    16:20:33 02/01/05
-- Design Name:    Stopwatch
-- Module Name:    statmach - statmach_arch
-- Project Name:   ISE In Depth Tutorial
-- Target Device:  xc3s200-4ft256
-- Tool versions:  ISE 8.2i
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity statmach is
    port ( CLK : in std_logic;
           RESET : in std_logic;
           LOCKED : in std_logic;
           STRTSTOP : in std_logic;
           CLKEN : out std_logic;
           RST_INT : out std_logic);
end statmach;

architecture statmach_arch of statmach is

	signal sreg : std_logic_vector (2 downto 0);
	signal next_sreg : std_logic_vector (2 downto 0);
	constant clear : std_logic_vector (2 downto 0) :="000";
	constant counting : std_logic_vector (2 downto 0) :="001";
	constant start : std_logic_vector (2 downto 0) :="010";
	constant stop : std_logic_vector (2 downto 0) :="011";
	constant stopped : std_logic_vector (2 downto 0) :="100";
	constant zero : std_logic_vector (2 downto 0) :="101";

begin

  process (CLK, RESET, next_sreg)
  begin
    if ( RESET='1' ) then
      sreg <= clear;
    elsif CLK='1' AND CLK'event then
      sreg <= next_sreg;
    end if;
  end process;

  process (sreg,STRTSTOP,LOCKED)
  begin
    CLKEN <= '0'; RST_INT <= '0'; 
    next_sreg<=clear;

    case sreg is
      when clear =>
        CLKEN <= '0';
        RST_INT <= '1';
        next_sreg <= zero;
      when counting =>
        CLKEN <= '1';
        RST_INT <= '0';
        if ( STRTSTOP='0' and LOCKED = '1' ) then
          next_sreg <= counting;
        else
          next_sreg <= stop;
        end if;
      when start =>
        CLKEN <= '1';
        RST_INT <= '0';
        if ( STRTSTOP='0' and LOCKED = '1' ) then
          next_sreg <= counting;
        else
          next_sreg <= start;
        end if;
      when stop =>
        CLKEN <= '0';
        RST_INT <= '0';
        if ( STRTSTOP='0') then
          next_sreg <= stopped;
        else
          next_sreg <= stop;
        end if;
      when stopped =>
        CLKEN <= '0';
        RST_INT <= '0';
        if ( STRTSTOP='1' and LOCKED = '1') then
          next_sreg <= start;
        else
          next_sreg <= stopped;
        end if;
      when zero =>
        CLKEN <= '0';
        RST_INT <= '0';
        if ( STRTSTOP='1' and LOCKED = '1') then
          next_sreg <= start;
        else
          next_sreg <= zero;
        end if;
      when others =>
        next_sreg <= clear;
    end case;
  end process;

end statmach_arch;
