
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:46:32 01/26/2007
-- Design Name:   logica_deco_uart_rx
-- Module Name:   C:/Xilinx/ISEexamples/modulo3/PicoBlaze/prueba_logica_read_tb.vhd
-- Project Name:  PicoBlaze
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: logica_deco_uart_rx
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY prueba_logica_read_tb_vhd IS
END prueba_logica_read_tb_vhd;

ARCHITECTURE behavior OF prueba_logica_read_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT logica_deco_uart_rx
	PORT(
		clk : IN std_logic;
		port_id : IN std_logic_vector(7 downto 0);
		read_strobe : IN std_logic;          
		read : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL read_strobe :  std_logic := '0';
	SIGNAL port_id :  std_logic_vector(7 downto 0) := (others=>'0');

	--Outputs
	SIGNAL read :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: logica_deco_uart_rx PORT MAP(
		clk => clk,
		port_id => port_id,
		read_strobe => read_strobe,
		read => read
	);


port_id <= "00000000", "00000001" after 150 ns;
read_strobe <= '0', '1' after 250 ns;

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		clk <= not clk;
		wait for 20 ns;

		-- Place stimulus here

		
	END PROCESS;

END;
