
-- VHDL Instantiation Created from source file Outputs_Ports.vhd -- 01:08:29 02/17/2007
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Outputs_Ports
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		Out_Port : IN std_logic_vector(7 downto 0);
		Port_id : IN std_logic_vector(7 downto 0);
		Write_strobe : IN std_logic;          
		Led : OUT std_logic_vector(7 downto 0);
		write_buffer : OUT std_logic;
		data_in : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_Outputs_Ports: Outputs_Ports PORT MAP(
		clk => ,
		rst => ,
		Out_Port => ,
		Port_id => ,
		Write_strobe => ,
		Led => ,
		write_buffer => ,
		data_in => 
	);


