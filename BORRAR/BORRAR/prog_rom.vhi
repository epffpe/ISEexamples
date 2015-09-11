
-- VHDL Instantiation Created from source file prog_rom.vhd -- 01:16:05 02/21/2007
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT prog_rom
	PORT(
		address : IN std_logic_vector(9 downto 0);
		clk : IN std_logic;          
		instruction : OUT std_logic_vector(17 downto 0)
		);
	END COMPONENT;

	Inst_prog_rom: prog_rom PORT MAP(
		address => ,
		instruction => ,
		clk => 
	);


