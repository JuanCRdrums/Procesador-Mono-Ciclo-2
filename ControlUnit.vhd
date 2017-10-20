
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ControlUnit is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

aluop <= op3;

end Behavioral;

