----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:18:19 01/25/2007 
-- Design Name: 
-- Module Name:    logica_deco_uart_rx - Behavioral 
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

entity logica_deco_uart_rx is
    Port ( clk : in  STD_LOGIC;
			  port_id : in  STD_LOGIC_VECTOR (7 downto 0);
           read_strobe : in  STD_LOGIC;
           read : out  STD_LOGIC);
end logica_deco_uart_rx;

architecture Behavioral of logica_deco_uart_rx is



begin

logic:process(clk)
		variable en_f : std_logic;
		begin
		en_f := not port_id(1) and port_id(0);
		read <= read_strobe and en_f;
		end process;

end Behavioral;

