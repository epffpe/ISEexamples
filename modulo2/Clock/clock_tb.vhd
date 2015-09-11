
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:30:55 02/16/2007
-- Design Name:   clock
-- Module Name:   C:/Xilinx/ISEexamples/modulo2/Clock/clock_tb.vhd
-- Project Name:  clock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clock
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

ENTITY clock_tb_vhd IS
END clock_tb_vhd;

ARCHITECTURE behavior OF clock_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT clock
	PORT(
		clk50in : IN std_logic;
		pb_in : IN std_logic_vector(3 downto 0);
		sw_in : IN std_logic_vector(7 downto 0);          
		digit_out : OUT std_logic_vector(3 downto 0);
		led_out : OUT std_logic_vector(7 downto 0);
		seg_out : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk50in :  std_logic := '0';
	SIGNAL pb_in :  std_logic_vector(3 downto 0);
	SIGNAL sw_in :  std_logic_vector(7 downto 0);

	--Outputs
	SIGNAL digit_out :  std_logic_vector(3 downto 0);
	SIGNAL led_out :  std_logic_vector(7 downto 0);
	SIGNAL seg_out :  std_logic_vector(7 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: clock PORT MAP(
		clk50in => clk50in,
		pb_in => pb_in,
		sw_in => sw_in,
		digit_out => digit_out,
		led_out => led_out,
		seg_out => seg_out
	);

sw_in <= (others => '0');
pb_in <= "0001", "0000" after 100 ns;

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 20 ns;
		clk50in <= not clk50in;
		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
