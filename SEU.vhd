
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SEU is
    Port ( imm : in  STD_LOGIC_VECTOR (12 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture Behavioral of SEU is

signal con: std_logic_vector (31 downto 0);
signal conN : std_logic_vector (18 downto 0):= "1111111111111111111";
signal conP : std_logic_vector (18 downto 0):= "0000000000000000000";

begin

	process(imm)
	begin
		if imm(12) = '0' then
		con <= conP & imm;
		else
			con <= conN & imm;
		end if;
	end process;

output <= con;

end Behavioral;

