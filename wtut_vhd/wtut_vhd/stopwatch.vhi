
-- VHDL Instantiation Created from source file stopwatch.vhd -- 05:35:58 01/12/2007
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_stopwatch: stopwatch PORT MAP(
		STRTSTOP => ,
		RESET => ,
		CLK => ,
		SEG_A => ,
		SEG_B => ,
		SEG_C => ,
		SEG_D => ,
		SEG_E => ,
		SEG_F => ,
		SEG_G => ,
		SEG_DP => ,
		AN => 
	);


