------------------------------------------------------------------------------
-- Fichero: loopback
-- Modulo: loopback
-- Autor: Javier Martín Abasolo  <javier0m0a@gmail.es>
--        Anabella Medina Machín <allebana@gmail.es>
-- Fecha: 25/01/2007
-- Descripción:
--        Entidad loopback que realiza dos bucles, uno con los switch y los leds
--			 y otro con el puerto serie. Para ello se utiliza el microcontrolador
--			 picoblaze, una uart_tx, una uart_rx, una entidad imput_port y otra
--			 output_port.
-- Modificaciones:
--    Quien:
--    Fecha:
--    Motivo:
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all ;

--pragma translate_off
library unisim ;
use unisim.vcomponents.all ;
--pragma translate_on

entity loopback is port (
	clk50in				: in std_logic ; 			-- 50 Mhz XTAL
	pb_in				: in std_logic_vector(3 downto 0);	-- 4 pushbutton inputs
	sw_in				: in std_logic_vector(7 downto 0);	-- 8 switch inputs
	digit_out			: out std_logic_vector(3 downto 0);	-- digit drivers
	led_out				: out std_logic_vector(7 downto 0);	-- 8 LEDs
	seg_out				: out std_logic_vector(7 downto 0);	-- segment drivers
	tx				: out std_logic ;
	rx				: in  std_logic );

end loopback ;

architecture arch_loopback of loopback is

-- CMOS33 input buffer primitive
component ibuf_lvcmos33 port (i : in std_logic; o : out std_logic); end component;
-- CMOS33 clock input buffer primitive
component ibufg_lvcmos33 port(i : in std_logic; o : out std_logic); end component;
-- CMOS33 output buffer primitive
component obuf_lvcmos33 port(i : in std_logic; o : out std_logic); end component;
-- global buffer primitive
component bufg port(i : in std_logic; o : out std_logic); end component;

--------------------------------------------------------------------------------
-- declaration of KCPSM3
--------------------------------------------------------------------------------
  component kcpsm3
    Port (      address : out std_logic_vector(9 downto 0);
            instruction : in std_logic_vector(17 downto 0);
                port_id : out std_logic_vector(7 downto 0);
           write_strobe : out std_logic;
               out_port : out std_logic_vector(7 downto 0);
            read_strobe : out std_logic;
                in_port : in std_logic_vector(7 downto 0);
              interrupt : in std_logic;
          interrupt_ack : out std_logic;
                  reset : in std_logic;
                    clk : in std_logic);
    end component;
--------------------------------------------------------------------------------
-- declaration of program ROM
--------------------------------------------------------------------------------
  component memoria
    Port (      address : in std_logic_vector(9 downto 0);
            instruction : out std_logic_vector(17 downto 0);
                    clk : in std_logic);
    end component;
    
--------------------------------------------------------------------------------
-- declaration of input_port
--------------------------------------------------------------------------------
  component input_port
    Port  (    in_port         : out std_logic_vector(7 downto 0);
               port_id         : in std_logic_vector(7 downto 0);
               read_strobe     : in std_logic;
               read_to_uart    : out std_logic;
               switch          : in std_logic_vector(7 downto 0);
               rx_data         : in std_logic_vector(7 downto 0);
               rx_data_present : in std_logic;
               rx_full         : in std_logic;
               rx_half_full    : in std_logic;
               tx_full         : in std_logic;
               tx_half_full    : in std_logic;
					reset 			 : in std_logic;
               clk             : in std_logic);
    end component;

--------------------------------------------------------------------------------
-- declaration of output_port
--------------------------------------------------------------------------------
  component output_port
    Port  (    out_port      : in std_logic_vector(7 downto 0);
               port_id       : in std_logic_vector(7 downto 0);
               write_strobe  : in std_logic;
               write_to_uart : out std_logic;
               LEDs          : out std_logic_vector(7 downto 0);
               tx_data       : out std_logic_vector(7 downto 0);
					reset 		  : in std_logic;
               clk           : in std_logic);
    end component;

--------------------------------------------------------------------------------
-- declaracion de uart9_tx
--------------------------------------------------------------------------------

  component uart9_tx
    Port (            data_in : in std_logic_vector(8 downto 0);
                 write_buffer : in std_logic;
                 reset_buffer : in std_logic;
                 en_16_x_baud : in std_logic;
                   serial_out : out std_logic;
                  buffer_full : out std_logic;
             buffer_half_full : out std_logic;
                          clk : in std_logic);
    end component;

