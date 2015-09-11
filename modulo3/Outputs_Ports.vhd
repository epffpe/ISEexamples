----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:23:59 01/23/2007 
-- Design Name: 
-- Module Name:    Outputs_Ports - Behavioral 
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

entity Outputs_Ports is
    Port ( clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  Out_Port : in  STD_LOGIC_VECTOR (7 downto 0);
           Port_id : in  STD_LOGIC_VECTOR (7 downto 0);
           Write_strobe : in  STD_LOGIC;
           Led : out  STD_LOGIC_VECTOR (7 downto 0);
			  write_buffer : out STD_LOGIC;
			  data_in : out STD_LOGIC_VECTOR (7 downto 0));
end Outputs_Ports;

architecture Behavioral of Outputs_Ports is

--signal CE_A : std_logic :='0';


begin

--CE_A <= not Port_id(0);

Puerto_A:process (clk, rst)
			variable CE_A : std_logic;
			variable CE_B : std_logic;
			begin
				CE_A := Write_strobe and not Port_id(0);
				CE_B := Write_strobe and Port_id(0);
				if rst='1' then   
					Led <= "00000000";
				elsif (clk'event and clk='1') then 
					if CE_A = '1' then 
						Led <= Out_Port;
					end if;
					if CE_B = '1' then
						write_buffer <= '1';
						data_in <= Out_Port;
					else
						write_buffer <= '0';
					end if;
				end if;
				

end process;
 

						


end Behavioral;

