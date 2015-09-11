------------------------------------------------------------------------------
-- Fichero: registro
-- Modulo: 
-- Autor: Eugenio Peñate Fariñas <epf.supersonic@gmail.com>
-- Fecha: 14/10/2008
-- Descripción:
--        
-- Modificaciones:
--    Quien:
--    Fecha:
--    Motivo:
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity clkscale is
    port(clk, rst_n : in std_logic;
         divsel : in std_logic_vector(3 downto 0);
         clkout : out std_logic );
end clkscale;

architecture compor of clkscale is
    signal contador: std_logic_vector(7 downto 0);
--    signal contador: integer range 0 to 127 :=0;
--    signal PA1,PA2,PI : std_logic;
begin
    
--    process(clk)
--        begin
 --           if clk'event and clk='1' then
 --               if contador = 2 then
 --                   contador <=0;
 --                   clkout <=1;
 --               else
 --                   contador <= contador +1;
 --                   clkout <=0;
 --               end if;
 --           end if;
                       
 --   end process;
    
----------------------------------------------------------------------------    
     process(clk, rst_n)
     begin
         if rst_n='0' then
             clkout<='0';
         elsif clk'event and clk='1' then
              contador <= contador + "00000001";
         end if;
     end process;
----------------------------------------------------------------------------       
     
         with divsel select
             when '0000' => clkout <= contador(0);   --no divide
             when '0001' => clkout <= contador(1);   -- divide por 2
             when '0010' => clkout <= contador(2);   -- divide por 4   
             when '0011' => clkout <= contador(3);   -- divide por 8
             when '0100' => clkout <= contador(4);   -- divide por 16
             when '0101' => clkout <= contador(5);   -- divide por 32
             when '0110' => clkout <= contador(6);   -- divide por 64
             when '0111' => clkout <= contador(7);   -- divide por 128
             when others => clkout <= contador(0);   -- no divide
                
         end with;
             
         
    
         
end compor;
