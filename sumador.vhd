library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity sumador is
    Port ( dato1 : in  STD_LOGIC_VECTOR (31 downto 0);
           dato2 : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end sumador;

architecture Behavioral of sumador is

begin
output <= dato1+dato2;


end Behavioral;

