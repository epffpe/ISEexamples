
-- VHDL Instantiation Created from source file uart_tx.vhd -- 22:58:30 01/25/2007
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT uart_tx
	PORT(
		data_in : IN std_logic_vector(7 downto 0);
		write_buffer : IN std_logic;
		reset_buffer : IN std_logic;
		en_16_x_baud : IN std_logic;
		clk : IN std_logic;          
		serial_out : OUT std_logic;
		buffer_full : OUT std_logic;
		buffer_half_full : OUT std_logic
		);
	END COMPONENT;

	Inst_uart_tx: uart_tx PORT MAP(
		data_in => ,
		write_buffer => ,
		reset_buffer => ,
		en_16_x_baud => ,
		serial_out => ,
		buffer_full => ,
		buffer_half_full => ,
		clk => 
	);


