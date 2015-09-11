
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:39:29 01/26/2007
-- Design Name:   Outputs_Ports
-- Module Name:   C:/Xilinx/ISEexamples/modulo3/PicoBlaze/out_ports_tb.vhd
-- Project Name:  PicoBlaze
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Outputs_Ports
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

ENTITY out_ports_tb_vhd IS
END out_ports_tb_vhd;

ARCHITECTURE behavior OF out_ports_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT Outputs_Ports
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		Out_Port : IN std_logic_vector(7 downto 0);
		Port_id : IN std_logic_vector(7 downto 0);
		Write_strobe : IN std_logic;          
		Led : OUT std_logic_vector(7 downto 0);
		write_buffer : OUT std_logic;
		data_in : OUT std_logic_vector(7 downto 0);
		status_port : out std_logic_vector (1 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL rst :  std_logic := '0';
	SIGNAL Write_strobe :  std_logic := '0';
	SIGNAL Out_Port :  std_logic_vector(7 downto 0) := (others=>'0');
	SIGNAL Port_id :  std_logic_vector(7 downto 0) := (others=>'0');

	--Outputs
	SIGNAL Led :  std_logic_vector(7 downto 0);
	SIGNAL write_buffer :  std_logic;
	signal data_in : std_logic_vector(7 downto 0);
	signal status_port : std_logic_vector (1 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: Outputs_Ports PORT MAP(
		clk => clk,
		rst => rst,
		Out_Port => Out_Port,
		Port_id => Port_id,
		Write_strobe => Write_strobe,
		Led => Led,
		write_buffer => write_buffer,
		data_in => data_in,
		status_port => status_port
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 10 ns;

		-- Place stimulus here

		clk <= not clk;
	END PROCESS;

rst <= '1', '0' after 40 ns;
out_port <= "10101010", "11111111" after 300 ns;
port_id <= "00000000", "00000001" after 500 ns, "00000010" after 1000 ns;
write_strobe <= '0', '1' after 100 ns, '0' after 150 ns, '1' after 600 ns, '0' after 650 ns, '1' after 1050 ns;


END;
