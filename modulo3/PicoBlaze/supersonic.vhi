
-- VHDL Instantiation Created from source file supersonic.vhd -- 22:55:57 01/25/2007
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT supersonic
	PORT(
		clk : IN std_logic;
		switches : IN std_logic_vector(7 downto 0);
		rs232_rx : IN std_logic;
		rst : IN std_logic;          
		leds : OUT std_logic_vector(7 downto 0);
		rs232_tx : OUT std_logic
		);
	END COMPONENT;

	Inst_supersonic: supersonic PORT MAP(
		clk => ,
		switches => ,
		rs232_rx => ,
		rst => ,
		leds => ,
		rs232_tx => 
	);


