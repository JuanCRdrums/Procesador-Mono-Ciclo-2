
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;

--use IEEE.NUMERIC_STD.ALL;
entity PSRModifier is
    Port ( ALUR : in  STD_LOGIC_VECTOR (31 downto 0);
           OP : in  STD_LOGIC_VECTOR (5 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0):="0000");
end PSRModifier;

architecture Behavioral of PSRModifier is



begin

process(ALUR,OP)
begin
	if (OP = "010001" or OP = "010101" or OP = "010010" or OP = "010110" or OP = "010011" or OP = "010111" or OP = "010000"
	or OP = "011000" or OP = "010100" or OP = "011100") then
		if (ALUR = "00000000000000000000000000000000") then 
			NZVC <= "0100";
		end if;
		if (ALUR < "00000000000000000000000000000000") then
			NZVC <= "1000";
		end if;
		if (ALUR > "01111111111111111111111111111111" or ALUR < -2147483647) then
			NZVC <= "0011";
		end if;
	else
		NZVC <= "0000";
	end if;
end process;

end Behavioral;

