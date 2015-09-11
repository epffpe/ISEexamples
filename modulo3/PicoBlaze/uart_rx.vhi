
-- VHDL Instantiation Created from source file uart_rx.vhd -- 21:41:50 01/25/2007
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT uart_rx
	PORT(
		serial_in : IN std_logic;
		read_buffer : IN std_logic;
		reset_buffer : IN std_logic;
		en_16_x_baud : IN std_logic;
		clk : IN std_logic;          
		data_out : OUT std_logic_vector(7 downto 0);
		buffer_data_present : OUT std_logic;
		buffer_full : OUT std_logic;
		buffer_half_full : OUT std_logic
		);
	END COMPONENT;

	Inst_uart_rx: uart_rx PORT MAP(
		serial_in => ,
		data_out => ,
		read_buffer => ,
		reset_buffer => ,
		en_16_x_baud => ,
		buffer_data_present => ,
		buffer_full => ,
		buffer_half_full => ,
		clk => 
	);


