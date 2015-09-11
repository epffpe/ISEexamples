
-- VHDL Instantiation Created from source file Inputs_Ports.vhd -- 03:28:40 01/23/2007
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Inputs_Ports
	PORT(
		clk : IN std_logic;
		Source_A : IN std_logic_vector(7 downto 0);
		Read_strobe : IN std_logic;
		Port_id : IN std_logic_vector(7 downto 0);          
		ports : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_Inputs_Ports: Inputs_Ports PORT MAP(
		clk => ,
		Source_A => ,
		Read_strobe => ,
		Port_id => ,
		ports => 
	);


