-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
 	COMPONENT Display
	PORT(
		--serial_in : IN std_logic;
		--serial_out : IN std_logic;
		clk : IN std_logic;
		rst : IN std_logic;          
		digit_out : OUT std_logic_vector(3 downto 0);
		seg_out : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

          SIGNAL clk :  std_logic :='0';
			 signal rst : std_logic;
          SIGNAL digit :  std_logic_vector(3 downto 0);
			 signal seg : std_logic_vector(7 downto 0);
          

  BEGIN

  -- Component Instantiation
	uut: Display PORT MAP(
		--serial_in => serial_in,
		--serial_out => serial_out,
		clk => clk,
		rst => rst,
		digit_out => digit,
		seg_out => seg
	);
	
	rst <= '1', '0' after 100ns;

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		
		wait for 10 ns;
		clk <= not clk;
		-- Place stimulus here

		
	END PROCESS;

  END;
