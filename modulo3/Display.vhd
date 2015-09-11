----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:55:15 02/13/2007 
-- Design Name: 
-- Module Name:    Display - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity Display is
    Port ( --serial_in : in  STD_LOGIC;
           --	serial_out : in  STD_LOGIC;
			  clk : in std_logic;
			  rst: in std_logic;
			  digit_out	: out std_logic_vector (3 downto 0);	-- digit drivers
			  seg_out	: out std_logic_vector (7 downto 0));	-- 8 LEDs
           
end Display;

architecture Behavioral of Display is
--HEX-to-seven-segment decoder
--   HEX:   in    STD_LOGIC_VECTOR (3 downto 0);
--   LED:   out   STD_LOGIC_VECTOR (6 downto 0);
-- 
-- segment encoinputg
--      0
--     ---  
--  5 |   | 1
--     ---   <- 6
--  4 |   | 2
--     ---
--      3
-- Rx-> 3 2 
-- Tx-> 1 0
--			Seg(0) = DP
--			Seg(1) = middle
--			Seg(2) = top left
--			Seg(3) = bottom left
--			Seg(4) = bottom
--			Seg(5) = bottom right
--			Seg(6) = top right
--			Seg(7) = top

----buffers
---- CMOS33 input buffer primitive
--component ibuf_lvcmos33 port (i : in std_logic; o : out std_logic); end component;
---- CMOS33 clock input buffer primitive
--component ibufg_lvcmos33 port(i : in std_logic; o : out std_logic); end component;
---- CMOS33 output buffer primitive
--component obuf_lvcmos33 port(i : in std_logic; o : out std_logic); end component;
---- global buffer primitive
--component bufg port(i : in std_logic; o : out std_logic); end component;
-------------------------------------------------------------
--signal clk50int		: std_logic ;				-- 
--signal clk		: std_logic ;




signal mhertz_count : std_logic_vector (5 downto 0);
signal khertz_count : std_logic_vector (9 downto 0);
signal half_hertz_count : std_logic_vector ( 10 downto 0);
signal mhertz_en : std_logic;
signal khertz_en : std_logic;
signal half_hertz_en : std_logic;
signal giro_rx : std_logic_vector (3 downto 0);
signal giro_tx : std_logic_vector (4 downto 0);
signal curr : std_logic_vector (3 downto 0);
signal cd : std_logic_vector (2 downto 0);



--signal digit : std_logic_vector (3 downto 0);
--signal rst : std_logic;

signal seg : std_logic_vector (7 downto 0);


begin

----clk50in_ibuf 	: ibufg_lvcmos33	port map(i => clk50in, 	o => clk50int );
----rxclka_bufg 	: bufg 			port map(i => clk50int, o => clk ) ;
--
--loop0 : for i in 0 to 3 generate
--digit_obuf 	: obuf_lvcmos33  	port map(i => digit(i),	o => digit_out(i));
----pb_ibuf 	: ibuf_lvcmos33  	port map(i => pb_in(i),	o => pb(i));
--end generate ;
--
--loop1 : for i in 0 to 7 generate
----led_obuf 	: obuf_lvcmos33  	port map(i => led(i),	o => led_out(i));
--digit_obuf 	: obuf_lvcmos33  	port map(i => seg(i),	o => seg_out(i));
----sw_ibuf 	: ibuf_lvcmos33  	port map(i => sw_in(i),	o => sw(i));
--end generate ;


--general 1 mhz
process (clk, rst)
begin
	if rst='1' then
		mhertz_count <= "000000";
		mhertz_en <= '0';
	elsif (clk'event and clk='1') then
		mhertz_count <= mhertz_count + '1';
		if mhertz_count = "110010" then
			mhertz_en <= '1';
			mhertz_count <= (others => '0');
		else
			mhertz_en <= '0';		
		end if;
	end if;
end process;

--generar 1 khz

process (clk, rst)
begin
	if rst='1' then
		khertz_count <= (others => '0');
		khertz_en <= '0';
	elsif (clk'event and clk='1') then
		if mhertz_en = '1' then
			khertz_count <= khertz_count + '1';
			if mhertz_count = "1111101000" then   --"1111101000"=1000
				khertz_en <= '1';
				khertz_count <= (others => '0');
			else
				khertz_en <= '0';		
			end if;
		end if;
	end if;
end process;

-- generar la mitad de un hert

process (clk, rst)
begin
	if rst='1' then
		half_hertz_count <= (others => '0');
		half_hertz_en <= '0';
	elsif clk'event and clk = '1' then
		if khertz_en='1' then
			half_hertz_count <= half_hertz_count + '1';
			if half_hertz_count = "110010" then
				half_hertz_en <= '1';
				half_hertz_count <= (others => '0');
			else
				half_hertz_en <= '0';
			end if;
		end if;
	end if;
end process;

--giro de los displays
process (clk, rst)
begin
	if rst ='1' then
		giro_rx <= (others => '0');
		giro_tx <= (others => '0');
	elsif (clk'event and clk='1') then
		if half_hertz_en ='1' then
		
			if giro_rx(1 downto 0)="11" then
				if giro_rx(3 downto 2)="11"  then
					giro_rx <= "0000";
				else
					giro_rx <= (giro_rx(3 downto 2) + '1') & "00";
				end if;
			else
				giro_rx <= giro_rx(3 downto 2) & (giro_rx(1 downto 0) + '1');
			end if;
			
			if giro_tx(1 downto 0)="11" then
				if giro_tx(3 downto 2)="11" then
					giro_tx <= (others => '0');
				else
					giro_tx <= (giro_tx(3 downto 2) + '1') & "00";
				end if;
			else
				giro_tx <= giro_tx(3 downto 2) & (giro_tx(1 downto 0) + '1');
			end if;
		end if;
	end if;
end process;

process(clk, rst)
begin
	if rst='1' then
		digit_out <= (others => '1');
		seg <= (others => '1');
		curr <= (others => '0');
		cd <= (others => '0');
	elsif clk'event and clk='1' then
		cd(2) <='1';
		if khertz_en ='1' then
			cd(1 downto 0) <= cd (1 downto 0) + '1';
		end if;
		case cd (1 downto 0) is
			when "00" => curr <= "00" & giro_tx(1 downto 0); digit_out <= "1110";
			when "01" => curr <= "01" & giro_tx(2 downto 1); digit_out <= "1101";
			when "10" => curr <= "10" & giro_rx(1 downto 0); digit_out <= "1011";
			when others => curr <= "11" & giro_rx(2 downto 1); digit_out <= "0111";
		end case;
		if cd(2)='1' then
			case curr is
				when "0000" => seg <= "00001000";
				when "0001" => seg <= "00000100";
				when "0010" => seg <= "00000010";
				when "0011" => seg <= "00000001";
				when "0100" => seg <= "00000001";
				when "0101" => seg <= "00100000";
				when "0110" => seg <= "00010000";
				when "0111" => seg <= "00001000";
				when "1000" => seg <= "00000001";
				when "1001" => seg <= "00000010";
				when "1010" => seg <= "00000100";
				when "1011" => seg <= "00001000";
				when "1100" => seg <= "00001000";
				when "1101" => seg <= "00010000";
				when "1110" => seg <= "00100000";
				when "1111" => seg <= "00000001";
				when others => seg <="01000000";
			end case;
		end if;
	end if;
end process;


--digit_out <= digit;


end Behavioral;

