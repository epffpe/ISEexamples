
-- VHDL Instantiation Created from source file logica_deco_uart_rx.vhd -- 22:32:08 01/25/2007
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT logica_deco_uart_rx
	PORT(
		clk : IN std_logic;
		port_id : IN std_logic_vector(7 downto 0);
		read_strobe : IN std_logic;          
		read : OUT std_logic
		);
	END COMPONENT;

	Inst_logica_deco_uart_rx: logica_deco_uart_rx PORT MAP(
		clk => ,
		port_id => ,
		read_strobe => ,
		read => 
	);


