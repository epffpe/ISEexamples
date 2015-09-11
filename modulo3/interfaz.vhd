----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:25:30 01/11/2007 
-- Design Name: 
-- Module Name:    interfaz - Behavioral 
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

library UNISIM;
use UNISIM.VComponents.all;


entity interfaz is port (
	clk50	: in std_logic ;
	reset: out std_logic;
	pb	: in std_logic_vector (3 downto 0);
	digit	: out std_logic_vector (3 downto 0);
	switches : in std_logic_vector (7 downto 0);
	led	: out std_logic_vector (7 downto 0);
	seg : out std_logic_vector (7 downto 0);
	sel : out std_logic_vector (1 downto 0);
	reproducir : out std_logic);
end interfaz;



architecture cuerpo of interfaz is


-- declaración de las variables y señales

signal rst 	: std_logic;	
signal init 	: std_logic;
signal prev_1 	: std_logic;
signal prev_2, prev_aux : std_logic;
signal next_1, next_2, next_aux 	: std_logic;
signal play	: std_logic := '0';
-- señales para los displays
signal nada : std_logic_vector (7 downto 0) := "11111101";
signal uno : std_logic_vector (7 downto 0)	:= "10011111";
signal dos : std_logic_vector (7 downto 0)	:= "00100101";
signal tres : std_logic_vector (7 downto 0)	:= "00001101";
signal cuatro : std_logic_vector (7 downto 0)	:= "10011001";
signal cancion : std_logic_vector (1 downto 0):= switches (1 downto 0);

signal mhert_count: std_logic_vector (5 downto 0);
signal khert_count: std_logic_vector (9 downto 0);
signal hert_count	: std_logic_vector (9 downto 0);
signal mhert_en	: std_logic;
signal khert_en	: std_logic;
signal hert_en	: std_logic;
signal bcdint	: std_logic_vector (15 downto 0);
signal curr	: std_logic_vector (3 downto 0);
signal cd	: std_logic_vector (2 downto 0);
signal rst1 : std_logic := '0';
signal rst2 : std_logic := '0';
signal init2 : std_logic := '0';
signal espera1 : std_logic_vector (1 downto 0) := "00";
signal espera2 : std_logic_vector (1 downto 0) := "00";
signal disp2 : std_logic_vector (3 downto 0) := "0"&("0"&switches (1 downto 0) + 1);


begin
	

	rst <= pb(0);
	reset <= pb(0);
	init <= pb(1);	
	prev_2 <= pb(2);
	next_2 <= pb(3);
	
	sel <= cancion;
	reproducir <= play;
	
	process (rst) 
	begin
		if rst = '1' then
			case switches (1 downto 0) is
				when "00" => disp2 <= "0001";
				when "01" => disp2 <= "0010";
				when "10" => disp2 <= "0011";
				when "11" => disp2 <= "0100";
				when others => null;
			end case;
		end if;
	end process;



---- Proceso para controlar los reset y que no esten pulsados demasiado tiempo
--
--process (rst, rst1, rst2) 
--begin 
--	if rst1 = '1'  and rst2 ='0' then
--		rst2 <='1';
--	end if;
----	wait for 100ms;
--	if rst1 = '0' and rst2 = '1' then
--			rst <= '1';
--			rst2 <= '0';
--	else
--		rst <= '0';
--	end if;
--end process;

-- Proceso para controlar el Pb de play/stop
--process (rst, init, init2)--, play)
--begin
--	if rst = '1' then
--		play <= '0';
--	end if;
--	if init = '1' and init2 = '0' then
--			init2 <= '1';
--	end if;
--	if init = '0' and init2 = '1' then
--		play <= not play;
--		init2 <= '0';
--	end if;
--end process;

	-- proceso para controlar el prev_1
	 
	process (clk50, prev_1, prev_2, prev_aux) 
	begin
		if clk50'event and clk50 = '1' then
			if prev_2 = '1' and prev_aux = '0' then
				prev_aux <= '1';
			end if;
			if prev_2 = '0' and prev_aux = '1' then
				if espera1 = "11" then
					prev_1 <= '1';
					prev_aux <= '0';
					espera1 <= "00";
				else
					espera1 <= espera1 + '1';
				end if;
	
			else
				prev_1 <= '0';
			end if;
		end if;
	end process;
	
	 -- Proceso para controlar el Pb del next
	process (clk50, next_1, next_2, next_aux) 
	begin
		if clk50'event and clk50 = '1' then
			if next_2 = '1' and next_aux = '0' then
				next_aux <= '1';
			end if;
			if next_2 = '0' and next_aux = '1' then
				if espera2 = "11" then
					next_1 <= '1';
					next_aux <= '0';
					espera2 <= "00";
				else
					espera2 <= espera2 + '1';
				end if;
			else
				next_1 <= '0';
			end if;
		end if;
	end process;