--------------------------------------------------------------------------------
-- declaracion de uart9_rx
--------------------------------------------------------------------------------
  component uart9_rx
    Port (            serial_in : in std_logic;
                       data_out : out std_logic_vector(8 downto 0);
                    read_buffer : in std_logic;
                   reset_buffer : in std_logic;
                   en_16_x_baud : in std_logic;
            buffer_data_present : out std_logic;
                    buffer_full : out std_logic;
               buffer_half_full : out std_logic;
                            clk : in std_logic);
  end component;

--------------------------------------------------------------------------------
-- señales
--------------------------------------------------------------------------------

signal address          : std_logic_vector(9 downto 0);
signal instruction      : std_logic_vector(17 downto 0);
signal port_id          : std_logic_vector(7 downto 0);
signal out_port         : std_logic_vector(7 downto 0);
signal in_port          : std_logic_vector(7 downto 0):="00000000";
signal write_strobe     : std_logic;
signal read_strobe      : std_logic;
signal interrupt        : std_logic :='0';
signal interrupt_ack    : std_logic;

signal rst 		           : std_logic ;				-- logic '1'
signal clk50int		       : std_logic ;				-- 
signal clk50		          : std_logic ;				-- 
signal pb 		            : std_logic_vector(3 downto 0) ;	-- 
signal digit 		         : std_logic_vector(3 downto 0):="1111" ;	-- 
signal seg 		           : std_logic_vector(7 downto 0):="11111111" ;	-- 
signal mhertz_count	    : std_logic_vector(5 downto 0):="000000" ;	-- 
signal khertz_count	    : std_logic_vector(9 downto 0):="0000000000";	-- 
signal hertz_count	     : std_logic_vector(9 downto 0):="0000000000";	-- 
signal mhertz_en	       : std_logic ;				-- 
signal khertz_en	       : std_logic ;				-- 
signal hertz_en		       : std_logic ;				-- 
signal bcdint		         : std_logic_vector(15 downto 0):="1111111111111111" ;	--
signal crr		           : std_logic_vector(3 downto 0):="1111";	-- 
signal conta             : std_logic_vector(2 downto 0):="000";  	-- 
signal tx_on		          : std_logic_vector(3 downto 0):="0000";  --
signal rx_on		          : std_logic_vector(3 downto 0):="0000";	--

signal tx_out		         : std_logic ;
signal rx_in		          : std_logic ;

signal write_to_uart    : std_logic:='0';
signal read_to_uart     : std_logic:='0';
signal en_16_x_baud     : std_logic:= '0';
signal LEDs 		          : std_logic_vector(7 downto 0):="00000000";
signal tx_data 		       : std_logic_vector(7 downto 0):="00000000";
signal switch 		        : std_logic_vector(7 downto 0);
signal rx_data 		       : std_logic_vector(7 downto 0);
signal rx_data_present  : std_logic;
signal rx_full          : std_logic;
signal rx_half_full     : std_logic;
signal tx_full          : std_logic;
signal tx_half_full     : std_logic;

signal rx_data_9        : std_logic_vector(8 downto 0);
signal tx_data_9       : std_logic_vector(8 downto 0);

signal baud_count       : integer range 0 to 127 :=0;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Start of circuit description
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

begin
    
-- ODD parity.
-- Transmitimos con bit de paridad, lo creamos con la xor de los bits de datos 
tx_data_9(8) <= tx_data(0) xor tx_data(1) xor tx_data(2) xor tx_data(3)   
                  xor tx_data(4) xor tx_data(5) xor tx_data(6) xor tx_data(7);
tx_data_9(7 downto 0) <= tx_data;
rx_data <= rx_data_9(7 downto 0); 

rst 	<= pb(0) ; 			

clk50in_ibuf 	: ibufg_lvcmos33	port map(i => clk50in, 	o => clk50int );
rxclka_bufg 	: bufg 			port map(i => clk50int, o => clk50 ) ;

-- uart in/out
tx_obuf 	: obuf_lvcmos33  	port map(i => tx_out,	o => tx);
rx_ibuf 	: ibuf_lvcmos33  	port map(i => rx,	o => rx_in);

loop0 : for i in 0 to 3 generate
digit_obuf 	: obuf_lvcmos33  	port map(i => digit(i),	o => digit_out(i));
pb_ibuf 	: ibuf_lvcmos33  	port map(i => pb_in(i),	o => pb(i));
end generate ;

loop1 : for i in 0 to 7 generate
led_obuf 	: obuf_lvcmos33  	port map(i => LEDs(i),	o => led_out(i));
digit_obuf 	: obuf_lvcmos33  	port map(i => seg(i),	o => seg_out(i));
sw_ibuf 	: ibuf_lvcmos33  	port map(i => sw_in(i),	o => switch(i));
end generate ;


