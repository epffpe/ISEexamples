-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY Prueba_programa IS
  END Prueba_programa;

  ARCHITECTURE behavior OF Prueba_programa IS 

  -- Component Declaration
	COMPONENT kcpsm3
	PORT(
		instruction : IN std_logic_vector(17 downto 0);
		in_port : IN std_logic_vector(7 downto 0);
		interrupt : IN std_logic;
		reset : IN std_logic;
		clk : IN std_logic;          
		address : OUT std_logic_vector(9 downto 0);
		port_id : OUT std_logic_vector(7 downto 0);
		write_strobe : OUT std_logic;
		out_port : OUT std_logic_vector(7 downto 0);
		read_strobe : OUT std_logic;
		interrupt_ack : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT prog_rom
	PORT(
		address : IN std_logic_vector(9 downto 0);
		clk : IN std_logic;          
		instruction : OUT std_logic_vector(17 downto 0)
		);
	END COMPONENT;
	
signal clk : std_logic:='0';


signal in_port : std_logic_vector(7 downto 0);
signal interrupt : std_logic := '0';
signal instruction : std_logic_vector(17 downto 0);

signal out_port : std_logic_vector(7 downto 0);

signal port_id : std_logic_vector(7 downto 0);
signal read_strobe : std_logic;
signal write_strobe : std_logic;
signal interrupt_ack : std_logic;

signal address : std_logic_vector(9 downto 0);
signal rst : std_logic;
          

  BEGIN

  -- Component Instantiation
	procesador: kcpsm3 PORT MAP(
		address => address,
		instruction => instruction,
		port_id => port_id,
		write_strobe => write_strobe,
		out_port => out_port,
		read_strobe => read_strobe,
		in_port => in_port,
		interrupt => interrupt,
		interrupt_ack => interrupt_ack,
		reset => rst,
		clk => clk
	);

-------------------------------------------------------
	program: prog_rom
    port map(      address => address,
               instruction => instruction,
                       clk => clk);
							  
							  
	
	in_port <="00010000";			--recibir->"00010000"   no_recibir->"11000000";
	rst <= '1', '0' after 10 ns;

	PROCESS
	BEGIN
		wait for 10 ns;
		-- Place stimulus here
		clk <=not clk;
	END PROCESS;
  END;
