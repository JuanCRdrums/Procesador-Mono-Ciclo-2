
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity multiplex is
    Port ( i : in  STD_LOGIC;
           R : in  STD_LOGIC_VECTOR (31 downto 0);
           imm : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end multiplex;

architecture Behavioral of multiplex is

begin

process(i,R,imm)
begin
	if(i='1') then
		output <= imm;
	else
		output <= R;
	end if;

end process;


end Behavioral;