-- Cuando Play = '0' --> stop
	process (init, rst, clk50, play, bcdint, cancion)
	begin
			
		if rst = '1' then
			play <= '0';
			bcdint <= "00000000"&disp2&"0100";
			cancion <= switches (1 downto 0);
			
		elsif clk50'event and clk50 = '1' then
			if init = '1' then
				play <= not play;
				if play = '1' then
					bcdint (15 downto 8)<="11010101";
					led (4) <=  '0';
				else 
					led (4) <= '1';
					bcdint (15 downto 8)<="00000000";
				end if;
			end if;
	
			if play = '0' then
				bcdint (15 downto 8) <= "00000000"; -- Mostramos los dos guiones
					if next_1 ='1' then
						if bcdint (7 downto 4) < "0100" then
							bcdint (7 downto 4) <= bcdint (7 downto 4) + 1; 
							cancion <= cancion + 1;
						else
							bcdint (7 downto 4) <= "0001";
							cancion <= "01";
						end if;
					elsif prev_1 ='1' then
						if bcdint (7 downto 4) > "0001" then
							bcdint (7 downto 4) <= bcdint (7 downto 4) - 1;
							cancion <= cancion + "11"; -- restamos 3
						else
							bcdint (7 downto 4) <= "0100";
							cancion <= "11";
						end if;
					end if;
	
			else       -- estamos en el caso de play
				if hert_en = '1' then
					
					if bcdint (15 downto 8) = "00000000" then
						bcdint (15 downto 8) <= "11010101";
						-- Para inicilizar los curr cuando se pone todo a play por primera vez
					else
				
						if bcdint (11 downto 8) < "1000" then
							bcdint (11 downto 8) <= bcdint (11 downto 8) + 1;
							bcdint (15 downto 12) <= "1101"; -- Para que no se vea el display más significativo
						else
							if bcdint (15 downto 12) = "1101" then
								bcdint (15 downto 12) <= "1001";
								bcdint (11 downto 8) <= "1101"; -- Para que no se vea el display más significativo
							else
								if bcdint (15 downto 12) < "1100" then
									bcdint (15 downto 12) <= bcdint (15 downto 12) + 1;
									bcdint (11 downto 8) <= "1101";
								else 
									bcdint (15 downto 12) <= "1101";
									bcdint (11 downto 8) <= "0101";
								end if;
							end if;
						end if;				
					end if;
				end if;
			end if;
	end if;
			
	
		
	
	end process;

-- Proceso que genera una señal de un mhertz
process (clk50, rst)
begin
if rst = '1' then
	mhert_count <= (others => '0');
	mhert_en <= '0';
elsif clk50'event and clk50 = '1' then
	mhert_count <= mhert_count + 1;
	if mhert_count = "110010" then
		mhert_en <= '1';
		mhert_count <= (others => '0');
	else
		mhert_en <= '0';
	end if;
end if;
end process;

process (clk50, rst)
begin
if rst = '1' then
	khert_count <= (others => '0') ;
	khert_en <= '0' ;
elsif clk50'event and clk50 = '1' then
	if mhert_en = '1' then
		khert_count <= khert_count + 1 ;
		if khert_count = "1111101000" then
			khert_en <= '1' ;
			khert_count <= (others => '0') ;
		else
			khert_en <= '0' ;
		end if ;
	else
		khert_en <= '0' ;
	end if ;
end if ;
end process ;

--generates a 1 Hz signal from a 1 kHz signal
process (clk50, rst)
begin
if rst = '1' then
	hert_count <= (others => '0') ;
	hert_en <= '0' ;
elsif clk50'event and clk50 = '1' then
	if khert_en = '1' then
		hert_count <= hert_count + 1 ;
		if hert_count = "1111101000" then
			hert_en <= '1' ;
			hert_count <= (others => '0') ;
		else
			hert_en <= '0' ;
		end if ;
	else
		hert_en <= '0' ;
	end if ;
end if ;
end process ;


	

-- Proceso para la muestra en los displays
process (clk50, rst)
begin 
if rst = '1' then
	--play <= '0';
	seg <= (others => '1'); -- Son activos a nivel bajo
	digit <= (others => '1');
	cd <= (others => '0');
	curr <= (others => '0');
elsif clk50'event and clk50 = '1' then
	cd(2)<= '1';  -- cd = 100
	
	if khert_en = '1' then
	-- Contador de displays --> los va moviendo
		cd (1 downto 0) <= cd (1 downto 0) + '1';
	end if;
	case cd (1 downto 0) is
		when "00" => curr <= bcdint (3 downto 0);
						digit <="1110"; -- Activa el display menos significativo
		when "01" => curr <= bcdint (7 downto 4);
						digit <="1101";
		when "10" => curr <= bcdint (11 downto 8);
						digit <="1011";
		when "11" => curr <= bcdint (15 downto 12);
						digit <="0111";
		when others => null;
	end case;

	if cd(2) = '1' then
		case curr is
			when "0000" => seg <= nada;
			when "0001" => seg <= uno;
			when "0010" => seg <= dos;
			when "0011" => seg <= tres;
			when "0100" => seg <= cuatro;
			when "0101"	=> seg <= "01111111"; -- Arriba
			when "0110" => seg <= "10111111"; -- Lateral arriba derecha
			when "0111" => seg <= "11011111"; -- Lateral abajo derecha
			when "1000" => seg <= "11101111"; -- Abajo
			when "1001" => seg <= "11101111"; -- Abajo
			when "1010" => seg <= "11110111"; -- Lateral inferior izquierda
			when "1011" => seg <= "11111011"; -- Lareral superior izquierda
			when "1100" => seg <= "01111111"; -- Arriba
			when "1101" => seg <= "11111111"; -- No se ve nada de nada
			when others => seg <= "11111111"; -- No se ve nada de nada
		end case;
	else
			seg <= (others => '1');
	end if;
end if;
end process;

end cuerpo;