--------------------------------------------------------------------------------
-- KCPSM3 and the program memory
--------------------------------------------------------------------------------

  processor: kcpsm3
    port map(      address => address,
               instruction => instruction,
                   port_id => port_id,
              write_strobe => write_strobe,
                  out_port => out_port,
               read_strobe => read_strobe,
                   in_port => in_port,
                 interrupt => interrupt,
             interrupt_ack => interrupt_ack,
                     reset => rst,
                       clk => clk50);

  program_rom: memoria
    port map(      address => address,
               instruction => instruction,
                       clk => clk50);
                       
--------------------------------------------------------------------------------
-- output_port
--------------------------------------------------------------------------------
  op: output_port
    port map(     out_port => out_port,
                  port_id => port_id,
                  write_strobe => write_strobe,
                  write_to_uart => write_to_uart,
                  LEDs => LEDs,
                  tx_data => tx_data,
						reset => rst,
                  clk => clk50);

--------------------------------------------------------------------------------
-- input_port
--------------------------------------------------------------------------------
  ip: input_port
    port map(  in_port => in_port,
               port_id => port_id,
               read_strobe => read_strobe,
               read_to_uart => read_to_uart,
               switch => switch,
               rx_data => rx_data,
               rx_data_present => rx_data_present,
               rx_full => rx_full,
               rx_half_full => rx_half_full,
               tx_full => tx_full,
               tx_half_full => tx_half_full,
					reset => rst,
               clk => clk50 );

--------------------------------------------------------------------------------
-- uart9_tx
--------------------------------------------------------------------------------

  uart_tx: uart9_tx
    port map (   data_in      => tx_data_9,
                 write_buffer => write_to_uart,
                 reset_buffer => rst,
                 en_16_x_baud => en_16_x_baud,
                   serial_out => tx_out,
                  buffer_full => tx_full,
             buffer_half_full => tx_half_full,
                          clk => clk50);

--------------------------------------------------------------------------------
-- uart9_rx
--------------------------------------------------------------------------------
  uart_rx: uart9_rx
    port map (        serial_in => rx_in,
                       data_out => rx_data_9,
                    read_buffer => read_to_uart,
                   reset_buffer => rst,
                   en_16_x_baud => en_16_x_baud,
            buffer_data_present => rx_data_present,
                    buffer_full => rx_full,
               buffer_half_full => rx_half_full,
                            clk => clk50);
                            
--------------------------------------------------------------------------------


-- generates a 1 Mhz signal from a 50 Mhz signal
process (clk50, rst)
begin
if rst = '1' then
	mhertz_count <= (others => '0') ;
	mhertz_en <= '0' ;
elsif clk50'event and clk50 = '1' then
	mhertz_count <= mhertz_count + 1 ;
	if mhertz_count = "110010" then
		mhertz_en <= '1' ;
		mhertz_count <= (others => '0') ;
	else 
		mhertz_en <= '0' ;
	end if ;
end if ;
end process ;												

-- generates a 1 kHz signal from a 1Mhz signal
process (clk50, rst)
begin
if rst = '1' then
	khertz_count <= (others => '0') ;
	khertz_en <= '0' ;
elsif clk50'event and clk50 = '1' then
	if mhertz_en = '1' then
		khertz_count <= khertz_count + 1 ;
		if khertz_count = "1111101000" then  
			khertz_en <= '1' ;
			khertz_count <= (others => '0') ;
		else
			khertz_en <= '0' ;
		end if ;
	else
		khertz_en <= '0' ;
	end if ;
end if ;
end process ;

--generates a 4 Hz signal from a 1 kHz signal
process (clk50, rst)
begin
if rst = '1' then
	hertz_count <= (others => '0') ;
	hertz_en <= '0' ;
elsif clk50'event and clk50 = '1' then
	if khertz_en = '1' then
		hertz_count <= hertz_count + 1 ;
		if hertz_count = "0011111010" then 
			hertz_en <= '1' ;
			hertz_count <= (others => '0') ;
		else
			hertz_en <= '0' ;
		end if ;
	else
		hertz_en <= '0' ;
	end if ;
end if ;
end process ;

