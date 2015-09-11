----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:44:17 01/23/2007 
-- Design Name: 
-- Module Name:    Inputs_Ports - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Inputs_Ports is
    Port ( clk : in STD_LOGIC;
			  Source_A : in  STD_LOGIC_VECTOR (7 downto 0);
			  Source_B : IN std_logic_vector(7 downto 0);
		     State    : IN std_logic_vector(7 downto 0);
           --Read_strobe : in  STD_LOGIC;
			  Port_id : in STD_LOGIC_VECTOR (7 downto 0);
           ports : out  STD_LOGIC_VECTOR (7 downto 0));
end Inputs_Ports;

architecture Behavioral of Inputs_Ports is

--signal Din,Qin	:STD_LOGIC_VECTOR (7 downto 0);
--signal Dout, Qout : STD_LOGIC_VECTOR (7 downto 0);


begin

--Din <= Source_A;

--FD1:process(clk)
--	begin
--		if(clk'event and clk='1') then
--			Qin <= Din;
--		end if;
--	end process;


mult:	process (clk)
		begin
		if(clk'event and clk='1') then
			case port_id (1 downto 0) is
				when "00" => ports <= Source_A;
		      when "01" => ports <= Source_B;
		      when "10" => ports <= State;
		--      when "11" => Dout <= "00000000";
				when others => ports <= "XXXXXXXX";
			end case;
		end if;
		end process;
 


--buff :process(clk)
--		begin
--			if(clk'event and clk='1') then
--				if(Read_strobe='1') then
--				Qout <= Dout;
--				end if;
--			end if;
--		end process;

--ports <= Qout;
end Behavioral;

