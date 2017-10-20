
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PSR is
    Port ( NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
				nCWP: in std_logic_vector(4 downto 0);
           C : out  STD_LOGIC;
			  CWP: out std_logic_vector(4 downto 0);
			  clk: in std_logic);
end PSR;

architecture Behavioral of PSR is

	signal registro: std_logic_vector (31 downto 0):= "00000000000000000000000000000000";
	signal cont: integer:= 0;
	
	
begin
	process(clk,NZVC,nCWP)
		begin
			if(rising_edge(clk) and cont mod 2 = 0) then
			registro(4 downto 0) <= nCWP;
			CWP <= nCWP;
			registro(23 downto 20)<= NZVC(3 downto 0);
			end if;
			cont <= cont + 1;

	end process;
	
	C <= registro(20);
	--CWP <= nCWP;


end Behavioral;

