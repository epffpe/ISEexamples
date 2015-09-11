
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:24:55 01/23/2007
-- Design Name:   supersonic
-- Module Name:   C:/Xilinx/ISEexamples/modulo3/PicoBlaze/supersonic_tb.vhd
-- Project Name:  PicoBlaze
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: supersonic
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

ENTITY supersonic_tb_vhd IS
END supersonic_tb_vhd;

ARCHITECTURE behavior OF supersonic_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT supersonic
	PORT(
		clk : IN STD_LOGIC;
		switches : IN std_logic_vector(7 downto 0);
		rs232_rx : IN std_logic;
		rst : IN std_logic;          
		leds : OUT std_logic_vector(7 downto 0);
		rs232_tx : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk : std_logic :='0';
	SIGNAL rs232_rx :  std_logic := '0';
	SIGNAL rst :  std_logic := '0';
	SIGNAL switches :  std_logic_vector(7 downto 0) := (others=>'0');

	--Outputs
	SIGNAL leds :  std_logic_vector(7 downto 0);
	SIGNAL rs232_tx :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: supersonic PORT MAP(
		clk => clk,
		switches => switches,
		rs232_rx => rs232_rx,
		rst => rst,
		leds => leds,
		rs232_tx => rs232_tx
	);
	
--	tb: process(clk)
--	begin
--	end process;

	rst <= '1', '0' after 105 ns;
	switches <= "00000000", "00000001" after 155 ns, "00000010" after 450 ns, "00000100" after 700 ns;
	rs232_rx <= '0';
	
	
	PROCESS
	BEGIN
		wait for 20 ns;
		-- Place stimulus here
		clk <=not clk;
	END PROCESS;

END;
