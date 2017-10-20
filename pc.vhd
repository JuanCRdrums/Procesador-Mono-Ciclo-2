library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity pc is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           datain : in  STD_LOGIC_VECTOR (31 downto 0);
           outp : out  STD_LOGIC_VECTOR (31 downto 0));
end pc;

architecture Behavioral of pc is


begin
process(clk,datain,rst)
	begin
	if rst = '1' then
		outp<="00000000000000000000000000000000";
	elsif	clk'event and clk = '1' then
		outp <= datain;
	end if;
end process;


end Behavioral;


