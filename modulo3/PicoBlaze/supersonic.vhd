----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:59:06 01/19/2007 
-- Design Name: 
-- Module Name:    supersonic - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity supersonic is
    Port ( clk50in : in STD_LOGIC;
			  switches : in  STD_LOGIC_VECTOR (7 downto 0);
           rs232_rx : in  STD_LOGIC;
			  rst	: in STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (7 downto 0);
           rs232_tx : out  STD_LOGIC;
			  digit_out : OUT std_logic_vector (3 downto 0);
			  seg_out : OUT std_logic_vector (7 downto 0));
end supersonic;

architecture Behavioral of supersonic is
--Interfaces de entrada del procesador


--------------------------------------------------------------------------
signal clk : std_logic;


signal in_port : std_logic_vector(7 downto 0);
signal interrupt : std_logic := '0';
signal instruction : std_logic_vector(17 downto 0);


--Interfaces de salida del procesador

signal out_port : std_logic_vector(7 downto 0);
signal data_in : std_logic_vector (7 downto 0);
signal port_id : std_logic_vector(7 downto 0);
signal read_strobe : std_logic;
signal write_strobe : std_logic;
signal interrupt_ack : std_logic;

signal address : std_logic_vector(9 downto 0);

signal Source_B : std_logic_vector (7 downto 0);


signal read_buffer : std_logic;
signal write_buffer : std_logic;

signal en_16_x_baud : std_logic;

--Puerto de entrada C--->estado del UART
signal rx_data_present : std_logic;
signal rx_full			  : std_logic;
signal rx_half_full	  : std_logic;
signal tx_full			  : std_logic;
signal tx_half_full    : std_logic;
signal uart_status_port: std_logic_vector (7 downto 0);
signal status_port : std_logic_vector (1 downto 0);

signal serial_in : std_logic;
signal serial_out : std_logic;
signal digit 		: std_logic_vector(3 downto 0) ;
signal seg 		: std_logic_vector(7 downto 0) ;



--Declaracion de los puertos de entrada
	COMPONENT Inputs_Ports
	PORT(
		clk : IN std_logic;
		Source_A : IN std_logic_vector(7 downto 0);
		Source_B : IN std_logic_vector(7 downto 0);
		State    : IN std_logic_vector(7 downto 0);
		--Read_strobe : IN std_logic;
		Port_id : IN std_logic_vector(7 downto 0);          
		ports : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;


--Declaracion del procesador
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
	
-- declaration of program ROM
--
  component prog_rom 
    Port (      address : in std_logic_vector(9 downto 0);
            instruction : out std_logic_vector(17 downto 0);
                    clk : in std_logic);
    end component;
--
------------------------------------------------------------------------------------
--	

--Declaracion de los puertos de salida

COMPONENT Outputs_Ports
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		Out_Port : IN std_logic_vector(7 downto 0);
		Port_id : IN std_logic_vector(7 downto 0);
		Write_strobe : IN std_logic;          
		Led : OUT std_logic_vector(7 downto 0);
		write_buffer : OUT std_logic;
		data_in : OUT std_logic_vector (7 downto 0);
		status_port : out std_logic_vector (1 downto 0)
		);
	END COMPONENT;
	
--Declaracion de la UART TX y RX

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
	
--Declaracion de la logica de decodificacion de la señal de entrada de lectura de la UART_RX

	COMPONENT logica_deco_uart_rx
	PORT(
		clk : IN std_logic;
		port_id : IN std_logic_vector(7 downto 0);
		read_strobe : IN std_logic;          
		read : OUT std_logic
		);
	END COMPONENT;
	
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

--Declaracion del divisor de frecuencias para utilizarlo en la UART

	COMPONENT divisor
	PORT(
		clk : IN std_logic;          
		en_16_x_baud : OUT std_logic
		);
	END COMPONENT;
	
	
------------------------------------------------------------------------
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
-----------------------------------------------------------------------	
-----------------------------------------------------------------------
begin



clk <= clk50in;


--Logica de lectura del buffer de la UART_RX

	Inst_logica_deco_uart_rx: logica_deco_uart_rx PORT MAP(
		clk => clk,
		port_id => port_id,
		read_strobe => read_strobe,
		read => read_buffer
	);
	
------------------------------------------------------

--Divisor de frecuencia

	Inst_divisor: divisor PORT MAP(
		clk => clk,
		en_16_x_baud => en_16_x_baud
	);
----------------------------------------------------

--UART de entrada y de salida

  Inst_uart_rx: uart_rx PORT MAP(
		serial_in => rs232_rx,
		data_out => Source_B,
		read_buffer => read_buffer,
		reset_buffer => rst,
		en_16_x_baud => en_16_x_baud,
		buffer_data_present => rx_data_present,
		buffer_full => rx_full,
		buffer_half_full => rx_half_full,
		clk => clk
	);
-------------------------

	Inst_uart_tx: uart_tx PORT MAP(
		data_in => data_in,
		write_buffer => write_buffer,
		reset_buffer => rst,
		en_16_x_baud => en_16_x_baud,
		serial_out => rs232_tx,
		buffer_full => tx_full,
		buffer_half_full => tx_half_full,
		clk => clk
	);
-------------------------------------------------
-----------------------------------------------

--Puerto C de entrada, status de la uart

uart_status_port <= "000" & rx_data_present & rx_full & rx_half_full & tx_full & tx_half_full;

------------------------------------------
-----------------------------------------

-------------------------------------------------
	Inst_Inputs_Ports: Inputs_Ports PORT MAP(
		clk => clk,
		Source_A => switches,
		Source_B => Source_B,
		State => uart_status_port,
		--Read_strobe => read_strobe,
		Port_id => port_id,
		ports => in_port
	);

---------------------------------------------------
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

----------------------------------------------------------
	Inst_Outputs_Ports: Outputs_Ports PORT MAP(
		clk => clk,
		rst => rst,
		Out_Port => out_port,
		Port_id => port_id,
		Write_strobe => write_strobe,
		Led => leds,
		write_buffer => write_buffer,
		data_in => data_in,
		status_port => status_port
	);
------------------------------------------------
--	Inst_Display: Display PORT MAP(
--		serial_in => serial_in,
--		serial_out =>serial_out,
--		en_16_x_baud => en_16_x_baud,
--		digit_out => digit_out,
--		led_out => led_out
--	);

	Inst_Display: Display PORT MAP(
		--serial_in => serial_in,
		--serial_out => serial_out,
		clk => clk,
		rst => rst,
		digit_out => digit,
		seg_out => seg
	);
-----------------------------------------------
serial_in <=rs232_rx;
serial_out <='0';
--serial_out <=rs232_tx;

digit_out <= digit;
seg_out <=seg;

end Behavioral;

