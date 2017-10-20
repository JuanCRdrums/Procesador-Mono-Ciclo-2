
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;
USE ieee.numeric_std.ALL;
use std.textio.all;

entity ALU is
    Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
				c: in std_logic;
           d1 : in  STD_LOGIC_VECTOR (31 downto 0);
           d2 : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process(op,d1,d2)
begin
	case(op) is
		when "000000" =>
			output <= d1 + d2;
		when "000100" =>
			output <= d1 - d2;
		when "000001" =>
			output <= d1 and d2;
		when "000010" =>
			output <= d1 or d2;
		when "000011" =>
			output <= d1 xor d2;
		when "000101" =>
			output <= d1 nand d2;
		when "000110" =>
			output <= d1 nor d2;
		when "000111" =>
			output <= d1 xnor d2;
		when "010000" =>
			output <= d1 + d2;
		when "010100" =>
			output <= d1 - d2;
		when "010001" =>
			output <= d1 and d2;
		when "010010" =>
			output <= d1 or d2;
		when "010011" =>
			output <= d1 xor d2;
		when "010101" =>
			output <= d1 and not d2;
		when "010110" =>
			output <= d1 or not d2;
		when "010111" =>
			output <= d1 xnor d2;
		when "001000" =>
			output <= d1 + d2 + ("0000000000000000000000000000000" & c);
		when "011000" =>
			output <= d1 + d2 + ("0000000000000000000000000000000" & c);
		when "001100" =>
			output <= d1 - d2 - ("0000000000000000000000000000000" & c);
		when "011100" =>
			output <= d1 - d2 - ("0000000000000000000000000000000" & c);
		when "100101" =>
			output <= to_stdlogicvector((to_bitvector(d1)) sll conv_integer(d2));
		when "100110" =>
			output <= to_stdlogicvector((to_bitvector(d1)) srl conv_integer(d2));
		when "111100" => 
			output <= d1 + d2;
		when "111101" =>
			output <= d1 + d2;
			
		when others => output <= "00000000000000000000000000000000";
	end case;
end process;

end Behavioral;