
-- VHDL Instantiation Created from source file divisor.vhd -- 22:53:51 01/25/2007
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT divisor
	PORT(
		clk : IN std_logic;          
		en_16_x_baud : OUT std_logic
		);
	END COMPONENT;

	Inst_divisor: divisor PORT MAP(
		clk => ,
		en_16_x_baud => 
	);