--------------------------------------------------------------------------------
-- tx_on
-- Proceso que detecta la transmision de datos por la uart gracias a la señal
-- write_to_uart. Una vez detectado entra en una máquina de estados que produce
--	un movimiento circular en los displays uno y dos.
--------------------------------------------------------------------------------
process (clk50)
begin
     if clk50 = '1' and clk50'event then
        if write_to_uart = '1' and tx_on = "0000" then
           tx_on <= "0001";
        else
            if hertz_en ='1' then
               case tx_on is
                    when "0001" =>   bcdint(7 downto 0) <="00001111" ;   tx_on <= "0010" ;
                    when "0010" =>   bcdint(7 downto 0) <="01011111" ;   tx_on <= "0011" ;
		              when "0011" =>   bcdint(7 downto 0) <="01001111" ;   tx_on <= "0100" ;
		              when "0100" =>   bcdint(7 downto 0) <="00111111" ;   tx_on <= "0101" ;
		              when "0101" =>   bcdint(7 downto 0) <="11110011" ;   tx_on <= "0110" ;
		              when "0110" =>   bcdint(7 downto 0) <="11110010" ;   tx_on <= "0111" ;
		              when "0111" =>   bcdint(7 downto 0) <="11110001" ;   tx_on <= "1000" ;
		              when "1000" =>   bcdint(7 downto 0) <="11110000" ;   tx_on <= "1001" ;
		              when others =>   bcdint(7 downto 0) <="11111111" ;   tx_on <= "0000" ;
               end case ;
           end if;
        end if;
     end if;
end process;

--------------------------------------------------------------------------------
-- rx_on
-- Proceso que detecta la recepción de datos por la uart gracias a la señal
-- read_to_uart. Una vez detectado entra en una máquina de estados que produce
--	un movimiento circular en los displays tres y cuatro.
--------------------------------------------------------------------------------
process (clk50)
begin
     if clk50'event and clk50 = '1' then
        if read_to_uart = '1' and rx_on = "0000" then
           rx_on <= "0001";
        else
            if hertz_en ='1' then
               case rx_on is
                    when "0001" =>   bcdint(15 downto 8) <="11110000" ;   rx_on <= "0010" ;
                    when "0010" =>   bcdint(15 downto 8) <="11110001" ;   rx_on <= "0011" ;
		              when "0011" =>   bcdint(15 downto 8) <="11110010" ;   rx_on <= "0100" ;
		              when "0100" =>   bcdint(15 downto 8) <="11110011" ;   rx_on <= "0101" ;
		              when "0101" =>   bcdint(15 downto 8) <="00111111" ;   rx_on <= "0110" ;
		              when "0110" =>   bcdint(15 downto 8) <="01001111" ;   rx_on <= "0111" ;
		              when "0111" =>   bcdint(15 downto 8) <="01011111" ;   rx_on <= "1000" ;
		              when "1000" =>   bcdint(15 downto 8) <="00001111" ;   rx_on <= "1001" ;
		              when others =>   bcdint(15 downto 8) <="11111111" ;   rx_on <= "0000" ;
               end case ;
           end if;
        end if;
     end if;
end process;

--------------------------------------------------------------------------------
-- Proceso que multiplexa los cuatro displays, introduciendo los datos procedentes
-- de los procesos que detectan la transmisión y recepción de datos en las uarts.
--------------------------------------------------------------------------------
process (clk50, rst)
begin
if rst = '1' then
	seg <= (others => '1') ;
	digit <= (others => '1') ;
	conta <= (others => '0') ;
	crr <= (others => '1') ;
elsif clk50'event and clk50 = '1' then
	conta(2) <= '1' ;
	if khertz_en = '1' then
		conta(1 downto 0) <= conta(1 downto 0) + 1 ;
	end if ;
        case conta(1 downto 0) is
		   when "00" =>   crr <= bcdint(3 downto 0) ;   digit <= "1110" ;
		   when "01" =>   crr <= bcdint(7 downto 4) ;   digit <= "1101" ;
		   when "10" =>   crr <= bcdint(11 downto 8) ;  digit <= "1011" ;
		   when others => crr <= bcdint(15 downto 12) ; digit <= "0111" ;
	     end case ;
	if conta(2) = '1' then
		case crr is
			when "0000" => seg <= "0111111" & '1' ;
			when "0001" => seg <= "1011111" & '1' ;
			when "0010" => seg <= "1101111" & '1' ;
			when "0011" => seg <= "1110111" & '1' ;
			when "0100" => seg <= "1111011" & '1' ;
			when "0101" => seg <= "1111101" & '1' ;
			when others => seg <= "1111111" & '1' ;
		end case ;
	else
		seg <= (others => '1') ;
	end if ;
end if ;
end process ;

--------------------------------------------------------------------------------
-- en_16_x_baud
-- Proceso que genera la señal en_16_x_baud, utilizadas en las uarts para la
-- transmisión de datos. Dicha señal produce una frecuencia de transmisión de
-- 38400 baud rate 260us.
--------------------------------------------------------------------------------
process (clk50)
begin
     if clk50'event and clk50='1' then
        if baud_count=81 then
           baud_count <= 0;
           en_16_x_baud <= '1';
        else
           baud_count <= baud_count + 1;
           en_16_x_baud <= '0';
        end if;
     end if;
end process ;

--------------------------------------------------------------------------------

end arch_loopback;


