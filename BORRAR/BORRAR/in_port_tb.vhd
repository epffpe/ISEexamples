
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:08:17 01/26/2007
-- Design Name:   Inputs_Ports
-- Module Name:   C:/Xilinx/ISEexamples/modulo3/PicoBlaze/in_port_tb.vhd
-- Project Name:  PicoBlaze
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Inputs_Ports
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

ENTITY in_port_tb_vhd IS
END in_port_tb_vhd;

ARCHITECTURE behavior OF in_port_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT Inputs_Ports
	PORT(
		clk : IN std_logic;
		Source_A : IN std_logic_vector(7 downto 0);
		Source_B : IN std_logic_vector(7 downto 0);
		State : IN std_logic_vector(7 downto 0);
		Port_id : IN std_logic_vector(7 downto 0);          
		ports : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL Source_A :  std_logic_vector(7 downto 0) := "11110000";
	SIGNAL Source_B :  std_logic_vector(7 downto 0) := "00001111";
	SIGNAL State :  std_logic_vector(7 downto 0) := "00010101";
	SIGNAL Port_id :  std_logic_vector(7 downto 0) := (others=>'0');

	--Outputs
	SIGNAL ports :  std_logic_vector(7 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: Inputs_Ports PORT MAP(
		clk => clk,
		Source_A => Source_A,
		Source_B => Source_B,
		State => State,
		Port_id => Port_id,
		ports => ports
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 10 ns;

		-- Place stimulus here

		clk <= not clk;
	END PROCESS;
	
Port_id (1 downto 0) <= "11", "00" after 50 ns, "01" after 100 ns, "10" after 150 ns;

END;
