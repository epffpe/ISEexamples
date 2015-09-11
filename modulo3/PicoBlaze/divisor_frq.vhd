----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:40:13 01/25/2007 
-- Design Name: 
-- Module Name:    divisor - Behavioral 
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

entity divisor is
    Port ( clk : in  STD_LOGIC;
			  en_16_x_baud : out STD_LOGIC
			);
end divisor;

architecture Behavioral of divisor is

--frecuencia de muestreo = 16*baud rate
--     frec reloj
--    -------------- = num de ciclos de reloj por muestra
--     frec muestreo
-- frec reloj= 50MHz
-- baud rate = 9600
-- frec muestreo = 16*9600
-- num =325.52 -> 512 
------------------------------------------------------------

signal baud_count : integer range 0 to 325 :=0;

begin

process(clk)
begin
	if clk'event and clk='1' then
		if baud_count = 325 then
			baud_count <= 0;
			en_16_x_baud <= '1';
		else
			baud_count <= baud_count + 1;
			en_16_x_baud <= '0';
		end if;
	end if;

end process;
end Behavioral;

