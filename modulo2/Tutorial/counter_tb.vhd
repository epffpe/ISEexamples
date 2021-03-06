
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:21:55 01/20/2007
-- Design Name:   counter
-- Module Name:   C:/Xilinx/ISEexamples/modulo2/Tutorial/counter_tb.vhd
-- Project Name:  Tutorial
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
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

ENTITY counter_tb_vhd IS
END counter_tb_vhd;

ARCHITECTURE behavior OF counter_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT counter
	PORT(
		CLOCK : IN std_logic;
		DIRECTION : IN std_logic;          
		COUNT_OUT : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL CLOCK :  std_logic := '0';
	SIGNAL DIRECTION :  std_logic := '0';

	--Outputs
	SIGNAL COUNT_OUT :  std_logic_vector(3 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: counter PORT MAP(
		CLOCK => CLOCK,
		DIRECTION => DIRECTION,
		COUNT_OUT => COUNT_OUT
	);
	
		DIRECTION <= '0', '1' after 105 ns;  -- Pasados 105ns ponemos la se�al de reset a 1 para poder trabajar con la cpumini
	
	process
	begin
		wait for 50 ns;  -- Establecemos el ciclo de reloj en 100ns
		CLOCK <= not CLOCK;	
	end process;


--	tb : PROCESS
--	BEGIN
--
--		-- Wait 100 ns for global reset to finish
--		wait for 100 ns;
--
--		-- Place stimulus here
--
--		wait; -- will wait forever
--	END PROCESS;

END;
