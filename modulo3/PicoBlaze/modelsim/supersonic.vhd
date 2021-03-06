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
    Port ( clk : in STD_LOGIC;
			  switches : in  STD_LOGIC_VECTOR (7 downto 0);
           rs232_rx : in  STD_LOGIC;
			  rst	: in STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (7 downto 0);
           rs232_tx : out  STD_LOGIC);
end supersonic;

architecture Behavioral of supersonic is
--Interfaces de entrada del procesador


--signal clk : std_logic;
signal in_port : std_logic_vector(7 downto 0);
signal interrupt : std_logic := '0';
signal instruction : std_logic_vector(17 downto 0);


--Interfaces de salida del procesador

signal out_port : std_logic_vector(7 downto 0);
signal port_id : std_logic_vector(7 downto 0);
signal read_strobe : std_logic;
signal write_strobe : std_logic;
signal interrupt_ack : std_logic;

signal address : std_logic_vector(9 downto 0);


--Declaracion de los puertos de entrada
	COMPONENT Inputs_Ports
	PORT(
		--clk : IN std_logic;
		Source_A : IN std_logic_vector(7 downto 0);
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
		Led : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
-----------------------------------------------------------------------	
-----------------------------------------------------------------------
begin

	Inst_Inputs_Ports: Inputs_Ports PORT MAP(
		--clk => clk,
		Source_A => switches,
		--Read_strobe => read_strobe,
		Port_id => port_id,
		ports => in_port
	);


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


	program: prog_rom
    port map(      address => address,
               instruction => instruction,
                       clk => clk);


	Inst_Outputs_Ports: Outputs_Ports PORT MAP(
		clk => clk,
		rst => rst,
		Out_Port => out_port,
		Port_id => port_id,
		Write_strobe => write_strobe,
		Led => leds
	);



end Behavioral;

