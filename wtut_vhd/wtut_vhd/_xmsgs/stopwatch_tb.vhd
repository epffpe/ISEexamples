
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:54:52 03/08/2005
-- Design Name:   stopwatch
-- Module Name:   stopwatch_tb.vhd
-- Project Name:  wtut_vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: stopwatch
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

ENTITY stopwatch_tb_vhd IS
END stopwatch_tb_vhd;

ARCHITECTURE behavior OF stopwatch_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT stopwatch
	PORT(
		STRTSTOP : IN std_logic;
		RESET : IN std_logic;
		CLK : IN std_logic;          
		SEG_A : OUT std_logic;
		SEG_B : OUT std_logic;
		SEG_C : OUT std_logic;
		SEG_D : OUT std_logic;
		SEG_E : OUT std_logic;
		SEG_F : OUT std_logic;
		SEG_G : OUT std_logic;
		SEG_DP : OUT std_logic;
		AN : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL STRTSTOP :  std_logic := '0';
	SIGNAL RESET :  std_logic := '0';
	SIGNAL CLK :  std_logic := '0';

	--Outputs
	SIGNAL SEG_A :  std_logic := '0';
	SIGNAL SEG_B :  std_logic := '0';
	SIGNAL SEG_C :  std_logic := '0';
	SIGNAL SEG_D :  std_logic := '0';
	SIGNAL SEG_E :  std_logic := '0';
	SIGNAL SEG_F :  std_logic := '0';
	SIGNAL SEG_G :  std_logic := '0';
	SIGNAL SEG_DP :  std_logic := '0';
	SIGNAL AN :  std_logic_vector(3 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: stopwatch PORT MAP(
		STRTSTOP => STRTSTOP,
		RESET => RESET,
		CLK => CLK,
		SEG_A => SEG_A,
		SEG_B => SEG_B,
		SEG_C => SEG_C,
		SEG_D => SEG_D,
		SEG_E => SEG_E,
		SEG_F => SEG_F,
		SEG_G => SEG_G,
		SEG_DP => SEG_DP,
		AN => AN
	);
   clock_process : PROCESS
   BEGIN
      CLK <= '0';
      wait for 10 ns;
      CLK <= not CLK;
      wait for 10 ns;
   END PROCESS;
	tb : PROCESS
	BEGIN
		RESET <= '1';
		STRTSTOP <= '0';		
		-- Wait 100 ns for global reset to finish
		wait for 100 ns;
		-- Place stimulus here
		wait for 50 ns;
		RESET <= '0';
		wait for 50 ns;
		STRTSTOP <= '1'; 
		wait; -- will wait forever
	END PROCESS;

END;
